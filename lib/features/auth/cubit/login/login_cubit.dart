// Cubit (Login Logic)
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thanima_admin/core/services/api_client.dart';
import 'package:thanima_admin/features/auth/cubit/login/login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());
  final ApiClient apiClient = ApiClient(
    baseUrl: "https://mnoihkamhd.execute-api.us-east-1.amazonaws.com",
  );

  void login(String email, String password) async {
    emit(LoginLoading());
    final response = await apiClient.request(
      url: "/dev/api/v1/login",
      requestType: RequestType.POST,
      body: {"email": email, "password": password},
    );

    print("Raw Response: $response"); // Debugging line

    if (response != null) {
      print("Response Data: ${response}");
      print("Error Message: ${response}");
    } else {
      print("Response is null");
    }

    if (response != null) {
      print("Login successful: ${response}");
    } else {
      print("Login failed: ${response}");
    }
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
