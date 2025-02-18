import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  const Header({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 54,
      decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide( //                   <--- left side
    color: Colors.grey,
    width: 0.5,
            ),
          ),
            ),
            child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      Text("Home / ",style: TextStyle(fontSize: 14,color: Colors.grey),),
      SizedBox(
        width: 10,
      ),
      Text("Dashboard",style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.w600,)),
    ],
            ),
            Row(
    children: [
      IconButton(onPressed: (){}, icon: Icon(Icons.language),),
    
            IconButton(onPressed: (){}, icon: Icon(Icons.notifications),),
    ],
            ),
          ],
            ),
    );
  }
}