import 'package:thanima_admin/core/services/interceptor/auth_interceptor.dart';
import 'package:dio/dio.dart';

import 'interceptor/error_interceptor.dart';
import 'interceptor/logging_interceptor.dart';
import 'interceptor/retry_interceptor.dart';
import 'network_response/network_response.dart';

enum RequestType { GET, POST, PUT, PATCH, DELETE }

class ApiClient {
  final Dio dio;

  ApiClient._(this.dio);

  factory ApiClient({
    required String baseUrl,
    Duration connectTimeout = const Duration(seconds: 3),
    Duration receiveTimeout = const Duration(seconds: 5),
    Duration sendTimeout = const Duration(seconds: 5),
    List<Interceptor>? customInterceptors,
  }) {
    final dio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
        connectTimeout: connectTimeout,
        receiveTimeout: receiveTimeout,
        sendTimeout: sendTimeout,
        contentType: Headers.jsonContentType,
      ),
    );

    // Add other interceptors
    dio.interceptors.addAll([
      AuthInterceptor(),
      RetryInterceptor(dio: dio),
      ErrorInterceptors(dio),
      LoggingInterceptor(dio),
      if (customInterceptors != null) ...customInterceptors,
    ]);

    return ApiClient._(dio);
  }

  Future<NetworkResponse?> request<T>({
    required String url,
    required RequestType requestType,
    Map<String, dynamic>? queryParameters,
    dynamic body,
    ResponseType responseType = ResponseType.json,
  }) async {
    try {
      final options = Options(responseType: responseType);
      Response response;

      switch (requestType) {
        case RequestType.GET:
          response = await dio.get<T>(
            url,
            queryParameters: queryParameters,
            options: options,
          );
          break;
        case RequestType.POST:
          response = await dio.post<T>(url, data: body, options: options);
          break;
        case RequestType.PUT:
          response = await dio.put<T>(url, data: body, options: options);
          break;
        case RequestType.PATCH:
          response = await dio.patch<T>(url, data: body, options: options);
          break;
        case RequestType.DELETE:
          response = await dio.delete<T>(url, data: body, options: options);
          break;
      }
      if (response.data != null) {
        return NetworkResponse.success(response.data!);
      } else {
        return NetworkResponse.error("No data received from the API");
      }
    } catch (error) {
      if (error is DioException) {
        return NetworkResponse.error(error.response?.data ?? error.message);
      }
      return NetworkResponse.error(error.toString());
    }
  }
}
// lib/
// │
// ├── core/
// │   ├── api/
// │   ├── constants/
// │   ├── error/
// │   ├── utils/
// │   ├── themes/
// │   └── widgets/
// │
// ├── data/
// │   ├── models/
// │   ├── repositories/
// │   ├── local/
// │   └── remote/
// │
// ├── domain/
// │   ├── entities/
// │   ├── use_cases/
// │   └── repositories/
// │
// ├── features/
// │   ├── screens/
// │   ├── blocs/ or cubits/ (if using BLoC or Cubit state management)
// │   ├── view_models/ (if using Provider/MVVM)
// │   ├── components/
// │   └── routes/
// │
// └── main.dart

// lib/
// ├── core/                # Shared resources across the app
// │   ├── api/             # API clients, interceptors, etc.
// │   ├── constants/       # App-wide constants
// │   ├── error/           # Error handling utilities
// │   ├── themes/          # Themes and styling
// │   ├── utils/           # Utilities/helpers
// │   └── widgets/         # Reusable UI components
// │
// ├── modules/             # Feature-specific modules
// │   ├── auth/            # Authentication module
// │   │   ├── data/
// │   │   │   ├── auth_service.dart
// │   │   │   ├── auth_api_endpoints.dart
// │   │   ├── models/
// │   │   │   ├── user.dart
// │   │   ├── screens/
// │   │   │   ├── login_screen.dart
// │   │   │   ├── signup_screen.dart
// │   │   ├── blocs/       # BLoC or Cubit for state management
// │   │   └── auth_module.dart
// │   │
// │   ├── product/         # Product module
// │   ├── cart/            # Cart module
// │   └── ...
// │
// ├── domain/              # Business logic (if using Clean Architecture)
// │   ├── entities/
// │   ├── repositories/
// │   └── use_cases/
// │
// ├── features/        # Presentation layer
// │   ├── screens/
// │   ├── routes/
// │   └── components/
// │
// └── main.dart            # App entry point
