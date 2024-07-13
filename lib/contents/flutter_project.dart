import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../data_folder/flutter_project.dart';
import '../social_media_url/social_media_url.dart';
import '../widget_folder/color_widget.dart';
import '../widget_folder/textstyle_widget.dart';
import 'my_project.dart';

class FlutterProject extends StatefulWidget {
  const FlutterProject({super.key});

  @override
  State<FlutterProject> createState() => _FlutterProjectState();
}

class _FlutterProjectState extends State<FlutterProject> {
  int? selectedIndex;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 10,
        horizontal: screenWidth > 500 ? screenWidth * 0.03 + 5 : screenWidth * 0.05,
      ),
      child: GridView.builder(
        itemCount: flutterProject.length,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: screenWidth > 500 ? 4 : 1,
          mainAxisSpacing: 50,
          crossAxisSpacing: 50,
          childAspectRatio: 1 / 1.2,
        ),
        itemBuilder: (context, index) {
          return ProjectCard(
            onTap: () {
              setState(() {
                selectedIndex = index;
              });
            },
            headline: flutterProject[index]['headline'],
            imageUrl: flutterProject[index]['image'],
            isSelected: selectedIndex == index,
          );
        },
      ),
    );
  }
}

class ProjectCard extends StatefulWidget {
  final String? headline;
  final String? imageUrl;
  final VoidCallback? onTap;
  final bool isSelected;

  const ProjectCard({
    required this.headline,
    this.imageUrl,
    super.key,
    this.onTap,
    required this.isSelected,
  });

  @override
  _ProjectCardState createState() => _ProjectCardState();
}

class _ProjectCardState extends State<ProjectCard> {
  bool isHover = false;
  final UrlHelper _urlHelper = UrlHelper();

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 6),
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(topRight: Radius.circular(10)),
            color: ColorWidget.deepOrange100,
          ),
          child: Text(
            widget.headline.toString(),
            style: textStyle14(fontWeight: FontWeight.w500),
            overflow: TextOverflow.ellipsis,
          ),
        ),
        Expanded(
          child: InkWell(
            onTap: widget.onTap,
            onHover: (value) {
              setState(() {
                isHover = value;
              });
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
                image: DecorationImage(
                  image: AssetImage(widget.imageUrl.toString()),
                  fit: BoxFit.fill,
                ),
                color: ColorWidget.deepOrange100,
              ),
              child: screenWidth > 500
                  ? isHover
                  ? _hoverActions()
                  : Container()
                  : widget.isSelected
                  ? _hoverActions()
                  : Container(),
            ),
          ),
        ),
      ],
    );
  }

  Widget _hoverActions() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(""),
        Container(
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10),
            ),
            color: ColorWidget.deepOrange100,
          ),
          padding: const EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              InkWell(
                onTap: () {
                  _urlHelper.launchUrlHelper(_urlHelper.calculatorApp);
                },
                child: Text(
                  "View Project",
                  style: textStyle14(fontWeight: FontWeight.w600, color: ColorWidget.colorBlack),
                ),
              ),
              InkWell(
                onTap: () {
                  _urlHelper.launchUrlHelper(_urlHelper.githubProfile);
                },
                child: Text(
                  "Source Code",
                  style: textStyle14(fontWeight: FontWeight.w600, color: ColorWidget.colorBlack),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
