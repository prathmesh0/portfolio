import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_portfolio/constants/colors.dart';
import 'package:my_portfolio/utils/project_utils.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectCardWidget extends StatelessWidget {
  const ProjectCardWidget({
    super.key,
    required this.project,
  });
  final ProjectUtils project;

  @override
  Widget build(BuildContext context) {
    Future<void> launchURL(String url) async {
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

    return Container(
      clipBehavior: Clip.antiAlias,
      height: 290,
      width: 260,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: CustomColor.bgLight2,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            project.images,
            height: 140,
            width: 260,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(12, 15, 12, 12),
            child: Text(
              project.title,
              style: GoogleFonts.ubuntu(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: CustomColor.whitePrimary,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(12, 0, 12, 12),
            child: Text(
              project.subtitle,
              style: GoogleFonts.rubik(
                fontSize: 12,
                color: CustomColor.whiteSecondary,
              ),
            ),
          ),
          const Spacer(),
          Container(
            color: CustomColor.bgLight1,
            padding: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 10,
            ),
            child: Row(
              children: [
                Text(
                  'Available on:',
                  style: GoogleFonts.rubik(
                    color: CustomColor.yellowSecondary,
                    fontSize: 11,
                    letterSpacing: 1,
                  ),
                ),
                const Spacer(),
                InkWell(
                  onTap: () {
                    launchURL(project.gitlink);
                  },
                  child: Image.asset(
                    'assets/images/github.png',
                    width: 22,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
