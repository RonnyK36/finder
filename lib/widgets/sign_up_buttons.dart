import 'package:finder/config/configurations.dart';
import 'package:finder/controllers/auth_controllers.dart';
import 'package:finder/views/screens/login_ui_screen.dart';

import 'package:finder/widgets/reusable_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpButtons extends StatefulWidget {
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
  _SignUpButtonsState createState() => _SignUpButtonsState();
}

class _SignUpButtonsState extends State<SignUpButtons> {
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    final _authController = Get.find<AuthController>();

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        reusableButton(
          context,
          label: 'Sign up',
          onPressed: () {
            print(widget._nameController.text.capitalize);
            if (widget._formKey.currentState!.validate()) {
              setState(() {
                isLoading = true;
              });
              print('Valid form');

              String name = widget._nameController.text.trim();
              String phone = widget._phoneController.text.trim();
              String email = widget._emailController.text.trim();
              String password = widget._passwordController.text.trim();
              bool isTenant = widget._isTenant;
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
