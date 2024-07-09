import 'package:flutter/material.dart';
import '../../../widget_folder/container_widget.dart';
import '../widget_folder/color_widget.dart';
import '../widget_folder/textstyle_widget.dart';
import 'my_certificate.dart';
import 'my_course.dart';
import 'my_descriptions.dart';
import 'my_speech.dart';

class AboutContainer extends StatefulWidget {
  const AboutContainer({super.key});

  @override
  State<AboutContainer> createState() => _AboutContainerState();
}

class _AboutContainerState extends State<AboutContainer> {

  int currentPage = 0;
  final PageController _pageController = PageController();
  bool isBackButton = false;
  bool isNextButton = false;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return containerWidget(
      context,
      height: 550,
      width: screenWidth > 500 ? screenWidth * 0.6 + 20 : screenWidth * 0.9,
      child: Column(
        children: [

          Expanded(
            child: PageView(
              controller: _pageController,
              scrollDirection: Axis.horizontal,
              onPageChanged: (index) {
                setState(() {
                  currentPage = index;
                });
              },
              children: [

                myDescriptions(context),
                const MyCourse(),
                const MyCertificate(),

              ],
            ),
          ),



          ///___ Back & Next Controller
          SizedBox(
            width: screenWidth > 500 ? screenWidth * 0.3 : screenWidth * 0.7,
            height: 75,
            child: Stack(
              alignment: Alignment.center,
              children: [


                ///___ Back & Next Button
                Container(
                  height: double.infinity,
                  margin: const EdgeInsets.only(top: 25),
                  decoration:  BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15),
                    ),
                    color: ColorWidget.deepOrange50,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      myButton(context, text: "Back", onTap: () {
                        _pageController.previousPage(duration: const Duration(milliseconds: 500), curve: Curves.linear);
                      }),
                    // 20.width,
                      myButton(context, text: "Next", onTap: () {
                        _pageController.nextPage(duration: const Duration(milliseconds: 500), curve: Curves.linear);
                      }),
                    ],
                  ),
                ),

                ///___ Play Button
                 CircleAvatar(
                  backgroundColor: ColorWidget.deepOrange50,
                  radius: 40,
                  child: const Padding(
                    padding: EdgeInsets.only(top: 5.0),
                    child: MySpeech(),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

Widget myButton(BuildContext context, {required String text, required VoidCallback onTap}) {
  final screenWidth = MediaQuery.of(context).size.width;
  return Expanded(
    child: Container(
      
      margin: const EdgeInsets.only(
        top:10,left: 10,right: 10
      ),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: ColorWidget.deepOrange100
      ),
     // height: 35,
     // width: screenWidth > 500 ? screenWidth * 0.1 : screenWidth * 0.2+10,
      child: InkWell(
        onTap: onTap,
        child: Center(
          child: Text(
            text,
            style: textStyle14(fontWeight: FontWeight.w500),
          ),
        ),
      ),
    ),
  );
}
