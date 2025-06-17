import '../../../../Core/Resources/colors.dart';
import '../../../../Core/Resources/text_style.dart';
import 'package:flutter/Material.dart';

class DescriptionInPartOnePage extends StatelessWidget {
  const DescriptionInPartOnePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(30, 24, 16, 0),
      child: Text(
        'Discover cozy stays, affordable prices, and great locations!',
        style: AppTextStyle.normal18.copyWith(color: AppColor.secondColors),
      ),
    );
  }
}
