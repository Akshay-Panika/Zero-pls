import 'package:flutter/material.dart';
import 'package:zero_pls/contents/my_footer.dart';
import 'package:zero_pls/widget_folder/height_width_widget.dart';
import '../social_media_url/social_media_url.dart';
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
         // screenWidth > 500 ? 50.height : 0.height,
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
                  mainAxisSpacing: 50,
                  crossAxisSpacing: 50,
                 childAspectRatio: 1/1.2
              ),
              itemBuilder: (context, index) {
                return ProjectCard(
                    headline: flutterProject[index]['headline'],
                  imageUrl: flutterProject[index]['image']
                );
              },),
          ),

          60.height,
          const MyFooter(),
        ],
      ),
    );
  }
}


class ProjectCard extends StatefulWidget {
  final String? headline;
  final String? imageUrl;

  const ProjectCard({required this.headline, this.imageUrl, super.key});

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
          decoration:  BoxDecoration(
            borderRadius: const BorderRadius.only(topRight: Radius.circular(10)),
            color: ColorWidget.deepOrange100,
          ),
          child: Text(widget.headline.toString(),
            style: textStyle14(fontWeight: FontWeight.w500),
          ),
        ),
        Expanded(
          child: InkWell(
            onTap: () {},
            onHover: (value) {
              setState(() {
                isHover = !isHover;
              });
            },
            child: Container(
              decoration:  BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
                image: DecorationImage(
                    image: AssetImage(widget.imageUrl.toString()),fit: BoxFit.fill
                ),
                color: ColorWidget.deepOrange100,
              ),
              child:isHover ? Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(""),
                  Container(
                    decoration:  BoxDecoration(
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                      ),
                      color: ColorWidget.deepOrange100,
                    ),
                    padding: const EdgeInsets.only(bottom: 20.0,top: 20.0),
                    child: Center(child: InkWell(
                        onTap: () {
                            _urlHelper.launchUrlHelper(_urlHelper.githubProfile);
                        },
                        child: Text("Source Code", style: textStyle16(fontWeight: FontWeight.w600, color: ColorWidget.colorBlack),))),
                  ),
                ],
              )
                  :Container(),
            ),
          ),
        ),
      ],
    );
  }
}

