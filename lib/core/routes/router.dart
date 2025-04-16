import 'package:flutter/material.dart';
import 'package:thanima_admin/features/auth/ui/auth_page.dart';
import 'package:thanima_admin/features/auth/ui/login_screen.dart';
import 'package:thanima_admin/features/dashboard/search_page.dart';
import 'package:thanima_admin/features/layout/home_page.dart';

class Routes {
  static const homePageRoute = "/home_page_route";
  static const searchScreenRoute = "/search_screen_route";
  static const authScreenRoute = "/auth_screen_route";
  static const loginScreenRoute = "/login_screen_route";

  static Route<dynamic> generateRoute(RouteSettings settings) {
    // if (ChitRouter.chitRoutes.containsKey(settings.name)) {
    //   return ChitRouter.generateRoute(settings);
    // }
    switch (settings.name) {
      case homePageRoute:
        // String? args = settings.arguments as String?;
        return MaterialPageRoute(
          settings: settings,
          builder: (context) => const HomePage(),
        );
      case searchScreenRoute:
        return MaterialPageRoute(
          settings: settings,
          builder: (context) => const SearchPage(),
        );
      case authScreenRoute:
        return MaterialPageRoute(
          settings: settings,
          builder: (context) => const AuthScreen(),
        );
      case loginScreenRoute:
        return MaterialPageRoute(
          settings: settings,
          builder: (context) => const LoginScreen(),
        );

      default:
        return MaterialPageRoute(
          settings: settings,
          builder: (context) => const HomePage(),
        );
    }
  }
}
