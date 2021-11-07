import 'package:finder/config/configurations.dart';
import 'package:finder/controllers/auth_controllers.dart';
import 'package:finder/widgets/reusable_button.dart';
import 'package:finder/widgets/rounded_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AdditionaInfo extends StatefulWidget {
  const AdditionaInfo({Key? key}) : super(key: key);

  @override
  _AdditionaInfoState createState() => _AdditionaInfoState();
}

class _AdditionaInfoState extends State<AdditionaInfo> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Account setup'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(
              'Please provide the following info:',
              style: kUbuntu15.copyWith(fontSize: 20, color: kAccentColor),
            ),
          ),
          SizedBox(height: 20),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    RoundedTextFormField(
                        controller: _phoneController,
                        isObscure: false,
                        icon: Icons.phone,
                        validator: (val) {
                          if (val.toString().length != 10) {
                            return 'Invalid phone number';
                          } else {
                            return null;
                          }
                        },
                        labelText: 'Phone',
                        keyboardType: TextInputType.phone),
                  ],
                ),
              ),
            ),
          ),
          reusableButton(
            context,
            onPressed: () {
              print(_phoneController.text.toString());
              if (_formKey.currentState!.validate()) {
                String phone = _phoneController.text.trim();

                Get.back(
                  result: phone,
                );
                // _authController.createUserInFirestore(phone);
              }
            },
            label: 'Submit',
          ),
        ],
      ),
    );
  }
}
