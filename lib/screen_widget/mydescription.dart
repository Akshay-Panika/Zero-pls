import 'package:flutter/cupertino.dart';
import 'package:zero_pls/constant_widget/hw_widget.dart';

Widget myDescription(){
  return Container(
    //color: Colors.grey,
    padding: const EdgeInsets.symmetric(horizontal: 10.0),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        30.height,
        const Text("'I am a highly motivated person who loves technology as a whole and keeps exploring new tools and technologies'",
            style:TextStyle(fontSize: 14,fontWeight: FontWeight.w700),textAlign: TextAlign.center),
        10.height,

        const Text("As a beginner in app development , I have been working hard to improve my development skills.",
            style:  TextStyle(fontSize: 14, fontWeight: FontWeight.w700),textAlign: TextAlign.center),
        10.height,
        const Text("Thank You!",
            style:  TextStyle(fontSize: 16,fontWeight: FontWeight.w700),textAlign: TextAlign.center),
        10.height,
      ],
    ),
  );
}