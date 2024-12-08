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
    return SizedBox(
      height: 600,
      width: screenWidth > 500 ? screenWidth * 0.6 : screenWidth * 1,
      // color: Colors.green,
      child: Container(
        margin: EdgeInsets.only(
          right: screenWidth > 500 ? 45 : 10,
          left: screenWidth > 500 ? 0 : 10,
          top: 15, bottom: 15,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.deepOrange.shade100,
        ),
        child:  Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

             Expanded(
                 child: PageView(
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
             )),

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
      ),
    );
  }
}
