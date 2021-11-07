import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:finder/config/configurations.dart';
import 'package:finder/views/screens/add_info.dart';
import 'package:finder/views/screens/landing_page.dart';
import 'package:finder/views/screens/root.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

final tenantsRef = FirebaseFirestore.instance.collection('tenants');
final landLordsRef = FirebaseFirestore.instance.collection('landlords');

class AuthController extends GetxController {
  var displayName = '';
  String phone = '';
  FirebaseAuth auth = FirebaseAuth.instance;

  String userMode = '';
  User? get userProfile => auth.currentUser;

  @override
  void onInit() {
    getTenants();
    displayName = userProfile != null ? userProfile!.displayName! : '';
    super.onInit();
  }

  getTenants() {
    tenantsRef.get();
  }

  void signUp(
    String name,
    String phone,
    String email,
    String password,
    bool isTenant,
  ) {
    try {
      auth
          .createUserWithEmailAndPassword(
        email: email,
        password: password,
      )
          .then((value) {
        displayName = name;
        phone = phone;
        userMode = isTenant ? 'Tenant' : 'Landlord';
        auth.currentUser!.updateDisplayName(name);

        createUserInFirestore(phone);
      });
      update();

      // Get.snackbar(
      //   'Welcome ${userProfile!.displayName.toString()}',
      //   'Your account has been created. Please wait as we log you in',
      //   backgroundColor: kAccentColor,
      //   duration: Duration(seconds: 6),
      //   colorText: Colors.white,
      // );
    } on FirebaseAuthException catch (e) {
      String title = e.code.replaceAll(RegExp('-'), ' ').capitalize!;
      String message = '';
      if (e.code == 'weak-password') {
        message = 'Use a stronger password';
      } else if (e.code == 'email-already-in-use') {
        message = 'Your email has been used to register an account';
      } else {
        message = e.message.toString();
      }
      Get.snackbar(
        title,
        message,
        backgroundColor: Colors.white,
        colorText: kAccentColor,
      );
    } catch (e) {
      print(e.toString());
      // Get.snackbar(
      //   'Error occured!',
      //   e.toString(),
      //   backgroundColor: kAccentColor,
      //   colorText: Colors.white,
      // );
    }
  }

  createUserInFirestore(String phone) async {
    final User user = userProfile!;
    if (userMode == 'Tenant') {
      final doc = await tenantsRef.doc(user.uid).get();
      if (!doc.exists) {
        print('Creating tenant');
        final phone = await Get.to(() => AdditionaInfo());
        tenantsRef.doc(user.uid).set({
          "id": user.uid,
          "userMode": userMode,
          "displayName": displayName,
          "email": user.email,
          "phone": phone,
        });
        Get.offAll(() => Root());
        Get.snackbar(
          'Welcome ${userProfile!.displayName.toString()}',
          'Your account has been created. Please wait as we log you in',
          backgroundColor: kAccentColor,
          duration: Duration(seconds: 6),
          colorText: Colors.white,
        );
      }
    } else if (userMode == 'Landlord') {
      final doc = await landLordsRef.doc(user.uid).get();
      if (!doc.exists) {
        print('Creating Landlord');
        final phone = await Get.to(() => AdditionaInfo());
        landLordsRef.doc(user.uid).set({
          "id": user.uid,
          "userMode": userMode,
          "email": user.email,
          "displayName": displayName,
          "phone": phone,
        });
        Get.offAll(() => Root());
      }
    }
  }

  Future<void> login(
    String email,
    String password,
  ) async {
    try {
      await auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) {});
      update();

      Get.offAll(() => Root());
      Get.snackbar(
        'Welcome back ${userProfile!.displayName.toString()}',
        'Let\'pick up where we left off. Shall we?',
        backgroundColor: Colors.white,
        colorText: kPrimaryColor,
        overlayBlur: 5,
        duration: Duration(seconds: 4),
      );
    } on FirebaseAuthException catch (e) {
      String title = e.code.replaceAll(RegExp('-'), ' ').capitalize!;
      String message = '';
      if (e.code == 'wrong-password') {
        message = 'Provide a correct password';
      } else if (e.code == 'email-already-in-use') {
        message = 'User does not exist. Is $email correct?';
      } else {
        message = e.message.toString();
      }
      Get.snackbar(
        title,
        message,
        backgroundColor: kAccentColor,
        colorText: Colors.white,
      );
    } catch (e) {
      Get.snackbar(
        'Error occured!',
        e.toString(),
        backgroundColor: kAccentColor,
        colorText: Colors.white,
      );
    }
  }

  Future<void> resetPassword(String email) async {
    try {
      await auth.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      String title = e.code.replaceAll(RegExp('-'), ' ').capitalize!;
      String message = '';
      if (e.code == 'user-not-found') {
        message = 'User does not exist. Is $email correct?';
      } else {
        message = e.message.toString();
      }
      Get.snackbar(
        title,
        message,
        backgroundColor: kAccentColor,
        colorText: Colors.white,
      );
    } catch (e) {
      Get.snackbar(
        'An error occurred!',
        e.toString(),
        backgroundColor: kAccentColor,
        colorText: Colors.white,
      );
    }
  }

  Future<void> signOut() async {
    try {
      await auth.signOut();
      displayName = '';
      update();
      Get.offAll(() => (LandingPage()));
    } catch (e) {
      Get.snackbar(
        'An error occurred!',
        e.toString(),
        backgroundColor: kAccentColor,
        colorText: Colors.white,
      );
    }
  }
}

  // extention StringExtension; on String{
  //   String capitalizeString(){
  //     return '${this[0].toUpperCase()${this.subString[1]}}';
  //   }
  // }
