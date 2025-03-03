import 'package:flutter/material.dart';
import 'package:thanima_admin/presentation/dashboard/views/dashboard_screen.dart';
// import 'package:thanima_admin/presentation/dashboard/views/side_menu.dart';
import 'package:thanima_admin/presentation/reports/views/reports_screen.dart';
import 'package:thanima_admin/presentation/users/views/user_screen.dart';


class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  
  int _selectedIndex = 0;
  static const List<Widget> _pages = [
    DashboardScreen(),
    UserScreen(),
     ReportsScreen(),
  ];

  

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget _navigationItem(IconData icon, String title, int index) {
    return ListTile(
      leading: Icon(icon, color: Colors.white70),
      title: Text(
        title,
        style: TextStyle(
          color: _selectedIndex == index ? Colors.white : Colors.white70,
          fontWeight: _selectedIndex == index ? FontWeight.bold : FontWeight.normal,
        ),
      ),
      selected: _selectedIndex == index,
      selectedTileColor: Colors.blueGrey[800],
      onTap: () => _onItemTapped(index),
    );
  }

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
            // SideMenu(),
            Drawer(
      backgroundColor: Color(0xFF0D2B25),
      child: ListView(
        children: [
          DrawerHeader(
            child: Image.asset("assets/images/logo.png"),
          ),
          _navigationItem(Icons.dashboard, 'Dashboard', 0),
                _navigationItem(Icons.people, 'Users', 1),
                _navigationItem(Icons.report, 'Reports', 2),
          
        ],
      ),
    ),
            Expanded(
              child: Container(
              color: Colors.grey[100],
              child: IndexedStack(
                index: _selectedIndex,
                children: _pages,
              ),
            ),
            ),
          ],
        ),
      ),
    );
  }
}

