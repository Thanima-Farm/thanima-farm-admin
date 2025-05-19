// Cubit (Login Logic)
import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thanima_admin/core/service_locator.dart';
import 'package:thanima_admin/core/services/api_client.dart';
import 'package:thanima_admin/core/services/token_storage_service.dart';
import 'package:thanima_admin/features/auth/cubit/login/login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());
  final apiClient = locator<ApiClient>();
  void login(String email, String password) async {
    emit(LoginLoading());
    final response = await apiClient.request(
      url: "/dev/api/v1/login",
      requestType: RequestType.POST,
      body: {"email": email, "password": password},
    );

    if (response.statusCode == 200) {
      var data = jsonEncode(response.data); // Convert response to JSON string
      var decodedData = jsonDecode(data); // Convert JSON string back to Map
      print("Error Message: ${decodedData["token"]}");
      TokenStorageService().saveToken(decodedData["token"]);
      print("Error Message: ${decodedData}");
      emit(LoginSuccess());
      TokenStorageService().saveToken(decodedData["token"]);
    } else {
      print("Response is null");
      emit(LoginFailure("Invalid email or password"));
    }
  }
}
