import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_portfolio/constants/colors.dart';
import 'package:my_portfolio/constants/nav_item.dart';
import 'package:my_portfolio/styles/style.dart';
import 'package:my_portfolio/widgets/side_logo.dart';

class HeaderDeskTop extends StatelessWidget {
  const HeaderDeskTop({
    super.key,
    required this.onNavMenuTap,
  });
  final Function(int) onNavMenuTap;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      margin: const EdgeInsets.symmetric(
        vertical: 10.0,
        horizontal: 20.0,
      ),
      width: double.maxFinite,
      decoration: kHeaderDecoration,
      child: Row(children: [
        const SideLogo(
            
            ),
        const Spacer(),
        for (int i = 0; i < navTitles.length; i++)
          Padding(
            padding: const EdgeInsets.only(
              right: 20,
            ),
            child: TextButton(
              onPressed: () {
                onNavMenuTap(i);
              },
              child: Text(
                navTitles[i],
                style: GoogleFonts.rubik(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: CustomColor.whitePrimary,
                ),
              ),
            ),
          ),
      ]),
    );
  }
}
