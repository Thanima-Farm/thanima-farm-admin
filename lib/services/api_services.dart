import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:thanima_admin/models/usermodel.dart';

class ApiService {
  static Future<UserModel?> getUser() async {
    final response = await http.get(Uri.parse('https://api.example.com/user'));

    if (response.statusCode == 200) {
      return UserModel.fromJson(json.decode(response.body));
    }
    return null;
  }
}