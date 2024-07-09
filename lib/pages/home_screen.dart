import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:zero_pls/widget_folder/height_width_widget.dart';
import '../contents/about_container.dart';
import '../contents/appbar_container.dart';
import '../contents/my_footer.dart';
import '../contents/my_project.dart';
import '../contents/my_skills.dart';
import '../contents/profile_container.dart';
import '../social_media_url/social_media_url.dart';
import '../widget_folder/color_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey homeKey = GlobalKey();
  final GlobalKey skillsKey = GlobalKey();
  bool openProject = false;
  final UrlHelper _urlHelper = UrlHelper();



  void toggleProject({required bool open}) {
    setState(() {
      openProject = open;
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: ColorWidget.deepOrange50,
      body: Column(
        children: [
          /// App bar
          AppbarContainer(
            homeKey: homeKey,
            skillsKey: skillsKey,
            toggleProject: toggleProject,
          ),

          /// Content based on openProjectScreen
          openProject
              ? const MyProject()
              : Expanded(
            child: ListView(
              children: [
                /// Home Container
                Padding(
                  key: homeKey,
                  padding: EdgeInsets.only(
                    top:screenWidth > 500 ? screenWidth*0.02 : screenWidth*0.06,),
                  child: const Wrap(
                    spacing: 30,
                    runSpacing: 40,
                    alignment: WrapAlignment.center,
                    children: [
                      /// Profile Container
                      ProfileContainer(),

                      /// About Container
                      AboutContainer(),
                    ],
                  ),
                ),

                /// My Skills
                100.height,
                MySkills(key: skillsKey),
                50.height,

                /// Footer
                const MyFooter(),
              ],
            ),
          ),
        ],
      ),

      /// Floating Action Button
      floatingActionButton: screenWidth > 500
          ? Container()
          : FloatingActionButton.small(
        backgroundColor: ColorWidget.deepOrange100,
        onPressed:() {
          _urlHelper.launchUrlHelper(_urlHelper.whatsappUri);
        },
        child: const FaIcon(FontAwesomeIcons.whatsapp),
      ),
    );
  }
}
