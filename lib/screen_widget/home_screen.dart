import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:zero_pls/constant_widget/hw_widget.dart';
import '../constant_widget/social_media_url.dart';
import 'myappbar.dart';
import 'mydata.dart';
import 'myfooter.dart';
import 'myprofile.dart';
import 'myprojects.dart';
import 'myskills.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}
class _HomeScreenState extends State<HomeScreen> {


  final GlobalKey homeKey = GlobalKey();
  final GlobalKey skillsKey = GlobalKey();
  bool openProject = false;

  /// toggleProject
  void toggleProject({required bool open}) {
    setState(() {
      openProject = open;
    });
  }

  final UrlHelper _urlHelper = UrlHelper();
  @override
  Widget build(BuildContext context) {

    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
         backgroundColor: Colors.deepOrange.shade50,
      /// Body
      body: Column(
        children: [
          10.height,
          MyAppbar(
            homeKey: homeKey,
            skillsKey: skillsKey,
            toggleProject: toggleProject,
          ),


       openProject? MyProjects()
         :Expanded(
            child: ListView(
              children: [
            
                 Wrap(
                  alignment: WrapAlignment.center,
                  children: [
            
                    MyProfile(key: homeKey,),
                    const MyData(),
            
            
                  ],
                ),

                20.height,
                 MySkills(key: skillsKey,),
                20.height,
                MyFooter(),
              ],
            ),
          ),


        ],
      ),



      /// Floating Action Button
      floatingActionButton: screenWidth > 500
          ? Container()
          : FloatingActionButton.small(
        backgroundColor: Colors.deepOrange.shade100,
        onPressed: () => _launchUrl(Uri.parse(_urlHelper.whatsappUri.toString())),
        child:  const FaIcon(FontAwesomeIcons.whatsapp, color: Colors.black87,),
      ),
    );
  }
}


Future<void> _launchUrl(Uri url) async {
  if (!await launchUrl(url)) {
    throw Exception('Could not launch $url');
  }
}