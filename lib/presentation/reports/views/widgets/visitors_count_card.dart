import 'package:flutter/material.dart';

class VisitorsCountCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String quantity;
  final Color iconColor;

  const VisitorsCountCard({
    super.key,
    required this.icon,
    required this.title,
    required this.quantity, required this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        
        Container(
          decoration: BoxDecoration(
            color: Color(0xFFE7F5FE),
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
            border: Border.all(color: Color(0xFFB4B4B4)),
          ),
          width: 166,
          height: 60,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    ),
                    height: 41,
                    width: 41,
                    child: Icon(icon, size: 24, color: iconColor),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 4, bottom: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(title, style: TextStyle(fontSize: 10, color: Colors.grey)),
                    Text(quantity, style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
                  ],
                ),
              ),
              
            ],
          ),
        ),
        Positioned(
          bottom: 2,
          right: 2,
          child: Padding(
                padding: const EdgeInsets.all(2.0),
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 1, horizontal: 2),
                  decoration: BoxDecoration(
                    color: Color(0xFFFFFFFF),
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    border: Border.all(color: Color(0xFFB4B4B4)),
                  ),
                  child: Text("+2.98%", style: TextStyle(fontSize: 10)),
                ),
              ),
        ),
      ],
    );
  }
}