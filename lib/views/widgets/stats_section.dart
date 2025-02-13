import 'package:flutter/material.dart';

class StatsSection extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;
  final Color color;

  const StatsSection({super.key, required this.title, required this.value, required this.icon, required this.color});

@override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(5, 2, 5, 2),
      width: 166, // Fixed width
      height: 60,
      decoration: BoxDecoration(
        color: Colors.blue[50], // Light blue background
        borderRadius: BorderRadius.circular(5),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Center(
            child: Container(
                  height: 41,
                  width: 41,
                  color: Colors.white,
                  child: Icon(Icons.person_add, color: Colors.blue, size: 13.5)),
          ),
          // SizedBox(height: 5),

          // Row with Icon + Number
          SizedBox(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  
                    // Title
              Text(
                "Total Visitor's",
                style: TextStyle(
                  color: Colors.grey[600],
                  fontSize: 10,
                  fontWeight: FontWeight.w500,
                ),
              ),
                  SizedBox(width: 8),
                  Text(
                    "1,200",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          

          // SizedBox(height: 5),

          // Percentage Change
          Container(
            padding: EdgeInsets.symmetric(horizontal: 4, vertical: 1),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5),
              boxShadow: [
                BoxShadow(color: Colors.black12, blurRadius: 2),
              ],
            ),
            child: Text(
              "+2.98%",
              style: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
            ),
          ),
        ],
      ),
    );
  }
  // @override
  // Widget build(BuildContext context) {
  //   return Expanded(
  //     child: Card(
  //       elevation: 3,
  //       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
  //       child: Padding(
  //         padding: EdgeInsets.all(15),
  //         child: Column(
  //           crossAxisAlignment: CrossAxisAlignment.start,
  //           children: [
  //             Row(
  //               children: [
  //                 Icon(icon, color: color, size: 30),
  //                 Spacer(),
  //                 Text("+2.98%", style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold)),
  //               ],
  //             ),
  //             SizedBox(height: 10),
  //             Text(title, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Colors.grey)),
  //             SizedBox(height: 5),
  //             Text(value, style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
  //           ],
  //         ),
  //       ),
  //     ),
  //   );
  // }
}