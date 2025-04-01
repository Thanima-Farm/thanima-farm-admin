import 'package:dio/dio.dart';

class RetryInterceptor extends Interceptor {
  final Dio dio;
  final int maxRetries;
  final Duration retryDelay;

  RetryInterceptor({
    required this.dio,
    this.maxRetries = 1,
    this.retryDelay = const Duration(milliseconds: 500),
  });

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    bool shouldRetry(DioException err) {
      return err.type == DioExceptionType.connectionTimeout ||
          err.type == DioExceptionType.receiveTimeout ||
          err.type == DioExceptionType.connectionError; // Network errors
    }

    if (shouldRetry(err) && err.requestOptions.extra['retries'] == null) {
      // Track retry count
      err.requestOptions.extra['retries'] = 1;

      // Wait before retrying
      await Future.delayed(retryDelay);

      try {
        // Retry the request
        final response = await dio.fetch(err.requestOptions);
        return handler.resolve(response);
      } catch (e) {
        // If retry also fails, pass the error to the next handler
        return handler.next(err);
      }
    }

    // If it's not retryable or retry limit reached, pass the error
    handler.next(err);
  }
}
