import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:zero_pls/widget_folder/height_width_widget.dart';
import '../contents/about_container.dart';
import '../contents/appbar_container.dart';
import '../contents/my_footer.dart';
import '../contents/my_project.dart';
import '../contents/my_skills.dart';
import '../contents/profile_container.dart';
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
                  padding: const EdgeInsets.only(top: 30.0),
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
                150.height,
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
        onPressed: _launchWhatsApp,
        child: const Icon(Icons.chat),
      ),
    );
  }

  /// WhatsApp Chat
  final Uri _whatsappChat = Uri.parse('https://wa.me/+918989207770');
  Future<void> _launchWhatsApp() async {
    if (!await launchUrl(_whatsappChat)) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Could not launch $_whatsappChat')),
      );
    }
  }
}
