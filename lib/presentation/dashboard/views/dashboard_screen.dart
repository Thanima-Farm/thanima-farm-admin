import 'package:flutter/material.dart';
import 'package:thanima_admin/presentation/reports/views/widgets/header.dart';
import 'package:thanima_admin/presentation/reports/views/widgets/new_visitors_card.dart';
import 'package:thanima_admin/presentation/reports/views/widgets/optimal_package_card.dart';
import 'package:thanima_admin/presentation/reports/views/widgets/revenue_chart.dart';
import 'package:thanima_admin/presentation/reports/views/widgets/reviews_card.dart';
import 'package:thanima_admin/presentation/reports/views/widgets/top_activities_card.dart';
import 'package:thanima_admin/presentation/reports/views/widgets/upcoming_trips_card.dart';
import 'package:thanima_admin/presentation/reports/views/widgets/visitors_count_card.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFFFFF),
      body: SingleChildScrollView(
        primary: false,
        padding: EdgeInsets.all(8),
        child: Column(
          children: [
            Header(),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Visitors count card list
                      SizedBox(
                        height: 60,
                        child: ListView(
                          
                          scrollDirection: Axis.horizontal,
                          children: [
                            SizedBox(width: 10,),
                            VisitorsCountCard(),
                            SizedBox(width: 10,),
                            VisitorsCountCard(),
                            SizedBox(width: 10,),
                            VisitorsCountCard(),
                            SizedBox(width: 10,),
                            VisitorsCountCard(),
                            
                          ],
                        ),
                        ),
                        // Revenue Chart
                        Row(
                          children: [
                            Column(
                              children: [
                                RevenueChart(),
                                ReviewsCard(),
                                OptimalPackageCard(),
                              ],
                            ),
                            Column(
                              children: [
                                TopActivitiesCard(),
                                NewVisitorsCard()
                              ],
                            ),
                          ],
                        )
                    ],
                  ),
                ),
                UpcomingTripsCard(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

