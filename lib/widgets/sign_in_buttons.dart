import 'dart:ffi';

import 'package:finder/config/configurations.dart';
import 'package:finder/views/screens/home_screen.dart';
import 'package:finder/views/screens/sign_up_screen.dart';
import 'package:finder/widgets/reusable_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignInButtons extends StatelessWidget {
  const SignInButtons({
    Key? key,
    required this.label,
    required this.onPressed,
  }) : super(key: key);
  final String label;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Align(
          alignment: Alignment.centerRight,
          child: TextButton(
            child: Text('Forgot password?'),
            onPressed: () {},
          ),
        ),
        reusableButton(
          context,
          padding: EdgeInsets.symmetric(
              horizontal: Config.screenWidth! * 0.35,
              vertical: Config.screenHeight! * 0.02),
          label: label,
          onPressed: onPressed,
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Row(
            children: [
              Text(
                'Don\'t have an account? ',
                style: kUbuntu15,
              ),
              TextButton(
                  onPressed: () => Get.to(() => SignUpScreen()),
                  child: Text('Sign up')),
            ],
          ),
        ),
      ],
    );
  }
}
