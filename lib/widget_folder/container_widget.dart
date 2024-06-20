
import 'package:flutter/cupertino.dart';
import 'color_widget.dart';

Widget containerWidget(BuildContext context, {
  Widget? child,
  double? height,
  double? width,
  double? margin,
  double? horizontal,
  double? vertical,

}){
  return  Container(
    height: height,
    width: width,
    margin: EdgeInsets.symmetric(horizontal: horizontal??0, vertical: vertical??0),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      color: ColorWidget.deepOrange100,
      // boxShadow: const [
      //   BoxShadow(
      //     color: ColorWidget.colorGrey,
      //     spreadRadius: 0.1,
      //     blurRadius: 2,
      //     offset: Offset(0, -1)
      //   )
      // ]
    ),
    child: child,
  );
}