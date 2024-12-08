import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:zero_pls/constant_widget/hw_widget.dart';

import '../constant_widget/social_media_url.dart';
import '../custom_widget/fonticons.dart';

class MyProfile extends StatefulWidget {
  const MyProfile({super.key});

  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {

  final UrlHelper _urlHelper = UrlHelper();

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return  Container(
      height: 600,
      width: screenWidth > 500 ? screenWidth*0.4 : screenWidth*1,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal:screenWidth > 500? 45 :10, vertical: 15),
        //margin: const EdgeInsets.symmetric(horizontal: 45, vertical: 15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.deepOrange.shade100,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(height: 50,),

            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [

                /// My Image
                const CircleAvatar(
                  radius: 140,
                  backgroundImage: AssetImage('assets/images/akshay.jpg'),
                ),


                10.height,
                const TextPadding(
                  title: "Akshay Panika",
                  textStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                ),
                const TextPadding(
                  title: "Flutter Developer",
                  textStyle: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),

              ],
            ),


            /// Social media icon
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: [
                  FontIcons(
                    icon: FontAwesomeIcons.instagram,
                    onTap:() => _urlHelper.launchCustomUrl(_urlHelper.instagramProfile)),
                  10.width,


                  FontIcons(
                    icon: FontAwesomeIcons.linkedin,
                      onTap:() => _urlHelper.launchCustomUrl(_urlHelper.linkedInChat)),
                  10.width,

                  FontIcons(
                    icon: FontAwesomeIcons.github,
                      onTap:() => _urlHelper.launchCustomUrl(_urlHelper.githubProfile)),
                  10.width,

                  FontIcons(
                    icon: FontAwesomeIcons.youtube,
                    onTap: () {},),
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}


class TextPadding extends StatelessWidget {
  final String title;
  final EdgeInsets? padding;
  final TextStyle? textStyle;
  final VoidCallback? onTap;
  const TextPadding({super.key, required this.title, this.padding, this.textStyle, this.onTap});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding:padding ?? const EdgeInsets.symmetric(vertical:0.0, horizontal: 0.0),
      child: InkWell(
          onTap: onTap,
          child: Text(title,style: textStyle,)),
    );
  }
}

