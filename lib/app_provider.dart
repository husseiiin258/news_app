import 'package:flutter/material.dart';

class AppProvider extends ChangeNotifier {
  String currentLocale = "en";

  ThemeMode currentTheme = ThemeMode.light;

  changeLanguage(String newLanguage) {
    if (currentLocale == newLanguage) return;
    currentLocale = newLanguage;
    notifyListeners();
  }
}