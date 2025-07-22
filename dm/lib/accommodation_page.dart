import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AccommodationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal.shade100,
        title: Text('Nearby Accommodations', style: GoogleFonts.poppins(color: Colors.black)),
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          HospitalCard(
            imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSVP-4jnnHwZTqJkLDK7N5gaQfeDq2GLkk0fLWxQOZGHehdhWHkUtCwolhvbkQWryzmJr8&usqp=CAU',
            name: 'Chennai Central',
            availability: 'Available for about 500 people',
            distance: '5 km',
            extraInfo: 'Fastly occupying, providing all necessary things and food is available 24/7',
          ),
          SizedBox(height: 16),
          HospitalCard(
            imageUrl: 'https://images.indianexpress.com/2015/12/chennal-gallery-4.jpg',
            name: 'Under Flyover - Teynampet to Saidapet',
            availability: 'Available for about 300 people',
            distance: '3.8 km',
            extraInfo: 'The pillows and bedsheets will be provided',
          ),
          SizedBox(height: 16),
          HospitalCard(
            imageUrl: 'https://images.indianexpress.com/2015/12/chennai-flood-victims759.jpg?w=414',
            name: 'Guindy Bustand',
            availability: 'Available for about 100 people',
            distance: '2.2 km',
            extraInfo: 'Providing food and sleeping spot',
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
