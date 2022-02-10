import 'package:flutter/material.dart';
import 'nearby_shop_tile.dart';

///
/// Created by Sunil Kumar (sunil@smarttersstudio.com)
/// On 05-11-2021 08:34 PM
///
class NearByStores extends StatelessWidget {
  const NearByStores({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
        children: List.generate(5, (index) => const NearByShopTile()));
  }
}
