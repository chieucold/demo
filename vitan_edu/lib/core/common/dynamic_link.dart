import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/material.dart';

class DynamicLinkService {
  FirebaseDynamicLinks dynamicLinks = FirebaseDynamicLinks.instance;
  final String DynamicLink = 'https://test-app/helloworld';
  final bundleIdIos = 'com.googleusercontent.apps.1029208064132-g58ce7g502hbh9o4ob333h3blni39g6';
  final packageNameAndroid = 'com.bndedu.vitanedu';
  final minimumVersionAndroid = 0;
  final minimumVersionIos = '0';
  final uriPrefix = "https://flutterdevs.page.link";

  Future<void> initDynamicLinks(BuildContext context) async {
    dynamicLinks.onLink.listen((dynamicLinkData) {
      final Uri? deepLink = dynamicLinkData.link;
      if (deepLink != null) {
        Navigator.pushNamed(context, dynamicLinkData.link.path);
      }
    })
      ..onData((data) {})
      ..onError((error) {
        print('onLink error');
        print(error.message);
      });
  }

  Future<void> createDynamicLink({required String parameter, required bool isShortLink}) async {
    final DynamicLinkParameters parameters = DynamicLinkParameters(
      uriPrefix: uriPrefix,
      link: Uri.parse('https://example.com/$parameter'),
      androidParameters: AndroidParameters(
        packageName: packageNameAndroid,
        minimumVersion: minimumVersionAndroid,
      ),
      iosParameters: IOSParameters(
        bundleId: bundleIdIos,
        minimumVersion: minimumVersionIos,
        appStoreId: '123456789',
      ),
      googleAnalyticsParameters: GoogleAnalyticsParameters(
        campaign: 'example-promo',
        medium: 'social',
        source: 'orkut',
      ),
      socialMetaTagParameters: SocialMetaTagParameters(
          title: 'Example of a Dynamic Link',
          description: 'This link works whether app is installed or not!',
          imageUrl: Uri.parse(
              "https://images.pexels.com/photos/3841338/pexels-photo-3841338.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260")),
    );
    Uri url;
    if (isShortLink) {
      final ShortDynamicLink shortLink = await dynamicLinks.buildShortLink(parameters);
      url = shortLink.shortUrl;
    } else {
      url = await dynamicLinks.buildLink(parameters);
    }
  }
}
