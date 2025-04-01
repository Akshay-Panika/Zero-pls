import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../custom_widget/mybutton.dart';
import 'mycertificat.dart';
import 'mydescription.dart';
import 'myeducations.dart';

class MyData extends StatefulWidget {
  const MyData({super.key});

  @override
  State<MyData> createState() => _MyDataState();
}

class _MyDataState extends State<MyData> {

  int currentPage = 0;
  final PageController _pageController = PageController();
  bool isBackButton = false;
  bool isNextButton = false;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return SizedBox(
      width: screenWidth > 600 ? screenWidth*0.6: double.infinity,
      child: Stack(
        alignment: AlignmentDirectional.bottomEnd,
        children: [
          ClipPath(
            clipper: RPSCustomClipper(),
            child: Container(
             // width: screenWidth > 600 ? screenWidth*0.6: double.infinity,
              height: screenHeight*0.8,
              color: Colors.deepOrange.shade100,
              child:  PageView(
                controller: _pageController,
                        onPageChanged: (index) {
              setState(() {
                currentPage = index;
              });
                        },
                        children: [
              myDescription(),
              myEducations(),
              const MyCertificate(),
                        ],
                      ),
            ),
          ),

          MyButton(
            backButtonTitle: 'Back',
            nextButtonTitle: 'Next',
            backButtonOnTap: (){
              _pageController.previousPage(duration: const Duration(milliseconds: 500), curve: Curves.linear);
            },
            nextButtonOnTap: (){
              _pageController.nextPage(duration: const Duration(milliseconds: 500), curve: Curves.linear);
            },
          ),
        ],
      ),
    );
  }
}

/// Clipper path
class MyCardClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    const double radius = 20.0; // Radius for the rounded corners

    Path path_0 = Path();
    path_0.moveTo(0,size.height*0.2600000);
    path_0.cubicTo(size.width*0.0033200,size.height*0.0074000,size.width*0.0030000,size.height*0.0037500,size.width*0.1000000,0);
    path_0.cubicTo(size.width*0.1500000,0,size.width*0.2500000,size.height*0.0037500,size.width*0.3000000,size.height*0.0050000);
    path_0.cubicTo(size.width*0.3426000,size.height*0.0062500,size.width*0.3406000,size.height*0.1107500,size.width*0.4000000,size.height*0.1100000);
    path_0.cubicTo(size.width*0.4510000,size.height*0.1112500,size.width*0.5530000,size.height*0.1087500,size.width*0.6040000,size.height*0.1100000);
    path_0.cubicTo(size.width*0.6666000,size.height*0.1075000,size.width*0.6606000,size.height*0.0035000,size.width*0.7040000,size.height*0.0050000);
    path_0.cubicTo(size.width*0.7540000,size.height*0.0050000,size.width*0.8540000,size.height*0.0050000,size.width*0.9040000,size.height*0.0050000);
    path_0.cubicTo(size.width*1.0008000,size.height*0.0042500,size.width,size.height*0.0047500,size.width,size.height*0.2500000);
    path_0.cubicTo(size.width*1.0005000,size.height*0.3775000,size.width*1.0015000,size.height*0.6325000,size.width*1.0020000,size.height*0.7600000);
    path_0.cubicTo(size.width*1.0013000,size.height*0.9967500,size.width*1.0023000,size.height*0.9962500,size.width*0.9000000,size.height*0.9950000);
    path_0.cubicTo(size.width*0.6995000,size.height*0.9950000,size.width*0.2985000,size.height*0.9950000,size.width*0.0980000,size.height*0.9950000);
    path_0.cubicTo(size.width*0.0004000,size.height*1.0005000,size.width*0.0012000,size.height*1.0015000,size.width*0.0020000,size.height*0.7450000);
    path_0.cubicTo(size.width*0.0015000,size.height*0.6237500,size.width*0.0015000,size.height*0.6237500,0,size.height*0.2600000);
    path_0.close();

    return path_0;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}

class RPSCustomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path_0 = Path();
    path_0.moveTo(0, size.height * 0.1020000);
    path_0.cubicTo(size.width * 0.0019000, size.height * 0.0034600, size.width * 0.0025000, size.height * 0.0030000, size.width * 0.0833333, size.height * 0.0020000);
    path_0.cubicTo(size.width * 0.2916667, size.height * 0.0020000, size.width * 0.7083333, size.height * 0.0020000, size.width * 0.9166667, size.height * 0.0020000);
    path_0.cubicTo(size.width * 1.0001667, size.height * 0.0025000, size.width * 1.0005000, size.height * 0.0051000, size.width, size.height * 0.1000000);
    path_0.cubicTo(size.width, size.height * 0.2995000, size.width, size.height * 0.6985000, size.width, size.height * 0.8980000);
    path_0.cubicTo(size.width * 1.0018333, size.height * 1.0008000, size.width * 1.0015000, size.height, size.width * 0.9166667, size.height * 1.0020000);
    path_0.cubicTo(size.width * 0.8750000, size.height * 1.0015000, size.width * 0.7916667, size.height * 1.0005000, size.width * 0.7500000, size.height);
    path_0.cubicTo(size.width * 0.6643333, size.height, size.width * 0.7503333, size.height * 0.9024000, size.width * 0.6633333, size.height * 0.9040000);
    path_0.cubicTo(size.width * 0.5812500, size.height * 0.9035000, size.width * 0.4170833, size.height * 0.9025000, size.width * 0.3350000, size.height * 0.9020000);
    path_0.cubicTo(size.width * 0.2510833, size.height * 0.9046000, size.width * 0.3339167, size.height * 0.9978000, size.width * 0.2500000, size.height * 1.0020000);
    path_0.cubicTo(size.width * 0.2087500, size.height * 1.0015000, size.width * 0.1262500, size.height * 1.0005000, size.width * 0.0850000, size.height);
    path_0.cubicTo(size.width * 0.0015000, size.height * 1.0017000, size.width * -0.0001667, size.height * 1.0035000, size.width * 0.0016667, size.height * 0.8980000);
    path_0.cubicTo(size.width * 0.0012500, size.height * 0.6990000, size.width * 0.0012500, size.height * 0.6990000, 0, size.height * 0.1020000);
    path_0.close();

    return path_0;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
