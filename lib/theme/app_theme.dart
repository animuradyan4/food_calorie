import 'package:flutter/material.dart';

class AppColors {
  static const Color primary = Color(0xFF4CAF50); // Пример, замените на ваш HEX
  static const Color accent = Color(0xFFFFC107); // Пример
  static const Color background = Color(0xFFF5F5F5); // Пример
  static const Color text = Color(0xFF212121); // Пример
  static const Color secondaryText = Color(0xFF757575); // Пример
}

class AppTextStyles {
  static const TextStyle headline = TextStyle(
    fontFamily: 'Inter', // Добавьте шрифт в pubspec.yaml
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: AppColors.text,
  );
  static const TextStyle body = TextStyle(
    fontFamily: 'Inter',
    fontSize: 16,
    color: AppColors.text,
  );
  static const TextStyle caption = TextStyle(
    fontFamily: 'Inter',
    fontSize: 14,
    color: AppColors.secondaryText,
  );
}

class AppPaddings {
  static const EdgeInsets screen = EdgeInsets.all(16.0);
  static const EdgeInsets card = EdgeInsets.all(12.0);
  static const EdgeInsets button = EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0);
}

ThemeData appTheme = ThemeData(
  primaryColor: AppColors.primary,
  scaffoldBackgroundColor: AppColors.background,
  textTheme: const TextTheme(
    titleLarge: AppTextStyles.headline,
    bodyMedium: AppTextStyles.body,
    bodySmall: AppTextStyles.caption,
  ),
  colorScheme: ColorScheme.fromSwatch().copyWith(secondary: AppColors.accent),
); 