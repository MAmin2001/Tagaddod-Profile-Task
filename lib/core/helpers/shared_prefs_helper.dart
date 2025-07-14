import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefsHelper {
  static SharedPreferences? prefs;

  static Future<void> init() async {
    prefs = await SharedPreferences.getInstance();
  }

  static Future<void> saveData(String key, String value) async {
    await prefs?.setString(key, value);
  }

  static String getData(String key) {
    return prefs?.getString(key) ?? '';
  }
}
