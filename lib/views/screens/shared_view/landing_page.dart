import 'package:finder/config/configurations.dart';
import 'package:finder/views/screens/auth_views/root.dart';
import 'package:finder/widgets/components/reusable_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Config().init(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Spacer(),
              SizedBox(height: 20),
              // Show the splash screen image
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
              // Show a short message to user
              Text(
                'Find a new place? \n\nHOSTEL || RENTAL',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).accentColor,
                  fontSize: 18,
                ),
              ),
              SizedBox(height: 40),
              //  Button to continue to the app
              reusableButton(
                context,
                onPressed: () => Get.to(() => Root()),
                label: 'Get started',
              ),
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
