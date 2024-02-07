import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_portfolio/constants/colors.dart';
import 'package:my_portfolio/constants/size.dart';
import 'package:my_portfolio/widgets/custom_textfield.dart';
import 'package:my_portfolio/widgets/socialmedia_profile.dart';
import 'package:http/http.dart' as http;

class ContactSection extends StatefulWidget {
  const ContactSection({super.key});

  @override
  State<ContactSection> createState() => _ContactSectionState();
}

class _ContactSectionState extends State<ContactSection> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController messageController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Future sendEmail() async {
    const serviceid = 'service_ocrmjad';
    const templateid = 'template_9y12j37';
    const userid = 'TGCpR79ZPk5UgFbLw';

    final url = Uri.parse('https://api.emailjs.com/api/v1.0/email/send');
    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
      },
      body: json.encode({
        'service_id': serviceid,
        'template_id': templateid,
        'user_id': userid,
        'template_params': {
          'user_name': nameController.text,
          'user_email': emailController.text,
          'user_message': messageController.text,
        }
      }),
    );
  }

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: GoogleFonts.rubik(
            color: Colors.white,
            fontSize: 16.0,
          ),
        ),
        backgroundColor: Colors.blueGrey,
        duration: const Duration(seconds: 3),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  String? _validateName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your name';
    }
    return null;
  }

  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email';
    } else if (!RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$')
        .hasMatch(value)) {
      return 'Please enter a valid email address';
    }
    return null;
  }

  String? _validateMessage(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your message';
    }
    return null;
  }

  void _submitForm() {
    String? nameError = _validateName(nameController.text);
    String? emailError = _validateEmail(emailController.text);
    String? messageError = _validateMessage(messageController.text);

    if (nameError != null || emailError != null || messageError != null) {
      // Display snackbar with the first encountered error message
      _showSnackBar(nameError ?? emailError ?? messageError ?? '');
    } else {
      sendEmail();
      _showSnackBar('Message sent successfully!');
      _formKey.currentState!.reset();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(25, 20, 25, 60),
      color: CustomColor.bgLight1,
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            //title
            SizedBox(
              width: 300,
              child: ShaderMask(
                shaderCallback: (Rect bounds) {
                  return const LinearGradient(
                    colors: [
                      CustomColor.whitePrimary,
                      CustomColor.yellowPrimary,
                      CustomColor.blueAccent,
                      CustomColor.greenAccent,
                      CustomColor.orangeAccent,
                    ],
                  ).createShader(bounds);
                },
                child: Text(
                  'Get In Touch',
                  style: GoogleFonts.ubuntu(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),

            const SizedBox(
              height: 50,
            ),
            ConstrainedBox(
              constraints: const BoxConstraints(
                maxWidth: 700,
                maxHeight: 100,
              ),
              child: LayoutBuilder(
                builder: (context, constraints) {
                  if (constraints.maxWidth >= kMindesktopWidth) {
                    return buildnameEmailFieldDesktop();
                  }
                  return buildnameEmailFieldMobile();
                },
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            ConstrainedBox(
              constraints: const BoxConstraints(
                maxWidth: 700,
              ),
              child: CustomTextField(
                controller: messageController,
                validator: _validateMessage,
                hintText: 'Your Message',
                maxLines: 16,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            //send button
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 700),
              child: SizedBox(
                width: double.maxFinite,
                height: 30,
                child: ElevatedButton(
                  onPressed: _submitForm,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: CustomColor.buttonOrange,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                  ),
                  child: Text(
                    "Get in Touch",
                    style: GoogleFonts.rubik(
                      color: CustomColor.whitePrimary,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 1.0,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 300),
              child: const Divider(),
            ),
            const SizedBox(
              height: 15,
            ),

            const Wrap(
              spacing: 15,
              runSpacing: 15,
              alignment: WrapAlignment.center,
              children: [
                SocialMediaProfile(
                  images: 'assets/images/twitter.png',
                  url: 'https://twitter.com/prathmesh__1209',
                ),
                SocialMediaProfile(
                  images: 'assets/images/instagram.png',
                  url: 'https://www.instagram.com/',
                ),
                SocialMediaProfile(
                  images: 'assets/images/facebook.png',
                  url:
                      'https://www.facebook.com/profile.php?id=100075806246443',
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Row buildnameEmailFieldDesktop() {
    return Row(
      children: [
        Flexible(
          child: CustomTextField(
            controller: nameController,
            validator: _validateName,
            hintText: 'Your Name',
          ),
        ),
        const SizedBox(
          width: 15,
        ),
        Flexible(
          child: CustomTextField(
            controller: emailController,
            validator: _validateEmail,
            hintText: 'Your Email',
          ),
        ),
      ],
    );
  }

  Column buildnameEmailFieldMobile() {
    return Column(
      children: [
        Flexible(
          child: CustomTextField(
            controller: nameController,
            hintText: 'Your Name',
            validator: _validateName,
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        Flexible(
          child: CustomTextField(
            controller: emailController,
            hintText: 'Your Email',
            validator: _validateEmail,
          ),
        ),
      ],
    );
  }
}
