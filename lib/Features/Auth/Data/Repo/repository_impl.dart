
import 'package:dartz/dartz.dart';
import '../../../../Core/Storage/Local/local_storage_service.dart';
import '../../../../Core/Storage/Remote/api_service.dart';
import '../Model/User_model.dart';
import '../Model/login_model.dart';
import '../Model/register_model.dart';

import '../../../../Core/Storage/Local/local_storage_keys.dart';
import '../../../../Core/Storage/Remote/api_endpoints.dart';
import '../../../../Core/Storage/Remote/response_model.dart';
import 'repository_auth.dart';

class AuthRepositoryImpl implements AuthRepository {
  @override
  Future<Either<FailureModel, UserModel>> login(LoginModel loginModel) async {
    try {
      final response = await DioHelper.postData(
        path: ApiEndpoints.login,
        data: loginModel.toJson(),
      );


      if (response.status) {
        final user = UserModel.fromJson(response.data['user']);
        LocalStorageService.setValue(LocalStorageKeys.idUser, user.id);
        LocalStorageService.setValue(LocalStorageKeys.isLoggedIn, true);

          return Right(user);
        
      }
      else {
        return Left(
          FailureModel(message: response.message, error: response.data),
        );
      }
    } catch (e) {
      return Left(
        FailureModel(
          message: 'An unexpected error occurred during login: ${e.toString()}',
          error: e,
        ),
      );
    }
  }

  @override
  Future<Either<FailureModel, bool>> register(
    RegisterModel registerModel,
  ) async {
    try {
      final response = await DioHelper.postData(
        path: ApiEndpoints.register,
        data: registerModel.toJson(),
      );
       if (response.status) {
        return const Right(true);
      } else {
        return Left(
          FailureModel(message: response.message, error: response.data),
        );
      }
    } catch (e) {
      return Left(
        FailureModel(
          message:
              'An unexpected error occurred during registration: ${e.toString()}',
          error: e,
        ),
      );
    }
  }
}
