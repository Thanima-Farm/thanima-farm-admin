import 'package:flutter/material.dart';
import 'package:thanima_admin/feature/dashboard/dashboard_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      home: DashboardScreen(),
    );
  }
}
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return ChangeNotifierProvider(
//       create: (_) => NavigationViewModel(),
//       child: MaterialApp(
//         title: 'Flutter Demo',
//         theme: ThemeData(
//         fontFamily: 'Lexend',
//         textTheme: AppTextTheme.lightTextTheme,
//         bottomNavigationBarTheme: BottomNavigationBarThemeData(
//     selectedItemColor: Colors.blue,
//     unselectedItemColor: Colors.grey,
//     backgroundColor: Colors.white,
//   ),
//       ),
//       darkTheme: ThemeData(
//         textTheme: AppTextTheme.darkTextTheme,
//         brightness: Brightness.dark,
//         bottomNavigationBarTheme: BottomNavigationBarThemeData(
//     selectedItemColor: Colors.blueAccent,
//     unselectedItemColor: Colors.white60,
//     backgroundColor: Colors.black,
//   ),
//       ),
//         home: DashboardScreen(),
//       ),
//     );
//   }
// }
//
