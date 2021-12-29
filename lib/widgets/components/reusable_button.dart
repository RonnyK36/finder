import 'package:finder/config/configurations.dart';
import 'package:flutter/material.dart';

Container reusableButton(
  context, {
  required VoidCallback onPressed,
  required String label,
}) {
  return Container(
    // padding: padding,
    height: Config.screenHeight! * 0.088,
    width: Config.screenWidth!,
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 3,
          primary: kAccentColor,
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
      ),
    ),
  );
}
