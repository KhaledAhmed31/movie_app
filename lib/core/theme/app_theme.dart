import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../colors/app_colors.dart';
import '../font/font_manager.dart';

class AppTheme {
  AppTheme._();
  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.darkBlue,
    appBarTheme: AppBarTheme(
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarColor: AppColors.darkBlue,
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.light,
      ),
      backgroundColor: AppColors.darkBlue,
      elevation: 0,
      centerTitle: true,
      titleTextStyle: FontManager.montserratGetSemiBoldStyle(
        fontSize: 16.sp,
        color: Colors.white,
      ),
      iconTheme: const IconThemeData(color: AppColors.white),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: AppColors.darkBlue,
      enableFeedback: true,
      selectedItemColor: AppColors.lightBlue,
      unselectedItemColor: AppColors.grey,
      selectedLabelStyle: FontManager.getRobotoMediumStyle(
        fontSize: 12.sp,
        color: AppColors.lightBlue,
      ),
      unselectedLabelStyle: FontManager.getRobotoMediumStyle(
        fontSize: 12.sp,
        color: AppColors.grey,
      ),
    ),
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: AppColors.grey,
      selectionColor: Color.fromARGB(124, 2, 150, 229),
      selectionHandleColor: AppColors.lightBlue,
    ),
  );
}
