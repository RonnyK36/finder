import 'package:finder/config/configurations.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TitleSection extends StatelessWidget {
  const TitleSection({
    @required this.title,
  });
  final String? title;

  @override
  Widget build(BuildContext context) {
    Config().init(context);
    return Container(
      height: Config.screenHeight! * 0.1,
      child: Align(
        alignment: Alignment.bottomLeft,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.all(5.0),
              child: Row(
                children: [
                  Text(
                    'Welcome to ',
                    style: GoogleFonts.ubuntu(
                      textStyle: TextStyle(
                        fontSize: Config.screenWidth! * 0.1,
                      ),
                    ),
                  ),
                  Text(
                    title!,
                    style: GoogleFonts.ubuntu(
                      textStyle: TextStyle(
                          fontSize: Config.screenWidth! * 0.1,
                          color: kPrimaryColor),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: Config.screenHeight! * 0.009),
          ],
        ),
      ),
    );
  }
}
