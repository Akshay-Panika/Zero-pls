import 'package:flutter/material.dart';
import '../../../widget_folder/container_widget.dart';
import '../widget_folder/color_widget.dart';
import '../widget_folder/textstyle_widget.dart';

class ProfileContainer extends StatelessWidget {
  const ProfileContainer({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return  containerWidget( context,
      height: 550,
      width: screenWidth > 500 ? screenWidth*0.3 : screenWidth*0.9,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: screenWidth > 500 ? screenWidth*0.09 : screenWidth*0.3,
            backgroundColor: Colors.deepOrange.shade100,
           // backgroundImage: const AssetImage('assets/images/logo.jpg'),),
            backgroundImage: const AssetImage('assets/images/Ak-dp.jpg'),),

           Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20),
            child: Column(
              children: [
                Text("Akshay Panika",style: textStyle18(fontWeight: FontWeight.w600)),
                // Wrap(
                //   alignment: WrapAlignment.center,
                //   children: [
                //     Text("Flutter / ",style: textStyle14(fontWeight: FontWeight.w500)),
                //     Text("Wordpress Developer & ",style: textStyle14(fontWeight: FontWeight.w500)),
                //     Text("Graphic Designer",style: textStyle14(fontWeight: FontWeight.w500)),
                //   ],
                // ),

                // SizedBox(height:30,
                //   child: AnimatedTextKit(
                //     repeatForever: true,
                //     animatedTexts: [
                //       RotateAnimatedText('Flutter Developer',textStyle: textStyle(fontSize:25,fontWeight: FontWeight.w600,color: ColorWidget.colorBlack) ),
                //       RotateAnimatedText('Wordpress Developer',textStyle: textStyle(fontSize:25,fontWeight: FontWeight.w600,color: ColorWidget.colorBlack) ),
                //       RotateAnimatedText('Graphic Designer',textStyle: textStyle(fontSize:25,fontWeight: FontWeight.w600,color: ColorWidget.colorBlack)),
                //     ],
                //   ),
                // ),
                 Text("Flutter Developer",style: textStyle(fontSize:23,fontWeight: FontWeight.w700,color: ColorWidget.colorBlack),),
              ],
            ),
          )
        ],
      ),
    );
  }
}
