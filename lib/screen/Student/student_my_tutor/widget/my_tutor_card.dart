import 'package:flutter/material.dart';

class StmyTutorCard extends StatelessWidget {
  const StmyTutorCard({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Card(
      margin: const EdgeInsets.all(12),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Placeholder for image
                Container(
                  width: screenWidth * 0.2,
                  height: screenWidth * 0.2,
                  color: Colors.grey[300],
                  child: const Center(child: Text("Image")),
                ),
                const SizedBox(width: 12),

                // Info column
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        "John Doe ★★★★☆",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      Text("University of Education"),
                      Text("Specialist in English"),
                      Text("3 years experience"),
                    ],
                  ),
                ),
              ],
            ),

            const SizedBox(height: 12),

            /// Location
            const Row(
              children: [
                Icon(Icons.location_on, size: 16, color: Colors.grey),
                SizedBox(width: 4),
                Text("Dhaka, Bangladesh"),
              ],
            ),

            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
              Text("Subject: English"),
                Text("College Students")

              ],
            ),

            const SizedBox(height: 12),

            /// Schedule and Salary
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text("4 Days/Week"),
                Text("৳12,000/Month"),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
