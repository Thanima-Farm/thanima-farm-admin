import 'package:flutter/material.dart';

class OptimalPackageCard extends StatelessWidget {
  const OptimalPackageCard({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> packageData = [
  {
    "gradient": [Color(0xFF0A214E), Color(0xFF661174)],
    "packageName": "Base",
    "price": "₹12040/-",
  },
  {
    "gradient": [Color(0xFFFFFCF7), Color(0xFF080808)],
    "packageName": "Silver",
    "price": "₹12040/-",
  },
  {
    "gradient": [Color(0xFFFFA600), Color(0xFFE9F057)],
    "packageName": "Gold",
    "price": "₹12040/-",
  },
];
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Optimal Package Sold",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600,color: Color(0xFF6A6A6A)),),
                Row(
                  children: [
                    Text("Sort by",style: TextStyle(fontSize: 8,color: Color(0xFF1E1E1E)),),
                    SizedBox(width: 5,),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 4,vertical: 2),
                decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
        Radius.circular(5.0) 
    ),
        border: Border.all(
          color: Color(0xFFB4B4B4)
        
        ),
      ),
                child: Text("Latest",style: TextStyle(fontSize: 10,fontWeight: FontWeight.w600),)
                ),
              SizedBox(width: 5,),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 4,vertical: 2),
                decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
        Radius.circular(5.0) 
    ),
        border: Border.all(
          color: Color(0xFFB4B4B4)
        
        ),
      ),
                child: Text("View All",style: TextStyle(fontSize: 10),),
                ),
                  ],
                )
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 3,
              itemBuilder: (contex,index){
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: PackageCard(
                  gradient: packageData[index]["gradient"],
                  packageName: packageData[index]["packageName"],
                  price: packageData[index]["price"],
                ),
              );
            }),
          )
        
        ],
      ),
    );
  }
}


class PackageCard extends StatelessWidget {
  final List<Color> gradient; // Gradient colors
  final String packageName;  // Package name (e.g., "Base")
  final String price;        // Package price (e.g., "₹12,000/-")

  const PackageCard({
    super.key,
    required this.gradient,
    required this.packageName,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 88,
      width: 168,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: gradient, // Gradient colors passed as parameter
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              packageName,
              style: TextStyle(
                fontSize: 16,
                color: Color(0xFFFFFFFF),
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              price,
              style: TextStyle(
                fontSize: 27,
                color: Color(0xFFFFFFFF),
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}