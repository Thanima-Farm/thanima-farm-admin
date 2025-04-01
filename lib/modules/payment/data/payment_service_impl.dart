import 'package:dio/dio.dart';

import 'payment_api_endpoints.dart';
import 'payment_service.dart';

class PaymentServiceImpl implements PaymentService {
  final Dio dio;

  PaymentServiceImpl(this.dio);

  @override
  Future<bool> processPayment(double amount) async {
    final response = await dio.post(
      PaymentApiEndpoints.processPayment,
      data: {'amount': amount},
    );
    return response.data['success'] as bool;
  }
}
