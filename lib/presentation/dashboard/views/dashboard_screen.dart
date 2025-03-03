import 'package:flutter/material.dart';
import 'package:thanima_admin/presentation/shared/widgets/header.dart';
import 'package:thanima_admin/presentation/dashboard/views/widgets/new_visitors_card.dart';
import 'package:thanima_admin/presentation/dashboard/views/widgets/optimal_package_card.dart';
import 'package:thanima_admin/presentation/dashboard/views/widgets/revenue_chart.dart';
import 'package:thanima_admin/presentation/dashboard/views/widgets/reviews_card.dart';
import 'package:thanima_admin/presentation/dashboard/views/widgets/top_activities_card.dart';
import 'package:thanima_admin/presentation/dashboard/views/widgets/upcoming_trips_card.dart';
import 'package:thanima_admin/presentation/dashboard/views/widgets/visitors_count_card.dart';

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
      body: SizedBox(
        width: 1200,
        child: SingleChildScrollView(
          primary: false,
          padding: EdgeInsets.all(8),
          child: Column(
            children: [
              Header(),
              SizedBox(
                height: 20,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
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
                              VisitorsCountCard(icon: Icons.person_add_alt_1_outlined,quantity: "1,200",title: "Total Visitor's",iconColor: Color(0xFF45ACFD),),
                              SizedBox(width: 10,),
                              VisitorsCountCard(icon: Icons.person_4_sharp,quantity: "10",title: "New Visitor's",iconColor: Color(0xFFFF8812),),
                              SizedBox(width: 10,),
                              VisitorsCountCard(icon: Icons.login,quantity: "23",title: "Today's Check In",iconColor: Color(0xFF00E03C),),
                              SizedBox(width: 10,),
                              VisitorsCountCard(icon: Icons.logout_sharp,quantity: "10",title: "Today's Check Out",iconColor: Color(0xFFFF704C),),
                              
                            ],
                          ),
                          ),
                          // Revenue Chart
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                children: [
                                  RevenueChart(),
                                  SizedBox(
                                    height: 10,
                                  ),
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
      ),
    );
  }
}


