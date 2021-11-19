import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class UploadTextFormField extends StatelessWidget {
  const UploadTextFormField({
    Key? key,
    required TextEditingController controller,
    // this.hintText,

    required this.prefixText,
    required this.validator,
    required this.labelText,
    required this.keyboardType,
  })  : controller = controller,
        super(key: key);

  final TextEditingController controller;
  final String prefixText;

  final String labelText;

  final validator;
  final TextInputType keyboardType;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      scrollPadding: EdgeInsets.all(20),
      autovalidateMode: AutovalidateMode.onUserInteraction,
      keyboardType: keyboardType,
      controller: controller,
      validator: validator,
      decoration: InputDecoration(
        prefixText: prefixText,
        contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        labelText: labelText,
        alignLabelWithHint: true,
        labelStyle: TextStyle(fontSize: 20),
        // focusedBorder: OutlineInputBorder(
        //   borderSide: BorderSide(
        //     width: 2,
        //     color: kAccentColor,
        //   ),
        //   borderRadius: BorderRadius.circular(16),
        // ),
        // enabledBorder: OutlineInputBorder(
        //   borderSide: BorderSide(color: kPrimaryColor),
        //   borderRadius: BorderRadius.circular(16),
        // ),
        // errorBorder: OutlineInputBorder(
        //   borderSide: BorderSide(color: kErrorColor),
        //   borderRadius: BorderRadius.circular(16),
        // ),
        // focusedErrorBorder: OutlineInputBorder(
        //   borderSide: BorderSide(
        //     width: 2,
        //     color: kAccentColor,
        //   ),
        //   borderRadius: BorderRadius.circular(16),
        // ),
      ),
    );
  }
}
