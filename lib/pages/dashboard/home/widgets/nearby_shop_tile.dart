import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nexmat/pages/store/store_details_page.dart';
import 'package:nexmat/utils/common_functions.dart';
import 'package:nexmat/utils/constants.dart';
import 'package:nexmat/utils/shared_preference_helper.dart';

///
/// Created by Sunil Kumar (sunil@smarttersstudio.com)
/// On 31-10-2021 08:51 PM
///
class NearByShopTile extends StatelessWidget {
  const NearByShopTile({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(16),
      clipBehavior: Clip.antiAlias,
      elevation: 2,
       shape: RoundedRectangleBorder(
  borderRadius: BorderRadius.circular(10),
  ),
      child: InkWell(
        onTap: () {
          Get.toNamed(StoreDetailsPage.routeName, arguments: {"id": ""});
        },
        child: Column(
          children: [
            Stack(
              children: [
                Image.network(
                  "https://images.pexels.com/photos/9660918/pexels-photo-9660918.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
                  height: 200,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const SizedBox(width: 8),
                Expanded(
                    flex: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Store Name",
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text("Address"),
                         SizedBox(height: 4),
                        Row(
                          children: [
                            Material(
                              color: Colorconstants.color6B5BE7,
                              shape: const StadiumBorder(),
                              child: const Padding(
                                padding: EdgeInsets.fromLTRB(6, 4, 6, 4),
                                child: Text(
                                  "WOW!",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                            ),
                            const SizedBox(width: 5,),
                              Material(
                              color: Colorconstants.colorA398F9
,
                              shape: const StadiumBorder(),
                              child: const Padding(
                                padding: EdgeInsets.fromLTRB(6, 4, 6, 4),
                                child: Text(
                                  "Amazing!",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    )),
                const SizedBox(width: 8),
                Expanded(
                  child: Material(
                    color: Colors.deepPurple.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(8),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text("Address",style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                             decoration: TextDecoration.underline,
                            
                          ),
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: const [
                              SizedBox(width: 8),
                              Icon(
                                Icons.directions_walk,
                                size: 20,
                                color: Colors.grey,
                              ),
                             Text("2km ",style: TextStyle(
                            color: Colors.grey,
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                         
                            
                          ),
                          ),
                              SizedBox(width: 6),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
              ],
            ),
            const SizedBox(height: 12),
          ],
        ),
      ),
    );
  }
}
