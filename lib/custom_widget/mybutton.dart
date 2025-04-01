import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../screen_widget/myspeech.dart';

class MyButton extends StatefulWidget {
  final String backButtonTitle;
  final String nextButtonTitle;
  final VoidCallback backButtonOnTap;
  final VoidCallback nextButtonOnTap;
  const MyButton({super.key, required this.backButtonTitle, required this.nextButtonTitle, required this.backButtonOnTap, required this.nextButtonOnTap});

  @override
  State<MyButton> createState() => _MyButtonState();
}

class _MyButtonState extends State<MyButton> {
  bool isBackHovered = false;
  bool isNextHovered = false;
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Stack(
      alignment: AlignmentDirectional.bottomEnd,
      children: [

        /// Back $ Next
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: screenWidth*0.1,),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(screenWidth>600?screenWidth*0.01:screenWidth*0.02),
                topRight: Radius.circular(screenWidth>600?screenWidth*0.01:screenWidth*0.02),
              ),
              color: Colors.deepOrange.shade50,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                _buildButton(context,
                  text: 'Back',
                  textColor: isBackHovered? Colors.deepOrange.shade50:Colors.black,
                  onTap: widget.backButtonOnTap,
                  onHover: (value) {
                    setState(() {
                      isBackHovered = value;
                    });
                  },
                ),


                _buildButton(context,
                text: 'Next',
                  textColor: isNextHovered? Colors.deepOrange.shade50:Colors.black,
                  onTap: widget.nextButtonOnTap,
                  onHover: (value) {
                    setState(() {
                      isNextHovered = value;
                    });
                  },
                ),
              ],
            ),
          ),
        ),


        /// Play button
        Align(
            alignment: Alignment.bottomCenter,
            child: CircleAvatar(radius: 45,backgroundColor: Colors.deepOrange.shade50,
            child: MySpeech(),),
        )
      ],
    );
  }
}


Widget _buildButton(BuildContext context, {VoidCallback? onTap, Function(bool)? onHover, String? text, Color? textColor}){
  final screenWidth = MediaQuery.of(context).size.width;
  final screenHeight = MediaQuery.of(context).size.height;
  return  Expanded(
    child: Container(
      height: screenHeight*0.07,
      margin: EdgeInsets.only(
        left: screenWidth*0.015,
        right: screenWidth*0.015,
        top: screenWidth*0.01,),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(screenWidth>600?screenWidth*0.01:screenWidth*0.02),
        color: Colors.deepOrange.shade100,
      ),
      child: InkWell(
          onTap: onTap,
          onHover: onHover,
          child:  Center(child: Text(text!, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: textColor?? Colors.black),))),
    ),
  );
}