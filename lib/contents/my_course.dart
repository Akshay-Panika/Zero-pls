import 'package:flutter/material.dart';
import 'package:timelines/timelines.dart';
import 'package:zero_pls/widget_folder/height_width_widget.dart';
import '../data_folder/course_data.dart';
import '../widget_folder/color_widget.dart';
import '../widget_folder/textstyle_widget.dart';

class MyCourse extends StatelessWidget {
  const MyCourse({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        20.height,
        Text("My Courses",style: textStyle14(fontWeight: FontWeight.w600)),
        Expanded(
          child: Timeline.tileBuilder(
            //physics: const NeverScrollableScrollPhysics(),
            padding: const EdgeInsets.only(left: 50.0, right: 50, top: 20),
            theme: TimelineThemeData(color: Colors.deepOrange.shade50),
            builder: TimelineTileBuilder.fromStyle(
              contentsAlign: ContentsAlign.alternating,
              contentsBuilder: (context, index){
                return  Card(
                  elevation: 0.0,
                  color: ColorWidget.deepOrange50,
                  child:  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Wrap(
                          spacing: 20,
                          children: [
                          Text(myCourseList[index]['course'], style: textStyle(fontSize: 13, fontWeight: FontWeight.w500),),
                          Text('[${myCourseList[index]['date']}]', style: textStyle(fontSize: 13, color: ColorWidget.colorGrey),),
                          ],
                        ),
                        10.height,
                        Expanded(child: Text(myCourseList[index]['institute'], style: textStyle(fontSize: 13,),)),
                      ],
                    ),
                  ),
                );
              },
              itemCount:myCourseList.length,
            ),
          ),
        ),
      ],
    );
  }
}
