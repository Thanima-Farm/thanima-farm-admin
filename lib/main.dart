
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:thanima_admin/presentation/dashboard/viewmodels/menu_app_controller.dart';
import 'package:thanima_admin/presentation/login_screen.dart';
import 'package:thanima_admin/presentation/main_screen.dart';
import 'package:thanima_admin/theme/theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Admin Panel',
      theme: ThemeData(
        fontFamily: 'Lexend',
        textTheme: AppTextTheme.lightTextTheme,
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
    selectedItemColor: Colors.blue,  
    unselectedItemColor: Colors.grey, 
    backgroundColor: Colors.white,
  ),),
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => MenuAppController(),
          ),
        ],
        child: MainScreen(),
        // child: LoginScreen(),
      ),
    );
  }
}
