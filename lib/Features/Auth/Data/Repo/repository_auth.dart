import 'package:dartz/dartz.dart';

import '../../../../Core/Storage/Remote/response_model.dart';
import '../Model/user_model.dart';
import '../Model/login_model.dart';
import '../Model/register_model.dart';

abstract class AuthRepository {
  Future<Either<FailureModel, UserModel>> login(LoginModel loginModel);
  Future<Either<FailureModel, bool>> register(RegisterModel registerModel);
}
