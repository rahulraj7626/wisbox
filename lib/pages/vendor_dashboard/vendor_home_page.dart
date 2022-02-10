import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:nexmat/app_configs/app_assets.dart';
import 'package:nexmat/imageToStorage/getImageUrl.dart';
import 'package:nexmat/pages/dashboard/home/home_page.dart';
import 'package:nexmat/pages/dashboard/user_dashboard_page.dart';
import 'package:nexmat/pages/dashboard/widgets/moment_icon_page.dart';
import 'package:nexmat/pages/dashboard/widgets/wallet_page.dart';
import 'package:nexmat/pages/profile/profile_page.dart';
import 'package:nexmat/pages/vendor_dashboard/vendor_analytics_page.dart';
import 'package:nexmat/pages/vendor_dashboard/vendor_home_page.dart';
import 'package:nexmat/pages/vendor_dashboard/widgets/vendor_cart_widget.dart';
import 'package:nexmat/pages/vendor_dashboard/widgets/vendor_home_user_details.dart';
import 'package:nexmat/pages/vendor_dashboard/widgets/vendor_products.dart';
import 'package:nexmat/widgets/user_circle_avatar.dart';

class VendorHomePage extends StatefulWidget {
  const VendorHomePage({Key? key}) : super(key: key);

  @override
  _VendorHomePageState createState() => _VendorHomePageState();
}

class _VendorHomePageState extends State<VendorHomePage> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    var profPic;

    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: theme.scaffoldBackgroundColor,
        elevation: 0,
        iconTheme: IconThemeData(color: theme.primaryColor),
        actionsIconTheme: IconThemeData(color: theme.primaryColor),
        title: Text(
          "NEXTMAT",
          style:
              TextStyle(color: theme.primaryColor, fontWeight: FontWeight.w500),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications_outlined),
          ),
          GestureDetector(
            onTap: () {
              Get.toNamed(ProfilePage.routeName, arguments: {
                'userName': Get.arguments['userName'],
                'userID': Get.arguments['userID'],
                'email': Get.arguments['email'],
                'phoneNo': Get.arguments['phoneNo'],
                'authToken': Get.arguments['authToken']
              });
            },
            child: UserCircleAvatar(
              imageUrl:
                  "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png",
              radius: 18,
            ),
          ),
          const SizedBox(width: 8)
        ],
      ),
      body: ListView(
        children: [
          const VendorHomeUserDetails(),
          const VendorProducts(),
          const VendorCartWidget(),
          Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Material(
                borderRadius: BorderRadius.circular(6),
                color: const Color(0xff180200),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: const Text(
                    "Total: ₹880-/",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
              ),
            ),
          ),
          Row(
            children: [
              const SizedBox(width: 16),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text("Checkout"),
                  style: ElevatedButton.styleFrom(
                    primary: const Color(0xff180200),
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text("Credit"),
                  style: ElevatedButton.styleFrom(
                    primary: const Color(0xff180200),
                  ),
                ),
              ),
              const SizedBox(width: 16),
            ],
          )
        ],
      ),
    );
  }
}
