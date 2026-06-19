
import 'package:fitness/src/core/const/colors/app_colors.dart';
import 'package:flutter/material.dart';

class  AppTheme{
  static final ThemeData light = ThemeData(
    scaffoldBackgroundColor: AppColors.white,
    colorScheme: ColorScheme.light(primary: AppColors.primary),
  );
  static final ThemeData dark = ThemeData(scaffoldBackgroundColor: AppColors.primary,
  colorScheme: ColorScheme.dark(primary: AppColors.white
  ));
}