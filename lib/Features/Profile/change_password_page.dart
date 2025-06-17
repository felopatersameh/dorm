import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../Core/Components/custom_build_button_app.dart';
import '../../Core/Resources/colors.dart';
import '../../Core/Resources/strings.dart';
import '../../Core/Resources/text_style.dart';
import '../Auth/view/Components/custom_text_form_field.dart';
import 'Data/Model/change_password_model.dart';
import 'Cubit/profile_cubit.dart';

class ChangePasswordPage extends StatefulWidget {
  const ChangePasswordPage({super.key});

  @override
  State<ChangePasswordPage> createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  final _formKey = GlobalKey<FormState>();
  final _currentPasswordController = TextEditingController();
  final _newPasswordController = TextEditingController();

  @override
  void dispose() {
    _currentPasswordController.dispose();
    _newPasswordController.dispose();
    super.dispose();
  }

  void _changePassword() {
    if (_formKey.currentState!.validate()) {
      final changePasswordModel = ChangePasswordModel(
        currentPassword: _currentPasswordController.text,
        newPassword: _newPasswordController.text,
      );

      context.read<ProfileCubit>().changePassword(changePasswordModel);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppStrings.changePassword, style: AppTextStyle.semiBold16),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: BlocConsumer<ProfileCubit, ProfileState>(
        listener: (context, state) {
          if (state.message.isNotEmpty) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
                backgroundColor: Colors.green,
              ),
            );
            // Clear form and navigate back on success
            if (state.message.contains('successfully')) {
              _currentPasswordController.clear();
              _newPasswordController.clear();
              Navigator.of(context).pop();
            }
          }
          if (state.errorMessage.isNotEmpty) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.errorMessage),
                backgroundColor: Colors.red,
              ),
            );
          }
        },
        builder: (context, state) {
          return SingleChildScrollView(
            padding: EdgeInsets.all(24.w),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(height: 20.h),

                  // Current Password Field
                  CustomTextFormField(
                  
                    title: AppStrings.currentPassword,
                    controller: _currentPasswordController,
                    obscureText: state.isCurrentPasswordVisible,
                    showSuffix: true,
                    onTap:
                        () =>
                            context
                                .read<ProfileCubit>()
                                .toggleCurrentPasswordVisibility(),
                   
                    
                  ),

                  SizedBox(height: 16.h),

                  // New Password Field
                  CustomTextFormField(
                    title: AppStrings.newPassword,
                    controller: _newPasswordController,
                    obscureText: state.isPasswordVisible,
                    showSuffix: true,
                    onTap:
                        () =>
                            context
                                .read<ProfileCubit>()
                                .togglePasswordVisibility(),
                    
                  ),

                  SizedBox(height: 16.h),

                  

                  SizedBox(height: 32.h),

                  // Change Password Button
                  CustomBuildButtonApp(
                    text: AppStrings.changePassword,
                    backgroundColor: AppColor.primaryColors,
                    onPressed:
                        state.isChangingPassword ? () {} : _changePassword,
                    looding: state.isChangingPassword,
                    isSpace: false
                  ),

                  SizedBox(height: 16.h),

                  // Password Requirements
                  Container(
                    padding: EdgeInsets.all(16.w),
                    decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Password Requirements:',
                          style: AppTextStyle.semiBold16,
                        ),
                        SizedBox(height: 8.h),
                        Text(
                          '• At least 6 characters long',
                          style: AppTextStyle.normal13,
                        ),
                        Text(
                          '• Must not match current password',
                          style: AppTextStyle.normal13,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
