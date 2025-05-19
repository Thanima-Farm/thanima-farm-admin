import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thanima_admin/core/services/api_client.dart';
import 'package:thanima_admin/features/dashboard/cubit/admin_dashboard_cubit.dart';
import 'package:thanima_admin/features/dashboard/dashboard_screen.dart';
import 'package:thanima_admin/features/reports/reports_screen.dart';
import 'package:thanima_admin/features/users/cubit/users_cubit.dart';
import 'package:thanima_admin/features/users/users_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  static late final ApiClient apiClient; // init this somewhere

  @override
  void initState() {
    apiClient = ApiClient(
      baseUrl: 'https://gau9gqbxih.execute-api.us-east-1.amazonaws.com',
    ); // or pass from higher up
    super.initState();
  }

  static final List<Widget> _pages = [
    BlocProvider(
      create: (_) => AdminDashboardCubit(),
      child: DashboardScreen(),
    ),
    BlocProvider(create: (_) => UsersCubit(apiClient), child: UsersScreen()),
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
          fontWeight:
              _selectedIndex == index ? FontWeight.bold : FontWeight.normal,
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
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            // Sidebar (Fixed Position)
            Positioned(
              left: 0,
              top: 0,
              bottom: 0,
              width: 250,
              child: Container(
                color: const Color(0xFF0D2B25),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Container(
                        height: 40.h,
                        width: 114.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(7.0)),
                          color: Color(0XFFFFFFFF),
                        ),
                        child: Image.asset(
                          "assets/images/logo.png",
                          height: 100,
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Divider(color: Color(0XFFFFFFFF)),
                    _navigationItem(Icons.dashboard, 'Dashboard', 0),
                    _navigationItem(Icons.people, 'Users', 1),
                    _navigationItem(Icons.report, 'Reports', 2),
                  ],
                ),
              ),
            ),

            // Main Content (Shifts Right)
            Positioned(
              left: 250, // Content moves right to make space for sidebar
              right: 0,
              top: 0,
              bottom: 0,
              child: IndexedStack(index: _selectedIndex, children: _pages),
            ),
          ],
        ),
      ),
    );
  }
}
