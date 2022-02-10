import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nexmat/imageToStorage/getImageUrl.dart';
import 'package:nexmat/pages/dashboard/home/widgets/deal_of_ther_slider.dart';
import 'package:nexmat/pages/dashboard/home/widgets/home_category.dart';
import 'package:nexmat/pages/dashboard/home/widgets/most_trending_store_widget.dart';
import 'package:nexmat/pages/dashboard/home/widgets/near_by_stores.dart';
import 'package:nexmat/pages/dashboard/home/widgets/nearby_industry_widget.dart';
import 'package:nexmat/pages/dashboard/home/widgets/new_openings.dart';
import 'package:nexmat/pages/dashboard/home/widgets/our_recomendations_widget.dart';
import 'package:nexmat/pages/dashboard/home/widgets/recomended_products_slider.dart';
import 'package:nexmat/pages/dashboard/home/widgets/sponsered_ads.dart';

import 'package:flutter_svg/flutter_svg.dart';

import 'package:nexmat/app_configs/app_assets.dart';

import 'package:nexmat/pages/profile/profile_page.dart';
import 'package:nexmat/widgets/user_circle_avatar.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
              Get.toNamed(
                ProfilePage.routeName,
                arguments: Get.arguments,
              );
            },
            child: UserCircleAvatar(
              imageUrl: "${Get.arguments['profilePic']}",
              name: "S",
              radius: 18,
            ),
          ),
          const SizedBox(width: 8)
        ],
      ),
      body: ListView(
        children: [
          // Padding(
          //   padding: const EdgeInsets.all(16),
          //   child: Material(
          //     color: Colors.grey.shade200,
          //     borderRadius: BorderRadius.circular(6),
          //     clipBehavior: Clip.antiAlias,
          //     child: Padding(
          //       padding: const EdgeInsets.fromLTRB(16, 12, 16, 12),
          //       child: Row(
          //         children: const [
          //           Icon(Icons.search),
          //           SizedBox(width: 4),
          //           Expanded(child: Text("Search for your location"))
          //         ],
          //       ),
          //     ),
          //   ),
          // ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Material(
              color: const Color(0xa4e2e1ff),
              clipBehavior: Clip.antiAlias,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6)),
              child: InkWell(
                onTap: () {},
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [Icon(Icons.search), Text("Search")],
                  ),
                ),
              ),
            ),
          ),
          GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.all(16),
              itemCount: 8,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                crossAxisSpacing: 0,
                mainAxisSpacing: 12,
              ),
              itemBuilder: (context, index) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    Expanded(
                      child: CircleAvatar(
                        radius: 32,
                        backgroundImage: NetworkImage(
                            "https://image.freepik.com/free-vector/realistic-changing-year-illustration_23-2149197830.jpg"),
                      ),
                    ),
                    SizedBox(height: 4),
                    Text("T-Shirt"),
                  ],
                );
              }),
          const MostTrendingStoreTile(),
          const SizedBox(height: 16),
          const DealOfTheDaySlider(),
          const SizedBox(height: 32),
          const NewOpenings(),
          const SizedBox(height: 32),
          const OurRecommendations(),
          const SizedBox(height: 16),
          const RecommendedProductsSlider(),
          const SizedBox(height: 16),
          const SponsoredAdds(),
          const SizedBox(height: 16),
          const HomeTopPicksNear(),
          const SizedBox(height: 16),
          const NearByIndustryWidget(),
          const NearByStores(),
          const Padding(
            padding: EdgeInsets.fromLTRB(16, 0, 16, 12),
            child: Text(
              "Sponsored Ads",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
          ),
          AspectRatio(
            aspectRatio: 1.3,
            child: Image.network(
              "https://image.freepik.com/free-vector/big-diwali-sale-banner-with-crackers-decoration_1017-21252.jpg",
              fit: BoxFit.cover,
            ),
          ),
          const NearByStores(),
          const Padding(
            padding: EdgeInsets.fromLTRB(16, 0, 16, 12),
            child: Text(
              "Sponsored Ads",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
          ),
          AspectRatio(
            aspectRatio: 1.3,
            child: Image.network(
              "https://image.freepik.com/free-vector/big-diwali-sale-banner-with-crackers-decoration_1017-21252.jpg",
              fit: BoxFit.cover,
            ),
          ),
          const NearByStores(),
          const Padding(
            padding: EdgeInsets.fromLTRB(16, 0, 16, 12),
            child: Text(
              "Sponsored Ads",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
          ),
          AspectRatio(
            aspectRatio: 1.3,
            child: Image.network(
              "https://image.freepik.com/free-vector/big-diwali-sale-banner-with-crackers-decoration_1017-21252.jpg",
              fit: BoxFit.cover,
            ),
          ),
          const NearByStores(),
          const Padding(
            padding: EdgeInsets.fromLTRB(16, 0, 16, 12),
            child: Text(
              "Sponsored Ads",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
          ),
          AspectRatio(
            aspectRatio: 1.3,
            child: Image.network(
              "https://image.freepik.com/free-vector/big-diwali-sale-banner-with-crackers-decoration_1017-21252.jpg",
              fit: BoxFit.cover,
            ),
          ),
          const NearByStores(),
          const Padding(
            padding: EdgeInsets.fromLTRB(16, 0, 16, 12),
            child: Text(
              "Sponsored Ads",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
          ),
          AspectRatio(
            aspectRatio: 1.3,
            child: Image.network(
              "https://image.freepik.com/free-vector/big-diwali-sale-banner-with-crackers-decoration_1017-21252.jpg",
              fit: BoxFit.cover,
            ),
          ),
          const NearByStores(),
          const Padding(
            padding: EdgeInsets.fromLTRB(16, 0, 16, 12),
            child: Text(
              "Sponsored Ads",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
          ),
          AspectRatio(
            aspectRatio: 1.3,
            child: Image.network(
              "https://image.freepik.com/free-vector/big-diwali-sale-banner-with-crackers-decoration_1017-21252.jpg",
              fit: BoxFit.cover,
            ),
          ),
          const NearByStores(),
          const SizedBox(height: 12),
          // const Text(
          //   "NEW Openings",
          //   style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
          // ),
          // const Text(
          //   "Top Picks near you",
          //   style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
          // ),
          // const Text(
          //   "Similar Shops ",
          //   style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
          // ),
          const SizedBox(height: 54),
        ],
      ),
    );
  }
}
