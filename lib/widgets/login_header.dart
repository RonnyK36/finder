import 'package:finder/config/configurations.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TitleSection extends StatelessWidget {
  const TitleSection({@required this.title, @required this.subtitle});
  final String? title, subtitle;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title!,
              style: GoogleFonts.ubuntu(
                textStyle: TextStyle(
                    fontSize: Config.screenWidth! * 0.1, color: kPrimaryColor),
              )),
          SizedBox(height: Config.screenHeight! * 0.005),
          Text(
            subtitle!,
            style: GoogleFonts.ubuntu(textStyle: kBodyText),
          ),
          SizedBox(height: Config.screenHeight! * 0.005),
        ],
      ),
    );
  }
}
