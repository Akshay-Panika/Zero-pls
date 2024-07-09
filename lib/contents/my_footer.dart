import 'package:flutter/material.dart';
import '../social_media_url/social_media_url.dart';
import '../widget_folder/textstyle_widget.dart';

class MyFooter extends StatefulWidget {
  const MyFooter({super.key});

  @override
  State<MyFooter> createState() => _MyFooterState();
}

class _MyFooterState extends State<MyFooter> {

  final UrlHelper _urlHelper = UrlHelper();

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final paddingValue = screenWidth > 500 ? screenWidth * 0.03 - 5 : screenWidth * 0.03;

    return Container(
      padding: EdgeInsets.only(left: paddingValue, bottom: 60),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "   Created By Akshay - 2024",
            style: textStyle(fontSize: 13, fontWeight: FontWeight.w500),
          ),
          Row(
            children: [
              _buildTextButton("Instagram", _urlHelper.instagramProfile),
              _buildTextButton("LinkedIn", _urlHelper.linkedInChat),
              _buildTextButton("GitHub", _urlHelper.githubProfile),
              _buildTextButton("Email", _urlHelper.emailUri),
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

  Widget _buildTextButton(String label, Uri url) {
    return TextButton(
      onPressed: () => _urlHelper.launchUrlHelper(url),
      child: Text(
        label,
        style: textStyle(fontSize: 13, fontWeight: FontWeight.w500),
      ),
    );
  }
}
