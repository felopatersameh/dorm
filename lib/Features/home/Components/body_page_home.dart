import 'package:dorm/Features/home/Components/build_search_bar.dart';
import 'package:dorm/Features/home/Components/description_in_part_one_page.dart';
import 'package:dorm/Features/home/Components/expanded_body_page.dart';
import 'package:dorm/Features/home/Components/logo_home_page.dart';
import 'package:flutter/Material.dart';

class BodyPageHome extends StatelessWidget {
  const BodyPageHome({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional(0, 0),
      child: SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            LogoHomePage(),
            BuildSearchBar(),
          
            ExpandedBodyPage(),
          ],
        ),
      ),
    );
  }
}
