import 'package:finder/config/configurations.dart';
import 'package:finder/widgets/forms/sign_in_form.dart';
import 'package:finder/widgets/login_header.dart';
import 'package:flutter/material.dart';

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
          // height: Config.screenHeight! * 0.95,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Header of page
              TitleSection(
                title: 'MKU Finder',
              ),

              // SizedBox(height: Config.screenHeight! * 0.08),
              SignInForm(),
            ],
          ),
        ),
      ),
    );
  }
}
