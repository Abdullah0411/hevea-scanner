import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hevea_partner/constants/constants.dart';

class HeveaThemes {
  static final main = ThemeData(
      fontFamily: FontConst.plexSansArabic,
      scaffoldBackgroundColor: AppColors.cultured,
      primaryColor: AppColors.primary,
      dividerColor: Colors.transparent,
      colorScheme: const ColorScheme.light(
        primary: AppColors.primary,
        secondary: AppColors.white,
      ),
      textTheme: TextTheme(
          headlineLarge:
              TextStyle(fontSize: 70.sp, fontWeight: FontWeight.w500),
          headlineMedium:
              TextStyle(fontSize: 50.sp, fontWeight: FontWeight.w500),
          titleLarge: TextStyle(fontSize: 30.sp, fontWeight: FontWeight.w500),
          titleMedium: TextStyle(fontSize: 25.sp, fontWeight: FontWeight.w500),
          bodyLarge: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w500),
          bodyMedium: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w500),
          bodySmall: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w500),
          displaySmall:
              TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w500)),
      bottomSheetTheme: const BottomSheetThemeData(
        backgroundColor: Colors.transparent,
      ),
      splashFactory: NoSplash.splashFactory,
      splashColor: Colors.transparent,
      backgroundColor: Colors.black,
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.cultured,
        elevation: 0,
      ));
}
