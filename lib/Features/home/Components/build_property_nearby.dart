import 'package:dorm/Core/Components/build_animatedview_list_box.dart';
import 'package:dorm/Features/home/Components/build_card_items.dart';
import 'package:dorm/Features/home/Components/enum.dart';
import 'package:flutter/Material.dart';

class BuildPropertyNearby extends StatelessWidget {
  const BuildPropertyNearby({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 100),
      child: BuildAnimatedview(
        index: 0,
        animationType: AnimationType.bottomToTop,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(16, 16, 16, 0),
              child: Text('property nearby'),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(16, 4, 16, 0),
              child: Text('Convenient stays close to your campus.'),
            ),
            Align(
              child: ListView.builder(
                padding: EdgeInsets.zero,
                primary: false,
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemCount: 2,
                itemBuilder:
                    (context, index) =>
                        BuildCardItems(typeCards: TypeCards.big),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
