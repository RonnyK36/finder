import 'package:finder/config/configurations.dart';
import 'package:finder/controllers/auth_controllers.dart';
import 'package:finder/widgets/reusable_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final _authController = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        actions: [
          TextButton.icon(
            onPressed: () => _authController.signOut(),
            icon: Icon(Icons.logout, color: Colors.red),
            label: Text(
              'Logout',
              style: kUbuntu15.copyWith(color: Colors.red),
            ),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              _authController.userProfile!.displayName.toString(),
              style: kUbuntu15.copyWith(fontSize: 25),
            ),
            Text(
              _authController.userProfile!.email.toString(),
              style: kUbuntu15.copyWith(fontSize: 15),
            ),
          ],
        ),
      ),
    );
  }
}
