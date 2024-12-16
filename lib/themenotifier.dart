import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeNotifier extends ChangeNotifier {
  bool _isDarkTheme = false;

  bool get isDarkTheme => _isDarkTheme;

  ThemeData get currentTheme =>
      _isDarkTheme ? ThemeData.dark() : ThemeData.light();

  // Load theme preference from SharedPreferences
  Future<void> loadThemePreference() async {
    final prefs = await SharedPreferences.getInstance();
    _isDarkTheme = prefs.getBool('isDarkTheme') ?? false;
    notifyListeners();
  }

  // Toggle theme and save preference
  Future<void> toggleTheme() async {
    _isDarkTheme = !_isDarkTheme;
    notifyListeners();

    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isDarkTheme', _isDarkTheme);
  }

  // Set theme explicitly (used for dropdown selection)
  Future<void> setTheme(bool isDark) async {
    _isDarkTheme = isDark;
    notifyListeners();

    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isDarkTheme', _isDarkTheme);
  }
}
