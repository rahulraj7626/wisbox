import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:nexmat/app_configs/app_assets.dart';
import 'package:nexmat/data_models/rest_error.dart';
import 'package:nexmat/imageToStorage/getImageUrl.dart';
import 'package:nexmat/imageToStorage/pickImage.dart';
import 'package:nexmat/imageToStorage/uploadImage.dart';
import 'package:nexmat/pages/login/banner.dart';
import 'package:nexmat/pages/onboarding/addedPopUp.dart';
import 'package:nexmat/pages/product/productAdd.dart';
import 'package:nexmat/pages/product/product_details_page.dart';
import 'package:nexmat/pages/vendor_dashboard/vendor_dashboard_page.dart';
import 'package:nexmat/utils/snackbar_helper.dart';
import 'package:nexmat/widgets/app_buttons/app_primary_button.dart';

class AddProductPage extends StatefulWidget {
  static const routeName = "/AddProductPage";
  const AddProductPage({Key? key}) : super(key: key);

  @override
  State<AddProductPage> createState() => _AddProductPageState();
}

class _AddProductPageState extends State<AddProductPage> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  final GlobalKey<AppPrimaryButtonState> _btnKey = GlobalKey();

  List<String> productTypes = [
    "ProductType1",
    "ProductType2",
    "ProductType3",
    "ProductType4"
  ];
  List<String> productBrands = [
    "productBrands1",
    "productBrands2",
    "productBrands3.",
    "productBrands4"
  ];
  List<int> quantities = [1, 2, 3, 4, 5, 6, 7, 8, 10, 12, 15, 20];
  List<String> units = ["KG", "Grams", "Lt.", "ML"];

  String? _name, _description, _productType, _brand, _price, _unit;
  int? _quantity;
  int _quantityFixed = 1;

  AutovalidateMode _autovalidateMode = AutovalidateMode.disabled;
  File? _image;

  var prodAdd = ProductAddForm();
  var err_msg = '';
  var addMsg = '';

  @override
  Widget build(BuildContext context) {
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
                "Add your Product",
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.w800),
              ),
              const SizedBox(height: 12),
              GestureDetector(
                onTap: () async {
                  await pickImage().then((value) async {
                    setState(() {
                      _image = value;
                    });
                    await uploadProductImage(Get.arguments['email'], value);
                    print(Get.arguments['email']);
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
                  child: _image == null
                      ? Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(AppAssets.addImage),
                            const SizedBox(height: 8),
                            const Text("Upload Product Image")
                          ],
                        )
                      : Image.file(
                          _image!,
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
                  _name = s.trim();
                },
                validator: (s) {
                  if (s == null || s.trim().isEmpty) {
                    return '*required';
                  }
                },
                decoration: const InputDecoration(labelText: 'Product Name'),
              ),
              const SizedBox(height: 12),
              const Text("Type of product"),
              const SizedBox(height: 12),
              DropdownButtonFormField<String>(
                items: productTypes
                    .map((e) => DropdownMenuItem(
                          child: Text(e),
                          value: e,
                        ))
                    .toList(),
                value: _productType,
                onChanged: (v) {
                  Get.focusScope?.unfocus();
                  _productType = v;
                },
                onSaved: (s) {
                  _productType = s?.trim();
                },
                validator: (s) {
                  if (s == null || s.trim().isEmpty) {
                    return '*required';
                  }
                },
                decoration: const InputDecoration(
                    hintText: 'Product Type', border: OutlineInputBorder()),
              ),
              const SizedBox(height: 12),
              const Text("Brand of product"),
              const SizedBox(height: 12),
              DropdownButtonFormField<String>(
                items: productBrands
                    .map((e) => DropdownMenuItem(
                          child: Text(e),
                          value: e,
                        ))
                    .toList(),
                value: _brand,
                onChanged: (v) {
                  Get.focusScope?.unfocus();
                  _brand = v;
                },
                onSaved: (s) {
                  _brand = s?.trim();
                },
                validator: (s) {
                  if (s == null || s.trim().isEmpty) {
                    return '*required';
                  }
                },
                decoration: const InputDecoration(
                    hintText: 'Product Brand', border: OutlineInputBorder()),
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  const Text("Quantity"),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          _quantityFixed = 1;
                        });
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Radio(
                              value: 1,
                              groupValue: _quantityFixed,
                              onChanged: (i) {
                                setState(() {
                                  _quantityFixed = 1;
                                });
                              }),
                          const Text("Fixed"),
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _quantityFixed = 2;
                      });
                    },
                    child: Row(
                      children: [
                        Radio(
                            value: 2,
                            groupValue: _quantityFixed,
                            onChanged: (i) {
                              setState(() {
                                _quantityFixed = 2;
                              });
                            }),
                        const Text("Variable"),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              if (_quantityFixed == 1) ...[
                DropdownButtonFormField<int>(
                  items: quantities
                      .map((e) => DropdownMenuItem(
                            child: Text("$e"),
                            value: e,
                          ))
                      .toList(),
                  value: _quantity,
                  onChanged: (v) {
                    Get.focusScope?.unfocus();
                    _quantity = v;
                  },
                  onSaved: (s) {
                    _quantity = s;
                  },
                  validator: (s) {
                    if (s == null) {
                      return '*required';
                    }
                  },
                  decoration: const InputDecoration(
                      hintText: 'Select Quantity',
                      border: OutlineInputBorder()),
                ),
                const SizedBox(height: 12),
              ],
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: DropdownButtonFormField<String>(
                      items: units
                          .map((e) => DropdownMenuItem(
                                child: Text(e),
                                value: e,
                              ))
                          .toList(),
                      value: _unit,
                      onChanged: (v) {
                        Get.focusScope?.unfocus();
                        _unit = v;
                        setState(() {});
                      },
                      onSaved: (s) {
                        _unit = s?.trim();
                      },
                      validator: (s) {
                        if (s == null || s.trim().isEmpty) {
                          return '*required';
                        }
                      },
                      decoration: const InputDecoration(
                          hintText: 'Unit', border: OutlineInputBorder()),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      textInputAction: TextInputAction.next,
                      onFieldSubmitted: (s) => Get.focusScope?.nextFocus(),
                      onSaved: (s) {
                        _price = s?.trim();
                      },
                      validator: (s) {
                        if (s == null || s.trim().isEmpty) {
                          return '*required';
                        }
                      },
                      decoration: InputDecoration(
                        labelText: 'Price',
                        suffixIcon: Text("₹/${_unit ?? "unit"}"),
                        prefixIcon: const Text("Price"),
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 12),
              TextFormField(
                keyboardType: TextInputType.multiline,
                textCapitalization: TextCapitalization.sentences,
                textInputAction: TextInputAction.done,
                onFieldSubmitted: (s) => Get.focusScope?.unfocus(),
                onChanged: (s) {
                  _description = s.trim();
                },
                minLines: 2,
                maxLines: 4,
                validator: (s) {
                  if (s == null || s.trim().isEmpty) {
                    return '*required';
                  }
                },
                decoration: const InputDecoration(labelText: 'Description'),
              ),
              const SizedBox(height: 36),
              AppPrimaryButton(
                child: const Text("Submit"),
                onPressed: _addProduct,
                key: _btnKey,
              ),
              const SizedBox(height: 38),
            ],
          ),
        ),
      ),
    );
  }

  void _addProduct() async {
    final state = _formKey.currentState;
    if (state == null) return;
    if (state.validate()) {
      var addProdResponse = await prodAdd.getAddProduct(
          prodName: _name,
          typeOfProd: _productType,
          brand: _brand,
          price: _price,
          quantType: _quantityFixed,
          unitType: _unit,
          description: _description,
          prodImage: await getProdImageUrl(Get.arguments['email']));
      if (addProdResponse.statusCode == 200) {
        var addProdResponseData = jsonDecode(addProdResponse.body);
        if (state.validate()) {
          if (_image == null) {
            SnackBarHelper.show("Please select a product image.");
            return;
          }
          state.save();

          try {
            print(addProdResponseData['product']);
            setState(() {
              addMsg = addProdResponseData['message'];
            });
            createPopup(
              context,
              addMsg: addMsg,
              onPressed: () {
                print('Great');
                Get.offAndToNamed(VendorDashboardPage.routeName,
                    arguments: Get.arguments);
              },
            );
          } catch (e, s) {
            SnackBarHelper.show(e.toString());
            log("ERROR", stackTrace: s, error: e);
            _btnKey.currentState?.hideLoader();
          }
        } else {
          setState(() {
            _autovalidateMode = AutovalidateMode.always;
          });
        }
      } else {
        setState(() {
          err_msg = 'Something went wrong. Try after some time.';
        });
        ScaffoldMessenger.of(context).showMaterialBanner(
          materialBanner(context, err_msg),
        );
      }
    }

    // final state = _formKey.currentState;
    // if (state == null) return;
  }
}
