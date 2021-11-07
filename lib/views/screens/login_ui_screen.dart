import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:finder/config/configurations.dart';
import 'package:finder/controllers/auth_controllers.dart';
import 'package:finder/widgets/sign_in_form.dart';
import 'package:finder/widgets/login_header.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// import 'package:flutter_svg/svg.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    Config().init(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: Config.screenHeight! * 0.95,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // Header of page
              TitleSection(
                title: 'Hello comrade,',
              ),

              // SizedBox(height: Config.screenHeight! * 0.02),
              SignInForm(),
            ],
          ),
        ),
      ),
    );
  }
}
