import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const kBodyText = TextStyle(color: Color(0xff1565C0), fontSize: 18);
var kButtonTS = GoogleFonts.ubuntu(textStyle: TextStyle(fontSize: 20));
const kPrimaryColor = Color(0xff0d47a1);
const kErrorColor = Color(0xfffe5350);

class Config {
  static MediaQueryData? _mediaQueryData;
  static double? screenWidth;
  static double? screenHeight;
  static double? defaultSize;
  static Orientation? orientation;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenHeight = _mediaQueryData!.size.height;
    screenWidth = _mediaQueryData!.size.width;
    orientation = _mediaQueryData!.orientation;
  }
}
