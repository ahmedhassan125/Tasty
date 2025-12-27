import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefHelper {
  static late SharedPreferences prefs;
  static const String tokenKey = 'authToken';

  static Future<void> init() async {
    prefs = await SharedPreferences.getInstance();
  }

  static Future<void> saveToken(String token) async {
    await prefs.setString(tokenKey, token);
  }

  static String? getToken() {
    return prefs.getString(tokenKey);
  }

  static Future<void> clearToken() async {
    await prefs.remove(tokenKey);
  }

  // static const String tokenKey = 'authToken';
  //
  // static Future<void> saveToken(String token) async {
  //   final pref = await SharedPreferences.getInstance();
  //   await pref.setString(tokenKey, token);
  // }
  //
  // static Future<String?> getToken() async {
  //   final pref = await SharedPreferences.getInstance();
  //   return pref.getString(tokenKey);
  // }
  //
  // static Future<void> clearToken() async {
  //   final pref = await SharedPreferences.getInstance();
  //    await pref.remove(tokenKey);
  //
  //
  // }
  //
  // static Future<void> init() async {
  //   await SharedPreferences.getInstance();
  // }
}
