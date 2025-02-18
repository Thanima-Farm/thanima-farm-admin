import 'package:flutter/material.dart';

class NewVisitorsCard extends StatelessWidget {
  const NewVisitorsCard({super.key});



  @override
  Widget build(BuildContext context) {
    return Container(
      height: 231,
      width: 214,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
        Radius.circular(5.0) 
    ),
        border: Border.all(
          color: Color(0xFFB4B4B4)
        
        ),
      ),
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'New Visitors (23)',
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
                return Container(
                  margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          CircleAvatar(
                      backgroundColor: Colors.green,
                        radius: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Jaipur City Tours",style: TextStyle(fontSize: 5),),
                        Text("Santosh Chandra",style: TextStyle(fontSize: 8,fontWeight: FontWeight.w600),),
                        Text("10+ Visitors",style: TextStyle(fontSize: 5),),
                      ],
                    ),
                    
                        ],
                      ),
                    Text("5 - 10 Feb",style: TextStyle(fontSize: 5),)
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