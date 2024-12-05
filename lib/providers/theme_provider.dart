import 'package:flutter/material.dart';

class ThemeProvider with ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.system; // Default to system theme mode

  // Getter to access the current theme mode
  ThemeMode get themeMode => _themeMode;

  // Method to toggle between light and dark mode
  void toggleTheme(bool isDarkMode) {
    _themeMode = isDarkMode ? ThemeMode.dark : ThemeMode.light;
    notifyListeners(); // Notify listeners to rebuild the UI
  }
}
