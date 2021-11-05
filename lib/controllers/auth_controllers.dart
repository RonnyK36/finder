import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:finder/config/configurations.dart';
import 'package:finder/views/screens/landing_page.dart';
import 'package:finder/views/screens/root.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

final tenantsRef = FirebaseFirestore.instance.collection('tenants');

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
      });
      update();

      Get.offAll(() => Root());
      Get.snackbar(
        'Welcome $displayName,',
        'Your account has been created. Please wait as we log you in',
        backgroundColor: kAccentColor,
        duration: Duration(seconds: 6),
        colorText: Colors.white,
      );
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
      Get.snackbar(
        'Error occured!',
        e.toString(),
        backgroundColor: kAccentColor,
        colorText: Colors.white,
      );
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
