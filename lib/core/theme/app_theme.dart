import 'package:flutter/material.dart';
import 'package:kratos/core/theme/app_colors.dart';

class AppTheme {
  AppTheme._();

  static final ThemeData lightTheme = ThemeData(
    primaryColor: AppColors.primary,
  );

  static final ThemeData darkTheme = ThemeData.dark().copyWith(
    primaryColor: AppColors.primary,
    checkboxTheme: CheckboxThemeData(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4),
      ),
      checkColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.disabled)) {
          return Colors.grey;
        }
        return Colors.white;
      }),
      fillColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return const Color.fromARGB(255, 81, 157, 48);
        }
        return AppColors.darkBackground;
      }),
    ),
    appBarTheme: const AppBarTheme(backgroundColor: AppColors.darkBackground),
    scaffoldBackgroundColor: AppColors.darkBackground,
    listTileTheme: ListTileThemeData(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
    ),
  );
}
