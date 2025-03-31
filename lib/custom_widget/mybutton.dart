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
                        onTap:widget.backButtonOnTap,
                        onHover: (value) {
                          setState(() {
                            isBackHovered = value;
                          });
                        },
                        child:  Center(child: Text(widget.backButtonTitle, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: isBackHovered? Colors.deepOrange.shade50:Colors.black),),)),
                  )),

                  Expanded(child: Container(
                    margin: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.deepOrange.shade100,
                    ),
                    child: InkWell(
                        onTap: widget.nextButtonOnTap,
                        onHover: (value) {
                         setState(() {
                           isNextHovered = value;
                         });
                        },
                        child:  Center(child: Text(widget.nextButtonTitle, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: isNextHovered? Colors.deepOrange.shade50:Colors.black),),)),
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
