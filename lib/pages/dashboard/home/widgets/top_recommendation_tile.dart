import 'package:flutter/material.dart';
import 'package:nexmat/widgets/text_widget.dart';

///
/// Created by Sunil Kumar (sunil@smarttersstudio.com)
/// On 01-11-2021 03:21 PM
///
class TopRecommendationTile extends StatelessWidget {
  final String avatar, title;

  const TopRecommendationTile(this.avatar, this.title, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 16, top: 6, bottom: 6),
      child: Material(
        elevation: 3,
        clipBehavior: Clip.antiAlias,
        borderRadius: BorderRadius.circular(8),
        child: SizedBox(
            width: 200,
            child: Row(
              children: [
                AspectRatio(
                  aspectRatio: 1,
                  child: Padding(
                    padding: const EdgeInsets.all(4),
                    child: Material(
                      clipBehavior: Clip.antiAlias,
                      borderRadius: BorderRadius.circular(8),
                      child: Image.network(
                        avatar,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(height: 4),
                     textWidget("My Local Store", Colors.black, FontWeight.w500, 18),
                      const SizedBox(height: 2),
                      Row(
                        children: const[
                          Icon(Icons.location_on,color: Colors.grey,size: 20,),
                          SizedBox(width: 5,),
                          Text(
                            "Jayadev Bihar",
                            maxLines: 1,
                            style: TextStyle(color: Colors.grey),
                          ),
                        ],
                      ),
                      const SizedBox(height: 4),
                    ],
                  ),
                )
              ],
            )),
      ),
    );
  }
}
