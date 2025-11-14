import 'package:flutter/material.dart';
import 'package:flutter_projects/common/constants/colors.dart';

class AppTheme {
  static final lightTheme = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: AppColors.lightModeBackground,
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.primary,
      brightness: Brightness.light,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.lightModeBackground,
      foregroundColor: AppColors.textLightMode,
      centerTitle: true,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.elevatedButton,
      ),
    ),

    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: AppColors.textLightMode),
      bodyMedium: TextStyle(color: AppColors.textLightMode),
      bodySmall: TextStyle(color: AppColors.textLightMode),
      titleLarge: TextStyle(color: AppColors.textLightMode),
    ),
  );

  static final darkTheme = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: AppColors.darkModeBackground,
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.secondary,
      brightness: Brightness.dark,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.primary,
      foregroundColor: AppColors.textDarkMode,
      centerTitle: true,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.elevatedButton,
      ),
    ),

    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: AppColors.textDarkMode),
      bodyMedium: TextStyle(color: AppColors.textDarkMode),
      bodySmall: TextStyle(color: AppColors.textDarkMode),
      titleLarge: TextStyle(color: AppColors.textDarkMode),
    ),
  );
}
