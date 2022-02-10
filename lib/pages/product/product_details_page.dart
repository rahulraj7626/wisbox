import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nexmat/pages/payment/payment_page.dart';
import 'package:nexmat/utils/snackbar_helper.dart';
import 'package:nexmat/widgets/app_buttons/app_primary_button.dart';
import 'package:nexmat/widgets/app_loader.dart';

///
/// Created by Sunil Kumar (sunil@smarttersstudio.com)
/// On 10-11-2021 01:08 PM
///
class ProductDetailsPage extends StatefulWidget {
  static const routeName = "/product-details";
  const ProductDetailsPage({Key? key}) : super(key: key);

  @override
  _ProductDetailsPageState createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  late String productId;
  @override
  void initState() {
    super.initState();
    final map = Get.arguments as Map<String, dynamic>?;
    if (map != null) {
      productId = map["id"];
    }
  }

  int quantity = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:   ListView(
            children: [
              AspectRatio(
                aspectRatio: 1,
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Material(
                    borderRadius: BorderRadius.circular(12),
                    clipBehavior: Clip.antiAlias,
                    child: Stack(
                      children: [
                        Positioned.fill(
                          child: Image.network(
                          "https://images.pexels.com/photos/9660918/pexels-photo-9660918.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
                            width: double.infinity,
                            height: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Positioned(
                          left: 22,
                          top: 22,
                          child: Material(
                            color: Colors.white,
                            type: MaterialType.circle,
                            clipBehavior: Clip.antiAlias,
                            child: InkWell(
                              onTap: () => Get.back(),
                              child: const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Icon(Icons.arrow_back_rounded),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          right: 22,
                          top: 22,
                          child: Material(
                            color: Colors.white,
                            type: MaterialType.circle,
                            clipBehavior: Clip.antiAlias,
                            child: InkWell(
                              onTap: () {},
                              child: const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Icon(Icons.bookmark),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Row(
                children: [
                  const SizedBox(width: 16),
                  Expanded(
                      child: Text(
                   "Name",
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.w500),
                  )),
                  const SizedBox(width: 16),
                  Text(
                    "₹ 122",
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(width: 16),
                ],
              ),
              const SizedBox(height: 6),
              Row(
                children: [
                  const SizedBox(width: 16),
                  const Text(
                    "Buy it from",
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey),
                  ),
                  Flexible(
                    child: Text(
                      "storeName",
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.w600),
                    ),
                  ),
                  const SizedBox(width: 16),
                ],
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
                child: Row(
                  children: [
                    Material(
                        clipBehavior: Clip.antiAlias,
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              quantity++;
                            });
                          },
                          child: const Padding(
                            padding: EdgeInsets.all(6),
                            child: Icon(Icons.add),
                          ),
                        ),
                        color: Colors.black26,
                        type: MaterialType.circle),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "$quantity",
                        style: const TextStyle(
                            fontSize: 22, fontWeight: FontWeight.w600),
                      ),
                    ),
                    Material(
                        clipBehavior: Clip.antiAlias,
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              quantity--;
                            });
                          },
                          child: const Padding(
                            padding: EdgeInsets.all(6),
                            child: Icon(Icons.remove),
                          ),
                        ),
                        color: Colors.black26,
                        type: MaterialType.circle),
                    const Spacer(),
                    AppPrimaryButton(
                      child: const Text("Buy"),
                      height: 48,
                      width: 110,
                      onPressed: quantity <= 0
                          ? null
                          : () {
                              // if (quantity >
                              //     int.parse(
                              //         snapshot.data?.data()?["quantity"])) {
                              //   SnackBarHelper.show("Quantity not available");
                              // } else {
                              //   Get.to(() => PaymentPage(
                              //         userId: FirebaseAuth
                              //                 .instance.currentUser?.uid ??
                              //             "",
                              //         productId: productId,
                              //         quantity: quantity,
                              //         total: quantity *
                              //             double.parse(
                              //                 snapshot.data?.data()?["price"]),
                              //         storeId: snapshot.data?.data()?["store"],
                              //       ));
                              // }
                            },
                    )
                  ],
                ),
              )
            ],

    ));
  }
}
