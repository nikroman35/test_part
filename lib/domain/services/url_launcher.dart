
import 'package:url_launcher/url_launcher_string.dart';

class URLLauncher {
  static Future<bool> canLaunchUrl(String urlPath) async {
    if (await canLaunchUrlString(urlPath)) {
      return true;
    } else {
      return false;
    }
  }

  static Future<void> launchUrl(String urlPath) async {
    await launchUrlString(urlPath);
  }
}