import 'dart:developer';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:nexmat/app_configs/app_assets.dart';
import 'package:nexmat/app_configs/environment.dart';
import 'package:nexmat/data_models/rest_error.dart';
import 'package:nexmat/imageToStorage/getImageUrl.dart';
import 'package:nexmat/pages/dashboard/user_dashboard_page.dart';
import 'package:nexmat/pages/login/login_api.dart';
import 'package:nexmat/pages/vendor_dashboard/vendor_dashboard_page.dart';
import 'package:nexmat/pages/onboarding/select_location_page.dart';
import 'package:nexmat/pages/register/register_page.dart';
import 'package:nexmat/utils/shared_preference_helper.dart';
import 'package:nexmat/utils/snackbar_helper.dart';
import 'package:nexmat/widgets/app_buttons/app_primary_button.dart';
import 'package:nexmat/widgets/app_loader.dart';

import 'banner.dart';

///
/// Created by Sunil Kumar (sunil@smarttersstudio.com)
/// On 27-10-2021 03:40 PM
///
class LoginPage extends StatefulWidget {
  static const routeName = '/login';
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  final GlobalKey<AppPrimaryButtonState> _btnKey = GlobalKey();
  bool _obscureText = true;
  var _email, _password;
  AutovalidateMode _autovalidateMode = AutovalidateMode.disabled;
  var Login_User = LoginApiPost();
  String err_msg = '';
  var authToken;
  var profImageUrl = '';

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Positioned(
              right: 0, top: 0, child: SvgPicture.asset(AppAssets.loginBgTop)),
          Positioned(
              left: 0,
              bottom: 0,
              child: SvgPicture.asset(AppAssets.loginBgBottom)),
          Positioned.fill(
            child: SafeArea(
              child: Form(
                key: _formKey,
                autovalidateMode: _autovalidateMode,
                child: ListView(
                  padding: const EdgeInsets.all(22),
                  children: [
                    SizedBox(height: height / 4),
                    const Text(
                      "Log In",
                      style:
                          TextStyle(fontSize: 26, fontWeight: FontWeight.w800),
                    ),
                    SizedBox(height: 15
                        // child: Text(
                        //   '$err_msg',
                        //   style: TextStyle(color: Colors.red),
                        // ),
                        ),
                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.next,
                      onFieldSubmitted: (s) => Get.focusScope?.nextFocus(),
                      onChanged: (s) {
                        _email = s.trim();
                      },
                      validator: (s) {
                        if (s == null || s.trim().isEmpty) {
                          return '*required';
                        } else {
                          if (!GetUtils.isEmail(s)) {
                            return 'Not a valid email id.';
                          } else if (s.trim().length < 6) {
                            return '*email length must be at least 6 characters long';
                          }
                        }
                      },
                      decoration: const InputDecoration(labelText: 'Email Id'),
                    ),
                    const SizedBox(height: 12),
                    TextFormField(
                      obscureText: _obscureText,
                      validator: (s) {
                        if (s == null || s.trim().isEmpty) {
                          return '*required';
                        } else if (s.length < 6) {
                          return '*password length must be at least 6 characters long';
                        }
                      },
                      textInputAction: TextInputAction.done,
                      onFieldSubmitted: (s) => _login(),
                      keyboardType: TextInputType.visiblePassword,
                      onChanged: (s) {
                        _password = s;
                      },
                      decoration: InputDecoration(
                          labelText: 'Password',
                          suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  _obscureText = !_obscureText;
                                });
                              },
                              icon: Icon(_obscureText
                                  ? Icons.visibility
                                  : Icons.visibility_off))),
                    ),
                    const SizedBox(height: 32),
                    AppPrimaryButton(
                      child: const Text("Log In"),
                      onPressed: _login,
                      key: _btnKey,
                    ),
                    const SizedBox(height: 38),
                    const Center(
                        child: Text(
                      "- Or LogIn with -",
                      style: TextStyle(color: Colors.grey),
                    )),
                    const SizedBox(height: 14),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                            onTap: signInWithGoogle,
                            child: SvgPicture.asset(AppAssets.google)),
                        const SizedBox(width: 16),
                        GestureDetector(
                            onTap: () {},
                            child: SvgPicture.asset(AppAssets.facebook)),
                      ],
                    ),
                    const SizedBox(height: 22),
                    Center(
                      child: RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                              style: theme.textTheme.bodyText1,
                              children: [
                                const TextSpan(text: "Don't have an account?"),
                                TextSpan(
                                    text: ' Sign up',
                                    style: const TextStyle(color: Colors.grey),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        Get.toNamed(RegisterPage.routeName);
                                      }),
                              ])),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _login() async {
    ScaffoldMessenger.of(context).hideCurrentMaterialBanner();
    final state = _formKey.currentState;
    if (state == null) return;
    //state.validate();
    if (state.validate()) {
      var loggedIn = await Login_User.getLogin(_email, _password);

      if (loggedIn['success'] == true) {
        authToken = loggedIn['data']["token"];
        print('skdjfsiejfowiefjwoief...................');
        try {
          profImageUrl = await getProfilePicUrl(_email);
        } catch (e) {
          print(e);
        }
        print(authToken);
        // print(profImageUrl.statusCode);
        // if (profImageUrl.statusCode == 404) {
        //   profImageUrl = '';
        // }
        if (state.validate()) {
          state.save();
          _btnKey.currentState?.showLoader();
          try {
            Get.offAllNamed(
              DashboardPage.routeName,
              arguments: {
                'authToken': authToken,
                'email': _email,
                'profilePic': profImageUrl
              },
            );
          } catch (e) {
            SnackBarHelper.show(e.toString());
          } finally {
            _btnKey.currentState?.hideLoader();
          }
        } else {
          setState(() {
            _autovalidateMode = AutovalidateMode.always;
          });
        }
      } else {
        setState(() {
          err_msg = loggedIn["message"];
          ScaffoldMessenger.of(context).showMaterialBanner(
            materialBanner(context, err_msg),
          );
        });
      }
    }
  }

  Future<void> signInWithGoogle() async {
    GoogleSignIn _googleSignIn =
        GoogleSignIn(scopes: ['email'], clientId: Environment.googleClientId);
    Get.key.currentState?.push(LoaderOverlay());
    try {
      GoogleSignInAccount? result = await _googleSignIn.signIn();
      if (result == null) {
        Get.key.currentState?.pop();
        return;
      }

      GoogleSignInAuthentication googleAuth = await result.authentication;
      log('TOKEN ${googleAuth.accessToken}');

      Get.offAllNamed(DashboardPage.routeName);
    } catch (e, s) {
      Get.key.currentState?.pop();
      SnackBarHelper.show(e.toString());
      log("message", error: e, stackTrace: s);
    } finally {
      _googleSignIn.signOut();
    }
    log('TOKEN }');
  }
}
