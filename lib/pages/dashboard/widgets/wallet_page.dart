import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:nexmat/data_models/rest_error.dart';
import 'package:nexmat/utils/constants.dart';
import 'package:nexmat/widgets/app_error_widget.dart';
import 'package:nexmat/widgets/app_loader.dart';
import 'package:nexmat/widgets/text_widget.dart';

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
    return Scaffold(
      body: SafeArea(
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
              searchBox(),
                 Padding(
              padding: const EdgeInsets.all(30),
              child: Container(
                height: 230,
                width: MediaQuery.of(context).size.width,
                color: Colorconstants.colorF9F8FF,
              
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Weekly Expense",
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400,color: Colorconstants.color472198),
                        ),
                        dropDown()
                      ],
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 0,right: 0,top: 10,bottom: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                             const SizedBox(height: 15,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              weeklyExpense(context,"Show Piece","1450/-","saved 450"),
                               weeklyExpense(context,"Grocery","1450/-","saved 450")
                            ],
                          ),
                         const SizedBox(height: 15,),
                           Row(
                             mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              weeklyExpense(context,"Skin Care","1450/-","saved 450"),
                               weeklyExpense(context,"Medicine","1450/-","saved 450")
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                
              ),
            ),
            Container(
            padding:const EdgeInsets.only(right: 15),
              height: 20,
              width: MediaQuery.of(context).size.width,
              child:
              const Text(
                          "Weekly Expense",
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400,color: Colors.black,
                          ),
                          textAlign: TextAlign.right,
                        ),
        
            ),
            Expanded(
              child:   ListView.builder(
                padding: EdgeInsets.zero,
                physics: NeverScrollableScrollPhysics(),
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
                                                        MainAxisAlignment.spaceEvenly,
                                                    children:const [
                                                      Text(
                                                        "Product name",
                                                        style: TextStyle(
                                                            fontSize: 16,
                                                            fontWeight:
                                                                FontWeight.w700),
                                                      ),
                                                      SizedBox(height: 5,),
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
                                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                            children:const [
                                              Text(
                                                "₹ 1222 ",
                                                style:  TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w800),
                                              ),
                                              Text("dd MM yyyy"),
                                              // if (snapshot.data!.docs[index]
                                              //         .data()["status"] ==
                                              //     -1)
                                                 Text(
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
      ),
    );
  }

  Container weeklyExpense(BuildContext context,String title,String rate,String saved) {
    return Container(
     // margin: const EdgeInsets.only(left:5,right: 5,top: 5,bottom: 5),
                        height: 70,
                        width: MediaQuery.of(context).size.width/2.5,
                        color: Colorconstants.color8E81F4,
                        child: Row(
                          children: [
                            Container(
                              margin: const EdgeInsets.only(left: 4,right: 4),
                              height: 55,
                              width: 60,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.white,width: 1)
                            ),
                            
                              child: Image.network("https://images.pexels.com/photos/9660918/pexels-photo-9660918.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",fit: BoxFit.cover,))
                          
                         , 
                         
                         Column(
                           crossAxisAlignment: CrossAxisAlignment.start,
                           mainAxisAlignment: MainAxisAlignment.center,
                           children: [
                            textWidget(title, Colors.white, FontWeight.w700, 14),
                             textWidget(rate, Colors.white, FontWeight.w300, 12.5),
                              textWidget(saved, Colors.black, FontWeight.w400, 12.5)
                             
                           ],
                         )
                          ],
                        ),
                    
                      );
  }

  Padding searchBox() {
    return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Material(
            color: const Color(0xa4e2e1ff),
            clipBehavior: Clip.antiAlias,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6)),
            child: InkWell(
              onTap: () {},
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [Icon(Icons.search), 
                  const SizedBox(width: 5,),
                   Text(
              
              "Search all orders",
              style: GoogleFonts.poppins(
                color: Colorconstants.color747D88,
                fontWeight: FontWeight.w400,
                fontStyle: FontStyle.normal,
                fontSize:16,
              ),
              textScaleFactor: 1,
            )],
                ),
              ),
            ),
          ),
        );
  }
  bool drpError = false;
  int? drpValue;
  List drpList = [
    {'name': 'Weekly', 'id': '1'},
    {'name': 'Monthly', 'id': '2'},
   
  ];
   Widget dropDown() {
    return Container(
      height: 40,
      width: 140,
      margin:  const EdgeInsets.only(right: 10, left: 5, bottom: 0),
      padding: const EdgeInsets.only(right: 5, left: 10, bottom: 0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        border: Border.all(color: Colorconstants.colorA398F9, width: 1),
        // borderRadius: BorderRadius.circular(10)
      ),
      child: DropdownButton<int>(
        onTap: () {},
        iconEnabledColor: Colors.black45,
        value: drpValue,
        style: const TextStyle(color: Colors.black),
        isExpanded: true,
        dropdownColor: Colors.white,
        underline: Container(
          height: 0,
          // width: 150,
          color: drpError ? Colors.red : Colors.white,
        ),
        hint: Padding(
          padding: const EdgeInsets.only(left: 12),
          child: Text(
            "Last Week",
            style: GoogleFonts.mulish(
              color: Colors.black,
              fontWeight: FontWeight.w700,
              fontSize: 15,
              fontStyle: FontStyle.normal,
            ),
            textScaleFactor: 1,
          ),
        ),
        items: drpList.map<DropdownMenuItem<int>>((answer) {
          return DropdownMenuItem(
            value: int.parse(answer["id"].toString()),
            child: Container(
              padding: const EdgeInsets.only(left: 12),
              child: Text(
                answer["name"].toString(),
                style: GoogleFonts.mulish(
                  color: Colors.black,
                  fontWeight: FontWeight.w700,
                  fontSize: 15,
                  fontStyle: FontStyle.normal,
                ),
                textScaleFactor: 1,
              ),
            ),
          );
        }).toList(),
        onChanged: (value) {
          setState(() {
            drpError = false;
            drpValue = value;

            // print("$dptValue id of compny");
          });
          // print(companyValue.runtimeType);
        },
      ),
    );
  }
}
