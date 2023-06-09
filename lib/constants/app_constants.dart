/// define all constant value in this file that going to use in app
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppConstants {
  AppConstants._();


  static final double DEFAULT_BUTTON_TEXT_SIZE = 6.5.sp;
  static  double DEFAULT_BUTTON_PADDING = 6.5.sp;

  static const double DEFAULT_CONTAINER_PADDING = 16;
  static const double PADDING = 5;
  static const double CORNER_RADIUS = 24;
  static const double DEFAULT_BUTTON_TEXT_SIZE_PHONE = 17;
  static const double PADDING_8 = 8;
  static const double PADDING30 = 30;

  static const double TEXT_FORM_FIELD_PADDING = 40;
  static const double PADDING_60 = 60;

  static const String DEFAULT_FONT_FAMILY = 'League Spartan';
  static const String DEFAULT_COUNTRY_CODE = '+966';

  static const String DEFAULT_LANGUAGE = 'en';
  static const int POST_LIMIT = 10;
  static const int ITEMS_PER_PAGE = 10;

  static const KEY_USER_LOCALE = 'user_locale';
  static const KEY_USER_CHOOSE_LOCALE = 'user_choose_locale';
  static const KEY_MESSAGE = 'message';
  static double tinyPadding = 3.sp;
  static double smallPadding = 5.sp;
  static double mediumPadding = 10.sp;
  static double largePadding = 15.sp;
  static double xlargePadding = 20.sp;
  static double xxLargePadding = 30.sp;

  static double textFieldRadius = 12.sp;

  static getFullHeight(BuildContext context, {num ratio = 1.0}) {
    return MediaQuery.of(context).size.height / ratio;
  }

  static getFullWidth(BuildContext context, {num ratio = 1.0}) {
    return MediaQuery.of(context).size.width / ratio;
  }
}