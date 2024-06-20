import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zero_pls/widget_folder/height_width_widget.dart';
import '../widget_folder/color_widget.dart';
import '../widget_folder/textstyle_widget.dart';

class MyProject extends StatefulWidget {
  const MyProject({super.key});

  @override
  State<MyProject> createState() => _MyProjectState();
}

class _MyProjectState extends State<MyProject> {

  List flutterProject = [
    {
      "headline":'Note App',
      "image":'assets/images/Note_app.jpg',
    },
    {
      "headline":'Calculator App',
      "image":'assets/images/Calculator_app.jpg',
    },
    {
      "headline":'Dmart Clone App',
      "image":'assets/images/dmart_clone.jpg',
    }
  ];

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Expanded(
      child: ListView(
        children: [
          40.height,
          Padding(
            padding:  EdgeInsets.symmetric(
              vertical: 50,
                horizontal:screenWidth > 500 ? screenWidth*0.03+5 : screenWidth*0.05,
            ),
            child: GridView.builder(
              itemCount: flutterProject.length,
              shrinkWrap: true,
              gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: screenWidth > 500 ?4 : 1,
                  mainAxisSpacing: 20,
                  crossAxisSpacing: 20,
                 childAspectRatio: 1/1.2
              ),
              itemBuilder: (context, index) {
                return projectCard(context,
                    headline: flutterProject[index]['headline'],
                  imageUrl: flutterProject[index]['image']
                );
              },),
          ),

          // 40.height,
          // Padding(
          //   padding:  EdgeInsets.symmetric(
          //     vertical: 50,
          //     horizontal:screenWidth > 500 ? screenWidth*0.03+5 : screenWidth*0.05,
          //   ),
          //   child: GridView.builder(
          //     itemCount: 4,
          //     shrinkWrap: true,
          //     gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
          //         crossAxisCount:  screenWidth > 500 ?4 : 2,
          //         mainAxisSpacing: 20,
          //         crossAxisSpacing: 20,
          //        childAspectRatio: 1/1.2
          //     ),
          //     itemBuilder: (context, index) {
          //       return projectCard(context,
          //           headline: "Headline",
          //         imageUrl: ""
          //       );
          //     },),
          // ),
          40.height,
        ],
      ),
    );
  }
}

Widget projectCard(BuildContext context, {required String headline, String? imageUrl}) {
  final screenWidth = MediaQuery.of(context).size.width;
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Container(
        padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 6),
        decoration:  BoxDecoration(
          borderRadius: const BorderRadius.only(topRight: Radius.circular(10)),
          color: ColorWidget.deepOrange100,
        ),
        child: Text(
          headline,
          style: textStyle14(fontWeight: FontWeight.w500),
        ),
      ),
      Expanded(
        child: Container(
          decoration:  BoxDecoration(
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(10),
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10),
            ),
            image: DecorationImage(
                image: imageUrl != null ? AssetImage(imageUrl) :
                AssetImage(imageUrl.toString()),fit: BoxFit.fill
            ),
            color: ColorWidget.deepOrange100,
          ),
        ),
      ),
    ],
  );
}
