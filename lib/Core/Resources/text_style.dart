import 'colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextStyle {
  static String fontFamily = "SFPRO";

  static TextStyle medium16 = _default2TextStyle(
    color: AppColor.secondColors,
    fontSize: 16.sp,
    fontWeight: FontWeight.w300,
  );

  static TextStyle semiBold16 = _default2TextStyle(
    color: AppColor.primaryColors,
    fontSize: 16.sp,
    fontWeight: FontWeight.w600,
  );
  static TextStyle semiBold18 = _default2TextStyle(
    color: AppColor.primaryColors,
    fontSize: 18.sp,
    fontWeight: FontWeight.w600,
  );
  static TextStyle semiBold22Black = _default2TextStyle(
    color: AppColor.black,
    fontSize: 22.sp,
    fontWeight: FontWeight.w600,
  );
  static TextStyle semiBold16Black = _default2TextStyle(
    color: AppColor.black,
    fontSize: 16.sp,
    fontWeight: FontWeight.w600,
  );
  static TextStyle semiBold12Black = _default2TextStyle(
    color: AppColor.black,
    fontSize: 12.sp,
    fontWeight: FontWeight.w600,
  );

  static TextStyle normal13 = _default2TextStyle(
    color: AppColor.black,
    fontSize: 13.sp,
    fontWeight: FontWeight.w300,
  );
  static TextStyle normal10 = _default2TextStyle(
    color: AppColor.black.withAlpha(100),
    fontSize: 13.sp,
    fontWeight: FontWeight.w300,
  );

  static TextStyle normal16 = _default2TextStyle(
    color: AppColor.primaryColors,
    fontSize: 16.sp,
    fontWeight: FontWeight.w400,
  );
  static TextStyle normal18 = _default2TextStyle(
    color: AppColor.primaryColors,
    fontSize: 18.sp,
    fontWeight: FontWeight.w400,
  );

  static TextStyle _default2TextStyle({
    required double fontSize,
    required FontWeight fontWeight,
    required Color color,
  }) => TextStyle(
    fontFamily: fontFamily,
    fontSize: fontSize,
    fontStyle: FontStyle.normal,

    fontWeight: fontWeight,
    color: color,
  );
}
