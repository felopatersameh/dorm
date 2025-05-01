import 'package:dorm/Core/Components/build_animatedview_list_box.dart';

import '../../../Core/Resources/colors.dart';
import '../../../Core/Resources/text_style.dart';
import 'build_card_items.dart';
import 'enum.dart';
import 'package:flutter/Material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BuildExperienceTopDormitories extends StatelessWidget {
  const BuildExperienceTopDormitories({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0, 12, 16, 0),
      child: BuildAnimatedview(
        index: 0,
        animationType: AnimationType.rightToLeft,
        child: Container(
          width: 1.sw,
          height: 260.h,
          decoration: BoxDecoration(color: AppColor.secondColors),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16, 16, 16, 0),
                child: InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    // context.pushNamed(
                    //     FavouritepageWidget
                    //         .routeName);
                  },
                  child: Text(
                    'Experience top dormitories',
                    style: AppTextStyle.semiBold18,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16, 4, 16, 0),
                child: Text(
                  '30+ student-friendly stays worldwide.',
                  style: AppTextStyle.normal13,
                ),
              ),
              Expanded(
                child: ListView.builder(
                  padding: EdgeInsets.zero,
                  primary: false,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: 2,
                  itemBuilder:
                      (context, index) =>
                          BuildCardItems(typeCards: TypeCards.small),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
