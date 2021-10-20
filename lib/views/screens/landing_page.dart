import 'package:finder/widgets/reusable_button.dart';
import 'package:flutter/material.dart';

import 'home_screen.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Spacer(),
              SizedBox(height: 20),
              Container(
                height: 250,
                width: 250,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('images/landing_apart.png'),
                  ),
                ),
              ),
              SizedBox(height: 30),
              Text(
                'Find a new place? \n\nHOSTEL || RENTAL',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).accentColor,
                  fontSize: 18,
                ),
              ),
              SizedBox(height: 40),
              reusableButton(
                context,
                onPressed: () {
                  Navigator.pushReplacement(
                      context, MaterialPageRoute(builder: (c) => HomeScreen()));
                },
                buttonName: 'Get started',
                icon: Icons.arrow_forward,
              ),
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
