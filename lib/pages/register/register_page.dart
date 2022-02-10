import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:nexmat/app_configs/app_assets.dart';
import 'package:nexmat/app_configs/environment.dart';
import 'package:nexmat/pages/login/banner.dart';
import 'package:nexmat/pages/onboarding/select_location_page.dart';
import 'package:nexmat/pages/register/signUpApi.dart';
import 'package:nexmat/pages/vendor_dashboard/vendor_dashboard_page.dart';
import 'package:nexmat/utils/snackbar_helper.dart';
import 'package:nexmat/widgets/app_buttons/app_primary_button.dart';
import 'package:nexmat/widgets/app_loader.dart';

///
/// Created by Sunil Kumar (sunil@smarttersstudio.com)
/// On 27-10-2021 03:41 PM
///
class RegisterPage extends StatefulWidget {
  static const routeName = '/register';
  const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  final GlobalKey<AppPrimaryButtonState> _btnKey = GlobalKey();
  bool _obscureText = true, _obscureText2 = false, _isVendor = false;
  var _email, _password, _name, _confirmPassword;
  var _phoneNo;
  AutovalidateMode _autovalidateMode = AutovalidateMode.disabled;
  var user = SignUpForm();
  String err_msg = '';
  var userID, authToken;
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
              left: 0, top: 0, child: SvgPicture.asset(AppAssets.signUpBgTop)),
          Positioned(
              right: 0,
              bottom: 0,
              child: SvgPicture.asset(AppAssets.signUpBgBottom)),
          Positioned.fill(
            child: SafeArea(
              child: Form(
                key: _formKey,
                autovalidateMode: _autovalidateMode,
                child: ListView(
                  padding: const EdgeInsets.all(22),
                  children: [
                    SizedBox(height: height / 10),
                    const Text(
                      "Create Account",
                      style:
                          TextStyle(fontSize: 26, fontWeight: FontWeight.w800),
                    ),
                    const SizedBox(height: 17),
                    TextFormField(
                      keyboardType: TextInputType.name,
                      textCapitalization: TextCapitalization.words,
                      textInputAction: TextInputAction.next,
                      onFieldSubmitted: (s) => Get.focusScope?.nextFocus(),
                      onChanged: (s) {
                        _name = s;
                      },
                      validator: (s) {
                        if (s == null || s.trim().isEmpty) {
                          return '*required';
                        } else if (s.length < 6) {
                          return '*Name length must be at least 6 characters long';
                        }
                      },
                      decoration: const InputDecoration(labelText: 'Name'),
                    ),
                    const SizedBox(height: 12),
                    TextFormField(
                      keyboardType: TextInputType.number,
                      textCapitalization: TextCapitalization.words,
                      textInputAction: TextInputAction.next,
                      onFieldSubmitted: (s) => Get.focusScope?.nextFocus(),
                      onChanged: (s) {
                        _phoneNo = s.trim();
                      },
                      validator: (s) {
                        if (s == null || s.trim().isEmpty) {
                          return '*required';
                        } else if (s.trim().length != 10) {
                          return 'Phone Number should contains 10 character';
                        }
                      },
                      decoration:
                          const InputDecoration(labelText: 'Phone Number'),
                    ),
                    const SizedBox(height: 12),
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
                          if (!GetUtils.isEmail(s.trim())) {
                            return 'Not a valid email Id.';
                          }
                        }
                      },
                      decoration: const InputDecoration(labelText: 'Email Id'),
                    ),
                    const SizedBox(height: 12),
                    TextFormField(
                      textInputAction: TextInputAction.done,
                      onFieldSubmitted: (s) => Get.focusScope?.nextFocus(),
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: _obscureText,
                      onChanged: (s) {
                        _password = s.trim();
                      },
                      validator: (s) {
                        if (s == null || s.trim().isEmpty) {
                          return '*required';
                        } else if (s.trim().length < 6) {
                          return '*password must be at least 6 characters long';
                        }
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
                    const SizedBox(height: 12),
                    TextFormField(
                      textInputAction: TextInputAction.done,
                      onFieldSubmitted: (s) => _signUp(),
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: _obscureText2,
                      validator: (s) {
                        if (s == null || s.trim().isEmpty) {
                          return '*required';
                        } else if (_password != s) {
                          return "Passwords does not match";
                        }
                      },
                      onChanged: (s) {
                        _confirmPassword = s;
                      },
                      decoration: InputDecoration(
                          labelText: 'Confirm Password',
                          suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  _obscureText2 = !_obscureText2;
                                });
                              },
                              icon: Icon(_obscureText2
                                  ? Icons.visibility
                                  : Icons.visibility_off))),
                    ),
                    const SizedBox(height: 12),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("User"),
                        Switch(
                            value: _isVendor,
                            onChanged: (b) {
                              setState(() {
                                _isVendor = b;
                              });
                            }),
                        const Text("Vendor"),
                      ],
                    ),
                    const SizedBox(height: 32),
                    AppPrimaryButton(
                      child: const Text("Sign up"),
                      onPressed: _signUp,
                      key: _btnKey,
                    ),
                    const SizedBox(height: 38),
                    const Center(
                        child: Text(
                      "- Or Sign up with -",
                      style: TextStyle(color: Colors.grey),
                    )),
                    const SizedBox(height: 14),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                            onTap: signUpWithGoogle,
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
                                const TextSpan(
                                    text: 'Already have an account?'),
                                TextSpan(
                                    text: ' Sign in',
                                    style: const TextStyle(color: Colors.grey),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        Get.back();
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

  void _signUp() async {
    ScaffoldMessenger.of(context).hideCurrentMaterialBanner();
    final state = _formKey.currentState;
    if (state == null) return;
    //state.validate();

    if (state.validate()) {
      var signUpResponse =
          await user.getSignUp(_name, _phoneNo, _email, _password, _isVendor);
      var signUpData = jsonDecode(signUpResponse.body);
      print(signUpData);

      if (signUpResponse.statusCode == 200) {
        userID = signUpData['user'];
        authToken = signUpData["token"];
        if (state.validate()) {
          state.save();
          _btnKey.currentState?.showLoader();
          try {
            Get.offAllNamed(SelectLocationPage.routeName, arguments: {
              'userName': _name,
              'userID': userID,
              'email': _email,
              'phoneNo': _phoneNo,
              'authToken': authToken
            });
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
          err_msg = signUpData['message'];
          ScaffoldMessenger.of(context).showMaterialBanner(
            materialBanner(context, err_msg),
          );
        });
      }
    }
  }

  Future<void> signUpWithGoogle() async {
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
      // final credential = GoogleAuthProvider.credential(
      //   accessToken: googleAuth.accessToken,
      //   idToken: googleAuth.idToken,
      // );
      //
      // final res = await FirebaseAuth.instance.signInWithCredential(credential);
      // if (res.user != null) {
      //   final user = UserDatum(
      //       uid: res.user!.uid,
      //       email: res.user!.email ?? "",
      //       name: res.user!.displayName ?? "",
      //       type: _isVendor ? 1 : 2,
      //       createdAt: DateTime.now());
      //   await FirebaseCollectionRefs.usersRef.doc(res.user!.email).set({
      //     "customerName": user.name,
      //     "userUID": res.user!.uid,
      //     "userTypeID": user.type,
      //     "edited": user.createdAt,
      //     "email": user.email,
      //     "userType": user.type == 1 ? "Vendor" : "Customer",
      //   });
      //   if (_isVendor) {
      //     await FirebaseCollectionRefs.storesRef.doc(res.user!.email).set({
      //       "vendorName": user.name,
      //       "userUID": user.uid,
      //       "userTypeID": user.type,
      //       "edited": user.createdAt,
      //       "email": user.email,
      //       "userType": user.type == 1 ? "Vendor" : "Customer",
      //     });
      //   }
      //   SharedPreferenceHelper.storeUser(user);
      Get.offAllNamed(SelectLocationPage.routeName);
      // } else {
      //   Get.key.currentState?.pop();
      //   SnackBarHelper.show("Some error occurred");
      // }
    } catch (e, s) {
      Get.key.currentState?.pop();
      SnackBarHelper.show(e.toString());
      log("message", error: e, stackTrace: s);
    } finally {
      _googleSignIn.signOut();
    }
  }
}
