import 'dart:io';

import 'package:dio/dio.dart';
import '../Local/local_storage_keys.dart';
import '../Local/local_storage_service.dart';
import 'api_endpoints.dart';

import 'response_model.dart';

class DioHelper {
  static late Dio dio;

  static Future<void> init() async {
    dio = Dio(
      BaseOptions(
        baseUrl: ApiEndpoints.baseUrl,
        receiveDataWhenStatusError: true,
        // connectTimeout: const Duration(seconds: 10),
        // receiveTimeout: const Duration(seconds: 10),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      ),
    );
  }

  /// Handles GET requests
  static Future<ResponseModel> getData({
    required String path,
    Map<String, dynamic>? queryParameters,
        dynamic data,

  }) async {
    try {
      final response = await dio.get(
        path,
        queryParameters: queryParameters,
        data: data
        // options: await _getAuthorizationHeader(),
      );
      return ResponseModel.success(
        message: 'Data fetched successfully',
        data: response.data,
      );
    } on DioException catch (e) {
      return _handleDioError(e);
    } catch (e) {
      return ResponseModel.error(
        message: 'An unexpected error occurred.',
        data: e.toString(),
      );
    }
  }

  /// Handles POST requests
  static Future<ResponseModel> postData({
    required String path,
    dynamic data,
    Options? options,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final response = await dio.post(
        path,
        data: data,
        queryParameters: queryParameters,
      );

      return ResponseModel(
        status: response.data['success'],
        message: response.data['error']?? 'Data posted successfully',
        data: response.data,
        );
  
      
    } on DioException catch (e) {
      return _handleDioError(e);
    } catch (e) {
      return ResponseModel.error(
        message: 'An unexpected error occurred.',
        data: e.toString(),
      );
    }
  }

  /// Handles PUT requests
  static Future<ResponseModel> putData({
    required String path,
    required dynamic data,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final response = await dio.put(
        path,
        data: data,
        queryParameters: queryParameters,
        options: await _getAuthorizationHeader(),
      );
      return ResponseModel.success(
        message: 'Data updated successfully',
        data: response.data,
      );
    } on DioException catch (e) {
      return _handleDioError(e);
    } catch (e) {
      return ResponseModel.error(
        message: 'An unexpected error occurred.',
        data: e.toString(),
      );
    }
  }

  /// Handles DELETE requests
  static Future<ResponseModel> deleteData({
    required String path,
    dynamic data,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final response = await dio.delete(
        path,
        data: data,
        queryParameters: queryParameters,
        options: await _getAuthorizationHeader(),
      );
      return ResponseModel.success(
        message: 'Data deleted successfully',
        data: response.data,
      );
    } on DioException catch (e) {
      return _handleDioError(e);
    } catch (e) {
      return ResponseModel.error(
        message: 'An unexpected error occurred.',
        data: e.toString(),
      );
    }
  }

  static Future<Options> _getAuthorizationHeader() async {
    String? token = LocalStorageService.getValue(LocalStorageKeys.idUser);
    return Options(
      headers: {
        'Authorization':
            token != null && token.isNotEmpty ? 'Bearer $token' : '',
      },
    );
  }

  // Centralized error handling for DioExceptions
  static ResponseModel _handleDioError(DioException e) {
    String errorMessage = 'Something went wrong.';
    dynamic errorData = e.response?.data; // Raw error data from API

    if (e.type == DioExceptionType.connectionTimeout) {
      errorMessage =
          'Connection timeout. Please check your internet connection.';
    } else if (e.type == DioExceptionType.receiveTimeout) {
      errorMessage = 'Receive timeout. The server took too long to respond.';
    } else if (e.type == DioExceptionType.badResponse) {
      // Server responded with a status code outside of 2xx range
      int? statusCode = e.response?.statusCode;
      if (errorData is Map<String, dynamic> &&
          errorData.containsKey('message')) {
        errorMessage =
            errorData['message']; // Use message from API if available
      } else {
        errorMessage = 'Server error: Status Code $statusCode';
      }

      switch (statusCode) {
        case 400:
          errorMessage = 'Bad request. Please check your input.';
          break;
        case 401:
          errorMessage = 'Unauthorized. Please log in again.';
          // You might want to trigger a logout flow here
          break;
        case 403:
          errorMessage =
              'Forbidden. You do not have permission to access this resource.';
          break;
        case 404:
          errorMessage =
              'Not Found. The requested resource could not be found.';
          break;
        case 500:
          errorMessage = 'Internal server error. Please try again later.';
          break;
        // Add more specific error messages for other status codes as needed
      }
    } else if (e.type == DioExceptionType.cancel) {
      errorMessage = 'Request cancelled.';
    } else if (e.type == DioExceptionType.unknown) {
      if (e.error is SocketException) {
        errorMessage = 'No internet connection. Please check your network.';
      } else {
        errorMessage = 'An unexpected network error occurred.';
      }
    }

    return ResponseModel.error(
      message: errorMessage,
      data: errorData, // Pass the raw error data for debugging if needed
      // If you have a FailureModel, you can pass it here:
      // failure: FailureModel(message: errorMessage, error: e),
    );
  }
}
