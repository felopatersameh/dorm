import 'Components/body_page_home.dart';

import '../../Core/Resources/constant.dart';
import 'Components/cover_image_home_page.dart';
import 'package:flutter/Material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        alignment: AlignmentDirectional(0, -1),
        children: [
          CoverImageHomePage(),
          AppConstant.coverColor,
          BodyPageHome(),
        ],
      ),
    );
  }
}
