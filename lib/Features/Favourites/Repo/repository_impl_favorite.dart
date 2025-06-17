

import 'package:dartz/dartz.dart';
import '../../../../Core/Storage/Local/local_storage_keys.dart';
import '../../../../Core/Storage/Local/local_storage_service.dart';
import '../../home/Data/Model/dorms_model.dart';
import '../../../../../Core/Storage/Remote/response_model.dart';
import '../../../../Core/Storage/Remote/api_endpoints.dart';
import '../../../../Core/Storage/Remote/api_service.dart';
import 'repository_favorite.dart';

class RepositoryImplFavorite implements RepositoryFavorite {
  
  @override
  Future<Either<FailureModel,  List<DormsModel>>> getfavourites()async {
      try {
      final response = await DioHelper.getData(
        path: ApiEndpoints.getFavourites,
        queryParameters: {
          'user_id': LocalStorageService.getValue(LocalStorageKeys.idUser),
        },
      );
    if (response.status) {
        final collection = response.data['data'];
        List<DormsModel> dorms = [];
        for (var element in collection) {
        dorms.add(DormsModel.fromJson(element)) ;
        
        }
        return Right(dorms);
      } else {
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
  Future<Either<FailureModel, bool>> postfavourites()async {
      try {
      final response = await DioHelper.postData(
        path: ApiEndpoints.getFavourites,
        queryParameters: {
          'user_id': LocalStorageService.getValue(LocalStorageKeys.idUser),
          "dorm_id":""
        },
      );
    if (response.status) {
        final collection = response.data['data'];
        List<DormsModel> dorms = [];
        for (var element in collection) {
        dorms.add(DormsModel.fromJson(element)) ;
        
        }
        return Right(true);
      } else {
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
  
 
}
