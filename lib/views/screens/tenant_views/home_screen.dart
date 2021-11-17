import 'package:finder/config/configurations.dart';
import 'package:finder/controllers/auth_controllers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool? showInfo;
  @override
  Widget build(BuildContext context) {
    final _authController = Get.find<AuthController>();

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          _authController.userProfile!.displayName.toString(),
          style: kUbuntu15.copyWith(fontSize: 25),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Text('Holla'),
          // Text(
          //   'Hello ${_authController.userProfile!.displayName.toString()},',
          //   style: kUbuntu15,
          // ),
          // Text(
          //   'Your email is: ${_authController.userProfile!.email.toString()}',
          //   style: kUbuntu15,
          // ),
          // Text(_authController.phone.toString()),
          // Padding(
          //   padding: const EdgeInsets.all(8.0),
          //   child: showInfo == true
          //       ? Container(
          //           height: 150,
          //           child: Text(
          //             'Uid: ${_authController.userProfile!.uid.toString()}\nDisplayname: ${_authController.userProfile!.displayName.toString()}',
          //             style: kUbuntu15,
          //           ),
          //         )
          //       : Container(),
          // ),
          // CarouselSlider(
          //     items: [
          //       Container(
          //         height: Config.screenHeight! * 0.18,
          //         decoration: BoxDecoration(
          //           color: Colors.green,
          //           borderRadius: BorderRadius.circular(20),
          //         ),
          //       ),
          //       Container(
          //         height: Config.screenHeight! * 0.18,
          //         color: Colors.red,
          //       ),
          //       Container(
          //         height: Config.screenHeight! * 0.18,
          //         color: Colors.blue,
          //       ),
          //     ],
          //     options: CarouselOptions(
          //       enlargeCenterPage: true,
          //       autoPlay: true,
          //       autoPlayInterval: Duration(seconds: 4),
          //       autoPlayAnimationDuration: Duration(seconds: 2),
          //     )),
          // reusableButton(
          //   context,
          //   onPressed: () {
          //     setState(() {
          //       showInfo = !showInfo!;
          //     });
          //   },
          //   label: showInfo == false ? 'Get my Info' : 'Hide info',
          //   padding: EdgeInsets.symmetric(
          //     horizontal: Config.screenWidth! * 0.30,
          //     vertical: Config.screenWidth! * 0.025,
          //   ),
          // ),

          SizedBox(height: 10),
          Image.network(
              'https://avatars.githubusercontent.com/u/77696744?s=96&v=4'),
        ],
      ),
    );
  }
}
