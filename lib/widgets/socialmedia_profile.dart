import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class SocialMediaProfile extends StatelessWidget {
  final String images;
  final String url;

  const SocialMediaProfile({
    super.key,
    required this.images,
    required this.url,
  });

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

    return InkWell(
      onTap: () {
        launchURL(url);
      },
      child: Container(
        width: 28,
        decoration: BoxDecoration(
          borderRadius:
              BorderRadius.circular(12), 
          color: Colors.transparent, 
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12), 
          child: Image.asset(
            images,
            fit: BoxFit.cover, 
          ),
        ),
      ),
    );
  }
}
