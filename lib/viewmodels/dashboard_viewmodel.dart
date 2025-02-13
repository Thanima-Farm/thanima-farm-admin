import 'package:flutter/material.dart';
import '../models/visitor_model.dart';
import '../services/dashboard_service.dart';

class DashboardViewModel extends ChangeNotifier {
  final DashboardService _service = DashboardService();

  List<Visitor> _visitors = [];
  List<Visitor> get visitors => _visitors;

  bool _isLoading = true;
  bool get isLoading => _isLoading;

  Future<void> fetchVisitors() async {
    _isLoading = true;
    notifyListeners();

    _visitors = await _service.getVisitors();

    _isLoading = false;
    notifyListeners();
  }
}
