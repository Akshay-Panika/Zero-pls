import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../widget_folder/color_widget.dart';
import '../social_media_url/social_media_url.dart';
import '../widget_folder/textstyle_widget.dart';

class AppbarContainer extends StatefulWidget {
  final GlobalKey homeKey;
  final GlobalKey skillsKey;
  final Function({required bool open}) toggleProject;

  const AppbarContainer({
    required this.homeKey,
    required this.skillsKey,
    required this.toggleProject,
    super.key,
  });

  @override
  State<AppbarContainer> createState() => _AppbarContainerState();
}

class _AppbarContainerState extends State<AppbarContainer> {

  bool isOpen = false;
  late List<Widget> navList;
  final UrlHelper _urlHelper = UrlHelper();

  @override
  void initState() {
    super.initState();
    navList = [
      textButtonWidget(title: 'Home', onTap: () => scrollTo(widget.homeKey, open: false),),

      textButtonWidget(title: 'Skills', onTap:() =>  scrollTo(widget.skillsKey, open: false),),

      textButtonWidget(title: 'My Projects', onTap: () => widget.toggleProject(open:true),),
    ];
  }

  void scrollTo(GlobalKey key, {required bool open}) {
    widget.toggleProject(open: open);
    if (key.currentContext != null) {
      Scrollable.ensureVisible(
        key.currentContext!,
        duration: const Duration(milliseconds: 300),
        curve: Curves.linear,
      );
    }
  }


  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Container(
      height: 60,
      width: double.infinity,
      margin: EdgeInsets.only(
        left: screenWidth > 500 ? screenWidth*0.03 : screenWidth*0.04,
        right: screenWidth > 500 ? screenWidth*0.03 : screenWidth*0.04,
        top: 20,
      ),      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: ColorWidget.deepOrange100,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "My Portfolio", style: textStyle16(fontWeight: FontWeight.w600),
            ),

            screenWidth > 500 ?  Row(children: navList,) : Container(),

            screenWidth > 500 ? IconButton(onPressed: (){
              _urlHelper.launchUrlHelper(_urlHelper.whatsappUri);
            }, icon: const FaIcon(FontAwesomeIcons.whatsapp)) :
            InkWell(child: Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Text(isOpen ?"Home": "Project",style: textStyle(fontSize: 13,fontWeight: FontWeight.w500),),
            ),
            onTap: () {
              isOpen = !isOpen; // Toggle isOpen state
              widget.toggleProject(open: isOpen);
            },
            )
          ],
        ),
      ),
    );
  }
}

Widget textButtonWidget({required String title, VoidCallback? onTap}) {
  return TextButton(
    onPressed: onTap,
    child: Text(
      title,
      style: textStyle14(color: ColorWidget.colorBlack, fontWeight: FontWeight.w600),
    ),
  );
}

