import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nexmat/data_models/rest_error.dart';
import 'package:nexmat/pages/dashboard/home/widgets/deal_of_ther_slider.dart';
import 'package:nexmat/pages/product/product_details_page.dart';
import 'package:nexmat/pages/profile/widgets/profile_details_page.dart';
import 'package:nexmat/pages/store/widgets/store_deatils_slider.dart';
import 'package:nexmat/utils/constants.dart';
import 'package:nexmat/widgets/app_error_widget.dart';
import 'package:nexmat/widgets/app_loader.dart';

///
/// Created by Sunil Kumar (sunil@smarttersstudio.com)
/// On 06-11-2021 11:53 AM
///
class StoreDetailsPage extends StatefulWidget {
  static const routeName = "/StoreDetailsPage";

  const StoreDetailsPage({Key? key}) : super(key: key);

  @override
  _StoreDetailsPageState createState() => _StoreDetailsPageState();
}

class _StoreDetailsPageState extends State<StoreDetailsPage> {
  late String storeId;
  @override
  void initState() {
    super.initState();
    final map = Get.arguments as Map<String, dynamic>?;
    if (map != null) {
      storeId = map["id"];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            StoreDetailsSlider({"image":"https://joyfoodsunshine.com/wp-content/uploads/2020/06/homemade-chocolate-ice-cream-recipe-7.jpg"}),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
              child: Row(
                children: [
                  Expanded(
                      child: Text(
                    "storeName",
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.w600),
                  )),
                  const SizedBox(width: 16),
                  const Material(
                    color: Color(0xffA398F9),
                    shape: StadiumBorder(),
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(6, 2, 6, 2),
                      child: Text(
                        "WOW!",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(22, 4, 22, 8),
              child: Text(
                "formattedAddress",
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(16, 22, 16, 12),
              child: Text(
                "Our Products",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
            ),
            Container(
                height: 240,
                color: const Color(0xffa880ff),
                child: ListView.builder(
                    padding: const EdgeInsets.only(left: 16),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Get.toNamed(ProductDetailsPage.routeName);
                        },
                        child: DealOfDayProduct(
                            image: "https://joyfoodsunshine.com/wp-content/uploads/2020/06/homemade-chocolate-ice-cream-recipe-7.jpg", name: "name", price: "price",type: dealOfTheDay.home),
                      );
                    },
                    itemCount: 5))
          ],
        ),
      ),
    );
  }
}
