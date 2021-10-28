import 'package:finder/config/configurations.dart';
import 'package:finder/views/screens/home_screen.dart';
import 'package:finder/widgets/rounded_text_form_field.dart';
import 'package:finder/widgets/sign_in_buttons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignInForm extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Config.screenHeight! * 0.51,
      child: Form(
        child: Card(
          elevation: 5,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  buildTextFormFields(),
                  SignInButtons(
                    label: 'Login',
                    onPressed: () => Get.to(() => HomeScreen()),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Column buildTextFormFields() {
    return Column(
      children: [
        RoundedTextFormField(
          labelText: 'Email',
          icon: Icons.person,
          validator: null,
          isObscure: false,
          emailController: _emailController,
        ),
        SizedBox(height: Config.screenHeight! * 0.015),
        RoundedTextFormField(
          icon: Icons.lock,
          validator: null,
          labelText: 'Password',
          isObscure: true,
          emailController: _passwordController,
        ),
      ],
    );
  }
}
