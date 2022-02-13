import 'package:flutter/material.dart';
import 'package:nexmat/widgets/text_widget.dart';

///
/// Created by Sunil Kumar (sunil@smarttersstudio.com)
/// On 06-11-2021 11:19 AM
///
class NewOpenings extends StatelessWidget {
  const NewOpenings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
         Padding(
          padding:const EdgeInsets.fromLTRB(16, 0, 16, 12),
          child: textWidget("NEW Openings", Colors.black, FontWeight.w500, 20)
        ),
        AspectRatio(
          aspectRatio: 1,
          child: Image.network(
            "https://image.freepik.com/free-vector/realistic-coffee-time-background-with-coffee-cup_79603-1559.jpg",
            fit: BoxFit.cover,
          ),
        ),
      ],
    );
  }
}
