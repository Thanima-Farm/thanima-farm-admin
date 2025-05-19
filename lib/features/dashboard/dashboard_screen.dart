import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thanima_admin/features/dashboard/cubit/admin_dashboard_cubit.dart';
import 'package:thanima_admin/features/dashboard/new_visitors_card.dart';
import 'package:thanima_admin/features/dashboard/optimal_package_card.dart';
import 'package:thanima_admin/features/dashboard/revenue_chart.dart';
import 'package:thanima_admin/features/dashboard/reviews_card.dart';
import 'package:thanima_admin/features/dashboard/top_activities_card.dart';
import 'package:thanima_admin/features/dashboard/upcoming_trips_card.dart';
import 'package:thanima_admin/features/dashboard/visitors_count_card.dart';
import 'package:thanima_admin/features/layout/header.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  void initState() {
    super.initState();
    // Use the cubit already provided in context
    context.read<AdminDashboardCubit>().fetchDashboard();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0D2B25),
      body: BlocBuilder<AdminDashboardCubit, AdminDashboardState>(
        builder: (context, state) {
          if (state is AdminDashboardLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is AdminDashboardLoaded) {
            final dashboardData = state.dashboardData;
            return Container(
              decoration: BoxDecoration(
                color: Colors.white,
                // borderRadius: BorderRadius.all(Radius.circular(54.0)),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(54.0),
                  bottomLeft: Radius.circular(54.0),
                ),
                border: Border.all(color: Color(0xFFB4B4B4)),
              ),
              width: 1064.w,
              height: 774.h,
              child: SingleChildScrollView(
                primary: false,
                padding: EdgeInsets.all(8),
                child: Column(
                  children: [
                    Header(),
                    SizedBox(height: 20.h),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Visitors count card list
                              SizedBox(
                                height: 60.h,
                                child: ListView(
                                  scrollDirection: Axis.horizontal,
                                  children: [
                                    SizedBox(width: 5.w),
                                    VisitorsCountCard(
                                      icon: Icons.person_add_alt_1_outlined,
                                      quantity:
                                          "${dashboardData.data.totalVisitors}",
                                      title: "Total Visitor's",
                                      iconColor: Color(0xFF45ACFD),
                                    ),
                                    SizedBox(width: 5.w),
                                    VisitorsCountCard(
                                      icon: Icons.person_4_sharp,
                                      quantity:
                                          "${dashboardData.data.newVisitors}",
                                      title: "New Visitor's",
                                      iconColor: Color(0xFFFF8812),
                                    ),
                                    SizedBox(width: 5.w),
                                    VisitorsCountCard(
                                      icon: Icons.login,
                                      quantity:
                                          "${dashboardData.data.todaysCheckins}",
                                      title: "Today's Check In",
                                      iconColor: Color(0xFF00E03C),
                                    ),
                                    SizedBox(width: 5.w),
                                    VisitorsCountCard(
                                      icon: Icons.logout_sharp,
                                      quantity:
                                          "${dashboardData.data.todaysCheckouts}",
                                      title: "Today's Check Out",
                                      iconColor: Color(0xFFFF704C),
                                    ),
                                  ],
                                ),
                              ),
                              // Revenue Chart
                              SizedBox(height: 20.h),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    children: [
                                      RevenueChart(
                                        data:
                                            dashboardData
                                                .data
                                                .revenueGraph
                                                .data,
                                      ),
                                      SizedBox(height: 10.h),
                                      ReviewsCard(
                                        reviews: dashboardData.data.reviews,
                                      ),
                                      SizedBox(height: 10.h),
                                      OptimalPackageCard(
                                        packageList:
                                            dashboardData.data.mostSoldPackages,
                                      ),
                                    ],
                                  ),
                                  SizedBox(width: 20.h),
                                  Column(
                                    children: [
                                      TopActivitiesCard(),
                                      SizedBox(height: 10.h),
                                      NewVisitorsCard(),
                                    ],
                                  ),
                                ],
                              ),
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
          } else if (state is AdminDashboardError) {
            return GestureDetector(
              onTap: () {
                context.read<AdminDashboardCubit>().fetchDashboard();
              },
              child: Center(
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(),
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Reload"),
                  ),
                ),
              ),
            );
          } else {
            print("object");
            return const SizedBox.shrink();
          }
        },
      ),
    );
  }
}
