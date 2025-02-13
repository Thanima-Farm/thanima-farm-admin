import 'package:flutter/material.dart';

class TopBar extends StatelessWidget {
  const TopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(topRight: Radius.circular(20)),
        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 4)],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("Dashboard", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          Row(
            children: [
              Icon(Icons.language, color: Colors.grey),
              SizedBox(width: 20),
              Icon(Icons.notifications, color: Colors.grey),
              SizedBox(width: 20),
              CircleAvatar(
                backgroundImage: AssetImage("assets/profile.jpg"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}