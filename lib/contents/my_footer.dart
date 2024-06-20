import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../widget_folder/textstyle_widget.dart';

class MyFooter extends StatefulWidget {
  const MyFooter({super.key});

  @override
  State<MyFooter> createState() => _MyFooterState();
}

class _MyFooterState extends State<MyFooter> {
  ///___ InstagramProfile
  final Uri _instagramProfile = Uri.parse('https://www.instagram.com/akshay_panika/');
  final Uri _githubProfile = Uri.parse('https://github.com/Akshay-Panika');
  final Uri _linkedInChat = Uri.parse('https://www.linkedin.com/in/akshay-panika/');
  final Uri _emailUri = Uri.parse('workedids@gmail.com');


  Future<void> _launchInstagramProfile() async {
    if (!await launchUrl(_instagramProfile)) {
      throw Exception('Could not launch $_instagramProfile');
    }
  }

  ///___ GitHubProfile
  Future<void> _launchGitHubProfile() async {
    if (!await launchUrl(_githubProfile)) {
      throw Exception('Could not launch $_githubProfile');
    }
  }

  ///___ LinkedInChat
  Future<void> _launchLinkedInChat() async {
    if (!await launchUrl(_linkedInChat)) {
      throw Exception('Could not launch $_linkedInChat');
    }
  }

  ///___ Email
  Future<void> _launchEmail() async {
    if (!await launchUrl(_emailUri)) {
      throw Exception('Could not launch $_emailUri');
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Container(
      padding: EdgeInsets.only(left: screenWidth > 500 ? screenWidth*0.03-5 :screenWidth*0.03, bottom: 60),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "   Created By Akshay - 2024",
            style: textStyle(fontSize: 13, fontWeight: FontWeight.w500),
          ),
          Row(
            children: [
              TextButton(
                onPressed: _launchInstagramProfile,
                child: Text(
                  "Instagram",
                  style: textStyle(fontSize: 13, fontWeight: FontWeight.w500),
                ),
              ),
              TextButton(
                onPressed: _launchLinkedInChat,
                child: Text(
                  "LinkedIn",
                  style: textStyle(fontSize: 13, fontWeight: FontWeight.w500),
                ),
              ),
              TextButton(
                onPressed: _launchGitHubProfile,
                child: Text(
                  "GitHub",
                  style: textStyle(fontSize: 13, fontWeight: FontWeight.w500),
                ),
              ),
              TextButton(
                onPressed: _launchEmail,
                child: Text(
                  "Email",
                  style: textStyle(fontSize: 13, fontWeight: FontWeight.w500),
                ),
              ),
            ],
          ),
          Text(
            "   Address- Waidhan Singrauli M.P. - 486886",
            style: textStyle(fontSize: 13, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}
