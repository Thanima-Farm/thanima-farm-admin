import 'package:flutter/cupertino.dart';
import 'package:thanima_admin/core/environment/environment.dart';

class AppConfig with ChangeNotifier {
  late Environment _environment;

  setFlavor(Environment env) {
    _environment = env;
  }

  String get apiUrl => _environment.apiUrl;

  bool get isProd => _environment.isProd;
}
