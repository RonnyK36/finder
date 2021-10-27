import 'package:finder/config/configurations.dart';
import 'package:flutter/material.dart';

class RoundedTextFormField extends StatelessWidget {
  const RoundedTextFormField({
    Key? key,
    required TextEditingController emailController,
    this.hintText,
    this.isObscure,
    this.validator,
  })  : _emailController = emailController,
        super(key: key);

  final TextEditingController _emailController;
  final String? hintText;
  final bool? isObscure;
  final validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _emailController,
      obscureText: isObscure!,
      validator: validator,
      decoration: InputDecoration(
        hintText: hintText,
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: 2,
            color: kAccentColor,
          ),
          borderRadius: BorderRadius.circular(30),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: kPrimaryColor),
          borderRadius: BorderRadius.circular(30),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: kErrorColor),
          borderRadius: BorderRadius.circular(30),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: 2,
            color: kAccentColor,
          ),
          borderRadius: BorderRadius.circular(30),
        ),
      ),
    );
  }
}
