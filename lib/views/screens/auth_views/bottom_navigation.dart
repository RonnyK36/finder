import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:finder/config/configurations.dart';
import 'package:finder/views/screens/landlord_views/add_apartments.dart';
import 'package:finder/views/screens/landlord_views/manage_apartments.dart';
import 'package:finder/views/screens/landlord_views/profile_page.dart';
import 'package:finder/views/screens/tenant_views/apartments.dart';
import 'package:finder/views/screens/tenant_views/profile_screen.dart';
import 'package:finder/views/screens/tenant_views/search.dart';
import 'package:flutter/material.dart';

class NavigationManager extends StatefulWidget {
  NavigationManager({required this.uid});
  final String uid;

  @override
  _NavigationManagerState createState() => _NavigationManagerState();
}

class _NavigationManagerState extends State<NavigationManager> {
  int currentIndex = 1;
  get uid => widget.uid;

  final tenantScreens = [
    Search(),
    Apartments(),
    TenantProfile(),
  ];

  CollectionReference landLordsRef =
      FirebaseFirestore.instance.collection('landlords');

  final landlordScreens = [
    AddApartment(),
    ManageApartments(),
    LandlordProfile(),
  ];
  bool isTenant = true;

  getUserMode(uid) async {
    DocumentSnapshot doc = await landLordsRef.doc(uid).get();
    print(doc.exists);
    if (doc.exists) {
      setState(() {
        isTenant = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    getUserMode(uid);
  }

  @override
  Widget build(BuildContext context) {
    return isTenant ? buildTenantView() : buildLandlordView();
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
            icon: Icon(Icons.phone),
            label: 'Call search',
          ),
          BottomNavigationBarItem(
            // backgroundColor: kAccentColor,
            icon: Icon(Icons.home),
            label: 'Apartments',
          ),
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
