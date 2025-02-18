import 'package:flutter/material.dart';

class UpcomingTripsList extends StatelessWidget {
  const UpcomingTripsList({super.key});


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 367,
      // width: 311,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Upcoming Guide Trips',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 3,
              itemBuilder: (context, index) {
                // final event = events[index];
                return Card(
                  margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                      color: Colors.green,
                        width: 60,
                      height: 54,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Jaipur City Tours",style: TextStyle(fontSize: 10),),
                        Text("Santosh Chandra",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w600),),
                        Text("10+ Visitors",style: TextStyle(fontSize: 10),),
                      ],
                    ),
                        ],
                      ),
                    Text("5 - 10 Feb",style: TextStyle(fontSize: 10),)
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}