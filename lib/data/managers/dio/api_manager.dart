

import 'package:dio/dio.dart';
import '../../models/api_result.dart';
import '../preferences/preference_manager.dart';
import 'dio_factory.dart';
import 'error_handler.dart';

class ApiManager {
  late final Dio _dio;
  final PreferenceManager _prefs;

  ApiManager(this._prefs) {
    _dio = DioFactory(_prefs).getDio();
  }

  Future<Response> get(String path, {Map<String, dynamic>? queryParameters}) async {
    return await _dio.get(path, queryParameters: queryParameters);
  }

  Future<Response> post(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
  }) async {
    return await _dio.post(path, data: data, queryParameters: queryParameters);
  }

  Future<Response> put(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
  }) async {
    return await _dio.put(path, data: data, queryParameters: queryParameters);
  }

  Future<Response> delete(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
  }) async {
    return await _dio.delete(path, data: data, queryParameters: queryParameters);
  }

  Future<ApiResult<T>> request<T>(
    String endpoint, {
    required T Function(dynamic json) parser,
    String method = 'GET',
    dynamic data,
    Map<String, dynamic>? query,
  }) async {
    try {
      Response response;

      switch (method.toUpperCase()) {
        case 'POST':
          response = await post(endpoint, data: data, queryParameters: query);
          break;
        case 'PUT':
          response = await put(endpoint, data: data, queryParameters: query);
          break;
        case 'DELETE':
          response = await delete(endpoint, queryParameters: query);
          break;
        default:
          response = await get(endpoint, queryParameters: query);
      }

      return ApiResult.success(parser(response.data));
    } on DioException catch (e) {
      final errorHandler = ErrorHandler.handle(e);
      return ApiResult.failure(errorHandler.failure.message);
    } catch (e) {
      final errorHandler = ErrorHandler.handle(e);
      return ApiResult.failure(errorHandler.failure.message);
    }
  }
}
