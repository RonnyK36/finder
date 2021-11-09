import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:finder/config/configurations.dart';
import 'package:finder/controllers/auth_controllers.dart';
import 'package:finder/views/screens/apartments.dart';
import 'package:finder/views/screens/home_screen.dart';
import 'package:finder/views/screens/profile_page.dart';
import 'package:finder/views/screens/search.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

final tenantsRef = FirebaseFirestore.instance.collection('tenants');
final landLordsRef = FirebaseFirestore.instance.collection('landlords');

class NavigationManager extends StatefulWidget {
  const NavigationManager({Key? key}) : super(key: key);

  @override
  _NavigationManagerState createState() => _NavigationManagerState();
}

class _NavigationManagerState extends State<NavigationManager> {
  int currentIndex = 0;
  final screens = [
    Apartments(),
    Search(),
    HomeScreen(), // trending page
    ProfilePage(),
  ];
  // final _auth = Get.find<AuthController>();

  bool isTenant = true;

  // tenantVsLandlord() {
  //   if () {
  //     print(_auth.userMode);
  //     setState(() {
  //       isTenant = true;
  //     });
  //   } else {
  //     print(_auth.userMode);
  //     setState(() {
  //       isTenant = false;
  //     });
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    // return buildTenantView();
    return !isTenant ? Scaffold() : buildTenantView();
  }

  Scaffold buildTenantView() {
    return Scaffold(
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        iconSize: 24,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white70,
        showUnselectedLabels: true,
        unselectedFontSize: 10,
        unselectedLabelStyle: kUbuntu15.copyWith(fontSize: 12),
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            backgroundColor: kAccentColor,
            icon: Icon(Icons.home),
            label: 'Appartments',
          ),
          BottomNavigationBarItem(
            backgroundColor: kAccentColor,
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            backgroundColor: kAccentColor,
            icon: Icon(Icons.whatshot),
            label: 'Trending',
          ),
          BottomNavigationBarItem(
            backgroundColor: kAccentColor,
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
