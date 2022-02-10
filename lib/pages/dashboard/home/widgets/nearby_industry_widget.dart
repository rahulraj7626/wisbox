import 'package:flutter/material.dart';
import 'package:nexmat/pages/dashboard/home/widgets/top_recommendation_tile.dart';

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
        const Padding(
          padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
          child: Text(
            "Best Near you",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ),
        ),
        SizedBox(
            height: 60,
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
              children: const [
                Chip(
                  label: Text("Grocery"),
                  labelStyle: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
                  backgroundColor: Colors.deepPurple,
                  padding: EdgeInsets.fromLTRB(16, 12, 16, 12),
                ),
                SizedBox(width: 16),
                Chip(
                  label: Text("Fashion"),
                  labelStyle: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                  padding: EdgeInsets.fromLTRB(16, 12, 16, 12),
                ),
                SizedBox(width: 16),
                Chip(
                  label: Text("Grocery"),
                  labelStyle: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
                  backgroundColor: Colors.deepPurple,
                  padding: EdgeInsets.fromLTRB(16, 12, 16, 12),
                ),
                SizedBox(width: 16),
                Chip(
                  label: Text("Fashion"),
                  labelStyle: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                  padding: EdgeInsets.fromLTRB(16, 12, 16, 12),
                ),
              ],
            )),
      ],
    );
  }
}
