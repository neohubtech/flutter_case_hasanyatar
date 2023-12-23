import 'dart:async';

import 'package:dio/dio.dart';
import 'package:movie_app/core/config/app_config.dart';
import 'package:movie_app/utilities/di/dependency_injection.dart';

class NetworkManager {
  NetworkManager() {
    dio = Dio(_createBaseOptions());
    _addInterceptors();
  }

  final String _baseUrl = getIt<AppConfig>().baseUrl ?? '';
  late final Dio dio;

  BaseOptions _createBaseOptions() {
    return BaseOptions(
      baseUrl: _baseUrl,
      contentType: Headers.jsonContentType,
      responseType: ResponseType.json,
      headers: _createHeaders(),
      connectTimeout: const Duration(seconds: 5),
      receiveTimeout: const Duration(seconds: 3),
    );
  }

  void _addInterceptors() {
    // Add your interceptors here if needed
    // Example
    // dio.interceptors.add(ExampleInterceptor());
  }

  Map<String, dynamic>? _createHeaders() {
    return null;
  }

  Future<Response<dynamic>> _request(
    Future<Response<dynamic>> Function() requestFunction,
  ) async {
    try {
      return await requestFunction();
    } on DioException {
      rethrow;
    } catch (e) {
      rethrow;
    }
  }

  // HTTP POST request
  Future<Response<dynamic>> post(String path, dynamic data) async {
    return _request(
      () => dio.post(path, data: data),
    );
  }

  // HTTP PUT request
  Future<Response<dynamic>> put(String path, dynamic data) async {
    return _request(
      () => dio.put(path, data: data),
    );
  }

  // HTTP DELETE request
  Future<Response<dynamic>> delete(String path) async {
    return _request(
      () => dio.delete(path),
    );
  }

  // HTTP GET request
  Future<Response<dynamic>> get(
    String path, {
    Map<String, dynamic>? queryParameters,
  }) async {
    return _request(
      () => dio.get(
        path,
        queryParameters: queryParameters,
      ),
    );
  }
}
