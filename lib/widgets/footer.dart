import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_portfolio/constants/colors.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20),
      width: double.maxFinite,
      alignment: Alignment.center,
      child: Text(
        'Made by Prathmesh with Flutter 3.16',
        style: GoogleFonts.ubuntu(
          color: CustomColor.whiteSecondary,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}
