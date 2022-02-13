import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nexmat/pages/dashboard/home/widgets/recomended_products_slider.dart';
import 'package:nexmat/utils/constants.dart';
import 'package:nexmat/widgets/text_widget.dart';

///
/// Created by Sunil Kumar (sunil@smarttersstudio.com)
/// On 06-11-2021 11:23 AM
///
class DealOfTheDaySlider extends StatelessWidget {
  const DealOfTheDaySlider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
         Padding(
          padding:const EdgeInsets.fromLTRB(16, 0, 16, 12),
          child:  textWidget("Deals of the day", Colors.black, FontWeight.w500, 20)
        ),
        Stack(
          children: [
            Container(
              height: 240,
              child: Row(
                children: [
                  Container(height:240,width: MediaQuery.of(context).size.width-50, color: const Color(0xff3E1D83).withOpacity(.49),),
                  Container(height: 240,width: 50,color: Colors.white,)
                ],
              ),
            ),
              Container(
            height: 240,
           // color: const Color(0xff3E1D83).withOpacity(.49),
            child: ListView(
              scrollDirection: Axis.horizontal,
              children:  [
                Padding(
                  padding:const  EdgeInsets.all(32),
                  child: Center(
                    child: textWidget(
                      "Best\nDeals",
                      Colors.white,   FontWeight.w600,
                           18,
                        
                          
                    ),
                  ),
                ),
                DealOfDayProduct(type: dealOfTheDay.home,),
                DealOfDayProduct(type: dealOfTheDay.home,),
                DealOfDayProduct(type: dealOfTheDay.home,),
                DealOfDayProduct(type: dealOfTheDay.home,),
              ],
            ),
          ),
          ],
         
        )
      ],
    );
  }
}

class DealOfDayProduct extends StatelessWidget {
  final String? image;
  final String? name;
  final String? price;
  final dealOfTheDay type;
 

  const DealOfDayProduct({Key? key, this.image, this.price, this.name,required this.type})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160,
      padding: const EdgeInsets.fromLTRB(0, 12, 16, 12),
      child: Material(
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
        elevation: 2,
        child: Column(children: <Widget>[
          Expanded(
              child: Stack(children: [
            Positioned.fill(
                child: Image.network(
              image ??
                  "https://images.pexels.com/photos/3987333/pexels-photo-3987333.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
              fit: BoxFit.cover,
            )),
            Positioned(
                right: 22,
                top: 0,
                width: 48,
                height: 65,
                child: CustomPaint(
                  painter:type==dealOfTheDay.blueOffer?OfferCustomPaint(): OfferCustomPaints(),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children:  [
                        Text(
                          "20%",
                          style: TextStyle(
                              color:type==dealOfTheDay.blueOffer?Colorconstants.color472198: Colors.white, fontWeight: FontWeight.w600),
                        ),
                        Text(
                          "OFF",
                          style: TextStyle(color:type==dealOfTheDay.blueOffer?Colorconstants.color472198: Colors.white),
                        ),
                      ],
                    ),
                  ),
                )),
          ])),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 2, 16, 5),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    name ?? "Name",
                    maxLines: 1,
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                ),
                Text(
                  "₹ ${price ?? "123"}",
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
          type==dealOfTheDay.home||type==dealOfTheDay.blueOffer?
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 5),
            child: Row(
              children: const [
                Expanded(
                  child: Text(
                    "Women Grey Regular Sneakers",
                    maxLines: 1,
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
                Icon(Icons.share_outlined,size: 15,)
              ],
            ),
          ):const SizedBox(height: 10,),
           type==dealOfTheDay.blueOffer?
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 5),
            child: Row(
              children: const [
                   SizedBox(width: 3,),
                Text(
                  "440",
                  maxLines: 1,
                  
                  style: TextStyle(color: Colors.grey,
                  decoration: TextDecoration.lineThrough,fontSize: 18),
                ),
                SizedBox(width: 3,),
            Text(
                    "330",
                    maxLines: 1,
                    
                    style: TextStyle(color: Colors.black,
                    fontSize: 18
                    ),
                  ),
              ],
            ),
          ):const SizedBox(height: 10,)
        ]),
      ),
    );
  }
}

class OfferCustomPaints extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colorconstants.color472198
      ..style = PaintingStyle.fill;
    

    final path = Path()
      ..moveTo(0, 0)
      ..lineTo(size.width, 0)
      ..lineTo(size.width, size.height)
      ..lineTo(size.width / 2, size.height - 16)
      ..lineTo(0, size.height)
      ..close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant OfferCustomPaint oldDelegate) {
    return false;
  }
}