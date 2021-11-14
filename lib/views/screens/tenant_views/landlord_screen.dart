import 'package:flutter/material.dart';

class LandLordScreens extends StatefulWidget {
  const LandLordScreens({Key? key}) : super(key: key);

  @override
  _LandLordScreensState createState() => _LandLordScreensState();
}

class _LandLordScreensState extends State<LandLordScreens> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Text('Landlords Here'),
      ),
    );
  }
}
