import 'package:flutter/material.dart';

///
/// Created by Sunil Kumar (sunil@smarttersstudio.com)
/// On 15-11-2021 08:59 PM
///
class HomeTopPicksNear extends StatelessWidget {
  const HomeTopPicksNear({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final list = [
    //   "assets/icons/dress_category.png",
    //   "assets/icons/shirt_category.png",
    //   "assets/icons/watch_category.png",
    //   "assets/icons/vegetable_category.png",
    //   "assets/icons/coffee_category.png",
    //   "assets/icons/electronic_category.png",
    // ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
          child: Text(
            "Top Picks near you",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ),
        ),
        ColoredBox(
          color: const Color(0x33ab9df4),
          child: GridView.builder(
              itemCount: 6,
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              padding: const EdgeInsets.all(16),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, crossAxisSpacing: 16, mainAxisSpacing: 16),
              itemBuilder: (context, index) {
                return Material(
                  borderRadius: BorderRadius.circular(12),
                  clipBehavior: Clip.antiAlias,
                  child: Stack(
                    children: [
                      Positioned.fill(
                        child: Image.network(
                          "https://image.freepik.com/free-photo/plate-with-chocolate-topping-ice-cream-cups_23-2148505921.jpg",
                          fit: BoxFit.cover,
                        ),
                      ),
                      Positioned(
                          left: 0,
                          right: 0,
                          bottom: 0,
                          height: 42,
                          child: Container(
                            decoration: const BoxDecoration(
                                gradient: LinearGradient(
                                    colors: [
                                  Colors.black54,
                                  Colors.transparent
                                ],
                                    end: Alignment.topCenter,
                                    begin: Alignment.bottomCenter)),
                          )),
                      const Positioned(
                          left: 0,
                          right: 0,
                          bottom: 4,
                          child: Center(
                            child: Text(
                              "Ice-Cream",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          )),
                    ],
                  ),
                );
              }),
        ),
      ],
    );
  }
}
