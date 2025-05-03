import '../../../Core/Resources/colors.dart';
import 'build_experience_top_dormitories.dart';
import 'build_property_nearby.dart';
import 'divider_home.dart';
import 'package:flutter/Material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ExpandedBodyPage extends StatelessWidget {
  const ExpandedBodyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 32.r),
      child: Container(
        width: 1.sw,

        decoration: BoxDecoration(
          color: AppColor.secondColors,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(0),
            bottomRight: Radius.circular(0),
            topLeft: Radius.circular(16.r),
            topRight: Radius.circular(16.r),
          ),
        ),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0, 8.h, 0, 24.h),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DividerHome(),

              BuildExperienceTopDormitories(),

              BuildPropertyNearby(),
            ],
          ),
        ),
      ),
    );
  }
}
