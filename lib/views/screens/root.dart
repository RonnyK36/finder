import 'package:finder/config/configurations.dart';
import 'package:finder/views/screens/login_ui_screen.dart';
import 'package:flutter/material.dart';

class Root extends StatefulWidget {
  const Root({Key? key}) : super(key: key);

  @override
  _RootState createState() => _RootState();
}

class _RootState extends State<Root> {
  @override
  Widget build(BuildContext context) {
    Config().init(context);

    return Scaffold(
      body: SafeArea(
        child: LoginPage(),
      ),
    );
  }
}
