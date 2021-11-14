import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:finder/config/configurations.dart';
import 'package:finder/controllers/auth_controllers.dart';
import 'package:finder/views/screens/landlord_views/add_apartments.dart';
import 'package:finder/views/screens/tenant_views/apartments.dart';
import 'package:finder/views/screens/tenant_views/home_screen.dart';
import 'package:finder/views/screens/landlord_views/notifications.dart';
import 'package:finder/views/screens/shared_view/profile_page.dart';
import 'package:finder/views/screens/tenant_views/search.dart';
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
  final tenantScreens = [
    Apartments(),
    Search(),
    HomeScreen(), // trending page
    ProfilePage(),
  ];

  final landlordScreens = [
    AddApartment(),
    Notifications(),
    ProfilePage(),
  ];

  // final _auth = Get.find<AuthController>();

  // bool isTenant = true;

  // tenantVsLandlord() {
  //   if (_auth.userMode == 'Tenant') {
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
    return Scaffold(
      body: GetBuilder<AuthController>(
        builder: (_) {
          return SafeArea(
            // child: buildTenantView(),
            child: _.userMode == 'Landlord'
                ? buildLandlordview()
                : buildTenantView(),
          );
        },
      ),
    );
  }

  Scaffold buildLandlordview() {
    return Scaffold(
      body: landlordScreens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        iconSize: 24,
        // selectedItemColor: Colors.white,
        unselectedItemColor: kAccentColor,
        showUnselectedLabels: true,
        unselectedFontSize: 9,
        unselectedLabelStyle: kUbuntu15.copyWith(fontSize: 13),
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            // backgroundColor: Colors.red,
            icon: Icon(Icons.add),
            label: 'Add new',
          ),
          BottomNavigationBarItem(
            // backgroundColor: kAccentColor,
            icon: Icon(Icons.notifications),
            label: 'Notifications',
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

  Scaffold buildTenantView() {
    return Scaffold(
      body: tenantScreens[currentIndex],
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
