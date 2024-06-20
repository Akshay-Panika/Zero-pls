import 'package:flutter/material.dart';
import 'package:zero_pls/widget_folder/height_width_widget.dart';
import '../widget_folder/color_widget.dart';
import '../widget_folder/textstyle_widget.dart'; // Assuming this is a custom widget

class MyCertificate extends StatefulWidget {
  const MyCertificate({Key? key}) : super(key: key);

  @override
  State<MyCertificate> createState() => _MyCertificateState();
}

class _MyCertificateState extends State<MyCertificate> {
  List<String> myCertificate = [
    'assets/images/Akshay Panika - wp.png',
    'assets/images/flutter_developer.jpg',
    'assets/images/graphic_designer.jpg',
  ];

  int? _hoverIndex; // Track the index of the hovered image

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Column(
      children: [
        20.height, // Assuming height is a custom extension method
        Text("My Certificate", style: textStyle14(fontWeight: FontWeight.w600)),

        40.height, // Assuming height is a custom extension method
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50.0), // Adjusted padding
            child: GridView.builder(
              itemCount: myCertificate.length,
              gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: screenWidth > 500 ? 3 : 2,
                childAspectRatio: 0.9,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20
              ),
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Padding(
                      padding: const EdgeInsets.all(50.0),
                      child: Stack(
                        children: [
                          Center(child: Image.asset(myCertificate[index])),
                          Positioned(
                              top: 0,right: 0,
                              child: IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: const Icon(Icons.clear, color: Colors.black,),
                          ))
                        ],
                      ),
                    )));
                  },
                  onHover: (value) {
                    setState(() {
                      _hoverIndex = index;
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(myCertificate[index]),fit: BoxFit.fill
                      ),
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: _hoverIndex == index ? ColorWidget.deepOrange50 : Colors.transparent,
                        width: 5,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
