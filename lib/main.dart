import 'package:finder/views/screens/auth_views/root.dart';
import 'package:finder/views/screens/shared_view/landing_page.dart';
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
        primaryColor: Color(0xff0d47a1),
        colorScheme:
            ColorScheme.fromSwatch().copyWith(secondary: Color(0xff6061fa)),
      ),
      home: LandingPage(),
    );
  }
}
