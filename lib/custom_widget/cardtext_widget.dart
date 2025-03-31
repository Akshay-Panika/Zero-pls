import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CardTextWidget extends StatefulWidget {
  final String title;
  final EdgeInsets? padding;
  final VoidCallback? onTap;
  const CardTextWidget({super.key, required this.title, this.padding, this.onTap});

  @override
  State<CardTextWidget> createState() => _CardTextWidgetState();
}

class _CardTextWidgetState extends State<CardTextWidget> {
  bool isHovered = false;
  void _setHoverEffect(bool value) {
    setState(() {
      isHovered = value;
    });
  }
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => _setHoverEffect(true),
      onExit: (_) => _setHoverEffect(false),
      child: GestureDetector(
        onTap: widget.onTap,
        onTapDown: (_) => _setHoverEffect(true),
        onTapUp: (_) => _setHoverEffect(false),
        onTapCancel: () => _setHoverEffect(false),
        child: Card(
          elevation: 0.0,
          color: isHovered ? Colors.deepOrange.shade100:Colors.deepOrange.shade50,
          shape: const OutlineInputBorder(borderSide: BorderSide(color: Colors.transparent)),
          child: Padding(padding: widget.padding ?? EdgeInsets.all(10),
          child: Text(widget.title, style: const TextStyle(fontSize: 14,fontWeight: FontWeight.w700),),
          ),
        ),
      ),
    );
  }
}
