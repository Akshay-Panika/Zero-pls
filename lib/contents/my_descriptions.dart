import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zero_pls/widget_folder/height_width_widget.dart';
import '../widget_folder/textstyle_widget.dart';

Widget myDescriptions(BuildContext? context){
  return  Column(
    children: [
      20.height,
      Text("My Descriptions",style: textStyle14(fontWeight: FontWeight.w600)),
      190.height,
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: [
            Text("'I am a highly motivated person who loves technology as a whole and keeps exploring new tools and technologies'",
                style: textStyle14(),textAlign: TextAlign.center),
              10.height,

            Text("As a beginner in app development , I have been working hard to improve my development skills.",
                style:  textStyle14(),textAlign: TextAlign.center),
            10.height,
            Text("Thank You!",
                style:  textStyle14(fontWeight: FontWeight.w500),textAlign: TextAlign.center),
            10.height,
          ],
        ),
      ),
    ],
  );
}
