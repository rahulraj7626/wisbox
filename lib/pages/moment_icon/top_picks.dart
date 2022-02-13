import 'package:flutter/material.dart';


class TopPicks extends StatelessWidget {
  const TopPicks({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
  

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.fromLTRB(16, 5, 16, 5),
          child: Text(
            "Hot Picks near you",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
          ),
        ),
      SizedBox(
        height: 240,
        //  color: const Color(0x33ab9df4),
          child: ListView.builder(
         scrollDirection: Axis.horizontal,
           itemCount: 6,
              padding: const EdgeInsets.all(16),
     
              itemBuilder: (context, index) {
                return Container(
                  margin: const EdgeInsets.all(10),
                  height: 220,
                width: 200,
                 // borderRadius: BorderRadius.circular(12),
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
                  child: Stack(
                    children: [
                      Positioned.fill(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.network(
                            "https://image.freepik.com/free-photo/plate-with-chocolate-topping-ice-cream-cups_23-2148505921.jpg",
                            fit: BoxFit.cover,
                            height: 220,
                            width: 200,
                          ),
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
                                //  Colors.black54,
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