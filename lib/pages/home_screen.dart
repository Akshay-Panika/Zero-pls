
import 'package:flutter/material.dart';
import 'package:zero_pls/widget_folder/height_width_widget.dart';
import '../contents/about_container.dart';
import '../contents/appbar_container.dart';
import '../contents/my_footer.dart';
import '../contents/my_project.dart';
import '../contents/my_skills.dart';
import '../contents/profile_container.dart';
import '../widget_folder/color_widget.dart';
import '../widget_folder/whatsapp_button.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey homeKey = GlobalKey();
  final GlobalKey skillsKey = GlobalKey();


  bool openProject = false;
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

          ///___ App bar
          AppbarContainer(
            homeKey: homeKey,
            skillsKey: skillsKey,
            toggleProject:  toggleProject,
          ),



          // Content based on openProjectScreen
          openProject ?
          const MyProject() :
          Expanded(
            child: ListView(
              children: [
                ///___ Home Container
                Padding(
                  key: homeKey,
                  padding: const EdgeInsets.only(top: 40.0),
                  child: const Wrap(
                    spacing: 30,
                    runSpacing: 40,
                    alignment: WrapAlignment.center,
                    runAlignment: WrapAlignment.center,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      ///___ Profile Container
                      ProfileContainer(),

                      ///___ About Container
                      AboutContainer(),
                    ],
                  ),
                ),

                ///___ My Project
                150.height,
                MySkills(key: skillsKey,),
                50.height,

                const MyFooter()
              ],
            ),
          )

        ],
      ),

      floatingActionButton: screenWidth > 500 ? Container()
      :FloatingActionButton.small(
        backgroundColor: ColorWidget.deepOrange100,
          onPressed: () {},child: const WhatsappButton(),),
    );
  }
}
