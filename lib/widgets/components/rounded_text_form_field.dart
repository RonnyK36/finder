import 'package:finder/config/configurations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class RoundedTextFormField extends StatelessWidget {
  const RoundedTextFormField({
    Key? key,
    required TextEditingController controller,
    // this.hintText,
    required this.isObscure,
    required this.icon,
    required this.validator,
    required this.labelText,
    required this.keyboardType,
  })  : controller = controller,
        super(key: key);

  final TextEditingController controller;
  final IconData icon;
  final String labelText;
  final bool isObscure;
  final validator;
  final TextInputType keyboardType;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      keyboardType: keyboardType,
      controller: controller,
      obscureText: isObscure,
      validator: validator,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(vertical: 10),
        prefixIcon: Icon(icon),
        labelText: labelText,
        alignLabelWithHint: true,
        labelStyle: TextStyle(fontSize: 20),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: 2,
            color: kAccentColor,
          ),
          borderRadius: BorderRadius.circular(16),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: kPrimaryColor),
          borderRadius: BorderRadius.circular(16),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: kErrorColor),
          borderRadius: BorderRadius.circular(16),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: 2,
            color: kAccentColor,
          ),
          borderRadius: BorderRadius.circular(16),
        ),
      ),
    );
  }
}
