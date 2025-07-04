import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../Core/Components/build_animatedview_list_box.dart';
import '../Cubit/home_cubit.dart';
import 'build_card_items.dart';
import 'enum.dart';
import 'package:flutter/Material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BuildPropertyNearby extends StatelessWidget {
  const BuildPropertyNearby({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.read<HomeCubit>().state;
    return Padding(
      padding: EdgeInsets.only(bottom: 16.h),
      child: BuildAnimatedview(
        index: 0,
        animationType: AnimationType.bottomToTop,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 16.w, top: 16.h, right: 16.w),
              child: Text('property nearby'),
            ),
            Padding(
              padding: EdgeInsets.only(left: 16.w, top: 4.h, right: 16.w, bottom: 16.h),
              child: Text('Convenient stays close to your campus.'),
            ),
            Align(
              child: state.nerbyDorms == null ? Center(child: const CircularProgressIndicator.adaptive()) :ListView.builder(
                padding: EdgeInsets.zero,
                primary: false,
                shrinkWrap: true,
                physics: RangeMaintainingScrollPhysics(),
                scrollDirection: Axis.vertical,
                itemCount: state.nerbyDorms?.length ?? 0,
                itemBuilder:
                    (context, index) =>
                        BuildCardItems(typeCards: TypeCards.big,dormsModel: state.nerbyDorms![index],),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
