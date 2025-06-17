import '../../../../Core/Resources/colors.dart';
import '../../../../Core/Resources/strings.dart';
import '../../../../Core/Resources/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ContaunerBackgroundAuth extends StatelessWidget {
  const ContaunerBackgroundAuth({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1.sw,
      height: 300.h,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF1E3A8A), Color(0xFF1B1E8D), Color(0xFF609FEE)],
          stops: [0, 0.5, 1],
          begin: AlignmentDirectional(-1, -1),
          end: AlignmentDirectional(1, 1),
        ),
      ),
      child: Container(
        width: 100.w,
        height: 100.h,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0x00FFFFFF), Colors.white],
            stops: [0, 1],
            begin: AlignmentDirectional(0, -1),
            end: AlignmentDirectional(0, 1),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 200.w,
              height: 55.h,
              decoration: BoxDecoration(
                color: AppColor.primaryColors,
                borderRadius: BorderRadius.circular(16),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  AppStrings.imageLogoAuth,
                  width: 40.w,
                  height: 0,
                  fit: BoxFit.cover,
                ),
              ),
            ),

            Text(
             AppStrings.titleLogoAuth,

              style:AppTextStyle.medium16
            ),
          ],
        ),
      ),
    );
  }
}
