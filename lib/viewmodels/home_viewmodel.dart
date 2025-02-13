import 'package:flutter/material.dart';
import 'package:thanima_admin/models/usermodel.dart';
import 'package:thanima_admin/services/api_services.dart';
class HomeViewModel extends ChangeNotifier {
  UserModel? user;
  bool isLoading = false;

  Future<void> fetchUserData() async {
    isLoading = true;
    notifyListeners(); // Notify UI to update loading state

    user = await ApiService.getUser(); // Fetch user from API
    isLoading = false;
    notifyListeners(); // Notify UI to update user data
  }
}