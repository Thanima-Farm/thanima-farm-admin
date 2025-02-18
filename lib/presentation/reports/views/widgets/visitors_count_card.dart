import 'package:flutter/material.dart';

class VisitorsCountCard extends StatelessWidget {
  const VisitorsCountCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
                color: Color(0xFFE7F5FE),
            borderRadius: BorderRadius.all(
            Radius.circular(5.0) 
        ),
            border: Border.all(
              color: Color(0xFFB4B4B4)
            
            ),
          ),
      width: 166,
      height: 60,
      
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                borderRadius: BorderRadius.all(
                Radius.circular(5.0) 
                      ),
              ),
                height: 41,
                width: 41,
                
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 4,bottom: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Total Visitors",style: TextStyle(fontSize: 10,color: Colors.grey),),
                Text("1,200",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w600),),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(2.0),
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 1,horizontal: 2),
              decoration: BoxDecoration(
                  color: Color(0xFFFFFFFF),
              borderRadius: BorderRadius.all(
              Radius.circular(5.0) 
                    ),
              border: Border.all(
                color: Color(0xFFB4B4B4)
              
              ),
            ),
              child: Text("+2.98%",style: TextStyle(fontSize: 10,),),
              ),
          ),
        ],
      ),
    );
  }
}

