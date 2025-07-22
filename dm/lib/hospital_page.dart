import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HospitalPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal.shade100,
        title: Text('Nearby Hospitals', style: GoogleFonts.poppins(color: Colors.black)),
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          HospitalCard(
            imageUrl: 'https://ehealth.eletsonline.com/wp-content/uploads/2009/07/best-hospital-in-south-india.jpg',
            name: 'City Care Hospital',
            treatment: 'General Medicine, Surgery, Pediatrics',
            distance: '5 km',
            extraInfo: 'Open 24/7 with emergency services.',
          ),
          SizedBox(height: 16),
          HospitalCard(
            imageUrl: 'https://advinhealthcare.com/wp-content/uploads/2022/12/Types-of-Hospitals-2.jpg',
            name: 'Green Valley Health Center',
            treatment: 'Orthopedics, Cardiology, Neurology',
            distance: '3.8 km',
            extraInfo: 'Advanced care for heart and brain diseases.',
          ),
          SizedBox(height: 16),
          HospitalCard(
            imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQMhs-nKJh6-m4gd8ApC7X3rxL-TrNYRgOV2w&s',
            name: 'Sunshine Children\'s Hospital',
            treatment: 'Pediatrics, Neonatology, Child Surgery',
            distance: '2.2 km',
            extraInfo: 'Specialized in child care and neonatal treatments.',
          ),
        ],
      ),
    );
  }
}

class HospitalCard extends StatelessWidget {
  final String imageUrl;
  final String name;
  final String treatment;
  final String distance;
  final String extraInfo;

  HospitalCard({
    required this.imageUrl,
    required this.name,
    required this.treatment,
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
                Text('Treatments: $treatment', style: GoogleFonts.poppins(fontSize: 14)),
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
