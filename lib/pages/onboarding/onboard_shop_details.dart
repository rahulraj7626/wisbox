import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:nexmat/app_configs/app_assets.dart';
import 'package:nexmat/data_models/rest_error.dart';
import 'package:nexmat/imageToStorage/getImageUrl.dart';
import 'package:nexmat/imageToStorage/pickImage.dart';
import 'package:nexmat/imageToStorage/uploadImage.dart';
import 'package:nexmat/pages/dashboard/user_dashboard_page.dart';
import 'package:nexmat/pages/login/banner.dart';
import 'package:nexmat/pages/onboarding/addStoreApi.dart';
import 'package:nexmat/pages/vendor_dashboard/vendor_dashboard_page.dart';
import 'package:nexmat/utils/shared_preference_helper.dart';
import 'package:nexmat/utils/snackbar_helper.dart';
import 'package:nexmat/widgets/app_buttons/app_primary_button.dart';
import 'addedPopUp.dart';

//import 'package:nexmat/widgets/photo_chooser.dart';

///
/// Created by Sunil Kumar (sunil@smarttersstudio.com)
/// On 27-10-2021 03:44 PM
///
class OnboardShopDetails extends StatefulWidget {
  static const String routeName = '/OnboardShopDetails';

  const OnboardShopDetails({Key? key}) : super(key: key);

  @override
  _OnboardShopDetailsState createState() => _OnboardShopDetailsState();
}

