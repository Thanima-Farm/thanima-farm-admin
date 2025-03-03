import 'package:flutter/material.dart';
import 'package:thanima_admin/presentation/dashboard/views/widgets/calender_page.dart';
import 'package:thanima_admin/presentation/dashboard/views/widgets/upcoming_trips_list.dart';

class UpcomingTripsCard extends StatelessWidget {
  const UpcomingTripsCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 678,
      width: 311,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
        Radius.circular(5.0) 
    ),
        border: Border.all(
          color: Color(0xFFB4B4B4)
        
        ),
      ),
      margin: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CalendarPage(),
          UpcomingTripsList(),
        ],
      ),
    );
  }
}
