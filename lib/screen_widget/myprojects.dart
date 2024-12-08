import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyProjects extends StatelessWidget {
  const MyProjects({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return  Expanded(
      child: ListView(
        children: [
          Container(
            height: 600,
            //color: Colors.blue,
            width: double.infinity,
            margin: EdgeInsets.symmetric(horizontal: screenWidth > 500 ? 45 : 10, vertical: 15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.deepOrange.shade100,
            ),
            child: const Center(
              child: Text("My Project"),
            ),
          ),
        ],
      ),
    );
  }
}
