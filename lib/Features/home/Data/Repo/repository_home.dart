import 'package:dartz/dartz.dart';
import '../Model/dorms_model.dart';

import '../../../../../Core/Storage/Remote/response_model.dart';

abstract class HomeRepository {
  Future<Either<FailureModel, List<DormsModel>>> getAllDorms();
  Future<Either<FailureModel, List<DormsModel>>> getNearbyDorms({required double latitude, required double longitude});
  Future<Either<FailureModel,  List<DormsModel>>> getfavourites();
  Future<Either<FailureModel, DormsModel>> postfavourites();
}
