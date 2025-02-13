import 'package:flutter/material.dart';
import 'widgets/sidebar.dart';
import 'widgets/top_bar.dart';
import 'widgets/stats_section.dart';
import 'widgets/revenue_chart.dart';
import 'widgets/activity_pie_chart.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Row(
          children: [
            SidebarMenu(),
            Positioned(
              left: 198,
              child: SizedBox(
                width: 1064,
                child: Expanded(
                  child: Column(
                    children: [
                      TopBar(),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.all(20),
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    StatsSection(title: "Total Visitors", value: "1,200", icon: Icons.people, color: Colors.blue),
                                    SizedBox(width: 4,),
                                    StatsSection(title: "New Visitors", value: "10", icon: Icons.person_add, color: Colors.orange),
                                    SizedBox(width: 4,),
                                    StatsSection(title: "Today's Check-In", value: "23", icon: Icons.check, color: Colors.green),
                                    SizedBox(width: 4,),
                                    StatsSection(title: "Today's Check-Out", value: "10", icon: Icons.exit_to_app, color: Colors.red),
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Flexible(child: RevenueChart()),
                                    Flexible(child: ActivityPieChart()),
                                  ],
                                ),
                                
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
        ], 
      ),
    );
  }
}