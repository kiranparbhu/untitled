import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/app_constants.dart';
import 'app_styles.dart';

class ThemeUtils {
  ThemeUtils._();

  static ThemeData buildAppTheme(BuildContext context) {
    ThemeData theme = ThemeData(
      fontFamily: 'Satoshi',
    );

    theme = theme.copyWith(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      hoverColor: Colors.transparent,
      //   textTheme: Typography.englishLike2018.apply(fontSizeFactor: 1.sp),
      //appBarTheme: _appBarTheme(theme),
      //elevatedButtonTheme: _elevatedButtonTheme(theme),
      // outlinedButtonTheme: _outlinedButtonTheme(theme),
      //  textButtonTheme: _textButtonTheme(theme),
      //  inputDecorationTheme: _inputDecorationTheme(theme),
      tabBarTheme: _tabBarTheme(theme),
      scaffoldBackgroundColor: AppStyles.white,
    );

    return theme;
  }

  static AppBarTheme _appBarTheme(ThemeData theme) {
    return theme.appBarTheme.copyWith(
      elevation: 4.0,
      backgroundColor: AppStyles.black,
      foregroundColor: AppStyles.white,
      titleSpacing: 0,
      centerTitle: true,
      shadowColor: Colors.black26,
      iconTheme: const IconThemeData(color: AppStyles.white),
    );
  }

  static ElevatedButtonThemeData _elevatedButtonTheme(ThemeData theme) {
    return ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
          foregroundColor: AppStyles.black,
          backgroundColor: AppStyles.primary200Color,
          textStyle: const TextStyle(
              fontSize: AppConstants.DEFAULT_BUTTON_TEXT_SIZE_PHONE,
              fontWeight: FontWeight.bold,
              fontFamily: AppConstants.DEFAULT_FONT_FAMILY),
          minimumSize: Size(64.0, AppConstants.DEFAULT_BUTTON_TEXT_SIZE),
          shape: const StadiumBorder(),
          padding: EdgeInsets.symmetric(horizontal: 48.sp)),
    );
  }

  static OutlinedButtonThemeData _outlinedButtonTheme(ThemeData theme) {
    return OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: AppStyles.primary900Color,
        textStyle: const TextStyle(
            fontSize: AppConstants.DEFAULT_BUTTON_TEXT_SIZE_PHONE,
            fontWeight: FontWeight.bold,
            fontFamily: AppConstants.DEFAULT_FONT_FAMILY),
        minimumSize: const Size(64.0, AppConstants.DEFAULT_BUTTON_TEXT_SIZE_PHONE),
        shape: const StadiumBorder(),
      ),
    );
  }

  static TextButtonThemeData _textButtonTheme(ThemeData theme) {
    return TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: AppStyles.primary200Color,
        textStyle: const TextStyle(
            fontSize: AppConstants.DEFAULT_BUTTON_TEXT_SIZE_PHONE,
            fontWeight: FontWeight.bold,
            fontFamily: AppConstants.DEFAULT_FONT_FAMILY),
        minimumSize: const Size(64.0, AppConstants.DEFAULT_BUTTON_TEXT_SIZE_PHONE),
        shape: const StadiumBorder(),
      ),
    );
  }

  static InputDecorationTheme _inputDecorationTheme(ThemeData theme) {
    return InputDecorationTheme(
      contentPadding: EdgeInsets.symmetric(
        vertical: AppConstants.DEFAULT_BUTTON_PADDING,
        horizontal: AppConstants.DEFAULT_BUTTON_PADDING,
      ),
      fillColor: AppStyles.primary200Color,
      filled: true,
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(64.0),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(64.0),
      ),
      labelStyle: TextStyle(
        color: AppStyles.black,
        fontSize: 8.sp,
        fontWeight: FontWeight.normal,
      ),
      hintStyle: TextStyle(
        color: AppStyles.black,
        fontSize: 8.sp,
        fontWeight: FontWeight.normal,
      ),
    );
  }

  static TabBarTheme _tabBarTheme(ThemeData theme) {
    return TabBarTheme(
      indicatorSize: TabBarIndicatorSize.label,
      indicator: const UnderlineTabIndicator(
        borderSide: BorderSide(
          width: 2,
          color: AppStyles.black,
        ),
      ),
      labelColor: AppStyles.black,
      unselectedLabelColor: AppStyles.black,
      labelStyle: TextStyle(
        fontSize: 24.sp,
        fontWeight: FontWeight.bold,
      ),
      unselectedLabelStyle: TextStyle(
        fontSize: 24.sp,
        fontWeight: FontWeight.normal,
      ),
    );
  }
}