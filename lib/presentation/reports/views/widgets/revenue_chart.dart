import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class RevenueChart extends StatelessWidget {
  const RevenueChart({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 464,
      height: 306,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
        Radius.circular(5.0) 
    ),
        border: Border.all(
          
          color: Color(0xFFB4B4B4)
        
        ),
  ),
      margin: EdgeInsets.symmetric(horizontal: 10),
        child: Padding(
          padding: EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                // width: 150,
                // height: 20,
                child: Text("Revenue Overview", style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),),),
              SizedBox(height: 10),
              SizedBox(
                height: 238,
                width: 454,
                child: LineChart(
                  LineChartData(
                  gridData: FlGridData(show: false),
                    borderData: FlBorderData(show: false),
                  titlesData: FlTitlesData(
                      // leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: true)),
                      bottomTitles: AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: true,
                          getTitlesWidget: (value, meta) {
                            List<String> days = ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat"];
                            return Padding(
                              padding: EdgeInsets.only(top: 8),
                              child: Text(days[value.toInt() % days.length], style: TextStyle(fontSize: 12)),
                            );
                          },
                        ),
                      ),
                    ),
                    lineBarsData: [
                      LineChartBarData(
                        isCurved: true,
        
                        spots: [
                          FlSpot(0, 60),
                          FlSpot(1, 70),
                          FlSpot(2, 80),
                          FlSpot(3, 90),
                          FlSpot(4, 85),
                          FlSpot(5, 60),
                        ],
                        color: Colors.green,
                        // colors: [Colors.green],
                        dotData: FlDotData(show: true),
                      ),
                    ],
                )),
              ),
            ],
          ),
        ),
      
    );
  }
}