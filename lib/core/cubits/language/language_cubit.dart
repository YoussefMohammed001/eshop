import 'package:eshop/core/constants/strings.dart';
import 'package:eshop/core/cubits/language/language_state.dart';
import 'package:eshop/core/shared_preferences/my_shared.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../shared_preferences/my_shared_keys.dart';
import 'package:flutter/material.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(AppInitialState()) {
    loadThemeMode();
    loadCurrentLanguage();
  }

  static dynamic language;
  static dynamic theme;

  // Load current language from shared preferences
  void loadCurrentLanguage() {
    language = MyShared.getCurrentLanguage();
    emit(ChangeLanguageState(language));
  }

  // Change language to English
  Future<void> changeLanguageToEn() async {
    await MyShared.putString(key: MySharedKeys.currentLanguage, value: AppStrings.englishCode);
    language = AppStrings.englishCode;
    emit(ChangeLanguageState(language));
  }

  // Change language to Arabic
  Future<void> changeLanguageToAr() async {
    await MyShared.putString(key: MySharedKeys.currentLanguage, value: AppStrings.arabicCode);
    language = AppStrings.arabicCode;
    emit(ChangeLanguageState(language));
  }

  // Load theme mode from shared preferences
  void loadThemeMode() {
    ThemeMode currentMode = MyShared.getThemeMode();
    emit(ChangeThemeState(currentMode));
  }

  // Change theme to Light mode
  Future<void> changeThemeToLight() async {
    await MyShared.setThemeMode(ThemeMode.light);
    emit(ChangeThemeState(ThemeMode.light));
  }

  // Change theme to Dark mode
  Future<void> changeThemeToDark() async {
    await MyShared.setThemeMode(ThemeMode.dark);
    emit(ChangeThemeState(ThemeMode.dark));
  }
}