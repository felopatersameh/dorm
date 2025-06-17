import '../../../Core/Resources/icons.dart';
import '../../../Core/Resources/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileDetailsWidget extends StatelessWidget {
  final Icon icon;
  final String title;
  final bool activeDivider;
  final VoidCallback? onTap;
  const ProfileDetailsWidget({
    super.key,
    required this.icon,
    required this.title,
    required this.activeDivider,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: GestureDetector(
                onTap: onTap,
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    icon,
                    Expanded(
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(16.w, 0, 0, 0),
                        child: Text(
                          title,
                          maxLines: 1,
                          style: AppTextStyle.normal13,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            IconButton(icon: AppIcons.angleRight, onPressed: onTap),
          ],
        ),
        if (!activeDivider) Divider(height: 1.h),
      ],
    );
  }
}
