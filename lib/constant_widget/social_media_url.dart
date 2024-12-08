import 'package:url_launcher/url_launcher.dart';

class UrlHelper {
  /// URLs for social profiles and email
  final Uri instagramProfile = Uri.parse('https://www.instagram.com/akshay_panika/');
  final Uri githubProfile = Uri.parse('https://github.com/Akshay-Panika');
  final Uri linkedInChat = Uri.parse('https://www.linkedin.com/in/akshay-panika/');
  final Uri emailUri = Uri(scheme: 'mailto', path: 'workedids@gmail.com');
  final Uri whatsappUri = Uri.parse('https://wa.me/918989207770');

  /// Method to launch a URL
  Future<void> launchCustomUrl(Uri url) async {
    bool launched = await launchUrl(url);
    if (!launched) {
      throw 'Could not launch $url';
    }
  }
}
