import 'package:core/common/common.dart';
import 'package:core/common/constants/url_settings.dart';
import 'package:core/common/utils/app_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

import '../common/color/core_color.dart';
import '../common/text_style.dart';

class BNDViewFile extends StatefulWidget {
  BNDViewFile({Key? key, required this.fileUrl, this.loaded, this.titleLoading, this.padding}) : super(key: key);

  final String fileUrl;
  final Function? loaded;
  final String? titleLoading;
  final double? padding;

  @override
  State<BNDViewFile> createState() => _BNDViewFileState();
}

class _BNDViewFileState extends State<BNDViewFile> {
  late InAppWebViewController _controller;

  double? get _paddingBottom => widget.padding;
  bool isShowFile = false;

  @override
  Widget build(BuildContext context) {
    final String extension = Utils.getExtension(widget.fileUrl);

    String filePath = widget.fileUrl;

    if (extension.toLowerCase() == 'pdf' ||
        extension.toLowerCase().contains('doc') ||
        extension.toLowerCase().contains('xls')) filePath = "${UrlSettings.fileViewUrl}${widget.fileUrl}";
    return Stack(children: <Widget>[
      InAppWebView(
        initialOptions: InAppWebViewGroupOptions(
          crossPlatform: InAppWebViewOptions(
            supportZoom: false,
          ),
          android: AndroidInAppWebViewOptions(
            useHybridComposition: true,
          ),
          ios: IOSInAppWebViewOptions(
            allowsInlineMediaPlayback: true,
          ),
        ),
        onLoadStop: (InAppWebViewController controller, _) {
          controller.evaluateJavascript(
              source:
                  "if(document.querySelector('[role=\"toolbar\"]'))document.querySelector('[role=\"toolbar\"]').remove();if(document.querySelector('[role=\"document\"]'))document.querySelector('[role=\"document\"]').style.marginTop = 0; if(document.querySelector('[role=\"document\"]'))document.querySelector('[role=\"document\"]').style.paddingBottom = '${_paddingBottom}px'");

          if (widget.loaded != null) {
            widget.loaded!();
          } else {
            isShowFile = true;
            setState(() {});
          }
        },
        initialUrlRequest: URLRequest(url: Uri.parse(filePath)),
        onWebViewCreated: (InAppWebViewController controller) {
          _controller = controller;
        },
      ),
      Positioned(
        child: IconButton(
          icon: const Icon(Icons.replay),
          onPressed: () async {
            if (!await _controller.isLoading()) {
              showLoading();
              await _controller.reload();
              hideLoading();
            }
          },
        ),
        top: 0,
        right: 0,
      ),
      isShowFile
          ? const SizedBox.shrink()
          : Positioned(
              child: Center(
              child: Text(
                widget.titleLoading ?? '',
                style: textStyleBodyDefault.copyWith(color: kTextColor),
              ),
            ))
    ]);
  }
}
