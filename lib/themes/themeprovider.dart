import 'package:flutter/material.dart';

class ThemeProvider with ChangeNotifier {
  ThemeMode themeMode = ThemeMode.system;

  bool get isDarkMode => themeMode == ThemeMode.dark;
  void toggleTheme(bool isTrue) {
    themeMode = isTrue ? ThemeMode.dark : ThemeMode.light;

    notifyListeners();
  }
}
