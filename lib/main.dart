import 'package:finder/views/screens/root.dart';
import 'package:finder/widgets/controller_bindings.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// Initialize firebase
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: ControllerBindings(),
      title: 'Finder',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'NotoSansMono-Regular',
        primaryColor: Color(0xff0d47a1),
        accentColor: Color(0xff6061fa),
      ),
      home: Root(),
    );
  }
}
