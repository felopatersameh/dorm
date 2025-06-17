import 'package:dartz/dartz.dart';

import '../../../../../Core/Storage/Remote/response_model.dart';
import '../../home/Data/Model/dorms_model.dart';

abstract class RepositoryFavorite {
  Future<Either<FailureModel,  List<DormsModel>>> getfavourites();
  Future<Either<FailureModel, bool>> postfavourites();
}
