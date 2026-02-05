

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import '../../../core/constants/api_end_points.dart';
import '../../../core/constants/app_constants.dart';
import '../preferences/preference_manager.dart';

const String applicationJson = "application/json";
const String contentType = "content-type";
const String accept = "accept";
const int apiTimeOut = 60000;

class DioFactory {
  final PreferenceManager _prefs;

  DioFactory(this._prefs);

  Dio getDio() {
    Dio dio = Dio();

    Map<String, String> headers = {
      contentType: applicationJson,
      accept: applicationJson,
    };

    dio.options = BaseOptions(
      baseUrl: ApiEndPoints.baseUrl,
      headers: headers,
      receiveTimeout: const Duration(milliseconds: apiTimeOut),
      sendTimeout: const Duration(milliseconds: apiTimeOut),
      connectTimeout: const Duration(milliseconds: apiTimeOut),
    );

    dio.interceptors.addAll([
      _getAuthInterceptor(),
      if (!kReleaseMode) _getLoggingInterceptor(),
    ]);

    return dio;
  }

  Interceptor _getAuthInterceptor() {
    return InterceptorsWrapper(
      onRequest: (options, handler) async {
        final token = await _prefs.getString(key: AppConstants.authToken);
        if (token != null && token.isNotEmpty) {
          options.headers['Authorization'] = 'Bearer $token';
        }
        handler.next(options);
      },
    );
  }

  Interceptor _getLoggingInterceptor() {
    return PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseHeader: true,
      responseBody: true,
      error: true,
    );
  }
}