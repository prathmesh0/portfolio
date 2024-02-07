import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_portfolio/constants/colors.dart';
import 'package:my_portfolio/constants/skill_item.dart';
import 'package:url_launcher/url_launcher.dart';

class SkillsMobile extends StatefulWidget {
  const SkillsMobile({super.key});

  @override
  State<SkillsMobile> createState() => _SkillsMobileState();
}

class _SkillsMobileState extends State<SkillsMobile> {
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
    return ConstrainedBox(
      constraints: const BoxConstraints(
        maxWidth: 500.0,
      ),
      child: Column(
        children: [
          for (int i = 0; i < platFormItems.length; i++)
            InkWell(
              onTap: () {
                _launchURL(platFormItems[i]["link"]);
              },
              child: Container(
                margin: const EdgeInsets.only(bottom: 5.0),
                width: double.maxFinite,
                decoration: BoxDecoration(
                  color: CustomColor.bgLight2,
                  borderRadius: BorderRadius.circular(5.0),
                ),
                child: ListTile(
                  contentPadding: const EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 20.0,
                  ),
                  leading: Image.asset(
                    platFormItems[i]["img"],
                    width: 26.0,
                  ),
                  title: Text(platFormItems[i]["title"],
                      style: GoogleFonts.notoSans()),
                ),
              ),
            ),
          const SizedBox(
            height: 50.0,
          ),
          Wrap(
            spacing: 10.0,
            runSpacing: 10.0,
            alignment: WrapAlignment.center,
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
        ],
      ),
    );
  }
}
