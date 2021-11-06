import 'package:url_launcher/url_launcher.dart';

Future<void> launchUrl(String url) async {
  if (await canLaunch(url)) {
    print("url is launching");
    await launch(url);
  } else {
    print("unable to launch url");
  }
}
