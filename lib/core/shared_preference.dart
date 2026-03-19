import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceService {
  static SharedPreferences? _prefs;

  /// Initialize once (call in main)
  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  // ---------------- Bool ----------------

  static Future<bool> setBool(String key, bool value) async {
    return await _prefs!.setBool(key, value);
  }

  static bool getBool(String key, {bool defaultValue = false}) {
    return _prefs!.getBool(key) ?? defaultValue;
  }

  // ---------------- String ----------------

  static Future<bool> setString(String key, String value) async {
    return await _prefs!.setString(key, value);
  }

  static String getString(String key, {String defaultValue = ""}) {
    return _prefs!.getString(key) ?? defaultValue;
  }

  // ---------------- Int ----------------

  static Future<bool> setInt(String key, int value) async {
    return await _prefs!.setInt(key, value);
  }

  static int getInt(String key, {int defaultValue = 0}) {
    return _prefs!.getInt(key) ?? defaultValue;
  }

  // ---------------- Remove ----------------

  static Future<bool> remove(String key) async {
    return await _prefs!.remove(key);
  }

  // ---------------- Clear ----------------

  static Future<bool> clear() async {
    return await _prefs!.clear();
  }
}
