import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:finder/config/configurations.dart';
import 'package:finder/controllers/auth_controllers.dart';
import 'package:finder/views/screens/landlord_views/add_apartments.dart';
import 'package:finder/views/screens/landlord_views/manage_apartments.dart';
import 'package:finder/views/screens/landlord_views/notifications.dart';
import 'package:finder/views/screens/shared_view/profile_page.dart';
import 'package:finder/views/screens/tenant_views/apartments.dart';
import 'package:finder/views/screens/tenant_views/home_screen.dart';
import 'package:finder/views/screens/tenant_views/search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

final tenantsRef = FirebaseFirestore.instance.collection('tenants').get();
final landLordsRef = FirebaseFirestore.instance.collection('landlords').get();

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
    // HomeScreen(), // trending page
    ProfilePage(),
  ];
  // final _auth = Get.find<AuthController>();
  // final String uid = _auth.userProfile!.uid;

  final landlordScreens = [
    AddApartment(),
    ManageApartments(),
    // Notifications(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<AuthController>(
        builder: (_) {
          return SafeArea(
            // child: buildTenantView(),
            child: buildLandlordView(),
            // child: _.userMode == 'Landlord'
            //     ? buildLandlordView()
            //     : buildTenantView(),
          );
        },
      ),
    );
  }

  Scaffold buildLandlordView() {
    return Scaffold(
      body: IndexedStack(
        index: currentIndex,
        children: [...landlordScreens],
      ),
      bottomNavigationBar: BottomNavigationBar(
        iconSize: 24,
        selectedItemColor: Colors.green,
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
            label: 'Upload new',
          ),
          BottomNavigationBarItem(
            // backgroundColor: Colors.red,
            icon: Icon(Icons.manage_accounts),
            label: 'Manage',
          ),
          // BottomNavigationBarItem(
          //   // backgroundColor: kAccentColor,
          //   icon: Icon(Icons.notifications),
          //   label: 'Notifications',
          // ),
          BottomNavigationBarItem(
            // backgroundColor: kAccentColor,
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }

  Scaffold buildTenantView() {
    return Scaffold(
      body: IndexedStack(
        index: currentIndex,
        children: [...tenantScreens],
      ),
      bottomNavigationBar: BottomNavigationBar(
        iconSize: 24,
        selectedItemColor: Colors.green,
        unselectedItemColor: kAccentColor,
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
            // backgroundColor: kAccentColor,
            icon: Icon(Icons.home),
            label: 'Appartments',
          ),
          BottomNavigationBarItem(
            // backgroundColor: kAccentColor,
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          // BottomNavigationBarItem(
          //   // backgroundColor: kAccentColor,
          //   icon: Icon(Icons.whatshot),
          //   label: 'Trending',
          // ),
          BottomNavigationBarItem(
            // backgroundColor: kAccentColor,
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
