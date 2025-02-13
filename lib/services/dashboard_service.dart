import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/visitor_model.dart';

class DashboardService {
  Future<List<Visitor>> getVisitors() async {
    final response = await http.get(Uri.parse("https://api.example.com/visitors"));

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      return data.map((json) => Visitor.fromJson(json)).toList();
    } else {
      throw Exception("Failed to load visitors");
    }
  }
}