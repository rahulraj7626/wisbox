import 'package:flutter/material.dart';

 import 'package:flutter/material.dart';
 import 'package:nexmat/data_models/rest_error.dart';
import 'package:nexmat/pages/dashboard/home/widgets/nearby_shop_tile.dart';
import 'package:nexmat/utils/common_functions.dart';
import 'package:nexmat/utils/shared_preference_helper.dart';
import 'package:nexmat/widgets/app_error_widget.dart';
import 'package:nexmat/widgets/app_loader.dart';

///
/// Created by Sunil Kumar (sunil@smarttersstudio.com)
/// On 06-11-2021 06:45 PM
///
class AllNearByStoresPage extends StatelessWidget {
  static const routeName = "/AllNearByStoresPage";
  const AllNearByStoresPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Nearby Stores"),
      ),
      body:  ListView(
                  children: [2,2,3,4,5].map((e) => NearByShopTile()).toList()) ,
    );
  }
}
