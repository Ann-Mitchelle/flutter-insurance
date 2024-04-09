import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  bool _isDarkModeEnabled = false;

  bool get isDarkModeEnabled => _isDarkModeEnabled;

  void enableDarkMode() {
    _isDarkModeEnabled = true;
    notifyListeners();
  }

  void disableDarkMode() {
    _isDarkModeEnabled = false;
    notifyListeners();
  }

  ThemeData getThemeData() {
    return _isDarkModeEnabled ? ThemeData.dark() : ThemeData.light();
  }
}
