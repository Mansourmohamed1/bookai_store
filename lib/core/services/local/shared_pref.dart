import 'dart:convert';

import 'package:bookai_store/features/auth/data/model/auth_response/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {
  static late final SharedPreferences prefs;
  static const String kUser = 'user';
  static const String kToken = 'token';

  static Future<void> init() async {
    prefs = await SharedPreferences.getInstance();
  }

  //Cached Token
  static void setToken(String? token) {
    if (token == null) return;
    setString(kToken, token);
  }

  static String? getToken() {
    return getString(kToken);
  }

  //Cached UserData
  static void setUserData(User? user) {
    if (user == null) return;
    setString(kUser, jsonEncode(user.toJson()));
  }

  static User? getUserData() {
    var cachedString = getString(kUser);
    if (cachedString == null) return null;
    return User.fromJson(jsonDecode(cachedString));
  }

  static void setInt(String key, int value) {
    prefs.setInt(key, value);
  }

  static int? getInt(String key) {
    return prefs.getInt(key);
  }

  static void setDouble(String key, double value) {
    prefs.setDouble(key, value);
  }

  static double? getDouble(String key) {
    return prefs.getDouble(key);
  }

  static void setBool(String key, bool value) {
    prefs.setBool(key, value);
  }

  static bool? getBool(String key) {
    return prefs.getBool(key);
  }

  static void setString(String key, String value) {
    prefs.setString(key, value);
  }

  static String? getString(String key) {
    return prefs.getString(key);
  }
}
