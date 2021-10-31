import 'package:carousel_slider/carousel_slider.dart';
import 'package:finder/config/configurations.dart';
import 'package:finder/controllers/auth_controllers.dart';
import 'package:finder/widgets/reusable_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final _authController = Get.find<AuthController>();
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Column(
          children: [
            Text('Hello ${_authController.displayName.toString()}'),
            CarouselSlider(
                items: [
                  Container(
                    height: Config.screenHeight! * 0.18,
                    color: Colors.green,
                  ),
                  Container(
                    height: Config.screenHeight! * 0.18,
                    color: Colors.red,
                  ),
                  Container(
                    height: Config.screenHeight! * 0.18,
                    color: Colors.blue,
                  ),
                ],
                options: CarouselOptions(
                  enlargeCenterPage: true,
                  autoPlay: true,
                  autoPlayInterval: Duration(seconds: 4),
                  autoPlayAnimationDuration: Duration(seconds: 2),
                )),
            reusableButton(
              context,
              onPressed: () => _authController.signOut(),
              label: 'Logout',
              padding: EdgeInsets.all(10),
            ),
          ],
        ),
      ),
    );
  }
}
