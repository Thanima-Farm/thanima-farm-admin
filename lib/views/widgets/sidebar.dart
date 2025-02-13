import 'package:flutter/material.dart';

class SidebarMenu extends StatelessWidget {
  const SidebarMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 288,
      // height: 744,
      decoration: BoxDecoration(
        color: Color(0xFF92B65E),
        // borderRadius: BorderRadius.only(topRight: Radius.circular(20)),
      ),
      child: Column(
        children: [
          SizedBox(height: 20),
          ListTile(
            leading: Icon(Icons.dashboard, color: Colors.white),
            title: Text("Dashboard", style: TextStyle(color: Colors.white)),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.person, color: Colors.white),
            title: Text("Users", style: TextStyle(color: Colors.white)),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.bar_chart, color: Colors.white),
            title: Text("Reports", style: TextStyle(color: Colors.white)),
            onTap: () {},
          ),
          Spacer(),
          ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage("assets/profile.jpg"),
            ),
            title: Text("Admin", style: TextStyle(color: Colors.white)),
            subtitle: Text("Aadarsh Soni", style: TextStyle(color: Colors.white70)),
          ),
        ],
      ),
    );
  }
}