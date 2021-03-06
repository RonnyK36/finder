import 'package:finder/config/configurations.dart';
import 'package:finder/controllers/auth_controllers.dart';
import 'package:finder/views/screens/auth_views/reset_password.dart';
import 'package:finder/views/screens/auth_views/sign_up_screen.dart';
import 'package:finder/widgets/components/reusable_button.dart';
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
    final _authController = Get.find<AuthController>();
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Align(
          alignment: Alignment.centerRight,
          child: TextButton(
            child: Text(
              'Forgot password?',
              style: kUbuntu15.copyWith(
                  fontSize: 15, color: kPrimaryColor, wordSpacing: 1),
            ),
            onPressed: () => Get.to(() => ResetPassword()),
          ),
        ),
        reusableButton(
          context,
          label: 'Login',
          onPressed: () {
            if (formKey.currentState!.validate()) {
              String email = emailController.text.trim();
              String password = passwordController.text.trim();
              _authController.login(email, password);
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
                  child: Text(
                    'Sign up',
                    style: kUbuntu15,
                  )),
            ],
          ),
        ),
      ],
    );
  }
}
