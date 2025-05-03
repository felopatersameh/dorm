import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../Search/Components/build_search_bar.dart';

import 'package:flutter/Material.dart';

import '../../../Core/Components/build_animatedview_list_box.dart';
import 'description_in_part_one_page.dart';

class BuildPartSearchBarHome extends StatelessWidget {
  const BuildPartSearchBarHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 16.w, top: 60.h, right: 16.w, bottom: 0),
      child: BuildAnimatedview(
        index: 0,
        animationType: AnimationType.bottomToTop,
        child: Column(
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [Expanded(child: BuildSearchBar(enable: false,))],
            ),
            DescriptionInPartOnePage(),
          ],
        ),
      ),
    );
  }
}
