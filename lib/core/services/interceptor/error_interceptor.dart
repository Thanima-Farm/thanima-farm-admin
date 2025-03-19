import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class ErrorInterceptors extends Interceptor {
  final Dio dio;

  ErrorInterceptors(this.dio);

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    switch (err.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        handler.reject(DioException(
          requestOptions: err.requestOptions,
          error: TimeOutException(err.requestOptions),
        ));
        break;
      case DioExceptionType.badResponse:
        switch (err.response?.statusCode) {
          case 400:
            handler.reject(DioException(
              requestOptions: err.requestOptions,
              error: BadRequestException(err.requestOptions),
            ));
            break;
          case 401:
            handler.reject(DioException(
              requestOptions: err.requestOptions,
              error: UnauthorizedException(err.requestOptions),
            ));
            break;
          case 404:
            handler.reject(DioException(
              requestOptions: err.requestOptions,
              error: NotFoundException(err.requestOptions),
            ));
            break;
          case 409:
            handler.reject(DioException(
              requestOptions: err.requestOptions,
              error: ConflictException(err.requestOptions),
            ));
            break;
          case 500:
            handler.reject(DioException(
              requestOptions: err.requestOptions,
              error: InternalServerErrorException(err.requestOptions),
            ));
            break;
          default:
            handler.reject(DioException(requestOptions: err.requestOptions));
        }
        break;
      case DioExceptionType.cancel:
        debugPrint("Request cancelled: ${err.message}");
        break;
      case DioExceptionType.unknown:
        handler.reject(DioException(
          requestOptions: err.requestOptions,
          error: NoInternetConnectionException(err.requestOptions),
        ));
        break;
      default:
        handler.next(err); // Continue to the next error handler
    }
  }
}

class TimeOutException extends DioException {
  TimeOutException(RequestOptions r) : super(requestOptions: r);

  @override
  String toString() {
    return 'The connection has timed out, please try again.';
  }
}

class BadRequestException extends DioException {
  BadRequestException(RequestOptions r) : super(requestOptions: r);

  @override
  String toString() {
    return 'Invalid request';
  }
}

class InternalServerErrorException extends DioException {
  InternalServerErrorException(RequestOptions r) : super(requestOptions: r);

  @override
  String toString() {
    return 'Unknown error occurred, please try again later.';
  }
}

class ConflictException extends DioException {
  ConflictException(RequestOptions r) : super(requestOptions: r);

  @override
  String toString() {
    return 'Conflict occurred';
  }
}

class UnauthorizedException extends DioException {
  UnauthorizedException(RequestOptions r) : super(requestOptions: r);

  @override
  String toString() {
    return 'Access denied';
  }
}

class NotFoundException extends DioException {
  NotFoundException(RequestOptions r) : super(requestOptions: r);

  @override
  String toString() {
    return 'The requested information could not be found';
  }
}

class NoInternetConnectionException extends DioException {
  NoInternetConnectionException(RequestOptions r) : super(requestOptions: r);

  @override
  String toString() {
    return 'No internet connection detected, please try again.';
  }
}
