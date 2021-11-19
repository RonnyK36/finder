import 'package:finder/config/configurations.dart';
import 'package:finder/controllers/auth_controllers.dart';
import 'package:finder/widgets/components/reusable_button.dart';
import 'package:finder/widgets/components/rounded_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResetForm extends StatefulWidget {
  ResetForm({required this.emailController});
  final TextEditingController emailController;
  @override
  _ResetFormState createState() => _ResetFormState();
}

class _ResetFormState extends State<ResetForm> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final _authController = Get.find<AuthController>();
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RoundedTextFormField(
              controller: _emailController,
              isObscure: false,
              icon: Icons.email,
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
              labelText: 'Email',
              keyboardType: TextInputType.emailAddress,
            ),
            SizedBox(
              height: Config.screenHeight! * 0.015,
            ),
            reusableButton(
              context,
              // padding: EdgeInsets.symmetric(
              //     horizontal: Config.screenWidth! * 0.35,
              //     vertical: Config.screenHeight! * 0.015),
              label: 'Reset',
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  String email = _emailController.text.trim();
                  _authController.resetPassword(email);
                }
              },
            ),
          ],
        )),
      ),
    );
  }
}
