import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:zero_pls/constant_widget/hw_widget.dart';

import '../constant_widget/social_media_url.dart';

class MyAppbar extends StatefulWidget {
  final GlobalKey homeKey;
  final GlobalKey skillsKey;
  final Function({required bool open}) toggleProject;
  const MyAppbar({super.key, required this.homeKey, required this.skillsKey, required this.toggleProject});

  @override
  State<MyAppbar> createState() => _MyAppbarState();
}

class _MyAppbarState extends State<MyAppbar> {

  bool isOpenProject = false;
  late List<Widget> navList;
  final UrlHelper _urlHelper = UrlHelper();

  @override
  void initState() {
    super.initState();
    navList =  [
      TextButton(onPressed: () => scrollTo(widget.homeKey, open: false), child: const Text("Home",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w700),)),
      20.width,
      TextButton(onPressed: () => scrollTo(widget.skillsKey, open: false), child: const Text("Skills",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w700))),
      20.width,
      TextButton(onPressed: () => widget.toggleProject(open: true), child: const Text("Projects",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w700))),
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
    final screenWidth = MediaQuery.of(context).size.width;
    return Container(
      height: 60,
      width: double.infinity,
      margin:  EdgeInsets.symmetric(horizontal:screenWidth > 500? 45 :10, vertical: 10),
      padding:  EdgeInsets.symmetric(horizontal:screenWidth > 500? 45 : 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
       // color: Colors.black,
        color: Colors.deepOrange.shade100,
      ),

      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [

          /// My Logo

          Image.asset('assets/images/zero+logo2.png',fit: BoxFit.cover,),
          //const Text("Zero+",style: TextStyle(color: Colors.white,fontSize:18, fontWeight: FontWeight.bold),),


          /// Nav List
          screenWidth > 500 ?  Row(children: navList,) : Container(),


          /// Toggle button
          screenWidth > 500 ? IconButton(onPressed: () => _urlHelper.launchCustomUrl(_urlHelper.whatsappUri),
              icon:const FaIcon(FontAwesomeIcons.whatsapp)) :
          InkWell(child: Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: Text(isOpenProject ?"Home": "My Project",style:
            const TextStyle(color: Colors.black, fontSize: 13,fontWeight: FontWeight.w500),),
          ),
            onTap: () {
              isOpenProject =! isOpenProject; // Toggle isOpen state
              widget.toggleProject(open: isOpenProject);
            },
          )
        ],
      ),
    );
  }
}
