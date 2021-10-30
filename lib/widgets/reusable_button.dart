import 'package:finder/config/configurations.dart';
import 'package:flutter/material.dart';

ElevatedButton reusableButton(
  context, {
  required VoidCallback onPressed,
  required String label,
  required padding,
}) {
  return ElevatedButton(
    style: ElevatedButton.styleFrom(
      elevation: 3,
      padding: padding,
      primary: Theme.of(context).primaryColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25),
      ),
    ),
    onPressed: onPressed,
    child: Text(
      label,
      // style: GoogleFonts.ubuntu(textStyle: kButtonTS),
      style: kButtonTS,
    ),
  );
}
