import 'package:flutter/material.dart';
import 'package:thanima_admin/presentation/dashboard/views/dashboard_screen.dart';
import 'package:thanima_admin/presentation/dashboard/views/side_menu.dart';


class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFFFFF),
      // key: context.read<MenuAppController>().scaffoldKey,
      // drawer: SideMenu(),
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // We want this side menu only for large screen
            // if (Responsive.isDesktop(context))
            //   Expanded(
                // default flex = 1
                // and it takes 1/6 part of the screen
              //   child: SideMenu(),
              // ),
            SideMenu(),
            Expanded(
              // It takes 5/6 part of the screen
              flex: 5,
              child: DashboardScreen(),
            ),
          ],
        ),
      ),
    );
  }
}
