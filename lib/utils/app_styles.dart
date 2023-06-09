import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

enum IndoorSprayOrFogging { indoorSpray, indoorFogging, rwa }

class AppStyles {
  static const primary500Color = Color(0xFF0D47A1);
  static const primaryLightColor = Color(0xffFFCC00);
  static const secondary500Color = Color(0xff006A80);
  static const rwaColor = Color(0xffA8BE10);

  static const secondaryLightColor = Color(0xffD4FAF2);
  static const secondary900Color = Color(0xff7A5700);
  static const secondary100Color = Color(0xffFFF9CC);
  static const primary900Color = Color(0xff32007A);
  static const primary700Color = Color(0xff6200B7);
  static const primary200Color = Color(0xffF099FF);

  //static const rwaColor = Color(0xffFF9800);
  static const naturalWhiteColor = Color(0xffFFFFFF);
  static const scaffoldColor = Color(0xff000000);
  static const scaffoldBackColor = Color(0xffC7C7C7);
  static const naturalBlackColor = Color(0xff000000);
  static const greyColor = Color(0xff595959);

  static get blue900Color => Colors.blue.shade500;

  static const editBackground = Color(0xffDBEAFE);
  static const grey900Color = Color(0xff18181B);
  static const grey800Color = Color(0xff1E293B);
  static const grey700Color = Color(0xff334155);
  static const grey600Color = Color(0xff475569);
  static const grey500Color = Color(0xff64748B);
  static const greyProgressColor = Color(0xffCCCCCC);
  static const grey400Color = Color(0xff94A3B8);
  static const grey300Color = Color(0xffCBD5E1);

  static const grey200Color = Color(0xffE2E8F0);
  static const grey100Color = Color(0xffF4F4F5);
  static const likeColor = Color(0xffEF4444);
  static const greenColor = Color(0xFF1B5E20);
  static const blackTextColor = Color(0xFF222222);

  static const danger500Color = Color(0xffEF4444);
  static const waring500Color = Color(0xffEAB308);
  static const success500Color = Color(0xff22C55E);
  static const unselectedBorderColor = Color(0xffC4C4C4);

  static const facebookColor = Color(0xff1877f2);
  static const white = Color(0xffffffff);
  static const black = Color(0xff000000);
  static const snapchatColor = Color(0xfffffc00);
  static const youtubeColor = Color(0xffff0000);
  static const instagramColor = Color(0xffe1306c);

  static const drawerColor = Color(0xffF2F2F2);
  static const greyButtonColor = Color(0xffD4D4D8);
  static const titleTextColor = Color(0xff3F3F46);
  static const greyButtonTextColor = Color(0xff71717A);
  static const greyIconColor = Color(0xffA1A1AA);
  static const greyBorderColor = Color(0xffE4E4E7);
  static const greyBgColor = Color(0xffE4E4E7);
  static const greyBackgroundColor = Color(0xffC7C7C7);
  static const greyTextColor = Color(0xff333333);
  static const greyDetailsColor = Color(0xff444444);

  static const fontFamily = 'Satoshi';

  static Color whiteOpacityColor = const Color(0xffffffff).withOpacity(0.2);

  ///TASK color
  static const taskBgColor = Color(0xffFFF8E0);
  static const taskBorderColor = Color(0xffFFE299);

  ///WORK_REPORT color
  static const workReportBgColor = Color(0xffF0FDF4);
  static const workReportBorderColor = Color(0xff56D6D8);

  ///SUMMARY color
  static const summaryBgColor = Color(0xffFFFFFF);
  static const summaryBorderColor = Color(0xffE4E4E7);

  static Color getPrimaryColor(String? indoorFogging) {
    if (indoorFogging == IndoorSprayOrFogging.indoorFogging.toString()) {
      return secondary500Color;
    } else if (indoorFogging == IndoorSprayOrFogging.rwa.toString()) {
      return rwaColor;
    } else {
      return primary500Color;
    }
  }

  static  TextStyle thinLargeTextStyle = const TextStyle(
    color: AppStyles.primary500Color,
    fontSize: 24,
    fontWeight: FontWeight.w500,
  );

  static TextStyle greyTitleStyle = TextStyle(
    color: AppStyles.greyTextColor,
    fontSize: 16.sp,
    fontWeight: FontWeight.w500,
  );
  static TextStyle blackTitleStyle = TextStyle(
    color: AppStyles.black,
    fontSize: 14.sp,
    fontWeight: FontWeight.w500,
  );

  static TextStyle textInputStyle = TextStyle(
    color: AppStyles.titleTextColor,
    fontSize: 14.sp,
    fontWeight: FontWeight.w500,
  );

  static TextStyle thickLargeTextStyle = TextStyle(
    color: AppStyles.titleTextColor,
    fontSize: 36.sp,
    fontWeight: FontWeight.w700,
  );

  static TextStyle normalTextStyle = TextStyle(
    color: AppStyles.greyButtonTextColor,
    fontSize: 18.sp,
    fontWeight: FontWeight.w500,
  );

  static TextStyle whiteOpacityTextStyle = TextStyle(
    color: naturalWhiteColor.withOpacity(0.5),
    fontSize: 12.sp,
    fontWeight: FontWeight.w500,
  );

  static TextStyle whiteTextStyle = TextStyle(
    color: naturalWhiteColor,
    fontSize: 15.sp,
    fontWeight: FontWeight.w500,
  );

  static TextStyle appBarTitleStyle({String indoorFogging = 'indoorFogging'}) {
    return TextStyle(
      // color: indoorFogging == IndoorSprayOrFogging.indoorFogging.toString() ? naturalBlackColor : naturalWhiteColor,
      color: black,
      fontSize: 20.sp,
      fontWeight: FontWeight.w500,
    );
  }

  static TextStyle primaryColorText({String indoorFogging = 'indoorFogging'}) {
    return TextStyle(
      color: indoorFogging == IndoorSprayOrFogging.indoorFogging.toString()
          ? secondary500Color
          : indoorFogging == IndoorSprayOrFogging.rwa.toString()
          ? rwaColor
          : primary500Color,
      fontSize: 20.sp,
      fontWeight: FontWeight.w500,
    );
  }

  static IconThemeData iconTheme({String indoorFogging = 'indoorFogging'}) {
    return const IconThemeData(
      //color: indoorFogging == IndoorSprayOrFogging.indoorFogging.toString() ? naturalBlackColor : naturalWhiteColor, //change your color here
      color: naturalWhiteColor, //change your color here
    );
  }

  static TextStyle subTitleTextStyle = TextStyle(
    color: AppStyles.white,
    fontWeight: FontWeight.w500,
    fontSize: 14.sp,
  );

  static TextStyle smallTextStyle = TextStyle(
    color: greyButtonTextColor,
    fontSize: 12.sp,
    fontWeight: FontWeight.w400,
  );

  static TextStyle errorTextStyle = TextStyle(
    color: Colors.red,
    fontSize: 13.sp,
  );

  static TextStyle appTextFieldTitle = TextStyle(
    color: AppStyles.greyIconColor,
    fontWeight: FontWeight.w500,
    fontSize: 14.sp,
  );
}