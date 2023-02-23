import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';

import '../Constant/App Keys/app_key.dart';

class ThemeNotifier extends ChangeNotifier {
  bool _darktheme = false;

  bool get darkTheme => _darktheme;

  ThemeNotifier() {
    _loadFromPref();
  }

  toggleTheme() {
    _darktheme = !darkTheme;
    _savedToPreferences();
    notifyListeners();
  }

  _loadFromPref() async {
    var val = await getDarkMode();
    _darktheme = val ?? false;
    notifyListeners();
  }

  _savedToPreferences() async {
    await savedDarkMode(_darktheme);
  }

  static Future<bool> savedDarkMode(bool darkMode) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.setBool(AppKey.appMode, darkMode);
  }

  static Future<bool?> getDarkMode() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getBool(AppKey.appMode);
  }
}
