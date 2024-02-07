import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_emoji/flutter_emoji.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_portfolio/constants/colors.dart';
import 'package:url_launcher/url_launcher.dart';

class MainDesktop extends StatefulWidget {
  const MainDesktop({super.key});

  @override
  State<MainDesktop> createState() => _MainDesktopState();
}

class _MainDesktopState extends State<MainDesktop> {
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
    final screenHeight = screenSize.height;
    const String url =
        'https://drive.google.com/drive/u/0/folders/1xPMaAQ77g2_IapqVtSltYF5O1UdC_dbZ';

    const String textWithEmoji =
        "As a software developer, I bring innovation to life through code, exploring diverse tech realms. Let's craft the extraordinary! 🚀🖥️";

    final parser = EmojiParser();
    final emojiText = parser.emojify(textWithEmoji);
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      height: screenHeight / 1.2,
      constraints: const BoxConstraints(
        minHeight: 350.0,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 150,
                child: AnimatedTextKit(
                  animatedTexts: [
                    TypewriterAnimatedText(
                      "Hi, \nI'm Prathmesh Parab\n Software Developer",
                      textStyle: GoogleFonts.ubuntu(
                        fontSize: 30,
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
                height: 30,
              ),
              SizedBox(
                width: 300,
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
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0.3,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              SizedBox(
                width: 300,
                height: 120,
                child: Text(
                  emojiText,
                  style: GoogleFonts.rubik(
                    fontSize: 16,
                    height: 1.5,
                    letterSpacing: 0.3,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
              SizedBox(
                width: 250,
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
              ),
            ],
          ),
          CircleAvatar(
            backgroundColor: Colors.black,
            radius: screenWidth / 6,
            backgroundImage: const AssetImage('assets/images/myphoto.png'),
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
