import 'package:finder/config/configurations.dart';
import 'package:finder/views/screens/home_screen.dart';
import 'package:finder/views/screens/profile_page.dart';
import 'package:flutter/material.dart';

class NavigationManager extends StatefulWidget {
  const NavigationManager({Key? key}) : super(key: key);

  @override
  _NavigationManagerState createState() => _NavigationManagerState();
}

class _NavigationManagerState extends State<NavigationManager> {
  int currentIndex = 0;
  final screens = [
    HomeScreen(),
    Center(child: Text('Apartments')),
    Center(child: Text('Hostels')),
    ProfilePage(),
  ];
  @override
  Widget build(BuildContext context) {
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
            icon: Icon(Icons.trending_up),
            label: 'Trending',
          ),
          BottomNavigationBarItem(
            backgroundColor: kAccentColor,
            icon: Icon(Icons.shop),
            label: 'Appartments',
          ),
          BottomNavigationBarItem(
            backgroundColor: kAccentColor,
            icon: Icon(Icons.house),
            label: 'Hostels',
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
