import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FoodServicePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal.shade100,
        title: Text('Nearby Food Spots', style: GoogleFonts.poppins(color: Colors.black)),
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          HospitalCard(
            imageUrl: 'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEgzBYHq0CS3B7WLEMXJ6afB_08YvrGW65Ti6oLIWqFNsTE5PN0pEshoy-xebh5G8kE02EnrrU7vKhFMePLywOt904qs63vUB95UQJDFa79vhR0LwvnKX8y3Dv8qUMC9hnZMy82ObZNhO9M/s1600/Providing+Meals+to+Disaster+affected+People+from+MDM+Kitchens.jpg',
            name: 'MDM Kitchens',
            availability: 'Available for 3 times a day',
            distance: '5 km',
            extraInfo: 'Breakfast: 7 AM, Lunch: 12 PM, Dinner: 7 PM',
          ),
          SizedBox(height: 16),
          HospitalCard(
            imageUrl: 'https://blog.akshayapatra.org/wp-content/uploads/2018/08/image-1-3.jpg',
            name: 'Akshaya Patra',
            availability: 'Available for 3 times a day',
            distance: '3.8 km',
            extraInfo: 'Breakfast: 7:30 AM, Lunch: 12:30 PM, Dinner: 7:30 PM',
          ),
          SizedBox(height: 16),
          HospitalCard(
            imageUrl: 'https://www.sumadhurafoundation.org/wp-content/uploads/2023/12/d-19.webp',
            name: 'Akshaya Patra',
            availability: 'Available for 3 times a day',
            distance: '2.2 km',
            extraInfo: 'Providing food 24/7',
          ),
        ],
      ),
    );
  }
}

class HospitalCard extends StatelessWidget {
  final String imageUrl;
  final String name;
  final String availability;
  final String distance;
  final String extraInfo;

  HospitalCard({
    required this.imageUrl,
    required this.name,
    required this.availability,
    required this.distance,
    required this.extraInfo,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
            child: Image.network(
              imageUrl,
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name, style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.bold)),
                SizedBox(height: 8),
                Text('Availability: $availability', style: GoogleFonts.poppins(fontSize: 14)),
                SizedBox(height: 8),
                Text('Distance: $distance', style: GoogleFonts.poppins(fontSize: 14)),
                SizedBox(height: 8),
                Text('Info: $extraInfo', style: GoogleFonts.poppins(fontSize: 14)),
                SizedBox(height: 16),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.teal,
                    padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: () {
                    // Implement get directions functionality here
                  },
                  child: Text('Get Directions', style: GoogleFonts.poppins(color: Colors.white)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
