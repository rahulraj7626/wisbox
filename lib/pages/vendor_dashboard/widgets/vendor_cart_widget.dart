import 'package:flutter/material.dart';

///
/// Created by Sunil Kumar (sunil@smarttersstudio.com)
/// On 09-11-2021 04:59 PM
///
class VendorCartWidget extends StatelessWidget {
  const VendorCartWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
          child: CartTile(),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
          child: CartTile(),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
          child: CartTile(),
        ),
      ],
    );
  }
}

class CartTile extends StatelessWidget {
  const CartTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                    "https://image.freepik.com/free-psd/close-up-wood-texture-mockup_23-2149160964.jpg",
                  ))),
          clipBehavior: Clip.antiAlias,
          // height: 120,
          width: 80,
        ),
        Expanded(
            child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                      child: Text(
                    "ProductName",
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  )),
                  GestureDetector(onTap: () {}, child: Icon(Icons.close)),
                ],
              ),
              Text(
                "Product description",
                maxLines: 2,
              ),
              Row(
                children: [
                  Row(
                    children: [
                      Material(
                        color: const Color(0xffA398F9),
                        borderRadius: BorderRadius.circular(4),
                        clipBehavior: Clip.antiAlias,
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(6, 4, 6, 4),
                          child: Row(
                            children: [
                              Text("Qty:"),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(4, 0, 4, 0),
                                child: Text("2"),
                              ),
                              Icon(Icons.keyboard_arrow_down)
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(width: 6),
                  Row(
                    children: [
                      Material(
                        color: const Color(0xffA398F9),
                        borderRadius: BorderRadius.circular(4),
                        clipBehavior: Clip.antiAlias,
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(6, 4, 6, 4),
                          child: Row(
                            children: [
                              Text("Qty:"),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(4, 0, 4, 0),
                                child: Text("2"),
                              ),
                              Icon(Icons.keyboard_arrow_down)
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                  Spacer(),
                  Text(
                    "₹ 440",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ],
          ),
        ))
      ],
    );
  }
}
