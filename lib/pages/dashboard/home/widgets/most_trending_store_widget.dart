import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nexmat/widgets/text_widget.dart';

///
/// Created by Sunil Kumar (sunil@smarttersstudio.com)
/// On 05-11-2021 08:00 PM
///
class MostTrendingStoreTile extends StatelessWidget {
  const MostTrendingStoreTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final theme = Theme.of(context);
    return AspectRatio(
      aspectRatio: 0.95,
      child: Stack(
        children: [
          const Positioned.fill(child: ColoredBox(color: Color(0xffCEC8FF
))),
          Positioned(
              top: 48,
              bottom: 48,
              width: size.width / 1.3,
              right: 16,
              child: const ColoredBox(color: Color(0x4d7a69ff))),
          Positioned(
              top: 22,
              left: 45,

              child: Material(
                type: MaterialType.circle,
                clipBehavior: Clip.antiAlias,
                color: const Color(0xff1A2A3A),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(12, 6, 12, 12),
                  child: Column(
                    children: const [
                      Icon(
                        Icons.people,
                        color: Colors.red,
                      ),
                      Text(
                        "73 Now",
                        style: TextStyle(color: Colors.white, fontSize: 10),
                      )
                    ],
                  ),
                ),
              )),
          Positioned(
              top: 100,
              left: 32,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                
                children:  [
                  Text(
                "CAESARS",
                style: GoogleFonts.ebGaramond(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  fontStyle: FontStyle.normal,
                  fontSize:31,
                ),
                textScaleFactor: 1,
              ),
                  const SizedBox(height: 4),
                Text(
                "awaits you",
                style: GoogleFonts.ebGaramond(
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.normal,
                  fontSize:19,
                ),
                textScaleFactor: 1,
              ), 
                ],
              )),
          Positioned(
              right: 38,
              top: 22,
              bottom: 94,
              width: 174,
              child: Material(
                clipBehavior: Clip.antiAlias,
                shape: RoundedRectangleBorder(
                    side: const BorderSide(color: Colors.white, width: 1.2),
                    borderRadius: BorderRadius.circular(8)),
                child: Image.network(
                  "https://images.pexels.com/photos/462030/pexels-photo-462030.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
                  fit: BoxFit.cover,
                ),
              )),
          const Positioned(
              height: 200,
              bottom: 40,
              width: 90,
              left: 16,
              child: ColoredBox(color: Color(0xffD9E2FF))),
          Positioned(
              height: 200,
              bottom: 50,
              width: 140,
              left: 32,
              child: Material(
                clipBehavior: Clip.antiAlias,
                shape: RoundedRectangleBorder(
                    side: const BorderSide(color: Colors.white, width: 1.2),
                    borderRadius: BorderRadius.circular(8)),
                child: Image.network(
                  "https://images.pexels.com/photos/462030/pexels-photo-462030.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
                  fit: BoxFit.cover,
                ),
              )),
          Positioned(
              right: 0,
              left: 0,
              bottom: 0,
              height: 33,
              child: ElevatedButton(
                onPressed: () {},
                child: textWidget("Visit now", Colors.white, FontWeight.w400, 14.22),
              ))
        ],
      ),
    );
  }
}
