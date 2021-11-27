import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:finder/config/configurations.dart';
import 'package:finder/views/screens/tenant_views/landlord_apartments.dart';
import 'package:finder/widgets/components/loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:get/get.dart';

class ViewLandlordProfile extends StatefulWidget {
  ViewLandlordProfile({required this.uid});
  final String uid;

  @override
  _ViewLandlordProfileState createState() => _ViewLandlordProfileState();
}

class _ViewLandlordProfileState extends State<ViewLandlordProfile> {
  get uid => widget.uid;
  CollectionReference landlords =
      FirebaseFirestore.instance.collection('landlords');
  String? displayName;
  getLandlordInfo() async {
    DocumentSnapshot doc = await landlords.doc(uid).get();

    setState(() {
      this.displayName = doc['displayName'];
    });
    print(doc['userMode']);
  }

  callLandlord(String id) async {
    DocumentSnapshot doc = await landlords.doc(id).get();
    String phone = doc['phone'];
    await FlutterPhoneDirectCaller.callNumber(phone);
  }

  @override
  void initState() {
    super.initState();
    getLandlordInfo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      // appBar: AppBar(
      //   backgroundColor: kAccentColor,
      //   title: Text(
      //     '',
      //     style: kUbuntu15.copyWith(color: kAccentColor),
      //   ),
      //   actions: [
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
      // TextButton.icon(
      //   onPressed: () => _authController.signOut(),
      //   icon: Icon(Icons.logout, color: Colors.red),
      //   label: Text(
      //     'Logout',
      //     style: kUbuntu15.copyWith(color: Colors.red),
      //   ),
      // ),
      //   ],
      // ),
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
                            displayName.toString()[0],
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ElevatedButton.icon(
                              onPressed: () {
                                print('Calling');
                                callLandlord(doc['id']);
                              },
                              icon: Icon(
                                Icons.phone,

                                color: Colors.white,
                                // color: color == Colors.red ? Colors.white : Colors.red,
                              ),
                              label: Text('Call landlord')),
                          ElevatedButton.icon(
                            onPressed: () {
                              Get.to(
                                () => LandlordAparmtents(
                                  ownerId: doc['id'],
                                  owner: doc['displayName'],
                                ),
                              );
                            },
                            icon: Icon(
                              Icons.more,
                              // color: color == Colors.red ? Colors.white : Colors.red,
                            ),
                            label: Text('More from owner'),
                          ),
                        ],
                      )
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
