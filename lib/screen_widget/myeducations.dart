import 'package:flutter/cupertino.dart';

Widget myEducations(){
  return Container(
    child:  const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text("BCA", style: TextStyle(fontSize: 100, fontWeight: FontWeight.bold),),
        Text("Bachelor Of Computer Application", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
      ],
    ),
  );
}