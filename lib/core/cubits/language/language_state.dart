import 'package:flutter/material.dart';




abstract class AppState {}

class AppInitialState extends AppState {}

// State for changing theme mode
class ChangeThemeState extends AppState {
  final ThemeMode themeMode;
  ChangeThemeState(this.themeMode);
}

// State for changing language
class ChangeLanguageState extends AppState {
  final String language;
  ChangeLanguageState(this.language);
}