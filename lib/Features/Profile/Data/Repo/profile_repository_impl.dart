import 'package:dartz/dartz.dart';
import '../../../../Core/Services/user_data_service.dart';
import '../../../../Core/Storage/Remote/api_service.dart';
import '../../../../Core/Storage/Remote/api_endpoints.dart';
import '../../../../Core/Storage/Remote/response_model.dart';
import '../../../Auth/Data/Model/user_model.dart';
import '../Model/change_password_model.dart';
import '../Model/update_profile_model.dart';
import 'profile_repository.dart';

class ProfileRepositoryImpl implements ProfileRepository {
  @override
  Future<Either<FailureModel, UserModel>> getCurrentUser() async {
    try {
      final user = await UserDataService.getCurrentUser();
      if (user != null) {
        return Right(user);
      } else {
        return Left(
          FailureModel(
            message: 'No user data found. Please login again.',
            error: 'USER_NOT_FOUND',
          ),
        );
      }
    } catch (e) {
      return Left(
        FailureModel(
          message: 'Error retrieving user data: ${e.toString()}',
          error: e,
        ),
      );
    }
  }

  @override
  Future<Either<FailureModel, UserModel>> updateProfile(
      UpdateProfileModel updateModel) async {
    try {
        final currentUser = await UserDataService.getCurrentUser();
     
      final response = await DioHelper.postData(
        path: ApiEndpoints.updateProfile,
        data: updateModel.toJson(currentUser!.id),
      );
      if (response.status) {
        final updatedUser =currentUser.copyWith(email: updateModel.email, username: updateModel.username);
        await UserDataService.updateUserData(updatedUser);
        return Right(updatedUser);
      } else {
        return Left(
          FailureModel(
            message: response.message,
            error: response.data,
          ),
        );
      }
    } catch (e) {
      return Left(
        FailureModel(
          message: 'An unexpected error occurred during profile update: ${e.toString()}',
          error: e,
        ),
      );
    }
  }

  @override
  Future<Either<FailureModel, bool>> changePassword(
      ChangePasswordModel changePasswordModel) async {
    try {
      final currentUser = await UserDataService.getCurrentUser();
      final response = await DioHelper.postData(
        path: ApiEndpoints.changePassword,
        data: changePasswordModel.toJson(currentUser!.id),
      );
      if (response.status) {
        return const Right(true);
      } else {
        return Left(
          FailureModel(
            message: response.message,
            error: response.data,
          ),
        );
      }
    } catch (e) {
      return Left(
        FailureModel(
          message: 'An unexpected error occurred during password change: ${e.toString()}',
          error: e,
        ),
      );
    }
  }

}
