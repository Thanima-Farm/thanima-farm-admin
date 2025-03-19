import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thanima_admin/features/home/ui/widgets/calender_page.dart';
import 'package:thanima_admin/features/home/ui/widgets/upcoming_trips_list.dart';

class UpcomingTripsCard extends StatelessWidget {
  const UpcomingTripsCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 678.h,
      width: 311.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(5.0)),
        border: Border.all(color: Color(0xFFB4B4B4)),
      ),
      // margin: EdgeInsets.symmetric(horizontal: 16),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CalendarPage(),
            UpcomingTripsList(),
          ],
        ),
      ),
    );
  }
}
