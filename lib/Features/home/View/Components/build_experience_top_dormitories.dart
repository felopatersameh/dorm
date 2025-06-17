import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../Core/Components/build_animatedview_list_box.dart';

import '../../../../Core/Resources/colors.dart';
import '../../../../Core/Resources/text_style.dart';
import '../Cubit/home_cubit.dart';
import 'build_card_items.dart';
import 'enum.dart';
import 'package:flutter/Material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BuildExperienceTopDormitories extends StatelessWidget {
  const BuildExperienceTopDormitories({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.read<HomeCubit>().state;
    return Padding(
      padding: EdgeInsets.only(top: 12.r, right: 16.r, bottom: 0),
      child: BuildAnimatedview(
        index: 0,
        animationType: AnimationType.rightToLeft,
        child: Container(
          width: 1.sw,
          height: 270.h,
          decoration: BoxDecoration(color: AppColor.secondColors),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 16.r, left: 16.r, right: 16.r),
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
                padding: EdgeInsets.only(top: 4.r, left: 16.r, right: 16.r),
                child: Text(
                  '30+ student-friendly stays worldwide.',
                  style: AppTextStyle.normal13,
                ),
              ),
              Expanded(
                child:state.featuredDorms == null ? Center(child: const CircularProgressIndicator.adaptive()) : ListView.builder(
                  padding: EdgeInsets.zero,
                  primary: false,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: state.featuredDorms?.length ?? 0,
                  itemBuilder:
                      (context, index) =>
                          BuildCardItems(typeCards: TypeCards.small,dormsModel: state.featuredDorms![index],),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
