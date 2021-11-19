import 'package:finder/config/configurations.dart';
import 'package:finder/widgets/login_header.dart';
import 'package:finder/widgets/forms/reset_form.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResetPassword extends StatefulWidget {
  ResetPassword({Key? key}) : super(key: key);

  @override
  _ResetPasswordState createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  TextEditingController _emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            child: Column(
              children: [
                Align(
                  alignment: Alignment.centerRight,
                  child: IconButton(
                      onPressed: () => Get.back(), icon: Icon(Icons.close)),
                ),
                Column(
                  children: [
                    Text(
                      'Recover your password.',
                      style: kUbuntu15.copyWith(
                        fontSize: 25,
                        color: kPrimaryColor,
                      ),
                    ),
                    Card(
                      elevation: 3,
                      shadowColor: kAccentColor,
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Text(
                          'Please enter your email. You will receive an email with instruction on how to reset your password.',
                          style: kUbuntu15,
                        ),
                      ),
                    ),
                    Card(
                      elevation: 3,
                      shadowColor: kAccentColor,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Container(
                          height: Config.screenHeight! * 0.30,
                          child: ResetForm(emailController: _emailController),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
