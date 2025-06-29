import 'package:flutter/material.dart';
import 'package:islami_app/utils/app_colors.dart';
import 'package:islami_app/utils/app_styles.dart';

class AppTheme {
  static final ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: AppColor.transparentColor,
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      selectedItemColor: AppColor.whiteColor,
      unselectedItemColor: AppColor.blackColor,
    ),
    appBarTheme: AppBarTheme(
      centerTitle: true,
      backgroundColor: AppColor.blackBgColor,
      iconTheme: IconThemeData(color: AppColor.primaryColor),
      titleTextStyle: AppStyles.bold20primary,
    ),
  );
}
