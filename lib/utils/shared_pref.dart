import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {
  static SharedPreferences? pref;

  static Future<void> initSharedPref() async {
    pref = await SharedPreferences.getInstance();
  }

  static Future<bool> setInt(String key, int value) async {
    bool result = false;

    if (pref != null) {
      result = await pref!.setInt(key, value);
    }

    return result;
  }

  static int? getInt(String key) {
    return pref?.getInt(key);
  }

  static Future<bool> setString(String key, String value) async {
    bool result = false;

    if (pref != null) {
      result = await pref!.setString(key, value);
    }

    return result;
  }

  static String? getString(String key) {
    return pref?.getString(key);
  }

  static Future<bool> setBool(String key, bool value) async {
    bool result = false;

    if (pref != null) {
      result = await pref!.setBool(key, value);
    }

    return result;
  }

  static bool? getBool(String key) {
    return pref?.getBool(key);
  }

  static Future<bool> setDouble(String key, double value) async {
    bool result = false;

    if (pref != null) {
      result = await pref!.setDouble(key, value);
    }

    return result;
  }

  static double? getDouble(String key) {
    return pref?.getDouble(key);
  }

  static Future<bool> setStringList(String key, List<String> value) async {
    bool result = false;

    if (pref != null) {
      result = await pref!.setStringList(key, value);
    }

    return result;
  }

  static List<String>? getStringList(String key) {
    return pref?.getStringList(key);
  }
}