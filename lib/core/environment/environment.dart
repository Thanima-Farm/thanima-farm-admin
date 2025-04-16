import 'package:thanima_admin/core/config/app_config.dart';

enum Environment {
  local,
  qa,
  dev,
  beta,
  prod;

  factory Environment.from(String env) {
    final Environment environment = Environment.values.firstWhere((element) {
      return element.name.toLowerCase() == env.toLowerCase();
    }, orElse: () => prod);
    return environment;
  }
}

extension Properties on Environment {
  bool get isProd => this == Environment.prod || this == Environment.beta;
  String get apiUrl {
    switch (this) {
      case Environment.local:
      case Environment.qa:
      case Environment.dev:
      case Environment.beta:
      case Environment.prod:
        // default:
        return "https://192.168.1.1:4000/api"; // TODO : add your server api url here
    }
  }
}

setConfig(AppConfig appConfig, Environment environment) {
  appConfig.setFlavor(environment);
}
