import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NewVisitorsCard extends StatelessWidget {
  const NewVisitorsCard({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> newVisitors = [
      {
        "color": Color(0xFFFFBCBC),
        "name": "Aadarsh Soni",
        "location": "Raigarh, CG",
        "days": "1",
      },
      {
        "color": Color(0xFFDCFFBC),
        "name": "Jai Sharma",
        "location": "Delhi",
        "days": "3",
      },
      {
        "color": Color(0xFFBCE4FF),
        "name": "Dheraj Kapor",
        "location": "Punjab",
        "days": "4",
      },
      {
        "color": Color(0xFFFFBCF3),
        "name": "Manoj Soni",
        "location": "Patna, Bihar",
        "days": "4",
      },
      {
        "color": Color(0xFFBCFFCF),
        "name": "Shrish Soni",
        "location": "Jaipur, RJ",
        "days": "3",
      },
    ];
    return Container(
      height: 231.h,
      width: 214.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(5.0)),
        border: Border.all(color: Color(0xFFB4B4B4)),
      ),
      // margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'New Visitors (23)',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 4,
              itemBuilder: (context, index) {
                // final event = events[index];
                return NewVisitorInfoCard(
                  color: newVisitors[index]["color"],
                  days: newVisitors[index]["days"],
                  location: newVisitors[index]["location"],
                  name: newVisitors[index]["name"],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class NewVisitorInfoCard extends StatelessWidget {
  final Color color;
  final String name;
  final String location;
  final String days;

  const NewVisitorInfoCard({
    super.key,
    required this.color,
    required this.name,
    required this.location,
    required this.days,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CircleAvatar(
                backgroundColor: color,
                radius: 18,
                child: Text(
                  "T.", // Taking the first letter of the name
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(width: 5.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(name, style: TextStyle(fontSize: 12)),
                  Text(location,
                      style:
                          TextStyle(fontSize: 11, fontWeight: FontWeight.w600)),
                ],
              ),
            ],
          ),
          Text("$days Day(s) ago", style: TextStyle(fontSize: 7)),
        ],
      ),
    );
  }
}
