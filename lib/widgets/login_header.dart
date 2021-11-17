import 'package:finder/config/configurations.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TitleSection extends StatelessWidget {
  const TitleSection({
    required this.title,
  });
  final String? title;

  @override
  Widget build(BuildContext context) {
    Config().init(context);
    return Container(
      height: Config.screenHeight! * 0.2,
      child: Align(
        alignment: Alignment.bottomLeft,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.all(5.0),
              child: Align(
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      title!,
                      style: GoogleFonts.ubuntu(
                        textStyle: TextStyle(
                          fontSize: Config.screenWidth! * 0.1,
                          color: kPrimaryColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Text(
                      '.',
                      style: GoogleFonts.ubuntu(
                        textStyle: TextStyle(
                          fontSize: Config.screenWidth! * 0.1,
                          color: kAccentColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: Config.screenHeight! * 0.009),
            Row(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: Config.screenWidth! * 0.03),
                    child: Text(
                      'Do you have an account? ',
                      style: kUbuntu15.copyWith(
                        fontSize: 20,
                        color: kPrimaryColor,
                      ),
                    ),
                  ),
                ),
                Text(
                  'Login',
                  style: kUbuntu15.copyWith(
                    fontSize: 20,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