class _OnboardShopDetailsState extends State<OnboardShopDetails> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  final GlobalKey<AppPrimaryButtonState> _btnKey = GlobalKey();
  AutovalidateMode _autovalidateMode = AutovalidateMode.disabled;
  File? _storeImage;
  var _storeName, _gstId, _country, _district, _city;
  var _userID, _email, _phoneNo;
  TimeOfDay? _openingTime, _closingTime;
  int? _storeType;
  String? _category;
  var addStore = AddStoreForm();
  var err_msg = '';
  var addMsg = '';
  var pathImage;

  @override
  void initState() {
    super.initState();
  }

  // createPopup(BuildContext context, addMsg, {required onPressed()}) {
  //   return showDialog(
  //     context: context,
  //     builder: (context) {
  //       return AlertDialog(
  //         title: Icon(Icons.check_circle, color: Colors.green),
  //         content: Text(
  //           "$addMsg",
  //           textAlign: TextAlign.center,
  //         ),
  //         actions: <Widget>[
  //           Center(
  //             child: AppPrimaryButton(
  //               child: Text('ok'),
  //               onPressed: onPressed,
  //             ),
  //           )
  //         ],
  //       );
  //     },
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    _btnKey.currentState?.hideLoader();

    final theme = Theme.of(context);
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: _formKey,
          autovalidateMode: _autovalidateMode,
          child: ListView(
            padding: const EdgeInsets.all(22),
            children: [
              const Text(
                "Shop Details",
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.w800),
              ),
              const SizedBox(height: 12),
              GestureDetector(
                onTap: () async {
                  // Get.bottomSheet(
                  //         //const PhotoChooser(),
                  //         SizedBox(),
                  //         backgroundColor: Colors.white)
                  //     .then((value) {
                  //   if (value != null) {
                  //     _storeImage = value;
                  //     setState(() {});
                  //   }
                  // });
                  await pickImage().then((value) async {
                    await uploadStoreImage(_email, value);
                    setState(() {
                      _storeImage = value;
                    });
                  });
                },
                child: Container(
                  height: 200,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: Colors.grey,
                      )),
                  child: _storeImage == null
                      ? Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(AppAssets.addImage),
                            const SizedBox(height: 8),
                            const Text("Upload Shop Image")
                          ],
                        )
                      : Image.file(
                          _storeImage!,
                          fit: BoxFit.cover,
                        ),
                ),
              ),
              const SizedBox(height: 12),
              TextFormField(
                keyboardType: TextInputType.name,
                textCapitalization: TextCapitalization.words,
                textInputAction: TextInputAction.next,
                onFieldSubmitted: (s) => Get.focusScope?.nextFocus(),
                onChanged: (s) {
                  _storeName = s.trim();
                },
                validator: (s) {
                  if (s == null || s.trim().isEmpty) {
                    return '*required';
                  }
                },
                decoration: const InputDecoration(labelText: 'Shop Name'),
              ),
              const SizedBox(height: 12),
              TextFormField(
                textInputAction: TextInputAction.next,
                onFieldSubmitted: (s) => Get.focusScope?.nextFocus(),
                onChanged: (s) {
                  _gstId = s.trim();
                },
                validator: (s) {
                  if (s == null || s.trim().isEmpty) {
                    return '*required';
                  }
                },
                decoration: const InputDecoration(labelText: 'GST Id'),
              ),
              const SizedBox(height: 12),
              const Text(
                "Enter shop location",
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 12),
              TextFormField(
                textInputAction: TextInputAction.next,
                onFieldSubmitted: (s) => Get.focusScope?.nextFocus(),
                onChanged: (s) {
                  _country = s.trim();
                },
                validator: (s) {
                  if (s == null || s.trim().isEmpty) {
                    return '*required';
                  }
                },
                decoration: const InputDecoration(labelText: 'Select Country'),
              ),
              const SizedBox(height: 12),
              TextFormField(
                textInputAction: TextInputAction.next,
                onFieldSubmitted: (s) => Get.focusScope?.nextFocus(),
                onChanged: (s) {
                  _district = s.trim();
                },
                validator: (s) {
                  if (s == null || s.trim().isEmpty) {
                    return '*required';
                  }
                },
                decoration: const InputDecoration(labelText: 'Select Dist'),
              ),
              const SizedBox(height: 12),
              TextFormField(
                textInputAction: TextInputAction.next,
                onFieldSubmitted: (s) => Get.focusScope?.nextFocus(),
                onChanged: (s) {
                  _city = s.trim();
                },
                validator: (s) {
                  if (s == null || s.trim().isEmpty) {
                    return '*required';
                  }
                },
                decoration: const InputDecoration(labelText: 'Select City'),
              ),
              const SizedBox(height: 12),
              const Text(
                "Select your business identity",
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 12),
              SizedBox(
                height: 150,
                child: Row(
                  children: [
                    Expanded(
                      child: StoreTypeTile(
                        title: "Stall",
                        avatar: AppAssets.stall,
                        selected: _storeType == 1,
                        onTap: () {
                          setState(() {
                            _storeType = 1;
                          });
                        },
                      ),
                    ),
                    Expanded(
                      child: StoreTypeTile(
                        title: "Shop",
                        avatar: AppAssets.shop,
                        selected: _storeType == 2,
                        onTap: () {
                          setState(() {
                            _storeType = 2;
                          });
                        },
                      ),
                    ),
                    Expanded(
                      child: StoreTypeTile(
                        title: "Showroom",
                        avatar: AppAssets.showroom,
                        selected: _storeType == 3,
                        onTap: () {
                          setState(() {
                            _storeType = 3;
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 12),
              const Text(
                "Category of product",
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 12),
              DropdownButtonFormField<String>(
                validator: (s) {
                  if (s == null) {
                    return '*required';
                  }
                },
                decoration: const InputDecoration(
                  labelText: 'Select Category',
                ),
                onChanged: (s) {
                  setState(() {
                    _category = s;
                  });
                },
                value: _category,
                items: ["Grocery", "a", "b", "c", "d"]
                    .map(
                      (e) => DropdownMenuItem(
                        child: Text(e),
                        value: e.toString(),
                      ),
                    )
                    .toList(),
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Opening time",
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ),
                        OutlinedButton(
                          onPressed: () {
                            showTimePicker(
                                    context: context,
                                    initialTime: TimeOfDay.now())
                                .then((value) {
                              if (value != null) {
                                setState(() {
                                  _openingTime = value;
                                });
                              }
                            });
                          },
                          child: Text(
                            _openingTime == null
                                ? "Select"
                                : _openingTime!.format(context),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Closing time",
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                      OutlinedButton(
                        onPressed: () {
                          showTimePicker(
                            context: context,
                            initialTime: TimeOfDay.now(),
                          ).then((value) {
                            if (value != null) {
                              setState(() {
                                _closingTime = value;
                              });
                            }
                          });
                        },
                        child: Text(
                          _closingTime == null
                              ? "Select"
                              : _closingTime!.format(context),
                        ),
                      ),
                    ],
                  )),
                ],
              ),
              SizedBox(height: 32),
              AppPrimaryButton(
                child: const Text("Create store"),
                onPressed: _submit,
                key: _btnKey,
              ),
              const SizedBox(height: 38),
            ],
          ),
        ),
      ),
    );
  }

  _submit() async {
    final state = _formKey.currentState;
    if (state == null) return;
    if (state.validate()) {
      // print(_storeName);
      // print(_gstId);
      // print(_country);
      // print(_state);
      // print(_district);
      // print(_city);
      // print(_storeType);
      // print(_category);
      // print(_openingTime);
      // print(_closingTime);
      var getArgs = Get.arguments;
      _email = getArgs['email'];
      _phoneNo = getArgs['phoneNo'];
      _userID = getArgs['userID'];

      var addStoreResponse = await addStore.addStoreReq(
          shopName: _storeName,
          GSTid: _gstId,
          country: _country,
          dist: _district,
          city: _city,
          storeType: _storeType,
          prodCategory: _category,
          openingTime: _openingTime,
          closingTime: _closingTime,
          StoreImageUrl: await getStoreImageUrl(_email));
      if (addStoreResponse.statusCode == 200) {
        var addStoreResponseData = jsonDecode(addStoreResponse.body);
        if (addStoreResponseData['success']) {
          // print(addStoreResponseData['store']['_id']);
          // print('GREAT');

          if (state.validate()) {
            //check it for: Image comment by Suhag
            if (_storeImage == null) {
              SnackBarHelper.show("Please select a store image.");
            } else if (_openingTime == null) {
              SnackBarHelper.show("Please choose opening time.");
            } else if (_closingTime == null) {
              SnackBarHelper.show("Please choose closing time.");
            } else {
              state.save();
              _btnKey.currentState?.showLoader();
              try {
                setState(() {
                  addMsg = addStoreResponseData['message'];
                });

                createPopup(
                  context,
                  addMsg: addMsg,
                  onPressed: () {
                    print(Get.arguments);
                    Get.offAllNamed(
                      VendorDashboardPage.routeName,
                      arguments: {
                        'userID': _userID,
                        'email': _email,
                        'phoneNo': _phoneNo,
                        'storeID': addStoreResponseData['store']['_id'],
                      },
                    );
                  },
                );
              } catch (e, s) {
                SnackBarHelper.show(e.toString());
                log("ERROR", stackTrace: s, error: e);
                _btnKey.currentState?.hideLoader();
              }
            }
          } else {
            setState(() {
              _autovalidateMode = AutovalidateMode.always;
            });
          }
        }
      } else {
        setState(() {
          err_msg = 'Something went wrong';
          ScaffoldMessenger.of(context).showMaterialBanner(
            materialBanner(context, err_msg),
          );
        });
      }
    }
  }
}

class StoreTypeTile extends StatelessWidget {
  final String title, avatar;
  final bool selected;
  final VoidCallback? onTap;
  const StoreTypeTile(
      {this.onTap,
      required this.avatar,
      required this.title,
      this.selected = false,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(4, 8, 4, 8),
      child: Stack(
        children: [
          Positioned.fill(
            child: Material(
              elevation: 2,
              borderRadius: BorderRadius.circular(4),
              clipBehavior: Clip.antiAlias,
              child: InkWell(
                onTap: onTap,
                child: Column(
                  children: [
                    Expanded(child: Image.asset(avatar)),
                    const SizedBox(height: 6),
                    Text(title),
                    const SizedBox(height: 12),
                  ],
                ),
              ),
            ),
          ),
          if (selected)
            const Positioned(
                right: 2,
                top: 2,
                child: Material(
                    type: MaterialType.circle,
                    color: Color(0xffAECEFF),
                    child: Padding(
                      padding: EdgeInsets.all(2),
                      child: Icon(Icons.done, size: 16),
                    )))
        ],
      ),
    );
  }
}
