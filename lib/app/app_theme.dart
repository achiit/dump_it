import 'package:dump_it/ui/shared/colors.dart';
import 'package:flutter/material.dart';

ThemeData appTheme() {
  return ThemeData(
    primaryColor: AppColors.primary,    scaffoldBackgroundColor: AppColors.background,
    textTheme: TextTheme(
      bodyText1: TextStyle(color: AppColors.textColor),
      bodyText2: TextStyle(color: AppColors.textColor),
    ),
  );
}