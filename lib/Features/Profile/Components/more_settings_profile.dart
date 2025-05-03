import '../../../Core/Resources/icons.dart';

import '../../../Core/Resources/strings.dart';

import 'profile_details_widget.dart';
import 'package:flutter/material.dart';

class MoreSettingsProfile extends StatelessWidget {
  const MoreSettingsProfile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ProfileDetailsWidget(
          icon: AppIcons.person,
          title:AppStrings.profileDetails,
          activeDivider: false,
        ),
        ProfileDetailsWidget(
          icon:  AppIcons.language,
          title: AppStrings.language,
          activeDivider: false,
        ),
        ProfileDetailsWidget(
          icon:  AppIcons.help,
          title: AppStrings.help,
          activeDivider: false,
        ),
        ProfileDetailsWidget(
          icon: AppIcons.feedback,
          title: AppStrings.giveUsFeedback,
          activeDivider: false,
        ),
        ProfileDetailsWidget(
          icon: AppIcons.logout,
          title: AppStrings.logOut,
          activeDivider: true,
        ),
      ],
    );
  }
}
