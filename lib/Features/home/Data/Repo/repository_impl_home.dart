
import 'dart:developer';

import 'package:dartz/dartz.dart';
import '../../../../Core/Storage/Local/local_storage_keys.dart';
import '../../../../Core/Storage/Local/local_storage_service.dart';
import '../Model/dorms_model.dart';
import '../../../../../Core/Storage/Remote/response_model.dart';
import '../../../../Core/Storage/Remote/api_endpoints.dart';
import '../../../../Core/Storage/Remote/api_service.dart';
import 'repository_home.dart';

class HomeRepositoryImpl implements HomeRepository {
  @override
  Future<Either<FailureModel, List<DormsModel>>> getAllDorms() async{
    try {
      final response = await DioHelper.getData(
        path: ApiEndpoints.getAllDorms,
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
  Future<Either<FailureModel, DormsModel>> postfavourites() {
    throw UnimplementedError();
  }
  
  @override
  Future<Either<FailureModel, List<DormsModel>>> getNearbyDorms({required double latitude, required double longitude})async {
        try {
      final response = await DioHelper.getData(
        path: ApiEndpoints.getNearbyDorms,
          queryParameters: {
          'lat': latitude,
          'lng': longitude,
        },
        
      );
        log(response.data.toString());
      if (response.status) {
        final collection = response.data['data'];
        List<DormsModel> dorms = [];
        for (var element in collection) {
        dorms.add(DormsModel.fromJson(element)) ;
        }
        log(dorms.toString());
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
 
}
