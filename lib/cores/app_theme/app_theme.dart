import 'package:event_app/cores/appcolors/appcolors.dart';
import 'package:flutter/material.dart';

abstract class AppTheme {
  static ThemeData lightTheme = ThemeData(
    primaryColor: AppColors.primary,
    scaffoldBackgroundColor: AppColors.white,
    primaryColorLight: AppColors.white,
    primaryColorDark: AppColors.black,
    textTheme: TextTheme(
      bodySmall: TextStyle(
        color: AppColors.black,
        fontSize: 14
      ),
      bodyMedium: TextStyle(
        color: AppColors.black,
        fontSize: 18
      ),
      bodyLarge: TextStyle(
        color: AppColors.black,
        fontSize: 20
      ),
    )
  ) ;
  static ThemeData darkTheme = ThemeData(
    primaryColor: AppColors.primary,
    scaffoldBackgroundColor: AppColors.black,
      textTheme: TextTheme(
        bodySmall: TextStyle(
            color: AppColors.white,
            fontSize: 14
        ),
        bodyMedium: TextStyle(
            color: AppColors.white,
            fontSize: 18
        ),
        bodyLarge: TextStyle(
            color: AppColors.white,
            fontSize: 20
        ),
      )

  ) ;
}