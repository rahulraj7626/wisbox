import 'package:get/get.dart';
import 'package:nexmat/pages/dashboard/user_dashboard_page.dart';
import 'package:nexmat/pages/onboarding/vendor_lets_start_page.dart';
import 'package:nexmat/pages/product/add_product_page.dart';
import 'package:nexmat/pages/product/product_details_page.dart';
import 'package:nexmat/pages/product/vendor_products_page.dart';
import 'package:nexmat/pages/vendor_dashboard/vendor_dashboard_page.dart';
import 'package:nexmat/pages/intro/intro_page.dart';
import 'package:nexmat/pages/login/login_page.dart';
import 'package:nexmat/pages/onboarding/onboard_shop_details.dart';
import 'package:nexmat/pages/onboarding/select_location_page.dart';
import 'package:nexmat/pages/profile/profile_page.dart';
import 'package:nexmat/pages/profile/widgets/edit_profile_page.dart';
import 'package:nexmat/pages/profile/widgets/profile_details_page.dart';
import 'package:nexmat/pages/profile/widgets/profile_my_saves_page.dart';
import 'package:nexmat/pages/register/register_otp_verification_page.dart';
import 'package:nexmat/pages/register/register_page.dart';
import 'package:nexmat/pages/splash/splash_screen.dart';
import 'package:nexmat/pages/static/app_webview_page.dart';
import 'package:nexmat/pages/store/all_nearby_stores.dart';
import 'package:nexmat/pages/store/store_details_page.dart';

///
/// Created by Sunil Kumar from Boiler plate
///
class AppPages {
  static final pages = [
    GetPage(name: SplashPage.routeName, page: () => const SplashPage()),
    GetPage(name: IntroPage.routeName, page: () => const IntroPage()),
    GetPage(name: LoginPage.routeName, page: () => const LoginPage()),
    GetPage(name: RegisterPage.routeName, page: () => const RegisterPage()),
    GetPage(
        name: RegisterOtpVerificationPage.routeName,
        page: () => const RegisterOtpVerificationPage()),
    GetPage(
        name: OnboardShopDetails.routeName,
        page: () => const OnboardShopDetails()),
    GetPage(
        name: SelectLocationPage.routeName,
        page: () => const SelectLocationPage()),
    GetPage(
        name: VendorDashboardPage.routeName,
        page: () => const VendorDashboardPage()),
    GetPage(
        name: VendorLetsStartPage.routeName,
        page: () => const VendorLetsStartPage()),
    GetPage(name: AddProductPage.routeName, page: () => const AddProductPage()),
    GetPage(
        name: ProductDetailsPage.routeName,
        page: () => const ProductDetailsPage()),
    GetPage(
        name: VendorProductsPage.routeName,
        page: () => const VendorProductsPage()),
    GetPage(
        name: DashboardPage.routeName,
        page: () => const DashboardPage(),
        children: [
          GetPage(
              name: StoreDetailsPage.routeName,
              page: () => const StoreDetailsPage()),
          GetPage(
              name: AllNearByStoresPage.routeName,
              page: () => const AllNearByStoresPage()),
          GetPage(name: ProfilePage.routeName, page: () => const ProfilePage()),
          GetPage(
              name: ProfileDetailsPage.routeName,
              page: () => const ProfileDetailsPage()),
          GetPage(
              name: EditProfilePage.routeName,
              page: () => const EditProfilePage()),
          GetPage(
              name: ProfileMySavesPage.routeName,
              page: () => const ProfileMySavesPage()),
        ]),
    GetPage(name: AppWebViewPage.routeName, page: () => const AppWebViewPage()),
  ];
}
