import '../../../../Core/Resources/icons.dart';
import '../../../../main.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../Core/Components/custom_build_button_app.dart';
import '../../../../Core/Resources/colors.dart';
import '../../../../Core/Resources/strings.dart';
import '../../../../Core/Resources/text_style.dart';
import 'custom_text_form_field.dart';
import '../Data/Model/register_model.dart';
import '../view/Components/build_text_button.dart';
import '../view/Cubit/auth_in_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FormRegister extends StatefulWidget {
  const FormRegister({super.key});

  @override
  State<FormRegister> createState() => _FormRegisterState();
}

class _FormRegisterState extends State<FormRegister> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  @override
  void initState() {
    context.watch<AuthCubit>().state.isPasswordVisible
        ? context.read<AuthCubit>().changePasswordVisibility()
        : null;
    emailController.text = "";
    passController.text = "";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit  , AuthState>(
      listener: (context, state) {
        if (state.messageRegister.isNotEmpty) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.messageRegister)));
        }
      },
      child:
         Align(
          alignment: AlignmentDirectional(0, 0),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 16),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                CustomTextFormField(
                  title: AppStrings.name,
                  keyboardType: TextInputType.name,
                  controller: nameController,
                ),
                CustomTextFormField(
                  title: AppStrings.password,
                  keyboardType: TextInputType.visiblePassword,
                  controller: passController,
                  obscureText:
                      context.watch<AuthCubit>().state.isPasswordVisible,
                  showSuffix: true,
                  onTap:
                      () =>
                          context.read<AuthCubit>().changePasswordVisibility(),
                ),

                CustomBuildButtonApp(
                  looding: context.watch<AuthCubit>().state.isLoadingRegister,
                  text: AppStrings.register,
                  backgroundColor: AppColor.primaryColors,
                  onPressed: () {
                    RegisterModel registerModel = RegisterModel(
                      name: nameController.text,
                      email: emailController.text,
                      password: passController.text,
                    );
                    context.watch<AuthCubit>().register(registerModel);
                  },
                  isSpace: false,
                ),

                BuildTextButton(
                  title: AppStrings.alreadyHaveAnAccount,
                  style: AppTextStyle.normal13,
                  onPressed: () {
                    kNavigationService.goBack();
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
          )));
  }
}
