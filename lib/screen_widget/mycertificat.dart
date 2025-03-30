import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_common/get_reset.dart';
import 'package:get/get_core/src/get_main.dart';

import '../data_widget/mycertificatelist.dart';

class MyCertificate extends StatefulWidget {
  const MyCertificate({super.key});

  @override
  State<MyCertificate> createState() => _MyCertificateState();
}

class _MyCertificateState extends State<MyCertificate> {
  int onHoverIndex = 0;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding:  const EdgeInsets.all(50),
      child: GridView.builder(
        itemCount: myCertificateList.length, // Adjust as per your requirement
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: screenWidth > 500 ? 3 : 1, // Number of columns
          childAspectRatio: 2, // Width-to-height ratio
          crossAxisSpacing: 10, // Spacing between columns
          mainAxisSpacing: 10, // Spacing between rows
          mainAxisExtent:screenWidth > 500 ? 300 :350, // Fixed height for each item
        ),
        itemBuilder: (context, index) {
          return InkWell(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.deepOrange.shade50,
                image: DecorationImage(
                  image: AssetImage(myCertificateList[index]['image']),
                  fit: BoxFit.fill,
                ),
                boxShadow: onHoverIndex == index
                    ? [
                        const BoxShadow(
                            color: Colors.deepOrangeAccent, blurRadius: 5)
                      ]
                    : [],
              ),
            ),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => OpenCertificate(myCertificate: myCertificateList[index]['image'],),));
            },
            onHover: (isHovered) {
              setState(() {
                onHoverIndex = isHovered ? index : -1;
              });
            },
          );
        },
      ),
    );
  }
}

class OpenCertificate extends StatelessWidget {
  final String myCertificate;
  const OpenCertificate({super.key, required this.myCertificate});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepOrange.shade50,
      appBar: AppBar( backgroundColor: Colors.deepOrange.shade50,),
      body: Stack(
        children: [
          Center(child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Image.asset(myCertificate),
          )),
        ],
      ),
    );
  }
}
