import 'shared_pref.dart';

class InstancePref {
  static Future<bool> setToken(String token) => SharedPref.setString('token', token);
  static String getToken() => SharedPref.getString('token') ?? '';
}