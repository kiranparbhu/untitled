import 'package:dio/dio.dart';

/// Represents handled exceptions
class AppException implements DioError {
  final String _message;
  final int code;

  AppException(
      this._message, {
        this.code = -1,
      });

  @override
  String toString() {
    return _message;
  }

  @override
  dynamic error;

  @override
  Response? response;

  // @override
  // DioErrorType type = DioErrorType.DEFAULT;
  @override
  DioErrorType type = DioErrorType.other;

  @override
  String get message => _message;

  @override
  late RequestOptions requestOptions;

  @override
  StackTrace? stackTrace;
}

class NoInternetException extends AppException {
  NoInternetException([String? message]) : super(message ?? 'No Internet connection available.');
}

class TooManyAttemptsException extends AppException {
  TooManyAttemptsException([String? message])
      : super(message ?? 'Server seems busy right now. Please try again after some time.');
}

/// Represents error in communicating with server
class ServerConnectionException extends AppException {
  ServerConnectionException([String? message]) : super(message ?? 'Failed to connect with the server, please try again later.');
}

class UserNotFoundException extends AppException {
  UserNotFoundException([String? message]) : super(message ?? 'User not found!');
}