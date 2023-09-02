import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesUtil {
  static getInt(String key) async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    return sf.getInt(key);
  }

  static Future<bool?> getBool(String key) async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    return sf.getBool(key);
  }

  static Future<double?> getDouble(String key) async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    return sf.getDouble(key);
  }

  static Future<String?> getString(String key) async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    return sf.getString(key);
  }

  static Future<List<String>?> getStringList(String key) async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    return sf.getStringList(key);
  }

  static setInt(String key, int value) async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    sf.setInt(key, value);
  }

  static setBool(String key, bool value) async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    sf.setBool(key, value);
  }

  static setDouble(String key, double value) async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    sf.setDouble(key, value);
  }

  static setString(String key, String value) async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    sf.setString(key, value);
  }

  static setStringList(String key, List<String> value) async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    sf.setStringList(key, value);
  }

  static remove(String key) async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    return sf.remove(key);
  }

  static clear() async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    return sf.clear();
  }
}
