import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
 import 'package:nexmat/pages/product/add_product_page.dart';
import 'package:nexmat/utils/shared_preference_helper.dart';
import 'package:nexmat/widgets/app_error_widget.dart';
import 'package:nexmat/widgets/app_loader.dart';

///
/// Created by Sunil Kumar (sunil@smarttersstudio.com)
/// On 15-11-2021 07:31 PM
///
class VendorProductsPage extends StatefulWidget {
  static const routeName = "/VendorProductsPage";

  const VendorProductsPage({Key? key}) : super(key: key);

  @override
  _VendorProductsPageState createState() => _VendorProductsPageState();
}

class _VendorProductsPageState extends State<VendorProductsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const Text("Your Products"),
        actions: [
          Center(
            child: ElevatedButton(
                onPressed: () {
                  Get.toNamed(AddProductPage.routeName);
                },
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    Text("Add New"),
                    SizedBox(width: 8),
                    Icon(Icons.navigate_next)
                  ],
                )),
          ),
          const SizedBox(width: 6)
        ],
      ),
      body:   ListView.builder(
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.fromLTRB(16, 4, 16, 16),
                    child: Material(
                      elevation: 2,
                      borderRadius: BorderRadius.circular(8),
                      clipBehavior: Clip.antiAlias,
                      child: Row(
                        children: [
                          Expanded(
                            flex: 2,
                            child: Image.network(
                            "https://images.pexels.com/photos/9660918/pexels-photo-9660918.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
                              height: 80,
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(width: 6),
                          Expanded(
                            flex: 3,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                   "name",
                                  style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700),
                                ),
                                Text("₹ 122"),
                              ],
                            ),
                          ),
                          const SizedBox(width: 6),
                          Material(
                            type: MaterialType.circle,
                            color: Colors.grey[400],
                            child: InkWell(
                              onTap: () {

                              },
                              child: const Padding(
                                padding: EdgeInsets.all(4),
                                child: Icon(Icons.add),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(6),
                            child: Text(
                              "12",
                              style: const TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w800),
                            ),
                          ),
                          Material(
                            type: MaterialType.circle,
                            color: Colors.grey[400],
                            child: InkWell(
                              onTap: () {

                              },
                              child: const Padding(
                                padding: EdgeInsets.all(4),
                                child: Icon(Icons.remove),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
                itemCount: 12)

    );
  }
}
