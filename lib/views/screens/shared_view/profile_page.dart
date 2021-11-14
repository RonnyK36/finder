import 'dart:math';

import 'package:finder/config/configurations.dart';
import 'package:finder/controllers/auth_controllers.dart';
import 'package:finder/models/landlords.dart';
import 'package:finder/models/users.dart';
import 'package:finder/views/screens/landlord_views/add_apartments.dart';
import 'package:finder/widgets/components/reusable_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool showInfo = true;

  final _authController = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        actions: [
          TextButton(
            onPressed: () {
              setState(() {
                showInfo = !showInfo;
              });
            },
            child: Text(
              showInfo ? 'Show info' : 'Hide info',
              style: kUbuntu15.copyWith(color: kAccentColor),
            ),
          ),
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
          children: [
            // Text('Your Account', style: kUbuntu15.copyWith(fontSize: 30)),
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: Config.screenHeight! * 0.015,
                      horizontal: Config.screenWidth! * 0.02),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          print('Change profile');
                        },
                        child: CircleAvatar(
                          backgroundColor: Colors.primaries[
                              Random().nextInt(Colors.primaries.length)],
                          maxRadius: Config.screenWidth! * 0.1,
                          child: Text(
                            _authController.userProfile!.displayName
                                .toString()[0],
                            style: kUbuntu15.copyWith(
                              fontSize: 30,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: Config.screenWidth! * 0.05),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            _authController.userProfile!.displayName.toString(),
                            style: kUbuntu15.copyWith(fontSize: 25),
                          ),
                          SizedBox(height: Config.screenHeight! * 0.006),
                          Text(
                            _authController.userProfile!.email.toString(),
                            style: kUbuntu15,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            showInfo
                ? Container()
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ProfileCard(
                        title:
                            _authController.userProfile!.displayName.toString(),
                        subtitle: "Username",
                        iconData: Icons.person,
                      ),
                      ProfileCard(
                        title: _authController.userProfile!.email.toString(),
                        subtitle: 'Email',
                        iconData: Icons.email,
                      ),
                      ProfileCard(
                        title: _authController.userProfile!.uid,
                        subtitle: 'UID',
                        iconData: Icons.perm_identity,
                      ),
                      // ProfileCard(
                      //   title: _authController.userMode.toString(),
                      //   subtitle: 'Phone',
                      //   iconData: Icons.mode,
                      // ),
                    ],
                  ),
            TextButton.icon(
              onPressed: () => Get.to(() => AddApartment()),
              icon: Icon(Icons.add),
              label: Text('Add new'),
            ),
            SizedBox(height: Config.screenHeight! * 0.006),
            Text('By Nerdy Approach Co', style: kUbuntu15),
          ],
        ),
      ),
    );
  }
}

class ProfileCard extends StatelessWidget {
  const ProfileCard(
      {required this.iconData, required this.title, required this.subtitle});
  final String title;
  final String subtitle;
  final IconData iconData;

  @override
  Widget build(
    BuildContext context,
  ) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: ListTile(
        leading: Icon(
          iconData,
          color: kAccentColor,
        ),
        title: Text(
          title,
          style: kUbuntu15.copyWith(fontSize: 20, color: kPrimaryColor),
        ),
        selectedTileColor: Colors.amber,
        subtitle: Text(
          subtitle,
          style: kUbuntu15.copyWith(color: kAccentColor),
        ),
      ),
    );
  }
}
