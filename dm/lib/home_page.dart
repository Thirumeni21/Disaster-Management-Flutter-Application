import 'package:flutter/material.dart';
import 'food_service_page.dart';
import 'accommodation_page.dart';
import 'hospital_page.dart';
import 'ambulance_page.dart';
import 'tips_page.dart';
import 'news_page.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Variables for adjustable spacing and sizes
  final double imageHeight = 200.0;
  final double containerHeight = 250.0;
  final double gridPadding = 18.0;
  final double gridSpacing = 16.0;
  final double iconSize = 50.0;
  final double buttonBorderRadius = 15.0;
  final double topSpace = 40.0; // Adjust this value for top spacing
  final double emergencyButtonVerticalPadding = 20.0;
  final double emergencyButtonHorizontalPadding = 100.0;
  final double emergencyButtonTextSize = 20.0;
  final double rollingNewsHeight = 250.0;
  final double newsImageBottomPadding = 12.0;
  final double newsTextSize = 14.0;
  final double disconnectedTextSize = 16.0;

  // Global key for the Scaffold
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.teal.shade100,
        title: const Text(
          'Dashboard',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontFamily: 'Poppins',
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          // Add spacing between the AppBar and the rolling news
          SizedBox(height: 40), // Adjust this value for space between AppBar and rolling news
          FutureBuilder(
            future: _checkConnectivity(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator();
              } else if (snapshot.hasData && snapshot.data == true) {
                return _buildRollingNews(); // Display rolling news when connected
              } else {
                return _buildDisconnectedContent();
              }
            },
          ),
          SizedBox(height: topSpace),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.redAccent,
              padding: EdgeInsets.symmetric(
                vertical: emergencyButtonVerticalPadding,
                horizontal: emergencyButtonHorizontalPadding,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(buttonBorderRadius),
              ),
            ),
            onPressed: () {
              // Emergency button clicked, show ambulance info with map
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: const Text(
                    'Ambulance Arriving!',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text(
                        'The ambulance is on the way. Estimated time of arrival: 10 minutes.',
                        style: TextStyle(fontFamily: 'Poppins'),
                      ),
                      SizedBox(height: 10),
                      Image.asset('assets/map_image.png'), // Add a map image for the ambulance
                    ],
                  ),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text('OK', style: TextStyle(fontFamily: 'Poppins')),
                    ),
                  ],
                ),
              );
            },
            child: Text(
              'Emergency',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: emergencyButtonTextSize,
                fontFamily: 'Poppins',
              ),
            ),
          ),
          SizedBox(height: 35),
          Expanded(
            child: GridView.count(
              padding: EdgeInsets.all(gridPadding),
              crossAxisCount: 3,
              mainAxisSpacing: gridSpacing,
              crossAxisSpacing: gridSpacing,
              children: [
                buildServiceButton(context, 'Food Service', Icons.fastfood, FoodServicePage(), Colors.teal.shade200),
                buildServiceButton(context, 'Accommodation', Icons.hotel, AccommodationPage(), Colors.teal.shade200),
                buildServiceButton(context, 'Hospital', Icons.local_hospital, HospitalPage(), Colors.teal.shade200),
                buildServiceButton(context, 'Ambulance', Icons.local_shipping, AmbulancePage(), Colors.teal.shade200),
                buildServiceButton(context, 'Tips', Icons.medical_services, TipsPage(), Colors.teal.shade200),
                buildServiceButton(context, 'News', Icons.article, NewsPage(), Colors.teal.shade200),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRollingNews() {
    return SizedBox(
      height: rollingNewsHeight,
      child: PageView(
        children: [
          _buildImageWithNews(
              'https://upload.wikimedia.org/wikipedia/commons/thumb/c/ce/Indian_Air_Force_Relief_and_Rescue_Op_during_Tamil_Nadu_Flood_December_2015.jpg/1920px-Indian_Air_Force_Relief_and_Rescue_Op_during_Tamil_Nadu_Flood_December_2015.jpg',
              'Chennai Flood: The Flyovers Submerged'),
          _buildImageWithNews(
              'https://ichef.bbci.co.uk/images/ic/1024x576/p09z3k04.jpg',
              'Kerala Flood: The Shattered houses'),
        ],
      ),
    );
  }

  Widget _buildImageWithNews(String imageUrl, String news) {
    return Padding(
      padding: EdgeInsets.only(bottom: newsImageBottomPadding),
      child: Column(
        children: [
          Container(
            height: imageHeight,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Image.network(
                imageUrl,
                fit: BoxFit.cover,
                width: double.infinity,
                errorBuilder: (context, error, stackTrace) {
                  return const Icon(Icons.error, color: Colors.red, size: 50);
                },
              ),
            ),
          ),
          SizedBox(height: 10),
          Text(
            news,
            style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: newsTextSize,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildDisconnectedContent() {
    return Container(
      height: containerHeight,
      alignment: Alignment.center,
      child: Text(
        'Toll free number: 1088 1056',
        style: TextStyle(
          fontFamily: 'Poppins',
          fontSize: disconnectedTextSize,
          fontWeight: FontWeight.bold,
          color: Colors.red,
        ),
      ),
    );
  }

  Future<bool> _checkConnectivity() async {
    var connectivityResult = await Connectivity().checkConnectivity();
    return connectivityResult == ConnectivityResult.mobile ||
        ConnectivityResult.wifi == connectivityResult;
  }

  Widget buildServiceButton(BuildContext context, String title, IconData icon, Widget page, Color buttonColor) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: buttonColor,
        padding: const EdgeInsets.all(8),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(buttonBorderRadius),
        ),
      ),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => page),
        );
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: iconSize, color: Colors.white),
          SizedBox(height: 10),
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontFamily: 'Poppins',
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}
