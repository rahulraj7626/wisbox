import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:nexmat/app_configs/app_assets.dart';
import 'package:nexmat/pages/dashboard/home/home_page.dart';
import 'package:nexmat/pages/dashboard/user_dashboard_page.dart';
import 'package:nexmat/pages/dashboard/widgets/moment_icon_page.dart';
import 'package:nexmat/pages/dashboard/widgets/wallet_page.dart';
import 'package:nexmat/pages/profile/profile_page.dart';
import 'package:nexmat/pages/vendor_dashboard/vendor_analytics_page.dart';
import 'package:nexmat/pages/vendor_dashboard/vendor_home_page.dart';
import 'package:nexmat/pages/vendor_dashboard/widgets/vendor_cart_widget.dart';
import 'package:nexmat/pages/vendor_dashboard/widgets/vendor_home_user_details.dart';
import 'package:nexmat/pages/vendor_dashboard/widgets/vendor_products.dart';
import 'package:nexmat/widgets/user_circle_avatar.dart';

///
/// Created by Sunil Kumar (sunil@smarttersstudio.com)
/// On 27-10-2021 03:44 PM
///
class VendorDashboardPage extends StatefulWidget {
  static const String routeName = '/vendor-dashboard';

  const VendorDashboardPage({Key? key}) : super(key: key);

  @override
  _VendorDashboardPageState createState() => _VendorDashboardPageState();
}

class _VendorDashboardPageState extends State<VendorDashboardPage> {
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
          const VendorHomePage(),
          const VendorAnalyticsPage(),
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
                tooltip: 'Moment Icon'),
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
