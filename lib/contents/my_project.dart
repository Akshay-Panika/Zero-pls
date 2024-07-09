import 'package:flutter/material.dart';
import 'package:zero_pls/widget_folder/height_width_widget.dart';
import '../widget_folder/container_widget.dart';
import 'flutter_project.dart';
import 'my_footer.dart';
import 'package:video_player/video_player.dart';

class MyProject extends StatefulWidget {
  const MyProject({super.key});

  @override
  State<MyProject> createState() => _MyProjectState();
}

class _MyProjectState extends State<MyProject> {
  late List<String> graphicUrl = [
    'https://www.instagram.com/reel/ClGKM4DB8H_/?utm_source=ig_web_copy_link&igsh=MzRlODBiNWFlZA==',
    'https://www.instagram.com/reel/ClGKM4DB8H_/?utm_source=ig_web_button_share_sheet&igsh=ZDNlZDc0MzIxNw==',
    'https://www.example.com/video3.mp4',
    'https://www.example.com/video4.mp4',
    'https://www.example.com/video5.mp4',
  ];

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Expanded(
      child: ListView(
        children: [
          ///___ Space
          SizedBox(height: screenWidth > 500 ? screenWidth * 0.03 : screenWidth * 0.05,),

          ///___ Flutter project
          const FlutterProject(),

          // Padding(
          //   padding: EdgeInsets.symmetric(
          //     vertical: 10,
          //     horizontal: screenWidth > 500 ? screenWidth * 0.03 + 5 : screenWidth * 0.05,
          //   ),
          //   child: GridView.builder(
          //     itemCount: graphicUrl.length,
          //     shrinkWrap: true,
          //     physics: const NeverScrollableScrollPhysics(),
          //     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          //       crossAxisCount: screenWidth > 500 ? 4 : 1,
          //       mainAxisSpacing: 50,
          //       crossAxisSpacing: 50,
          //       childAspectRatio: 1 / 1.2,
          //     ),
          //     itemBuilder: (context, index) {
          //       return containerWidget(
          //         horizontal: 0,
          //         vertical: 0,
          //         context,
          //         child: Image.network('https://www.instagram.com/p/CjGBolNoqoX/?utm_source=ig_web_copy_link&igsh=MzRlODBiNWFlZA=='),
          //       );
          //     },
          //   ),
          // ),

          60.height,
          const MyFooter(),
        ],
      ),
    );
  }
}