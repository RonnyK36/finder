import 'package:finder/config/configurations.dart';
import 'package:finder/views/screens/home_screen.dart';
import 'package:finder/widgets/rounded_text_form_field.dart';
import 'package:finder/widgets/sign_in_buttons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
    return Container(
      height: Config.screenHeight! * 0.51,
      child: Form(
        key: _formKey,
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
                    emailController: _emailController,
                    passwordController: _passwordController,
                    formKey: _formKey,
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
          keyboardType: TextInputType.emailAddress,
          controller: _emailController,
          labelText: 'Email',
          icon: Icons.person,
          validator: null,
          // validator: (val) {
          //   bool _isEmailValid = RegExp(
          //           r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
          //       .hasMatch(val);
          //   if (!_isEmailValid) {
          //     return 'Invalid Email';
          //   } else {
          //     return null;
          //   }
          // },
          isObscure: false,
        ),
        SizedBox(height: Config.screenHeight! * 0.015),
        RoundedTextFormField(
          keyboardType: TextInputType.visiblePassword,
          icon: Icons.lock,
          validator: null,
          // validator: (val) {
          //   if (val.toString().length < 6) {
          //     return 'Try a stronger password';
          //   } else if (val.toString() == '') {
          //     return 'Password can not be empty';
          //   } else {
          //     return null;
          //   }
          // },
          labelText: 'Password',
          isObscure: true,
          controller: _passwordController,
        ),
      ],
    );
  }
}
