import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TopActivitiesCard extends StatelessWidget {
  const TopActivitiesCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(5.0)),
        border: Border.all(color: Color(0xFFB4B4B4)),
      ),
      height: 342.h,
      width: 214.w,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                    height: 18.h,
                    width: 86.w,
                    child: Text("Top Activities",
                        style: TextStyle(
                            fontSize: 11, fontWeight: FontWeight.bold))),
                SizedBox(
                  height: 24.h,
                  width: 77.w,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Feb 2025",
                          style: TextStyle(
                              fontSize: 11, fontWeight: FontWeight.bold)),
                      Icon(
                        Icons.keyboard_arrow_down,
                        color: Color(0xFF0038FF),
                        size: 16,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          SizedBox(
            height: 290.h,
            width: 200.w,
            child: Column(
              children: [
                SizedBox(
                  height: 139.h,
                  width: 139.w,
                  child: PieChart(
                    PieChartData(
                      sections: [
                        PieChartSectionData(
                            color: Color(0xFFB0EAF2), value: 12, title: ""),
                        PieChartSectionData(
                            color: Color(0xFFC3C9E8), value: 48, title: ""),
                        PieChartSectionData(
                            color: Color(0xFFFFDFB0), value: 10, title: ""),
                        PieChartSectionData(
                            color: Color(0xFFDBECC7), value: 15, title: ""),
                        PieChartSectionData(
                            color: Color(0xFF99D09B), value: 10, title: ""),
                        PieChartSectionData(
                            color: Color(0xFF333333), value: 1, title: ""),
                        PieChartSectionData(
                            color: Color(0xFFF44336), value: 1, title: ""),
                        PieChartSectionData(
                            color: Color(0xFFFFFFFF), value: 13, title: ""),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 139.h,
                  width: 178.w,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 5.h,
                      ),
                      ActivityStatCard(
                        fieldColor: Color(0xFFB0EAF2),
                        title: "City Tours",
                        percentage: "10%",
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      ActivityStatCard(
                        fieldColor: Color(0xFFC3C9E8),
                        title: "Kayaking",
                        percentage: "20%",
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      ActivityStatCard(
                        fieldColor: Color(0xFFFFDFB0),
                        title: "Treking",
                        percentage: "30%",
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      ActivityStatCard(
                        fieldColor: Color(0xFFDBECC7),
                        title: "Fish Spa",
                        percentage: "40%",
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      ActivityStatCard(
                        fieldColor: Color(0xFF99D09B),
                        title: "Zipline",
                        percentage: "50%",
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      ActivityStatCard(
                        fieldColor: Color(0xFF333333),
                        title: "Boating",
                        percentage: "60%",
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      ActivityStatCard(
                        fieldColor: Color(0xFFF44336),
                        title: "Parasailing",
                        percentage: "10%",
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ActivityStatCard extends StatelessWidget {
  final Color fieldColor;
  final String title;
  final String percentage;

  const ActivityStatCard({
    super.key,
    required this.fieldColor,
    required this.title,
    required this.percentage,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 178.w,
      height: 13.h,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: 6,
                backgroundColor: fieldColor,
              ),
              SizedBox(width: 10.w),
              Text(title, style: TextStyle(fontSize: 10)),
            ],
          ),
          Text(percentage, style: TextStyle(fontSize: 10)),
        ],
      ),
    );
  }
}
