import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../core/themes/app_theme.dart';

enum AppThemeMode { light, dark, system }

class ThemeController extends GetxController {
  var themeMode = AppThemeMode.light.obs;

  ThemeData get themeData {
    switch (themeMode.value) {
      case AppThemeMode.dark:
        return AppTheme.darkTheme;
      case AppThemeMode.light:
      default:
        return AppTheme.lightTheme;
    }
  }

  void setTheme(AppThemeMode mode){
    themeMode.value = mode;
  }
}
