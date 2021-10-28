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
      height: Config.screenHeight! * 0.5,
      child: Form(
        child: Card(
          elevation: 5,
          child: Padding(
            padding: EdgeInsets.all(10),
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
          hintText: 'Email',
          isObscure: false,
          emailController: _emailController,
        ),
        SizedBox(height: Config.screenHeight! * 0.02),
        RoundedTextFormField(
          hintText: 'Password',
          isObscure: true,
          emailController: _passwordController,
        ),
      ],
    );
  }
}
