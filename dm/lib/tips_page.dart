import 'package:flutter/material.dart';

class TipsPage extends StatelessWidget {
  const TipsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Tips',
          style: TextStyle(fontFamily: 'Poppins', fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.teal.shade100,
      ),
      body: const Center(
        child: Text(
          'Information about Tips',
          style: TextStyle(fontFamily: 'Poppins', fontSize: 18),
        ),
      ),
    );
  }
}
