import 'package:dorm/Core/Resources/colors.dart';
import 'package:dorm/Features/home/Components/build_experience_top_dormitories.dart';
import 'package:dorm/Features/home/Components/build_property_nearby.dart';
import 'package:dorm/Features/home/Components/divider_home.dart';
import 'package:flutter/Material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ExpandedBodyPage extends StatelessWidget {
  const ExpandedBodyPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(
        0,
        32,
        0,
        0,
      ),
      child: Container(
        width: 1.sw,
        height: 700.h,
        decoration: BoxDecoration(
          color: AppColor.secondColors,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(0),
            bottomRight: Radius.circular(0),
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
          ),
        ),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(
            0,
            8,
            0,
            24
          ),
          child: SingleChildScrollView(
            physics: RangeMaintainingScrollPhysics(),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment:
                  CrossAxisAlignment.start,
              children: [
                DividerHome(),
              
                BuildExperienceTopDormitories(),
                
                BuildPropertyNearby(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
