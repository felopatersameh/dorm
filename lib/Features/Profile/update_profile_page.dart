import '../../main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../Core/Components/custom_build_button_app.dart';
import '../../Core/Resources/colors.dart';
import '../../Core/Resources/strings.dart';
import '../../Core/Resources/text_style.dart';
import '../../Core/Routes/app_routes.dart';
import '../Auth/view/Components/custom_text_form_field.dart';
import 'Data/Model/update_profile_model.dart';
import 'Cubit/profile_cubit.dart';

class UpdateProfilePage extends StatefulWidget {
  const UpdateProfilePage({super.key});

  @override
  State<UpdateProfilePage> createState() => _UpdateProfilePageState();
}

class _UpdateProfilePageState extends State<UpdateProfilePage> {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _emailController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadCurrentUserData();
  }

  void _loadCurrentUserData() {
    final profileState = context.read<ProfileCubit>().state;
      _usernameController.text = profileState.user!.username;
      _emailController.text = profileState.user!.email;
    
  }



  void _updateProfile() {
    if (_formKey.currentState!.validate()) {
      final currentUser = context.read<ProfileCubit>().state.user;

      bool hasChanges = false;
      String? newUsername;
      String? newEmail;

      if (currentUser != null) {
        if (_usernameController.text.trim() != currentUser.username) {
          newUsername = _usernameController.text.trim();
          hasChanges = true;
        }
        if (_emailController.text.trim() != currentUser.email) {
          newEmail = _emailController.text.trim();
          hasChanges = true;
        }
      }

      if (!hasChanges) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('No changes detected'),
            backgroundColor: Colors.orange,
          ),
        );
        return;
      }

      final updateModel = UpdateProfileModel(
        username: newUsername??currentUser!.username,
        email: newEmail??currentUser!.email,
      );

      context.read<ProfileCubit>().updateProfile(updateModel);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppStrings.updateProfile, style: AppTextStyle.semiBold16),
        centerTitle: true,
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
            // Navigate back on success
            if (state.message.contains('successfully')) {
                kNavigationService.goBack();
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

                  SizedBox(height: 32.h),

                  // Username Field
                  CustomTextFormField(
                    title: AppStrings.username,
                    controller: _usernameController,
                    keyboardType: TextInputType.text,
                  ),

                  SizedBox(height: 16.h),

                  // Email Field
                  CustomTextFormField(
                    title: AppStrings.email,
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                  ),

                  SizedBox(height: 32.h),

                  CustomBuildButtonApp(
                    text: AppStrings.updateProfile,
                    backgroundColor: AppColor.primaryColors,
                    onPressed: state.isUpdatingProfile ? () {} : _updateProfile,
                    looding: state.isUpdatingProfile,
                    isSpace: false,
                  ),

                  SizedBox(height: 16.h),

                  // Change Password Button
                  CustomBuildButtonApp(
                    text: AppStrings.changePassword,
                    backgroundColor: AppColor.secondColors,
                    textColor: AppColor.primaryColors,
                    onPressed: () {
                      kNavigationService.navigateTo(AppRoutes.changePassword);
                    },
isSpace: false
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
