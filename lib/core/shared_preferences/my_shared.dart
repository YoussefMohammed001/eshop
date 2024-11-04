import 'package:eshop/core/shared_preferences/my_shared_keys.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyShared {
  static SharedPreferences? _preferences;

  static Future<void> init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  // Clear all preferences
  static Future<void> clear() async {
    await _preferences?.clear();
  }

  // Clear specific user data (e.g., token, username)
  static Future<void> clearUserData() async {
    await putString(key: MySharedKeys.apiToken, value: "");
    await putString(key: MySharedKeys.userName, value: "");
  }

  // Save a boolean value to shared preferences
  static Future<bool?> putBoolean({
    required MySharedKeys key,
    required bool value,
  }) async {
    return await _preferences?.setBool(key.name, value);
  }

  // Retrieve a boolean value from shared preferences
  static bool getBoolean({
    required MySharedKeys key,
    bool defaultValue = false,
  }) {
    return _preferences?.getBool(key.name) ?? defaultValue;
  }

  // Save a string value to shared preferences
  static Future<bool> putString({
    required MySharedKeys key,
    required String? value,
  }) async {
    return await _preferences?.setString(key.name, value ?? "") ?? false;
  }

  // Retrieve a string value from shared preferences
  static String getString({required MySharedKeys key}) {
    return _preferences?.getString(key.name) ?? "";
  }

  // Retrieve the current language
  static String getCurrentLanguage() {
    return _preferences?.getString(MySharedKeys.currentLanguage.name) ?? "ar";
  }

  // Save the theme mode (light/dark) to shared preferences
  static Future<void> setThemeMode(ThemeMode themeMode) async {
    String mode = themeMode == ThemeMode.dark ? 'dark' : 'light';
    await putString(key: MySharedKeys.theme, value: mode);
  }

  // Retrieve the theme mode (light or dark)
  static ThemeMode getThemeMode() {
    String theme = getString(key: MySharedKeys.theme);
    return theme == 'dark' ? ThemeMode.dark : ThemeMode.light;
  }

  // Check if the user is logged in
  static bool isLoggedIn() {
    return (_preferences?.getString(MySharedKeys.apiToken.name) ?? "").isNotEmpty;
  }

  // Check if the app was opened for the first time
  static bool isFirstOpen() {
    return _preferences?.getBool(MySharedKeys.firstOpen.name) ?? true;
  }
}