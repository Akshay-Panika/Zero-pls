import 'package:flutter/material.dart';
import '../../../widget_folder/container_widget.dart';
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
            backgroundImage: const AssetImage('assets/images/logo.jpg'),),

           Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20),
            child: Column(
              children: [
                Text("Akshay Panika",style: textStyle18(fontWeight: FontWeight.w600)),
                Wrap(
                  alignment: WrapAlignment.center,
                  children: [
                    Text("Flutter / ",style: textStyle14(fontWeight: FontWeight.w500)),
                    Text("Wordpress Developer & ",style: textStyle14(fontWeight: FontWeight.w500)),
                    Text("Graphic Designer",style: textStyle14(fontWeight: FontWeight.w500)),
                  ],
                ),

                // SizedBox(height:30,
                //   child: AnimatedTextKit(
                //     repeatForever: true,
                //     animatedTexts: [
                //       RotateAnimatedText('Flutter Developer',textStyle:const TextStyle(fontSize:25,fontWeight: FontWeight.w600,color: Colors.black) ),
                //       RotateAnimatedText('Wordpress Developer',textStyle:const TextStyle(fontSize:25,fontWeight: FontWeight.w600,color: Colors.black) ),
                //       RotateAnimatedText('Graphic Designer',textStyle:const TextStyle(fontSize:25,fontWeight: FontWeight.w600,color: Colors.black) ),
                //     ],
                //   ),
                // ),
                // Text("Flutter Developer",style: TextStyle(fontSize:25,fontWeight: FontWeight.w600,color: Colors.black),),
              ],
            ),
          )
        ],
      ),
    );
  }
}
