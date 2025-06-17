import 'package:bloc/bloc.dart';
import '../../../../Core/Routes/app_routes.dart';
import 'package:flutter/Material.dart';
import '../../Data/Model/login_model.dart';
import '../../Data/Model/register_model.dart';
import '../../../../main.dart';

import '../../Data/Model/user_model.dart';
import '../../Data/Repo/repository_impl.dart';
import '../../../../Core/Services/user_data_service.dart';
import '../../../../Core/Storage/Local/local_storage_service.dart';

part 'auth_in_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit({required this.authRepositoryImpl}) : super(AuthState());
  final AuthRepositoryImpl authRepositoryImpl;

  void changePasswordVisibility() {
    emit(state.copyWith(isPasswordVisible: !state.isPasswordVisible));
  }

  Future<void> login(LoginModel loginModel) async {
    emit(state.copyWith(isLoadingLogin: true));

    final response = await authRepositoryImpl.login(loginModel);
    response.fold(
      (l) =>
          emit(state.copyWith(isLoadingLogin: false, messageLogin: l.message)),
      (r) {
        kNavigationService.clearAndNavigateTo(AppRoutes.main);
        emit(state.copyWith(isLoadingLogin: false, user: r as UserModel?));
      },
    );
  }

  Future<void> register(RegisterModel registerModel) async {
    emit(state.copyWith(isLoadingRegister: true));

    final response = await authRepositoryImpl.register(registerModel);
    response.fold(
      (l) => emit(
        state.copyWith(isLoadingRegister: false, messageRegister: l.message),
      ),
      (r) {
        kNavigationService.goBack();
        emit(
          state.copyWith(
            isLoadingRegister: false,
            messageRegister: 'Registerd successfully',
          ),
        );
      },
    );
  }

  Future<void> logout() async {
    emit(state.copyWith(isLoadingLogin: true));

    try {
      // Clear user data from UserDataService
      await UserDataService.clearUserData();

      // Clear local storage for backward compatibility
      await LocalStorageService.clear();

      // Navigate to login page
      kNavigationService.clearAndNavigateTo(AppRoutes.login);

      emit(
        state.copyWith(
          isLoadingLogin: false,
          user: null,
          messageLogin: 'Logged out successfully',
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          isLoadingLogin: false,
          messageLogin: 'Error during logout: ${e.toString()}',
        ),
      );
    }
  }
}
