part of 'profile_cubit.dart';

@immutable
class ProfileState {
  final UserModel? user;
  final bool isLoading;
  final bool isUpdatingProfile;
  final bool isChangingPassword;
  final String message;
  final String errorMessage;
  final bool isPasswordVisible;
  final bool isConfirmPasswordVisible;
  final bool isCurrentPasswordVisible;

  const ProfileState({
    this.user,
    this.isLoading = false,
    this.isUpdatingProfile = false,
    this.isChangingPassword = false,
    this.message = '',
    this.errorMessage = '',
    this.isPasswordVisible = true,
    this.isConfirmPasswordVisible = true,
    this.isCurrentPasswordVisible = true,
  });



  ProfileState copyWith({
    UserModel? user,
    bool? isLoading,
    bool? isUpdatingProfile,
    bool? isChangingPassword,
    String? message,
    String? errorMessage,
    bool? isPasswordVisible,
    bool? isConfirmPasswordVisible,
    bool? isCurrentPasswordVisible,
  }) {
    return ProfileState(
      user: user ?? this.user,
      isLoading: isLoading ?? this.isLoading,
      isUpdatingProfile: isUpdatingProfile ?? this.isUpdatingProfile,
      isChangingPassword: isChangingPassword ?? this.isChangingPassword,
      message: message ?? this.message,
      errorMessage: errorMessage ?? this.errorMessage,
      isPasswordVisible: isPasswordVisible ?? this.isPasswordVisible,
      isConfirmPasswordVisible:
          isConfirmPasswordVisible ?? this.isConfirmPasswordVisible,
      isCurrentPasswordVisible:
          isCurrentPasswordVisible ?? this.isCurrentPasswordVisible,
    );
  }
}
