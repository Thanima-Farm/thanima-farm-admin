import 'package:flutter/material.dart';

class UpcomingTripCard extends StatelessWidget {
  final String assetImageName;
  final String activityName;
  final String visitorName;
  final String visitorNo;
  final String duration;

  const UpcomingTripCard({
    super.key,
    required this.assetImageName,
    required this.activityName,
    required this.visitorNo,
    required this.duration, required this.visitorName,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(5), // Optional: Rounded corners for image
                child: Image.asset(
                  assetImageName,
                  width: 60,
                  height: 54,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(width: 5),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(5.0)),
                      border: Border.all(color: Color(0xFFB4B4B4)),
                      color: Color(0xFFB8DFFC),
                    ),
                    width: 85,
                    height: 13,
                    child: Center(
                      child: Text(activityName, style: TextStyle(fontSize: 8)),
                    ),
                  ),
                  Text(
                    visitorName, // Static name (if dynamic, make it a required parameter)
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                  ),
                  Text(visitorNo, style: TextStyle(fontSize: 10)),
                ],
              ),
            ],
          ),
          Row(
            children: [
              Icon(Icons.calendar_month_outlined,size: 15,color: Color(0xFF949494)),
              SizedBox(width: 2,),
              Text(duration, style: TextStyle(fontSize: 10,color: Color(0xFF949494))),
            ],
          ),
        ],
      ),
    );
  }
}