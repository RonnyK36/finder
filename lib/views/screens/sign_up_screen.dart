import 'package:finder/config/configurations.dart';
import 'package:finder/widgets/rounded_text_form_field.dart';
import 'package:finder/widgets/sign_up_buttons.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final formKey = GlobalKey<FormState>();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();
  bool isTenant = true;

  late int selectedRadio;

  @override
  void initState() {
    super.initState();
    selectedRadio = 0;
  }

  setSelectedRadio(val) {
    setState(() {
      selectedRadio = val;
      isTenant = !isTenant;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create an Account'),
        backgroundColor: kAccentColor,
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            // height: Config.screenHeight! * 0.99,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                buildFormFileds(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Card buildFormFileds() {
    return Card(
      elevation: 3,
      shadowColor: kAccentColor,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 10,
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Radio(
                        value: 1,
                        groupValue: selectedRadio,
                        onChanged: (val) {
                          print('Tenant');
                          setSelectedRadio(val);
                        },
                      ),
                      Text(
                        'Tenant',
                        style: kUbuntu15,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Radio(
                        value: 2,
                        groupValue: selectedRadio,
                        onChanged: (val) {
                          print('Landlord');
                          setSelectedRadio(val);
                        },
                      ),
                      Text(
                        'Landlord',
                        style: kUbuntu15,
                      ),
                    ],
                  ),
                ],
              ),
              Form(
                key: formKey,
                child: Container(
                  height: Config.screenHeight! * 0.8,
                  width: Config.screenWidth! * 0.90,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      RoundedTextFormField(
                        controller: _nameController,
                        isObscure: false,
                        icon: Icons.person,
                        validator: (val) {
                          if (val.toString().length < 3) {
                            return 'Short name';
                          } else {
                            return null;
                          }
                        },
                        labelText: "Username",
                        keyboardType: TextInputType.name,
                      ),
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
                        labelText: "Phone",
                        keyboardType: TextInputType.number,
                      ),
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
                        labelText: "Email",
                        keyboardType: TextInputType.emailAddress,
                      ),
                      RoundedTextFormField(
                        controller: _passwordController,
                        isObscure: true,
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
                        labelText: "Password",
                        keyboardType: TextInputType.visiblePassword,
                      ),
                      RoundedTextFormField(
                        controller: _confirmPasswordController,
                        isObscure: true,
                        icon: Icons.lock,
                        validator: (val) {
                          if (val.toString().trim() !=
                              _passwordController.text.trim()) {
                            return 'Passwords do not much.';
                          } else {
                            return null;
                          }
                        },
                        labelText: "Confirm password",
                        keyboardType: TextInputType.visiblePassword,
                      ),
                      SignUpButtons(
                        isTenant: isTenant,
                        formKey: formKey,
                        emailController: _emailController,
                        passwordController: _passwordController,
                        confrimPasswordController: _confirmPasswordController,
                        phoneController: _phoneController,
                        nameController: _nameController,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
