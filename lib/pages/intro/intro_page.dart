import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nexmat/app_configs/app_assets.dart';
import 'package:nexmat/pages/login/login_page.dart';
import 'package:nexmat/utils/constants.dart';
import 'package:nexmat/utils/shared_preference_helper.dart';
import 'package:nexmat/widgets/text_widget.dart';

///
/// Created by Sunil Kumar from Boiler plate
///
class IntroPage extends StatefulWidget {
  static const String routeName = '/intro';

  const IntroPage({Key? key}) : super(key: key);

  @override
  _IntroPageState createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  late PageController _pageController;
  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  final List<String> avatars = [
    AppAssets.intro1,
    AppAssets.intro2,
    AppAssets.intro3,
  ];
  final List<String> titles = ['Watch out!', 'Live Offers ', 'Hangout Now '];
  final List<String> descriptions = [
    'Know whats going on in your nearby market with just one click.',
    'Catch live offers and win exciting prices along with your shopping process.',
    'Catch live offers and win exciting prices along with your shopping process.',
  ];
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                    onPressed: () {
                      SharedPreferenceHelper.storeFirstTime();
                      Get.offAllNamed(LoginPage.routeName);
                    },
                    child:  textWidget("Skip", Colorconstants.colorCDCDCD, FontWeight.w400, 18))),
            Expanded(
              flex: 5,
              child: PageView(
                physics: const NeverScrollableScrollPhysics(),
                controller: _pageController,
                children: List.generate(
                    3,
                    (index) => Column(
                          children: [
                            const Spacer(),
                            Image.asset(avatars[index], width: Get.width / 1.5,
                           // height: Get.height/1.8,
                            ),
                            const Spacer(),
                            Center(
                                child: textWidget(titles[index], Colors.black, FontWeight.w700, 41)),
                            const SizedBox(height: 23),
                            Center(
                                child: Padding(
                              padding: const EdgeInsets.fromLTRB(32, 0, 32, 0),
                              child: textWidget(descriptions[index], Colors.black, FontWeight.w400, 18)
                            )),
                            const Spacer(),
                          ],
                        )),
              ),
            ),
            Flexible(
              flex: 1,
              child: Material(
                shape: const CircleBorder(
                    side: BorderSide(width: 2, color: Color(0xffA398F9))),
                child: Padding(
                  padding: const EdgeInsets.all(6),
                  child: Material(
                    color: const Color(0xffA398F9
),
                    shape: const CircleBorder(),
                    child: InkWell(
                      onTap: () {
                        if (_pageController.page != 2) {
                          _pageController.nextPage(
                              duration: kThemeAnimationDuration,
                              curve: Curves.linear);
                        } else {
                          SharedPreferenceHelper.storeFirstTime();
                          Get.offAllNamed(LoginPage.routeName);
                        }
                      },
                      child: const Padding(
                        padding: EdgeInsets.all(12),
                        child: Icon(Icons.arrow_forward_rounded,
                            color: Colors.white, size: 28),
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
