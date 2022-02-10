import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:nexmat/pages/splash/splash_screen.dart';

import 'app_configs/app_page_routes.dart';
import 'app_configs/app_theme.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  // SharedPreferenceHelper.preferences = await SharedPreferences.getInstance();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'WISBOX',
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      theme: AppThemes.lightTheme,
      darkTheme: AppThemes.darkTheme,
      initialRoute: SplashPage.routeName,
      // transitionDuration: const Duration(seconds: 1),
      defaultTransition: Transition.fadeIn,
      getPages: AppPages.pages,
    );
  }
}
