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
      themeMode: ThemeMode.dark,
      darkTheme: ThemeData.dark().copyWith(
        primaryColor: Color(0xff0d47a1),
        primaryColorDark: Color(0xff0d47a1),
        scaffoldBackgroundColor: Color(0xff0d47a1),
        textSelectionTheme: TextSelectionThemeData(
          cursorColor: Color(0xff6061fa),
        ),
        accentColor: Color(0xff6061fa),
      ),
      home: Root(),
    );
  }
}
