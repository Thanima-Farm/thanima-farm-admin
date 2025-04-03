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
      print("Error Message: ${decodedData}");
      emit(LoginSuccess());
      TokenStorageService().saveToken(decodedData["token"]);
    } else {
      print("Response is null");
      emit(LoginFailure("Invalid email or password"));
    }

    // if (response != null) {
    //   print("Login successful: ${response}");
    // } else {
    //   print("Login failed: ${response}");
    // }
    // Future.delayed(Duration(seconds: 2), () {
    //   if (email == "test@example.com" && password == "password") {
    //     emit(LoginSuccess());
    //   } else {
    //     emit(LoginFailure("Invalid email or password"));
    //   }
    // });
  }
}
// Future<void> login(String email, String password) async {
//     final response = await apiClient.request(
//       url: "/auth/login", // Your API login endpoint
//       requestType: RequestType.POST,
//       body: {"email": email, "password": password},
//     );

//     if (response != null) {
//       print("Login successful: ");
//       // Navigate to home screen or save token
//     } else {
//       print("Login failed: ${response}");
//     }
//   }
