import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../custom_widget/mybutton.dart';
import 'mycertificat.dart';
import 'mydescription.dart';
import 'myeducations.dart';

class MyData extends StatefulWidget {
  const MyData({super.key});

  @override
  State<MyData> createState() => _MyDataState();
}

class _MyDataState extends State<MyData> {

  int currentPage = 0;
  final PageController _pageController = PageController();
  bool isBackButton = false;
  bool isNextButton = false;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return SizedBox(
      width: screenWidth > 600 ? screenWidth*0.6: double.infinity,
      child: Stack(
        alignment: AlignmentDirectional.bottomEnd,
        children: [
          Container(
           // width: screenWidth > 600 ? screenWidth*0.6: double.infinity,
            height: screenHeight*0.8,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(screenWidth*0.02),
              color: Colors.deepOrange.shade100,
            ),
            child:  PageView(
              controller: _pageController,
                      onPageChanged: (index) {
            setState(() {
              currentPage = index;
            });
                      },
                      children: [
            myDescription(),
            myEducations(),
            const MyCertificate(),
                      ],
                    ),
          ),

          MyButton(
            backButtonTitle: 'Back',
            nextButtonTitle: 'Next',
            backButtonOnTap: (){
              _pageController.previousPage(duration: const Duration(milliseconds: 500), curve: Curves.linear);
            },
            nextButtonOnTap: (){
              _pageController.nextPage(duration: const Duration(milliseconds: 500), curve: Curves.linear);
            },
          ),
        ],
      ),
    );
  }
}
