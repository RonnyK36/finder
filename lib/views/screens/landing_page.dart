import 'package:finder/config/configurations.dart';
import 'package:finder/views/screens/login_ui_screen.dart';
import 'package:finder/views/screens/root.dart';
import 'package:finder/widgets/reusable_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'home_screen.dart';

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
                onPressed: () => Get.to(() => Root()),
                padding: EdgeInsets.symmetric(
                    horizontal: Config.screenWidth! * 0.3,
                    vertical: Config.screenHeight! * 0.015),
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
