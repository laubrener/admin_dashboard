import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  static late SharedPreferences preferences;

  static Future<void> configurePrefs() async {
    preferences = await SharedPreferences.getInstance();
  }
}
