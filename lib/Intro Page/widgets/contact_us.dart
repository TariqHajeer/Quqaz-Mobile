import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactUs extends StatelessWidget {
  const ContactUs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: Get.width,
        height: Get.height * 0.6,
        child: ListView(
          physics: NeverScrollableScrollPhysics(),
          children: [
            ListTile(
              title:
                  Text('متابعة', style: Theme.of(context).textTheme.headline6),
              subtitle: Text('07700890880',
                  style: Theme.of(context).textTheme.subtitle1),
              leading: CircleAvatar(
                backgroundColor: Colors.green,
                child: Icon(
                  Icons.phone,
                  color: Colors.white,
                ),
              ),
              onTap: () async {
                await _launchPhone(phone: ("07700890880"));
              },
            ),
            ListTile(
              title:
                  Text('متابعة2', style: Theme.of(context).textTheme.headline6),
              subtitle: Text('07714400880',
                  style: Theme.of(context).textTheme.subtitle1),
              leading: CircleAvatar(
                backgroundColor: Colors.green,
                child: Icon(Icons.phone, color: Colors.white),
              ),
              onTap: () async {
                await _launchPhone(phone: ("07714400880"));
              },
            ),
            ListTile(
              title: Text('القوقز للتوصيل السريع',
                  style: Theme.of(context).textTheme.headline6),
              // subtitle: Text('القوقز للتوصيل السريع',
              //     style: Theme.of(context).textTheme.subtitle1),
              leading: CircleAvatar(
                  child: Container(
                      color: Colors.white,
                      child: Image.asset('images/face.png'))),
              onTap: () async {
                await _launchUrl(url: 'https://www.facebook.com/quqaz.fast/');
              },
            ),
            ListTile(
              title: Text('quqaz.fast',
                  style: Theme.of(context).textTheme.headline6),
              // subtitle: Text('quqaz.fast',
              //     style: Theme.of(context).textTheme.subtitle1),
              leading: CircleAvatar(
                  child: Container(
                      color: Colors.white,
                      child: Image.asset('images/insta.png'))),
              onTap: () async {
                await _launchUrl(url: 'https://www.instagram.com/quqaz.fast/');
              },
            ),
            ListTile(
              title: Text('اربيل - قرب تقاطع كوك ايه',
                  style: Theme.of(context).textTheme.headline6),
              // subtitle: Text('اربيل - قرب تقاطع كوك ايه',
              //     style: Theme.of(context).textTheme.subtitle1),
              leading: CircleAvatar(
                backgroundColor: Colors.red,
                child: Icon(Icons.location_on_outlined),
              ),
              onTap: () async {
                await _launchMap(
                    "https://maps.google.com/maps/search/?api=$map_api&query=${33.303257 /*double.parse((state.contact?.location?.lat ?? '1.1'))*/},${44.354321 /*double.parse((state.contact?.location?.lng ?? '1.1' ) )*/}");
              },
            ),
            ListTile(
              title: Text('Support@quqaz.com',
                  style: Theme.of(context).textTheme.headline6),
              // subtitle: Text('Support@quqaz.com',
              //     style: Theme.of(context).textTheme.subtitle1),
              leading: CircleAvatar(
                child: Icon(Icons.email),
              ),
              onTap: () async {
                await launch(getUrl('mailto', 'Support@quqaz.com',
                    {'subject': 'Feedback for quqaz'}));
              },
            ),
          ],
        ));
  }

  static const String map_api = "AIzaSyDXRDoAfTZAp6Mfca6NZlD8egHeRPl7Rec";

  //method to launch maps
  _launchMap(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch Maps';
    }
  }

  _launchPhone({required String phone}) async => await canLaunch('tel:$phone')
      ? await launch('tel:$phone')
      : print('Could not launch $phone');

  _launchUrl({required String url}) async =>
      await canLaunch(url) ? await launch(url) : print('Could not launch $url');

  String getUrl(
      String scheme, String path, Map<String, String> queryParameters) {
    String url = '$scheme:$path?';

    queryParameters.forEach((String k, String v) {
      url += '$k=$v&';
    });

    return url;
  }
}
