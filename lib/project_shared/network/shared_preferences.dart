import 'dart:async';

import 'package:shared_preferences/shared_preferences.dart';


class CacheHelper {
  static late SharedPreferences sharedPreferences;

  static init() async {
    sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString('profile_img_url', 'images/default_user2.png');
    // sharedPreferences.setBool('isOnBoardingShowed', false);

  }

  static void saveData({required String key, required value}) async {
    if (value is String) {
      await sharedPreferences.setString(key, value);
    } else if (value is int) {
      await sharedPreferences.setInt(key, value);
    } else if (value is bool) {
      await sharedPreferences.setBool(key, value);
    } else if (value is double) {
      await sharedPreferences.setDouble(key, value);
    }
  }

  static dynamic getData({required key}) {
    return sharedPreferences.get(key);
  }
  static dynamic getStringData({required key}) {
    return sharedPreferences.getString(key);
  }
  static dynamic getBoolData({required key}) {
    return sharedPreferences.getBool(key);
  }
  static dynamic getIntData({required key}) {
    return sharedPreferences.getInt(key);
  }
//static  String token=CacheHelper.getStringData(key: 'token')!=null ? ' ':CacheHelper.getStringData(key: 'token');
  static dynamic getToken() {
    return sharedPreferences.getString('token')!=null? sharedPreferences.getString('token') : " ";
  }

}
