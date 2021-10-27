import 'package:finder/config/configurations.dart';
import 'package:finder/widgets/reusable_button.dart';
import 'package:finder/widgets/rounded_text_form_field.dart';
import 'package:flutter/material.dart';

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
            child: Column(
              children: [
                buildTextFormFields(),
                Expanded(
                  flex: 1,
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      child: Text('Forgot password?'),
                      onPressed: () {},
                    ),
                  ),
                ),
                reusableButton(
                  context,
                  padding: EdgeInsets.symmetric(
                      horizontal: Config.screenWidth! * 0.35,
                      vertical: Config.screenHeight! * 0.02),
                  label: 'Login',
                  onPressed: () {},
                ),
              ],
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
