import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../screen_widget/myspeech.dart';

class MyButton extends StatelessWidget {
  final String backButtonTitle;
  final String nextButtonTitle;
  final VoidCallback backButtonOnTap;
  final VoidCallback nextButtonOnTap;
  const MyButton({super.key, required this.backButtonTitle, required this.nextButtonTitle, required this.backButtonOnTap, required this.nextButtonOnTap});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 90,
     // color: Colors.white,
      child: Stack(
        children: [

          /// Back $ Next
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 80,
              width: 400,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15)),
                color: Colors.deepOrange.shade50,
              ),

              child: Row(
                children: [
                  Expanded(child: Container(
                    margin: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.deepOrange.shade100,
                    ),
                    child: InkWell(
                        onTap:backButtonOnTap,
                        child:  Center(child: Text(backButtonTitle, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),),)),
                  )),

                  Expanded(child: Container(
                    margin: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.deepOrange.shade100,
                    ),
                    child: InkWell(
                        onTap: nextButtonOnTap,
                        child:  Center(child: Text(nextButtonTitle, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),),)),
                  )),
                ],
              ),
            ),
          ),


          /// Play button
          Align(
              alignment: Alignment.bottomCenter,
              child: CircleAvatar(radius: 45,backgroundColor: Colors.deepOrange.shade50,

              child: CircleAvatar(radius: 35,backgroundColor: Colors.deepOrange.shade100,
              child:MySpeech()
              ),),
          )
        ],
      ),
    );
  }
}
