import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'Components/more_settings_profile.dart';
import 'Components/profile_image.dart';
import 'Components/random_card.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(24.w, 0, 24.w, 0),
      child: SingleChildScrollView(
        child: Column(
          spacing: 50.h,
          children: [
            SizedBox(),
            ProfileImage(),
            RandomCard(),
            MoreSettingsProfile(),
          ],
        ),
      ),
    );
  }
}
