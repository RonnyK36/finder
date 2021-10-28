import 'package:carousel_slider/carousel_slider.dart';
import 'package:finder/config/configurations.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Column(
          children: [
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
          ],
        ),
      ),
    );
  }
}
