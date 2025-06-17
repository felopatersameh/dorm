import '../../../../../Core/Resources/icons.dart';
import '../../../../../Core/Routes/app_routes.dart';
import '../../../../../main.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../Core/Components/custom_build_button_app.dart';
import '../../../../../Core/Resources/colors.dart';
import '../../../../../Core/Resources/strings.dart';
import '../../../../../Core/Resources/text_style.dart';
import '../../Data/Model/login_model.dart';
import 'custom_text_form_field.dart';
import '../Cubit/auth_in_cubit.dart';
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
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state.messageLogin.isNotEmpty) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.messageLogin)));
        }
      },
      child: Align(
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
                obscureText: context.watch<AuthCubit>().state.isPasswordVisible,
                showSuffix: true,
                onTap:
                    () => context.read<AuthCubit>().changePasswordVisibility(),
              ),

              CustomBuildButtonApp(
                text: AppStrings.login,
                backgroundColor: AppColor.primaryColors,
                onPressed: () {
                  LoginModel loginModel = LoginModel(
                    email: emailController.text,
                    password: passController.text,
                  );
                  context.read<AuthCubit>().login(loginModel);
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
                onPressed: () {
                  kNavigationService.navigateTo(AppRoutes.register);
                },
              ),

              CustomBuildButtonApp(
                text: AppStrings.continueWithGoogle,
                backgroundColor: AppColor.secondColors,
                onPressed: () {},
                elevation: 0,
                textColor: AppColor.black,
                icon: AppIcons.google,
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
      ),
    );
  }
}

class BuildTextButton extends StatelessWidget {
  final String title;
  final TextStyle style;
  final VoidCallback? onPressed;
  const BuildTextButton({
    super.key,
    required this.title,
    required this.style,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
      child: InkWell(
        onTap: onPressed,
        child: Text(
          title,
          style: style,
          textAlign: TextAlign.center,

        ),
      ),
    );
  }

}
