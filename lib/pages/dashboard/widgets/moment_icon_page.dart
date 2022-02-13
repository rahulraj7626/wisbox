import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nexmat/pages/dashboard/home/widgets/deal_of_ther_slider.dart';
import 'package:nexmat/pages/dashboard/home/widgets/home_category.dart';
import 'package:nexmat/pages/dashboard/home/widgets/most_trending_store_widget.dart';
import 'package:nexmat/pages/dashboard/home/widgets/near_by_stores.dart';
import 'package:nexmat/pages/dashboard/home/widgets/nearby_industry_widget.dart';
import 'package:nexmat/pages/dashboard/home/widgets/new_openings.dart';
import 'package:nexmat/pages/dashboard/home/widgets/our_recomendations_widget.dart';
import 'package:nexmat/pages/dashboard/home/widgets/recomended_products_slider.dart';
import 'package:nexmat/pages/dashboard/home/widgets/sponsered_ads.dart';
import 'package:nexmat/pages/dashboard/home/widgets/top_recommendation_tile.dart';
import 'package:nexmat/pages/onboarding/select_location_page.dart';
import 'package:nexmat/pages/store/all_nearby_stores.dart';
import 'package:nexmat/utils/constants.dart';
import 'package:nexmat/utils/shared_preference_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:nexmat/app_configs/app_assets.dart';
import 'package:nexmat/pages/dashboard/home/home_page.dart';
import 'package:nexmat/pages/dashboard/widgets/moment_icon_page.dart';
import 'package:nexmat/pages/dashboard/widgets/wallet_page.dart';
import 'package:nexmat/pages/profile/profile_page.dart';
import 'package:nexmat/widgets/user_circle_avatar.dart';

import '../../moment_icon/top_picks.dart';

///
/// Created by Sunil Kumar (sunil@smarttersstudio.com)
/// On 31-10-2021 08:02 PM
///
class MomentIconPage extends StatefulWidget {
  const MomentIconPage({Key? key}) : super(key: key);

  @override
  _MomentIconPageState createState() => _MomentIconPageState();
}

class _MomentIconPageState extends State<MomentIconPage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: theme.scaffoldBackgroundColor,
        elevation: 0,
        iconTheme: IconThemeData(color: theme.primaryColor),
        actionsIconTheme: IconThemeData(color: theme.primaryColor),
        centerTitle: false,
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(
              AppAssets.logo,
              width: 38,
              color: Colors.grey,
            ),
            const SizedBox(width: 10),
            Text(
              "NEXMAT",
              style: TextStyle(
                  color: theme.primaryColor, fontWeight: FontWeight.w500),
            ),
          ],
        ),
        actions: [
          IconButton(
              onPressed: () {}, icon: const Icon(Icons.notifications_outlined)),
          GestureDetector(
            onTap: () {
              Get.toNamed(ProfilePage.routeName);
            },
            child: const UserCircleAvatar(
              imageUrl:
                  "https://gitlab.com/uploads/-/system/user/avatar/3477620/avatar.png?width=90",
              name: "Sunil",
              radius: 18,
            ),
          ),
          const SizedBox(width: 8)
        ],
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
            child: Row(
              children: const [
                Text(
                  "Fortune Grocery",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
                Text(
                  " (Cart Details)",
                ),
              ],
            ),
          ),
          Container(
            color: Colorconstants.color8E81F4.withOpacity(.10),
              height: 230,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                children: const [
                  DealOfDayProduct(type: dealOfTheDay.momentIcon),
                  DealOfDayProduct(type: dealOfTheDay.momentIcon),
                  DealOfDayProduct(type: dealOfTheDay.momentIcon),
                  DealOfDayProduct(type: dealOfTheDay.momentIcon),
                ],
              )),
          Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 4),
                child: ElevatedButton(
                    onPressed: () {}, child: const Text("Pay: ₹ 880/-")),
              )),
          const NearByIndustryWidget(),
          Container(
            color: Colorconstants.color8E81F4.withOpacity(.2),
            child: GridView.builder(
                padding: const EdgeInsets.fromLTRB(16, 16, 0, 16),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 0,
                  crossAxisSpacing: 0,
                  childAspectRatio: .7
                ),
                itemCount: 10,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) => const DealOfDayProduct(type: dealOfTheDay.blueOffer)),
          ),
          TopPicks()
        ],
      ),
    );
  }
}
