import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nexmat/app_configs/app_assets.dart';
import 'package:nexmat/pages/product/add_product_page.dart';

///
/// Created by Sunil Kumar (sunil@smarttersstudio.com)
/// On 20-12-2021 10:40 AM
///
class VendorLetsStartPage extends StatelessWidget {
  static const routeName = "/VendorLetsStartPage";
  const VendorLetsStartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          if (Navigator.canPop(context))
            const Align(alignment: Alignment.centerLeft, child: BackButton()),
          Expanded(child: Image.asset(AppAssets.vendorLetsStart)),
          const Text(
            "Let’s Start",
            style: TextStyle(fontSize: 26, fontWeight: FontWeight.w800),
          ),
          const Padding(
            padding: EdgeInsets.all(16),
            child: Text(
              "Add your first product to get started",
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(
            child: Material(
              color: const Color(0xffA398F9),
              type: MaterialType.circle,
              clipBehavior: Clip.antiAlias,
              child: InkWell(
                  onTap: () {
                    Get.toNamed(AddProductPage.routeName);
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(12),
                    child: Icon(Icons.keyboard_arrow_right),
                  )),
            ),
          )
        ],
      ),
    );
  }
}
