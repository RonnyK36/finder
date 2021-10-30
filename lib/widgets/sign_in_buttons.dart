import 'package:finder/config/configurations.dart';
import 'package:finder/views/screens/reset_password.dart';
import 'package:finder/views/screens/sign_up_screen.dart';
import 'package:finder/widgets/reusable_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignInButtons extends StatelessWidget {
  const SignInButtons({
    Key? key,
    required this.formKey,
    required this.emailController,
    required this.passwordController,
  }) : super(key: key);

  final GlobalKey<FormState> formKey;
  final TextEditingController emailController;
  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Align(
          alignment: Alignment.centerRight,
          child: TextButton(
            child: Text('Forgot password?'),
            onPressed: () => Get.to(() => ResetPassword()),
          ),
        ),
        reusableButton(
          context,
          padding: EdgeInsets.symmetric(
              horizontal: Config.screenWidth! * 0.35,
              vertical: Config.screenHeight! * 0.015),
          label: 'Login',
          onPressed: () {
            if (formKey.currentState!.validate()) {
              String email = emailController.text.trim();
              String password = passwordController.text.trim();
            }
          },
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Row(
            children: [
              Text(
                'Don\'t have an account? ',
                style: kUbuntu15,
              ),
              TextButton(
                  onPressed: () => Get.to(() => SignUpScreen()),
                  child: Text('Sign up')),
            ],
          ),
        ),
      ],
    );
  }
}
