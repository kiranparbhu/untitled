import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';

import '../app_config.dart';
import '../preferences/preferences_manager.dart';
import '../utils/app_utils.dart';
import 'exceptions.dart';

class DioClient {
  late final Dio _dio;
  final AppConfig config;
  DioClient(this.config) {
    /// paste your API's baseUrl here...
    final BaseOptions options = BaseOptions(
        sendTimeout: 30000,
        connectTimeout: 30000,
        receiveTimeout: 30000,
        baseUrl: config.apiUrl,
        headers: {"Accept": "application/json", "content-type": "application/json"});

    _dio = Dio(options);
    _dio.interceptors.add(AuthorizationInterceptor());
    _dio.interceptors.add(LoggingInterceptor());
  }

  Dio getDio() => _dio;
}

class AuthorizationInterceptor extends InterceptorsWrapper {
  final _preferences = GetIt.I<PreferencesManager>();

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    // Send user token in headers if it is available
    debugPrint(options.uri.toString());
    final token = await _preferences.getUserToken();
    if (token != null && token.isNotEmpty) {
      options.headers['Authorization'] = 'Bearer $token';
    }

    super.onRequest(options, handler);
  }
}

class LoggingInterceptor extends InterceptorsWrapper {
  // todo disable for release builds
  final _logger = GetIt.I<Logger>();

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    _logger.d(options.path);
    _logger.d(options.queryParameters.toString());
    _logger.d(options.headers.toString());
    _logger.d(options.data);
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    _logger.d(response.data);
    super.onResponse(response, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    final errorMessage = err.message;
    final errorData = err.response?.data;
    final statusCode = err.response?.statusCode;
    _logger.e(errorMessage);
    if (errorData != null) {
      _logger.e(errorData);
    }
    // Check if the error is regarding no internet connection.
    if (err.type == DioErrorType.other && err.error is SocketException) {
      debugPrint('Error ${err.error},${err.type}');
      err = NoInternetException();
      AppUtils.showSnackBar(AppUtils.navigatorKey.currentContext!, 'No Internet connection available.');
    }
    if (err.type == DioErrorType.sendTimeout ||
        err.type == DioErrorType.connectTimeout ||
        err.type == DioErrorType.receiveTimeout) {
      err = ServerConnectionException();
    }

    if (errorData != null && errorData['message'].toString().toLowerCase().startsWith('too many attempts')) {
      err = TooManyAttemptsException();
    }
    super.onError(err, handler);
  }
}