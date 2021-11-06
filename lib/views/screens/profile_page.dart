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
  bool showInfo = false;

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
                      CircleAvatar(maxRadius: Config.screenWidth! * 0.1),
                      SizedBox(width: Config.screenWidth! * 0.25),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            _authController.userProfile!.displayName.toString(),
                            style: kUbuntu15.copyWith(fontSize: 25),
                          ),
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
                        subtitle: 'Username',
                        iconData: Icons.person,
                      ),
                      ProfileCard(
                        title: _authController.userProfile!.email.toString(),
                        subtitle: 'Email',
                        iconData: Icons.email,
                      ),
                      ProfileCard(
                        title:
                            _authController.userProfile!.phoneNumber.toString(),
                        subtitle: 'Phone',
                        iconData: Icons.phone,
                      ),
                      ProfileCard(
                        title: _authController.userMode.toString(),
                        subtitle: 'Phone',
                        iconData: Icons.mode,
                      ),
                    ],
                  ),
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
          style: kUbuntu15.copyWith(fontSize: 25, color: kPrimaryColor),
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
