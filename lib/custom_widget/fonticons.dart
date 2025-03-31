import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class FontIcons extends StatefulWidget {
  final IconData icon;
  final VoidCallback onTap;
  const FontIcons({super.key, required this.icon, required this.onTap});

  @override
  State<FontIcons> createState() => _FontIconsState();
}

class _FontIconsState extends State<FontIcons> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return  InkWell(
        onTap: widget.onTap,
        child:  MouseRegion(
            onEnter: (_) => setState(() => isHovered = true),
            onExit: (_) => setState(() => isHovered = false),
            child: FaIcon(widget.icon, size: 20, color: isHovered ? Colors.deepOrange.shade50: Colors.black,)));
  }
}
