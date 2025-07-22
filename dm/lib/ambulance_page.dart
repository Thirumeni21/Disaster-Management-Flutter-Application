import 'package:flutter/material.dart';

class AmbulancePage extends StatelessWidget {
  const AmbulancePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Ambulance',
          style: TextStyle(fontFamily: 'Poppins', fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.teal.shade50,
      ),
      body: const Center(
        child: Text(
          'Information about Ambulance',
          style: TextStyle(fontFamily: 'Poppins', fontSize: 18),
        ),
      ),
    );
  }
}
