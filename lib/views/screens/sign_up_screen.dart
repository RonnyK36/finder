import 'package:carousel_slider/carousel_options.dart';
import 'package:finder/config/configurations.dart';
import 'package:finder/views/screens/sign_in_form.dart';
import 'package:finder/widgets/login_header.dart';
import 'package:finder/widgets/sign_in_buttons.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: Config.screenHeight! * 0.9,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Header of page
              TitleSection(
                title: 'Create an account',
              ),
              SizedBox(
                height: Config.screenHeight! * 0.02,
              ),
              SignInForm(),
            ],
          ),
        ),
      ),
    );
  }
}
