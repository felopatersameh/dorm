import '../../Core/Components/build_animatedview_list_box.dart';
import 'Components/build_card_favorites.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../Core/Resources/text_style.dart';

class FavouritesPage extends StatelessWidget {
  const FavouritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(16.w, 0, 0, 0),
          child: Text(
            'Keep track of your favorite dorms here',
            style: AppTextStyle.normal13,
          ),
        ),
        ...List.generate(
          10,
          (index) => BuildAnimatedview(
            index: index,
            animationType: AnimationType.rightToLeft,
            child: BuildCardFavorites(),
          ),
        ),
      ],
    );
  }
}
