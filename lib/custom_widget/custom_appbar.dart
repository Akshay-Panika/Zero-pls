import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Widget? leading;
  final List<Widget>? actions;
  final Color backgroundColor;
  final double elevation;
  final bool centerTitle;
  final double height;
  final EdgeInsets? padding;

  const CustomAppBar({
    super.key,
    required this.title,
    this.leading,
    this.actions,
    this.backgroundColor = Colors.blue,
    this.elevation = 4.0,
    this.centerTitle = true,
    this.height = 56.0,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: preferredSize,
      child: Padding(
        padding: padding!,
        child: AppBar(
          title: Text(
            title,
            style: const TextStyle(color: Colors.white,fontWeight: FontWeight.bold),
          ),
          leading: leading,
          actions: actions,
          backgroundColor: backgroundColor,
          elevation: elevation,
          centerTitle: centerTitle,
          shape:  RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10)
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
}
