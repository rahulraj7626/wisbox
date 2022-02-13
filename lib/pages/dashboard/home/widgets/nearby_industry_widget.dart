import 'package:flutter/material.dart';
import 'package:nexmat/pages/dashboard/home/widgets/top_recommendation_tile.dart';
import 'package:nexmat/utils/constants.dart';
import 'package:nexmat/widgets/text_widget.dart';

///
/// Created by Sunil Kumar (sunil@smarttersstudio.com)
/// On 05-11-2021 08:06 PM
///
class NearByIndustryWidget extends StatelessWidget {
  const NearByIndustryWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
         Padding(
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children:  [
              const Text(
                "Best Near you",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
               Text(
                "View More",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500,color: Colorconstants.color472198,
              ),)
             
            ],
          ),
        ),
        SizedBox(
            height: 60,
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
              children:  [
                Chip(
                  avatar: const Icon(Icons.rice_bowl,color: Colors.white,size: 18,),
                  label: const Text("Grocery"),
                  labelStyle: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                      color: Colors.white),
                  backgroundColor: Colorconstants.color472198,
                  padding: const EdgeInsets.fromLTRB(16, 12, 16, 12),
                ),
                const SizedBox(width: 16),
                const Chip(
                          avatar:  Icon(Icons.person,color: Colors.black,size: 18),
                  label: Text("Fashion"),
                  labelStyle: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                  ),
                  padding: EdgeInsets.fromLTRB(16, 12, 16, 12),
                ),
                const SizedBox(width: 16),
                Chip(
                          avatar: const Icon(Icons.rice_bowl,color: Colors.white,size: 18),
                  label: const Text("Grocery"),
                  labelStyle: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                      color: Colors.white),
                  backgroundColor: Colorconstants.color472198,
                  padding: const EdgeInsets.fromLTRB(16, 12, 16, 12),
                ),
                const SizedBox(width: 16),
                const Chip(
                          avatar:  Icon(Icons.person,color: Colors.black,size: 18),
                  label: Text("Fashion"),
                  labelStyle: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                  ),
                  padding: EdgeInsets.fromLTRB(16, 12, 16, 12),
                ),
              ],
            )),
      ],
    );
  }
}
