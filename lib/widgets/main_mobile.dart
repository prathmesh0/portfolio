import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_portfolio/constants/colors.dart';
import 'package:url_launcher/url_launcher.dart';

class MainMobile extends StatefulWidget {
  const MainMobile({super.key});

  @override
  State<MainMobile> createState() => _MainMobileState();
}

class _MainMobileState extends State<MainMobile> {
  Future<void> _launchURL(String url) async {
    final Uri urll = Uri.parse(url);

    if (!await launchUrl(urll)) {
      throw Exception('Could not launch $urll');
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;

    const String url =
        'https://drive.google.com/drive/u/0/folders/1xPMaAQ77g2_IapqVtSltYF5O1UdC_dbZ';
    const String textWithEmoji =
        "As a software developer, I bring innovation to life through code, exploring diverse tech realms. Let's craft the extraordinary! 🚀🖥️";

    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 40.0,
        vertical: 30.0,
      ),
      constraints: const BoxConstraints(minHeight: 560.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            backgroundColor: Colors.black,
            radius: screenWidth / 3.5,
            backgroundImage: const AssetImage('assets/images/myphoto.png'),
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    spreadRadius: 6,
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          //intro
          SizedBox(
            height: 110,
            child: AnimatedTextKit(
              animatedTexts: [
                TypewriterAnimatedText(
                  "Hi, \nI'm Prathmesh Parab\n Software Developer",
                  textStyle: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: CustomColor.whitePrimary,
                    height: 1.5,
                  ),
                  speed: const Duration(milliseconds: 150),
                ),
              ],
              totalRepeatCount: 20,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            width: 250,
            child: ShaderMask(
              shaderCallback: (Rect bounds) {
                return const LinearGradient(
                  colors: [
                    CustomColor.whitePrimary,
                    Color.fromARGB(255, 35, 131, 210),
                  ],
                ).createShader(bounds);
              },
              child: Text(
                "Welcome to my portfolio!",
                style: GoogleFonts.rubik(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: CustomColor.whitePrimary,
                  letterSpacing: 0.3,
                ),
                textAlign: TextAlign.left,
              ),
            ),
          ),
          const SizedBox(
            height: 3,
          ),
          SizedBox(
            width: 250,
            height: 110,
            child: Text(
              textWithEmoji,
              style: GoogleFonts.rubik(
                fontSize: 15,
                color: CustomColor.whitePrimary,
                height: 1.5,
                letterSpacing: 0.2,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          const SizedBox(
            height: 18,
          ),
          SizedBox(
            width: 180,
            child: ElevatedButton(
              onPressed: () {
                _launchURL(url);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: CustomColor.buttonOrange,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
              ),
              child: Text(
                "Resume",
                style: GoogleFonts.rubik(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: CustomColor.whitePrimary,
                  letterSpacing: 1.0,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
