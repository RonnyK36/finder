import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:finder/config/configurations.dart';
import 'package:finder/controllers/auth_controllers.dart';
import 'package:finder/models/landlords.dart';
import 'package:finder/models/users.dart';
import 'package:finder/views/screens/landlord_views/add_apartments.dart';
import 'package:finder/widgets/components/loading.dart';
import 'package:finder/widgets/components/reusable_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LandlordProfile extends StatefulWidget {
  const LandlordProfile({Key? key}) : super(key: key);

  @override
  _LandlordProfileState createState() => _LandlordProfileState();
}

class _LandlordProfileState extends State<LandlordProfile> {
  bool showInfo = true;
  bool isTenant = false;

  CollectionReference landlords =
      FirebaseFirestore.instance.collection('landlords');

  final _authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    String uid = _authController.userProfile!.uid;
    return Scaffold(
      backgroundColor: kAccentColor,
      appBar: AppBar(
        backgroundColor: Colors.white,
        actions: [
          // TextButton(
          //   onPressed: () {
          //     setState(() {
          //       showInfo = !showInfo;
          //     });
          //   },
          //   child: Text(
          //     showInfo ? 'Show info' : 'Hide info',
          //     style: kUbuntu15.copyWith(color: kAccentColor),
          //   ),
          // ),
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
      body: StreamBuilder(
          stream: landlords.snapshots(),
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (!snapshot.hasData) {
              return Loading();
            }
            return ListView(
              children: snapshot.data!.docs.map((doc) {
                if (doc['id'] == uid) {
                  return Column(
                    children: [
                      SizedBox(height: Config.screenHeight! * 0.02),
                      GestureDetector(
                        onTap: () {
                          print('Change profile');
                        },
                        child: CircleAvatar(
                          backgroundColor: Colors.primaries[
                              Random().nextInt(Colors.primaries.length)],
                          maxRadius: Config.screenWidth! * 0.15,
                          child: Text(
                            _authController.userProfile!.displayName
                                .toString()[0],
                            style: kUbuntu15.copyWith(
                              fontSize: 40,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: Config.screenHeight! * 0.02),
                      ProfileCard(
                        title: doc['displayName'],
                        subtitle: 'Name',
                        iconData: Icons.person,
                      ),
                      ProfileCard(
                        title: doc['phone'],
                        subtitle: 'Phone',
                        iconData: Icons.phone,
                      ),
                      ProfileCard(
                        title: doc['email'],
                        subtitle: 'Email',
                        iconData: Icons.email,
                      ),
                      ProfileCard(
                        title: doc['userMode'],
                        subtitle: 'User mode',
                        iconData: Icons.mode,
                      ),
                    ],
                  );
                }
                return SizedBox.shrink();
              }).toList(),
            );
          }),
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
