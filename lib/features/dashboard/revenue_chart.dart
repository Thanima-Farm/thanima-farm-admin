import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thanima_admin/features/dashboard/cubit/admin_dashboard_model.dart';

class RevenueChart extends StatelessWidget {
  final List<RevenueDatum> data;

  const RevenueChart({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    final spots =
        data.asMap().entries.map((entry) {
          int index = entry.key;
          RevenueDatum e = entry.value;
          return FlSpot(index.toDouble(), e.totalBookings as double);
        }).toList();

    final dateLabels = data.map((e) => _formatDateLabel(e.date)).toList();

    return Container(
      width: 464.w,
      height: 306.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(5.0)),
        border: Border.all(color: Color(0xFFB4B4B4)),
      ),
      child: Padding(
        padding: EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Revenue Overview",
              style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            SizedBox(
              height: 238.h,
              width: 454.w,
              child: LineChart(
                LineChartData(
                  gridData: FlGridData(show: false),
                  borderData: FlBorderData(show: false),
                  titlesData: FlTitlesData(
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        interval: 1,
                        getTitlesWidget: (value, meta) {
                          int index = value.toInt();
                          if (index < 0 || index >= dateLabels.length) {
                            return const SizedBox.shrink();
                          }
                          return Padding(
                            padding: EdgeInsets.only(top: 8),
                            child: Text(
                              dateLabels[index],
                              style: TextStyle(fontSize: 10),
                            ),
                          );
                        },
                      ),
                    ),
                    leftTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        getTitlesWidget: (value, meta) {
                          return Text(
                            value.toStringAsFixed(
                              0,
                            ), // This will round to integer (no .0, .5)
                            style: TextStyle(fontSize: 10),
                          );
                        },
                        reservedSize: 28,
                        interval:
                            1, // Optional: set interval to 1 if you want consistent spacing
                      ),
                    ),
                    rightTitles: AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                    topTitles: AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                  ),
                  lineBarsData: [
                    LineChartBarData(
                      isCurved: true,
                      spots: spots,
                      color: Colors.green,
                      dotData: FlDotData(show: true),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _formatDateLabel(DateTime date) {
    // You can customize this (e.g., 'May 6' or '6th')
    return '${date.month}/${date.day}';
  }
}
