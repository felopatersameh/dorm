import 'package:dorm/Core/Resources/icons.dart';
import 'package:dorm/Core/Routes/app_routes.dart';
import 'package:dorm/main.dart';

import '../Cubit/log_in_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../Core/Components/custom_build_button_app.dart';
import '../../../Core/Resources/colors.dart';
import '../../../Core/Resources/strings.dart';
import '../../../Core/Resources/text_style.dart';
import 'build_text_button.dart';
import 'custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FormLogin extends StatefulWidget {
  const FormLogin({super.key});

  @override
  State<FormLogin> createState() => _FormLoginState();
}

class _FormLoginState extends State<FormLogin> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  @override
  void initState() {
    emailController.text = "";
    passController.text = "";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional(0, 0),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 16),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            CustomTextFormField(
              title: AppStrings.email,
              keyboardType: TextInputType.emailAddress,
              controller: emailController,
            ),
            CustomTextFormField(
              title: AppStrings.password,
              keyboardType: TextInputType.visiblePassword,
              controller: passController,
              obscureText: context.watch<LogInCubit>().state.isPasswordVisible,
              showSuffix: true,
              onTap:
                  () => context.read<LogInCubit>().changePasswordVisibility(),
            ),

            CustomBuildButtonApp(
              text: AppStrings.login,
              backgroundColor: AppColor.primaryColors,
              onPressed: () {
                kNavigationService.clearAndNavigateTo(AppRoutes.main);
              },
              isSpace: false,
            ),

            BuildTextButton(
              title: AppStrings.forgotPassword,
              style: AppTextStyle.semiBold12Black,
            ),
            BuildTextButton(
              title: AppStrings.orSignUpWith,
              style: AppTextStyle.normal13,
            ),

            CustomBuildButtonApp(
              text: AppStrings.continueWithGoogle,
              backgroundColor: AppColor.secondColors,
              onPressed: () {},
              elevation: 0,
              textColor: AppColor.black,
              icon:  AppIcons.google,
            ),
            10.verticalSpace,
            CustomBuildButtonApp(
              text: AppStrings.continueWithApple,
              backgroundColor: AppColor.secondColors,
              onPressed: () {},
              elevation: 0,
              textColor: AppColor.black,
              icon: AppIcons.apple,
            ),
          ],
        ),
      ),
    );
  }
}
