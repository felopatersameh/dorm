import '../../../Core/Resources/icons.dart';
import '../../../Core/Resources/strings.dart';
import '../../../Core/Routes/app_routes.dart';

import 'profile_details_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../Auth/view/Cubit/auth_in_cubit.dart';

class MoreSettingsProfile extends StatelessWidget {
  const MoreSettingsProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ProfileDetailsWidget(
          icon: AppIcons.person,
          title: AppStrings.profileDetails,
          activeDivider: false,
          onTap: () {
            Navigator.of(context).pushNamed(AppRoutes.updateProfile);
          },
        ),
        ProfileDetailsWidget(
          icon: AppIcons.language,
          title: AppStrings.language,
          activeDivider: false,
        ),
        ProfileDetailsWidget(
          icon: AppIcons.help,
          title: AppStrings.help,
          activeDivider: false,
        ),
        ProfileDetailsWidget(
          icon: AppIcons.feedback,
          title: AppStrings.giveUsFeedback,
          activeDivider: false,
        ),
        BlocBuilder<AuthCubit, AuthState>(
          builder: (context, state) {
            return ProfileDetailsWidget(
              icon: AppIcons.logout,
              title: AppStrings.logOut,
              activeDivider: true,
              onTap: () {
                context.read<AuthCubit>().logout();
              },
            );
          },
        ),
      ],
    );
  }
}
