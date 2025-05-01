import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppConstant {
  static const String nameApp = "";
  static const double designWidth = 375;
  static const double designHeight = 812;
  static final coverColor = Container(
    width: 1.sw,
    height: 500,
    decoration: BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [Colors.black.withAlpha(10), Colors.black.withAlpha(200)],
      ),
    ),
  );
}
