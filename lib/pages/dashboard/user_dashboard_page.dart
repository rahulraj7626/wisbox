import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:nexmat/app_configs/app_assets.dart';
import 'package:nexmat/pages/dashboard/home/home_page.dart';
import 'package:nexmat/pages/dashboard/widgets/moment_icon_page.dart';
import 'package:nexmat/pages/dashboard/widgets/wallet_page.dart';
import 'package:nexmat/pages/profile/profile_page.dart';
import 'package:nexmat/widgets/user_circle_avatar.dart';

///
/// Created by Sunil Kumar (sunil@smarttersstudio.com)
/// On 27-10-2021 03:44 PM
///
class DashboardPage extends StatefulWidget {
  static const String routeName = '/';

  const DashboardPage({Key? key}) : super(key: key);

  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return WillPopScope(
      onWillPop: () async {
        if (_currentIndex == 0) {
          return true;
        } else {
          setState(() {
            _currentIndex = 0;
          });
          return false;
        }
      },
      child: Scaffold(
        body: [
          const HomePage(),
          const MomentIconPage(),
          const WalletPage()
        ][_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          onTap: (i) {
            setState(() {
              _currentIndex = i;
            });
          },
          backgroundColor: const Color(0xffA398F9),
          showSelectedLabels: false,
          showUnselectedLabels: false,
          currentIndex: _currentIndex,
          items: const [
            BottomNavigationBarItem(
                icon: BottomNavIcon(AppAssets.home),
                activeIcon: BottomNavIcon(
                  AppAssets.home,
                  active: true,
                ),
                label: 'Home',
                tooltip: 'Home'),
            BottomNavigationBarItem(
              icon: BottomNavIcon(AppAssets.momentIcon),
              activeIcon: BottomNavIcon(
                AppAssets.momentIcon,
                active: true,
              ),
              label: 'Moment Icon',
              tooltip: 'Moment Icon',
            ),
            BottomNavigationBarItem(
                icon: BottomNavIcon(AppAssets.wallet),
                activeIcon: BottomNavIcon(
                  AppAssets.wallet,
                  active: true,
                ),
                label: 'Wallet',
                tooltip: 'Wallet'),
          ],
        ),
      ),
    );
  }
}

class BottomNavIcon extends StatelessWidget {
  final String asset;
  final bool active;
  const BottomNavIcon(this.asset, {this.active = false, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      SvgPicture.asset(asset, width: 26),
      if (active)
        const Center(
          child: Material(
            color: Colors.white,
            type: MaterialType.circle,
            child: SizedBox.square(
              dimension: 8,
            ),
          ),
        )
    ]);
  }
}
