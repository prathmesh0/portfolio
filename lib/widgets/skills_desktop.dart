import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_portfolio/constants/colors.dart';
import 'package:my_portfolio/constants/skill_item.dart';
import 'package:url_launcher/url_launcher.dart';

class SkillsDesktop extends StatefulWidget {
  const SkillsDesktop({super.key});

  @override
  State<SkillsDesktop> createState() => _SkillsDesktopState();
}

class _SkillsDesktopState extends State<SkillsDesktop> {
  Future<void> _launchURL(String url) async {
    if (url.endsWith('gmail.com')) {
      final Uri emailLaunchUri = Uri(
        scheme: 'mailto',
        path: 'prathmeshparab12.o@gmail.com',
      );
      await launchUrl(emailLaunchUri);
    } else {
      final Uri urll = Uri.parse(url);
      // For other URLs (e.g., LinkedIn or GitHub), check if the URL is launchable
      if (!await launchUrl(urll)) {
        throw Exception('Could not launch $urll');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        //platform
        ConstrainedBox(
          constraints: const BoxConstraints(
            maxWidth: 450,
          ),
          child: Wrap(
            spacing: 5.0,
            runSpacing: 5.0,
            children: [
              for (int i = 0; i < platFormItems.length; i++)
                InkWell(
                  onTap: () {
                    _launchURL(platFormItems[i]["link"]);
                  },
                  child: Container(
                    width: 200,
                    decoration: BoxDecoration(
                      color: CustomColor.bgLight2,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: ListTile(
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 20.0,
                        vertical: 10.0,
                      ),
                      leading: Image.asset(
                        platFormItems[i]["img"],
                        width: 28,
                      ),
                      title: Text(
                        platFormItems[i]["title"],
                        style: GoogleFonts.notoSans(),
                      ),
                    ),
                  ),
                )
            ],
          ),
        ),
        const SizedBox(
          width: 50,
        ),

        Flexible(
          child: ConstrainedBox(
            constraints: const BoxConstraints(
              maxWidth: 500,
            ),
            child: Wrap(
              spacing: 10.0,
              runSpacing: 10.0,
              children: [
                for (int i = 0; i < skillsItem.length; i++)
                  Chip(
                    padding: const EdgeInsets.symmetric(
                      vertical: 12.0,
                      horizontal: 16.0,
                    ),
                    backgroundColor: CustomColor.bgLight2,
                    label: Text(skillsItem[i]["title"],
                        style: GoogleFonts.notoSans()),
                    avatar: Image.asset(skillsItem[i]["img"]),
                  ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
