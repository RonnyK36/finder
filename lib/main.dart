import 'package:finder/views/screens/landing_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Finder',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0xff0d47a1),
        accentColor: Color(0xff4fc3f7),
      ),
      home: LandingPage(),
    );
  }
}
