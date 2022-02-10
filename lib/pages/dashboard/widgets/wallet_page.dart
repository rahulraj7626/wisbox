import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:nexmat/data_models/rest_error.dart';
import 'package:nexmat/widgets/app_error_widget.dart';
import 'package:nexmat/widgets/app_loader.dart';

///
/// Created by Sunil Kumar (sunil@smarttersstudio.com)
/// On 31-10-2021 08:03 PM
///
class WalletPage extends StatefulWidget {
  const WalletPage({Key? key}) : super(key: key);

  @override
  _WalletPageState createState() => _WalletPageState();
}

class _WalletPageState extends State<WalletPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(16),
            child: Text(
              "Shopping History",
              style: TextStyle(fontSize: 23, fontWeight: FontWeight.w800),
            ),
          ),
          Expanded(
            child:   ListView.builder(
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.fromLTRB(16, 4, 16, 16),
                          child: Material(
                            elevation: 2,
                            borderRadius: BorderRadius.circular(8),
                            clipBehavior: Clip.antiAlias,
                            child:   Row(
                                    children: [
                                         Expanded(
                                          child: Row(
                                            children: [
                                              Expanded(
                                                flex: 2,
                                                child: Image.network(
                                                  "https://images.pexels.com/photos/9660918/pexels-photo-9660918.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
                                                  height: 80,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                              const SizedBox(width: 6),
                                              Expanded(
                                                flex: 3,
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      "Product name",
                                                      style: const TextStyle(
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.w700),
                                                    ),
                                                    Text(
                                                      "Store Name",
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      const SizedBox(width: 6),
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            6, 6, 16, 6),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            Text(
                                              "₹ 1222 ",
                                              style: const TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w800),
                                            ),
                                            Text("dd MM yyyy"),
                                            // if (snapshot.data!.docs[index]
                                            //         .data()["status"] ==
                                            //     -1)
                                              const Text(
                                                "Cancelled",
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    color: Colors.red),
                                              ),
                                          ],
                                        ),
                                      ),
                                    ],
                                ),
                          ),
                        );
                      },
                      itemCount:12
                    )
          )
        ],
      ),
    );
  }
}
