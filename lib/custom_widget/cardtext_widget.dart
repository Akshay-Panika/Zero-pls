import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CardTextWidget extends StatelessWidget {
  final String title;
  final EdgeInsets? padding;
  final VoidCallback? onTap;
  const CardTextWidget({super.key, required this.title, this.padding, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
        elevation: 0.0,
        color: Colors.deepOrange.shade50,
        shape: OutlineInputBorder(borderSide: BorderSide(color: Colors.transparent)),
        child: Padding(padding: padding ?? EdgeInsets.all(10),
        child: Text(title, style: const TextStyle(fontSize: 14,fontWeight: FontWeight.w700),),
        ),
      ),
    );
  }
}
