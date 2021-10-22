import 'package:finder/config/configurations.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ElevatedButton reusableButton(
  context, {
  VoidCallback? onPressed,
  String? buttonName,
  IconData? icon,
}) {
  return ElevatedButton(
    style: ElevatedButton.styleFrom(
      elevation: 3,
      primary: Theme.of(context).primaryColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18),
      ),
    ),
    onPressed: onPressed,
    child: Container(
      width: MediaQuery.of(context).size.width * 0.75,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            buttonName!,
            // style: GoogleFonts.ubuntu(textStyle: kButtonTS),
            style: kButtonTS,
          ),
          Icon(icon),
        ],
      ),
    ),
  );
}
