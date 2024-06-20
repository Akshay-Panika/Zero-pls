import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'color_widget.dart';

class WhatsappButton extends StatefulWidget {
  const WhatsappButton({super.key});

  @override
  State<WhatsappButton> createState() => _WhatsappButtonState();
}

class _WhatsappButtonState extends State<WhatsappButton> {
  ///___ WhatsAppChat
  final Uri _whatsappChat = Uri.parse('https://wa.me/+918989207770');

  Future<void> whatsappChat() async {
    if (!await launchUrl(_whatsappChat)) {
      throw Exception('Could not launch $_whatsappChat');
    }
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => whatsappChat(),
      icon:  Icon(Icons.chat, color: ColorWidget.colorBlack),);
  }
}
