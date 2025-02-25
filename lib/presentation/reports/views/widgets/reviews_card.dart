import 'package:flutter/material.dart';

class ReviewsCard extends StatelessWidget {
  const ReviewsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 78,
      width: 468,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
        Radius.circular(5.0) 
    ),
        border: Border.all(
          
          color: Color(0xFFB4B4B4)
        
        ),
  ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Container(
              height: 41,
              width: 41,
                      padding: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        color: Colors.green.shade50,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Icon(Icons.star, color: Colors.amber, size: 20),
                    ),
                    const SizedBox(width: 16),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Reviews',
                          style: TextStyle(fontSize: 10, fontWeight: FontWeight.w500),
                        ),
                        Text(
                          '300',
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
            Container(
              width: 329,
              color: Colors.transparent,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 16,
                    width: 80,
                  // padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 4),
                  decoration: BoxDecoration(
                    color: Colors.blue.shade100,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child:  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'This Week',
                        style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold,fontSize: 8),
                      ),
                      Icon(Icons.arrow_drop_down, color: Colors.blue,size: 15,),
                    ],
                  ),
                ),
                  LinearProgressIndicator(
                value: 0.85,
                backgroundColor: Colors.orange.shade100,
                valueColor: AlwaysStoppedAnimation<Color>(Colors.orange),
                minHeight: 8,
                borderRadius: BorderRadius.circular(8),
              ),
              // const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildReviewLabel(Colors.orange.shade200, 'Excellent(4.0)'),
                  _buildReviewLabel(Colors.orange.shade400, 'Good(3.5)'),
                  _buildReviewLabel(Colors.orange.shade600, 'Better(2.5)'),
                ],
              ),
      
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildReviewLabel(Color color, String label) {
    return Row(
      children: [
        Container(
          width: 12,
          height: 12,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
        ),
        const SizedBox(width: 8),
        Text(label, style: const TextStyle(fontWeight: FontWeight.w500,fontSize: 10)),
      ],
    );
  }
}
