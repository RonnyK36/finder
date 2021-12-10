import 'package:finder/config/configurations.dart';
import 'package:finder/views/screens/auth_views/root.dart';
import 'package:finder/views/screens/auth_views/sign_up_screen.dart';
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
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // Show the splash screen image
              Container(
                height: Config.screenHeight! * 0.75,
                width: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('images/haofinder-logo.png'),
                  ),
                ),
              ),

              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  reusableButton(
                    context,
                    onPressed: () => Get.to(() => Root()),
                    label: 'Continue',
                  ),
                  Text(
                    'OR',
                    style: kUbuntu15.copyWith(
                      fontWeight: FontWeight.bold,
                      color: kPrimaryColor,
                      fontSize: 20,
                    ),
                  ),
                  TextButton(
                    onPressed: () => Get.to(() => SignUpScreen()),
                    child: Text(
                      'Create an acount',
                      style: kUbuntu15.copyWith(
                        fontSize: 20,
                        color: kAccentColor,
                      ),
                    ),
                  ),
                ],
              ),

              Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
