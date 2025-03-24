import 'dart:convert';
import 'package:http/http.dart' as http;

class AuthService {
  // final String baseUrl =
  //     "https://x6bbd9l89b.execute-api.us-east-1.amazonaws.com/dev/api/v1";
  final Uri baseUrl = Uri(
    scheme: 'https',
    host: 'x6bbd9l89b.execute-api.us-east-1.amazonaws.com',
    path: 'dev/api/v1',
  );

  Future<Map<String, dynamic>> login(String email, String password) async {
    print("YESSSSSS");
    final response = await http.post(
      Uri.parse("$baseUrl/login"),
      headers: {
        "Content-Type": "application/json",
        "Accept": "application/json",
        "Accept-Encoding": "gzip, deflate, br",
        "Connection": "kepp-alive",
      },
      body: jsonEncode({"email": email, "password": password}),
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body); // Return the user data
    } else {
      throw Exception("Login failed");
    }
  }
}
