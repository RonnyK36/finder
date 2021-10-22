import 'package:finder/config/configurations.dart';
import 'package:finder/widgets/login_header.dart';
import 'package:finder/widgets/reusable_button.dart';
import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Header of page
              TitleSection(
                title: 'Welcome!',
                subtitle: 'Login to view available apartments and hostels...',
              ),
              Expanded(
                  flex: 4,
                  child: SvgPicture.asset('images\create_account.jfif')),
              Expanded(
                flex: 5,
                child: Column(
                  children: [],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
