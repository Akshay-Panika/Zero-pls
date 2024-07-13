import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:zero_pls/widget_folder/height_width_widget.dart';
import '../widget_folder/container_widget.dart';
import 'flutter_project.dart';
import 'my_footer.dart';

class MyProject extends StatefulWidget {
  const MyProject({super.key});

  @override
  State<MyProject> createState() => _MyProjectState();
}

class _MyProjectState extends State<MyProject> {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Expanded(
      child: ListView(
        children: [
          ///___ Space
          SizedBox(
            height: screenWidth > 500 ? screenWidth * 0.03 : screenWidth * 0.05,
          ),

          ///___ Flutter project
          const FlutterProject(),

          60.height,
          const MyFooter(),
        ],
      ),
    );
  }
}
