import 'package:flutter/material.dart';
import 'package:zero_pls/widget_folder/textstyle_widget.dart';
import 'color_widget.dart';

class AppbarWidget extends StatelessWidget implements PreferredSizeWidget {
  const AppbarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(10),
      child: AppBar(
        title: const Text("Zero +"),
        titleTextStyle: textStyle20(fontWeight: FontWeight.w600),
        backgroundColor: ColorWidget.deepOrange100,
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
