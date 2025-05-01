// import 'package:dorm/Core/Resources/constant.dart';
// import 'package:flutter/material.dart';


// class ScreenContext {
//   static late BuildContext _context;

//   static void setContext(BuildContext context) {
//     _context = context;
//   }

//   static BuildContext get context => _context;
// }



// extension CustomSizeExtension on num {
//   double get h {
//     final context = ScreenContext.context;
//     final screenHeight = MediaQuery.of(context).size.height;
//     return this * screenHeight / AppConstant.designHeight;
//   }

//   double get w {
//     final context = ScreenContext.context;
//     final screenWidth = MediaQuery.of(context).size.width;
//     return this * screenWidth / AppConstant.designWidth;
//   }

//   double get sp {
//     final context = ScreenContext.context;
//     final screenWidth = MediaQuery.of(context).size.width;
//     return (this * screenWidth / AppConstant.designWidth);
//   }
// }