import 'package:flutter/material.dart';
import 'package:nexmat/pages/dashboard/home/widgets/top_recommendation_tile.dart';
import 'package:nexmat/utils/constants.dart';
import 'package:nexmat/widgets/text_widget.dart';

///
/// Created by Sunil Kumar (sunil@smarttersstudio.com)
/// On 05-11-2021 08:45 PM
///
class OurRecommendations extends StatelessWidget {
  const OurRecommendations({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
         Padding(
          padding:const EdgeInsets.fromLTRB(16, 0, 20, 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              textWidget("Our Top Recomendations", Colors.black, FontWeight.w500, 20),
              Icon(Icons.search,color: Colorconstants.color747D88,)
            ],
          )
        ),
        SizedBox(
            height: 75,
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
              children: const [
                TopRecommendationTile(
                    "https://images.pexels.com/photos/10027871/pexels-photo-10027871.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
                    "Fashion"),
                TopRecommendationTile(
                    "https://images.pexels.com/photos/10027871/pexels-photo-10027871.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
                    "Grocery"),
                TopRecommendationTile(
                    "https://images.pexels.com/photos/10027871/pexels-photo-10027871.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
                    "Decoration"),
                TopRecommendationTile(
                    "https://images.pexels.com/photos/10027871/pexels-photo-10027871.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
                    "Fashion"),
              ],
            )),
      ],
    );
  }
}
