import 'package:flutter/material.dart';
import 'login_page.dart';
import 'sign_up_page.dart';
import 'otp_verification_page.dart';
import 'home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Your App Name',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        fontFamily: 'Poppins',
      ),
      initialRoute: '/login',
      routes: {
        '/login': (context) => LoginPage(),
        '/sign_up': (context) => SignUpPage(),
        '/otp_verification': (context) => OTPVerificationPage(),
        '/home': (context) => HomePage(),
      },
    );
  }
}
