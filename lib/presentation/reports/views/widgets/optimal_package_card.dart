import 'package:flutter/material.dart';

class OptimalPackageCard extends StatelessWidget {
  const OptimalPackageCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 177,
      width: 468,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
        Radius.circular(5.0) 
    ),
        border: Border.all(
          color: Color(0xFFB4B4B4)
        
        ),
      ),
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
  }
}