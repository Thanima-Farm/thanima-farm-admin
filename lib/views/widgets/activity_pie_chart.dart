import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class ActivityPieChart extends StatelessWidget {
  const ActivityPieChart({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 342,
      width: 214,
      child: Card(
        elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Column(
        children: [
          SizedBox(
                    height:10,
                  ),
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // SizedBox(
                //   width: 5,
                // ),
                SizedBox(
                  height: 18,
                  width: 86,
                  child: Text("Top Activities", style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold))
                  ),
                SizedBox(
                  height: 24,
                  width: 77,
                  child: Text("Feb 2025", style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)
                  ),
                  ),
              ],
            ),
            SizedBox(
                    height: 10,
                  ),
            SizedBox(
              height: 290,
              width: 200,
              child: Column(
                children: [
                  SizedBox(
              height: 139,
              width: 139,
              child: PieChart(

                PieChartData(
                  sections: [
                    PieChartSectionData(color: Colors.blue, value: 30, title: ""),
                    PieChartSectionData(color: Colors.orange, value: 5, title: ""),
                    PieChartSectionData(color: Colors.green, value: 10, title: ""),
                    PieChartSectionData(color: Colors.yellow, value: 5, title: ""),
                    PieChartSectionData(color: Colors.red, value: 3, title: ""),
                    PieChartSectionData(color: Colors.pink, value: 2, title: ""),
                    PieChartSectionData(color: Colors.purple, value: 40, title: ""),
                    PieChartSectionData(color: Colors.red, value: 5, title: ""),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 139,
              width: 178,
              child: Column(
                children: [
                  SizedBox(
                    height: 5,
                  ),
                  ActivityStatCard(),
                  SizedBox(
                    height: 5,
                  ),
                  ActivityStatCard(),
                  SizedBox(
                    height: 5,
                  ),
                  
                  ActivityStatCard(),
                  SizedBox(
                    height: 5,
                  ),
                  ActivityStatCard(),
                  SizedBox(
                    height: 5,
                  ),
                  ActivityStatCard(),
                  SizedBox(
                    height: 5,
                  ),
                  ActivityStatCard(),
                  SizedBox(
                    height: 5,
                  ),
                  ActivityStatCard(),
                ],
              ),
            )
                ],
              ),
            ),
        ],
      ),
      ),
    );
//     return Card(
//       elevation: 3,
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//       child: Padding(
//         padding: EdgeInsets.all(15),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Text("Top Activities", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
//                 Text("Feb 2025", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
//               ],
//             ),
//             SizedBox(height: 10),
//             SizedBox(
//               height: 214,
//               width: 342,
//               child: PieChart(

//                 PieChartData(
//                   sections: [
//                     PieChartSectionData(color: Colors.blue, value: 10, title: ""),
//                     PieChartSectionData(color: Colors.orange, value: 20, title: ""),
//                     PieChartSectionData(color: Colors.green, value: 30, title: ""),
//                     PieChartSectionData(color: Colors.yellow, value: 40, title: ""),
//                     PieChartSectionData(color: Colors.red, value: 50, title: ""),
//                     PieChartSectionData(color: Colors.yellow, value: 40, title: ""),
//                     PieChartSectionData(color: Colors.yellow, value: 40, title: ""),
//                     PieChartSectionData(color: Colors.red, value: 50, title: ""),
//                   ],
//                 ),
//               ),
//             ),
//             SizedBox(
//               height: 10,
//             ),
//             SizedBox(
//               height: 139,
//               width: 139,
//               child: Column(
//                 children: [
// SizedBox(
//   height: 13,
//   width: 178,
//   child: Row(
//     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//     children: [
//       CircleAvatar(
//         backgroundColor: Colors.green,
//         radius: 6,
//       ),
//       SizedBox(
//         width: 158,
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Text("City Tours", style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold)),
//             Text("10%", style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold))
//           ],
//         ),
//       )
//     ],
//   ),
// )
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
  }
}

class ActivityStatCard extends StatelessWidget {
  const ActivityStatCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 178,
      height:13,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: 6,
              ),
              SizedBox(
                width: 10,
              ),
              Text("City Tours",style: TextStyle(fontSize: 10),),
            ],
          ),
          Text("10%",style: TextStyle(fontSize: 10),),
        ],
      ),
    );
  }
}