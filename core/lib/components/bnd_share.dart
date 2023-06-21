import 'package:core/assets/images/images.dart';
import 'package:core/common/common_function.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class BND_Share extends StatelessWidget {
  final Color backgroundColor;
  final Color? borderColor;
  final bool hasBorder;
  final int objectType;
  final int objectId;
  BND_Share({
    Key? key,
    this.backgroundColor = const Color(0xff414B5B),
    this.hasBorder = false,
    required this.objectType,
    required this.objectId,
    this.borderColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<ShareModel> shareModel = <ShareModel>[
      // ShareModel(Images.icFBShare, () {
      //   // _onShareSocial(SocialMedia.facebook);
      //   _onShare(context);
      // }),
      // ShareModel(Images.icInstaShare, () {
      //   // _onShareSocial(SocialMedia.twitter);
      //   _onShare(context);
      // }),
      ShareModel(Images.icShare, () {
        _onShare(context);
      })
    ];
    return Row(
      children: <Widget>[
        for (int i = 0; i < shareModel.length; i++)
          GestureDetector(
            onTap: () {
              shareModel[i].onChoose();
            },
            child: Container(
              height: 30,
              width: 30,
              margin: const EdgeInsets.only(right: 12),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: !hasBorder ? backgroundColor.withOpacity(0.1) : Colors.transparent,
                border: !hasBorder
                    ? null
                    : Border.all(
                        width: 1,
                        color: borderColor ?? backgroundColor.withOpacity(0.2),
                      ),
              ),
              alignment: Alignment.center,
              child: Images.svgAssets(
                shareModel[i].icon,
                height: 12,
                package: 'core',
                color: !hasBorder ? backgroundColor.withOpacity(0.7) : borderColor ?? backgroundColor,
              ),
            ),
          ),
      ],
    );
  }

  Future<void> _onShare(BuildContext context) async {
    // final RenderBox box = context.findRenderObject() as RenderBox;
    // final String subject = "ádsda";
    // await Share.share(url,
    //     subject: subject,
    //     sharePositionOrigin: box.localToGlobal(Offset.zero) & box.size);
    await onShare(context, objectType, objectId);
  }

  Future<void> _onShareSocial(SocialMedia socialPlatform) async {
    final String text = 'BNDShare';
    final String urlShare = Uri.encodeComponent('https://pub.dev/');
    final String subject = 'BNDShare';

    final Map<SocialMedia, String> urls = <SocialMedia, String>{
      SocialMedia.facebook: 'https://www.facebook.com/sharer/sharer.php?u=$urlShare&text=$text',
      SocialMedia.twitter: 'https://twitter.com/intent/tweet?url=$urlShare&text=$text',
      SocialMedia.email: 'mailto:?subject=$subject&body=$text\n\n$urlShare',
      SocialMedia.linkedin: 'https://www.linkedin.com/shareArticle?mini=true&url=$urlShare',
      SocialMedia.whatsapp: 'https://api.whatsapp.com/send?text=$text$urlShare',
    };

    final String url = urls[socialPlatform]!;
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}

enum SocialMedia { facebook, twitter, email, linkedin, whatsapp }

class ShareModel {
  String icon;
  Function onChoose;
  ShareModel(this.icon, this.onChoose);
}
