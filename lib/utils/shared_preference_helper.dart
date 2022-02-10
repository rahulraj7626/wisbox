import 'dart:convert';
import 'package:mapbox_search/mapbox_search.dart';
import 'package:nexmat/data_models/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceHelper {
  static const USER_KEY = 'user';
  static const FIRST_TIME_KEY = 'first-time';
  static const LOCATION_KEY = 'location';

  static SharedPreferences? preferences;

  static void clear() {
    preferences?.clear();
  }

  static void logout() {
    preferences?.remove(USER_KEY);
    preferences?.remove(LOCATION_KEY);
  }

  static void storeFirstTime() {
    preferences?.setBool(FIRST_TIME_KEY, true);
  }

  static bool get firstTime => preferences?.getBool(FIRST_TIME_KEY) ?? false;

  static void storeUser(UserResponse? user) {
    if (user != null) {
      preferences?.setString(USER_KEY, userResponseToJson(user));
    }
  }

  static UserResponse? get user => preferences?.getString(USER_KEY) == null
      ? null
      : userResponseFromJson(preferences?.getString(USER_KEY) ?? '{}');

  // static void storeLocation(UserAddressData place) {
  //   preferences?.setString(LOCATION_KEY, userAddressDataToJson(place));
  // }
  //
  // static UserAddressData? get location =>
  //     preferences?.getString(LOCATION_KEY) == null
  //         ? null
  //         : userAddressDataFromJson(preferences!.getString(LOCATION_KEY)!);
}
