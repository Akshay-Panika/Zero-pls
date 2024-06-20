import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widget_folder/color_widget.dart';
import '../widget_folder/textstyle_widget.dart';

class MySkills extends StatelessWidget {
  const MySkills({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Wrap(
      spacing: 40,
      runSpacing: 40,
      alignment: WrapAlignment.center,
      children: [
        skillsCard(
          context,
          headline: "Programming Language",
          children: [
            MyCard(title: 'Dart', hoverText: '85%', onTap: () {}),
            MyCard(title: 'Python', hoverText: '75%', onTap: () {}),
          ],
        ),
        skillsCard(
          context,
          headline: "Framework",
          children: [
            MyCard(title: 'Flutter', hoverText: '90%', onTap: () {}),
            MyCard(title: 'Wordpress', hoverText: '90%', onTap: () {}),
          ],
        ),
        skillsCard(
          context,
          headline: "Graphic Design",
          children: [
            MyCard(title: 'Canva', hoverText: '80%', onTap: () {}),
            MyCard(title: 'Photoshop', hoverText: '80%', onTap: () {}),
            MyCard(title: 'Illustrator', hoverText: '70%', onTap: () {}),
            MyCard(title: 'After Effect', hoverText: '70%', onTap: () {}),
          ],
        ),
      ],
    );
  }
}

Widget skillsCard(BuildContext context, {required String headline, required List<Widget> children}) {
  final screenWidth = MediaQuery.of(context).size.width;
  return SizedBox(
    width: screenWidth > 500 ? screenWidth * 0.3 - 10 : screenWidth * 0.9,
    child: Column(
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
        Container(
          width: double.infinity,
          decoration:  BoxDecoration(
            borderRadius: const BorderRadius.only(
                topRight: Radius.circular(10),
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10),
            ),
            //border: Border.all(color: ColorWidget.colorGrey, width: 0.1),
            color: ColorWidget.deepOrange100,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 30),
            child: Wrap(
              spacing: 10,
              runSpacing: 10,
              children: children,
            ),
          ),
        ),
      ],
    ),
  );
}

class MyCard extends StatefulWidget {
  final String title;
  final String hoverText;
  final VoidCallback? onTap;

  const MyCard({
    Key? key,
    required this.title,
    required this.hoverText,
    this.onTap,
  }) : super(key: key);

  @override
  _MyCardState createState() => _MyCardState();
}

class _MyCardState extends State<MyCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      onHover: (hovering) {
        setState(() {
          _isHovered = hovering;
        });
      },
      child: Card(
        elevation: 0.0,
        color: ColorWidget.deepOrange50,
        shape: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.transparent),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 5),
          child: Text(
            _isHovered ? widget.hoverText : widget.title,
            style: textStyle(fontSize: 13, fontWeight: FontWeight.w500),
          ),
        ),
      ),
    );
  }
}

