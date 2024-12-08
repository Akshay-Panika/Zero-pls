import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class FontIcons extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;
  const FontIcons({super.key, required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return  InkWell(
        onTap: onTap,
        child:  FaIcon(icon, size: 20, color: Colors.black54,));
  }
}
