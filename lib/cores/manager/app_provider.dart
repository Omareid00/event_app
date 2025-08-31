import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppProvider extends ChangeNotifier {
  ThemeMode themeMode = ThemeMode.light;
  String lang = "en";

  /// Change theme and save it
  void changeTheme(ThemeMode? value) async {
    if (value != null) {
      themeMode = value;
    } else {
      // toggle if no value provided
      themeMode = themeMode == ThemeMode.light
          ? ThemeMode.dark
          : ThemeMode.light;
    }

    await saveTheme();
    notifyListeners();
  }

  /// Save theme to SharedPreferences
  Future<void> saveTheme() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString("theme", themeMode.name);
  }

  /// Load theme from SharedPreferences
  Future<void> getTheme() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String theme = prefs.getString("theme") ?? "light";

    if (theme == "light") {
      themeMode = ThemeMode.light;
    } else {
      themeMode = ThemeMode.dark;
    }
   saveTheme();
    notifyListeners();
  }

  /// Check if dark mode is active
  bool isDarkMode() => themeMode == ThemeMode.dark;

  /// Change language and save it
  void changeLanguage(String? value) async {
    if (value != null) {
      lang = value;
    } else {
      // toggle if no value provided
      lang = lang == "en" ? "ar" : "en";
    }

    await saveLang();
    notifyListeners();
  }

  /// Save language to SharedPreferences
  Future<void> saveLang() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString("lang", lang);
  }

  /// Load language from SharedPreferences
  Future<void> getLang() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    lang = prefs.getString("lang") ?? "en";

    notifyListeners(); // 👈 important!
  }

  /// Mark onboarding as finished
  Future<void> setOnTime() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool("isFirst", false);
  }

  /// Check if onboarding should be shown
  Future<bool> getOntime() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool("isFirst") ?? true;
  }
}
