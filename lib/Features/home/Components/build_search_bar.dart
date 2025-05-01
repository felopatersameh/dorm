import '../../../Core/Resources/colors.dart';
import '../../../Core/Resources/text_style.dart';
import 'package:flutter/Material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../Core/Components/build_animatedview_list_box.dart';
import 'description_in_part_one_page.dart';

class BuildSearchBar extends StatelessWidget {
  const BuildSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(16, 60, 16, 0),
      child: BuildAnimatedview(
        index: 0,
        animationType: AnimationType.bottomToTop,
        child: Column(
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: SearchBar(
                    autoFocus: false,
                    backgroundColor: WidgetStatePropertyAll(AppColor.secondColors),
                    textStyle: WidgetStatePropertyAll(AppTextStyle.semiBold12Black),
                    keyboardType: TextInputType.text,
                    onChanged: (value) async {
                      Duration(milliseconds: 2000);
                    },
                    focusNode: FocusNode(),
                    shape: WidgetStatePropertyAll(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                        side: BorderSide(color: Color(0x00000000), width: 1.0),
                      ),
                    ),
                    trailing: [
                      Icon(Icons.filter_list, color: Color(0xFF757575), weight: 22),
                      10.horizontalSpace,
                    ],
                    leading: Icon(Icons.search, color: Colors.grey, weight: 20),
                    hintText: 'Beach, mountains, long strolls...',
                    hintStyle: WidgetStatePropertyAll(
                      AppTextStyle.semiBold12Black.copyWith(color: Colors.grey),
                    ),
                    onSubmitted: (value) {},
                  ),
                ),
              ],
            ),
           DescriptionInPartOnePage(),
          ],
        ),
      ),
    );
  }
}
