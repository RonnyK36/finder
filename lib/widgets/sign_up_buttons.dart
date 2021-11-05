import 'package:finder/config/configurations.dart';
import 'package:finder/controllers/auth_controllers.dart';
import 'package:finder/views/screens/login_ui_screen.dart';

import 'package:finder/widgets/reusable_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpButtons extends StatelessWidget {
  const SignUpButtons({
    required GlobalKey<FormState> formKey,
    required bool isTenant,
    required TextEditingController emailController,
    required TextEditingController phoneController,
    required TextEditingController nameController,
    required TextEditingController passwordController,
    required TextEditingController confrimPasswordController,
  })  : _formKey = formKey,
        _isTenant = isTenant,
        _nameController = nameController,
        _phoneController = phoneController,
        _emailController = emailController,
        _passwordController = passwordController;

  final GlobalKey<FormState> _formKey;
  final TextEditingController _emailController;
  final TextEditingController _phoneController;
  final TextEditingController _nameController;
  final TextEditingController _passwordController;
  final bool _isTenant;

  @override
  Widget build(BuildContext context) {
    final _authController = Get.find<AuthController>();

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        reusableButton(
          context,
          // padding: EdgeInsets.symmetric(
          //     horizontal: Config.screenWidth! * 0.35,
          //     vertical: Config.screenHeight! * 0.015),
          label: 'Sign up',
          onPressed: () {
            print(_nameController.text.capitalize);
            if (_formKey.currentState!.validate()) {
              print('Valid form');
              String name = _nameController.text.trim();
              String phone = _phoneController.text.trim();
              String email = _emailController.text.trim();
              String password = _passwordController.text.trim();
              bool isTenant = _isTenant;
              _authController.signUp(name, phone, email, password, isTenant);
            }
          },
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Row(
            children: [
              Text(
                'Already have an account? ',
                style: kUbuntu15,
              ),
              TextButton(
                  onPressed: () => Get.to(() => LoginPage()),
                  child: Text('Login')),
            ],
          ),
        ),
      ],
    );
  }
}
