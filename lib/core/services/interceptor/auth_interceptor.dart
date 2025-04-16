import 'package:thanima_admin/core/services/token_storage_service.dart';
import 'package:dio/dio.dart';

class AuthInterceptor extends Interceptor {
  final TokenStorageService tokenStorageService = TokenStorageService();

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final token = await tokenStorageService.getToken();
    if (token != null) {
      options.headers['Authorization'] = '$token';
    }
    super.onRequest(options, handler);
  }
}
