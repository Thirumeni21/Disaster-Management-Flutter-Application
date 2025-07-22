import 'package:flutter/material.dart';

class NewsPage extends StatelessWidget {
  const NewsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'News',
          style: TextStyle(fontFamily: 'Poppins', fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.teal.shade100,
      ),
      body: const Center(
        child: Text(
          'Information about News',
          style: TextStyle(fontFamily: 'Poppins', fontSize: 18),
        ),
      ),
    );
  }
}