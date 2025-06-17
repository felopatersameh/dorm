import 'package:dartz/dartz.dart';
import '../../../../Core/Storage/Remote/response_model.dart';
import '../../../Auth/Data/Model/user_model.dart';
import '../Model/change_password_model.dart';
import '../Model/update_profile_model.dart';

abstract class ProfileRepository {
  Future<Either<FailureModel, UserModel>> getCurrentUser();
  
  Future<Either<FailureModel, UserModel>> updateProfile(UpdateProfileModel updateModel);
  
  Future<Either<FailureModel, bool>> changePassword(ChangePasswordModel changePasswordModel);
}
