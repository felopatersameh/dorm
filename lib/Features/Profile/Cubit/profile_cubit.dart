
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import '../../Auth/Data/Model/user_model.dart';
import '../Data/Model/change_password_model.dart';
import '../Data/Model/update_profile_model.dart';
import '../Data/Repo/profile_repository_impl.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final ProfileRepositoryImpl profileRepository;

  ProfileCubit({required this.profileRepository}) : super(const ProfileState());

  Future<void> loadCurrentUser() async {
    emit(state.copyWith(isLoading: true, message: '', errorMessage: ''));

    final result = await profileRepository.getCurrentUser();
    result.fold(
      (failure) =>
          emit(state.copyWith(isLoading: false, errorMessage: failure.message)),
      (user) => emit(
        state.copyWith(
          isLoading: false,
          user: user,
          message: '',
          errorMessage: '',
        ),
      ),
    );
  }

  /// Update user profile (username, email, profile image)
  Future<void> updateProfile(UpdateProfileModel updateModel) async {
    if (updateModel.username.isEmpty && updateModel.email.isEmpty) {
      emit(state.copyWith(errorMessage: 'No changes to update'));
      return;
    }

    emit(
      state.copyWith(isUpdatingProfile: true, message: '', errorMessage: ''),
    );

    final result = await profileRepository.updateProfile(updateModel);
    result.fold(
      (failure) => emit(
        state.copyWith(isUpdatingProfile: false, errorMessage: failure.message),
      ),
      (updatedUser) {
        emit(
          state.copyWith(
            isUpdatingProfile: false,
            user: updatedUser,
            message: 'Profile updated successfully',
            errorMessage: '',
          ),
        );
      },
    );
  }

  /// Change user password
  Future<void> changePassword(ChangePasswordModel changePasswordModel) async {
    // Validate passwords match

    emit(
      state.copyWith(isChangingPassword: true, message: '', errorMessage: ''),
    );

    final result = await profileRepository.changePassword(changePasswordModel);
    result.fold(
      (failure) => emit(
        state.copyWith(
          isChangingPassword: false,
          errorMessage: failure.message,
        ),
      ),
      (success) => emit(
        state.copyWith(
          isChangingPassword: false,
          message: 'Password changed successfully',
          errorMessage: '',
        ),
      ),
    );
  }

  /// Toggle password visibility for current password field
  void toggleCurrentPasswordVisibility() {
    emit(
      state.copyWith(isCurrentPasswordVisible: !state.isCurrentPasswordVisible),
    );
  }

  /// Toggle password visibility for new password field
  void togglePasswordVisibility() {
    emit(state.copyWith(isPasswordVisible: !state.isPasswordVisible));
  }

  /// Toggle password visibility for confirm password field
  void toggleConfirmPasswordVisibility() {
    emit(
      state.copyWith(isConfirmPasswordVisible: !state.isConfirmPasswordVisible),
    );
  }

  /// Clear messages
  void clearMessages() {
    emit(state.copyWith(message: '', errorMessage: ''));
  }
}
