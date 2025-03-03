import 'package:flutter/material.dart';
import 'package:thanima_admin/presentation/dashboard/views/widgets/upcoming_trip_card.dart';

class UpcomingTripsList extends StatelessWidget {
  const UpcomingTripsList({super.key});

  


  @override
  Widget build(BuildContext context) {
    List<Map> upcomingTrips = [
  {
    "assetImageName": "assets/images/jaipur.png",
    "visitorName":"Santosh Chandra",
    "activityName": "Jaipur City Tours",
    "visitorNo": "10+ Visitors",
    "duration": "5 - 10 Feb",
  },
  {
    "assetImageName": "assets/images/beach.png",
    "visitorName":"Aadarsh Soni",
    "activityName": "Jungle Safari Gujrat",
    "visitorNo": "10+ Visitors",
    "duration": "5 - 10 Feb",
  },
  {
    "assetImageName": "assets/images/beach.png",
    "visitorName":"Vipul Ranjan",
    "activityName": "Jaigarh Fort Tour",
    "visitorNo": "10+ Visitors",
    "duration": "5 - 10 Feb",
  },
  {
    "assetImageName": "assets/images/beach.png",
    "visitorName":"Vipul Ranjan",
    "activityName": "Zipline Activity",
    "visitorNo": "13+ Visitors",
    "duration": "1 - 12 Feb",
  },
];
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
              itemCount: 4,
              itemBuilder: (context, index) {
                // final event = events[index];
                return UpcomingTripCard(
                  activityName: upcomingTrips[index]["activityName"],
                  assetImageName: upcomingTrips[index]["assetImageName"],
                  duration: upcomingTrips[index]["duration"],
                  visitorName: upcomingTrips[index]["visitorName"],
                  visitorNo: upcomingTrips[index]["visitorNo"],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

