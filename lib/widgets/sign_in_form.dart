import 'package:finder/config/configurations.dart';
import 'package:finder/widgets/rounded_text_form_field.dart';
import 'package:finder/widgets/sign_in_buttons.dart';
import 'package:flutter/material.dart';

class SignInForm extends StatefulWidget {
  @override
  _SignInFormState createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      shadowColor: kAccentColor,
      child: Container(
        height: Config.screenHeight! * 0.52,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: Config.screenWidth! * 0.03),
                child: Text(
                  'Log in if you have an account',
                  style: kUbuntu15.copyWith(fontSize: 20, color: kAccentColor),
                ),
              ),
            ),
            SizedBox(height: Config.screenHeight! * 0.006),
            Form(
              key: _formKey,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      buildTextFormFields(),
                      SignInButtons(
                        emailController: _emailController,
                        passwordController: _passwordController,
                        formKey: _formKey,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Column buildTextFormFields() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        RoundedTextFormField(
          keyboardType: TextInputType.emailAddress,
          controller: _emailController,
          labelText: 'Email',
          icon: Icons.person,
          validator: (val) {
            bool _isEmailValid = RegExp(
                    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                .hasMatch(val);
            if (!_isEmailValid) {
              return 'Invalid Email';
            } else {
              return null;
            }
          },
          isObscure: false,
        ),
        SizedBox(
          height: Config.screenHeight! * 0.030,
        ),
        RoundedTextFormField(
          keyboardType: TextInputType.visiblePassword,
          icon: Icons.lock,
          validator: (val) {
            if (val.toString().length < 6) {
              return 'Try a stronger password';
            } else if (val.toString() == '') {
              return 'Password can not be empty';
            } else {
              return null;
            }
          },
          labelText: 'Password',
          isObscure: true,
          controller: _passwordController,
        ),
      ],
    );
  }
}
