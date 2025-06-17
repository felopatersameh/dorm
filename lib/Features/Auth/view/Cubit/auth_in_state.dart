part of 'auth_in_cubit.dart';


@immutable
class AuthState {
  final bool isPasswordVisible;
  final bool isLoadingLogin;
  final bool isLoadingRegister;
  final String messageLogin;
  final String messageRegister;
  final UserModel? user;

  const AuthState({
    this.isPasswordVisible = true,
    this.isLoadingLogin = false,
    this.isLoadingRegister = false,
    this.messageLogin = '',
    this.messageRegister = '',
    this.user,
  });

  AuthState copyWith({
    bool? isPasswordVisible,
    bool? isLoadingLogin,
    bool? isLoadingRegister,
    String? messageLogin,
    String? messageRegister,
    UserModel? user,
  }) {
    return AuthState(
      isPasswordVisible: isPasswordVisible ?? this.isPasswordVisible,
      isLoadingLogin: isLoadingLogin ?? this.isLoadingLogin,
      isLoadingRegister: isLoadingRegister ?? this.isLoadingRegister,
      messageLogin: messageLogin ?? this.messageLogin,
      messageRegister: messageRegister ?? this.messageRegister,
      user: user ?? this.user,
    );
  }
}
