import 'package:finder/config/configurations.dart';
import 'package:finder/controllers/auth_controllers.dart';
import 'package:finder/views/screens/auth_views/bottom_navigation.dart';
import 'package:finder/views/screens/tenant_views/landlord_screen.dart';
import 'package:finder/views/screens/auth_views/login_ui_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
      body: GetBuilder<AuthController>(
        builder: (_) {
          return SafeArea(
            child: _.userProfile != null ? NavigationManager() : LoginPage(),
          );
        },
      ),
    );
  }
}
