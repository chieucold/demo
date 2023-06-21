import 'package:core/common/app_settings/app_settings.dart';
import 'package:core/components/core_component.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:get_it/get_it.dart';

class BNDVideoPlayer extends StatefulWidget {
  const BNDVideoPlayer({
    Key? key,
    required this.url,
    this.height = 250,
    this.borderRadiusNumber = 0,
    this.width = double.infinity,
    this.onEnded,
  }) : super(key: key);
  final String url;
  final double height;
  final double width;

  final double borderRadiusNumber;
  final Function? onEnded;

  @override
  _BNDVideoPlayerState createState() => _BNDVideoPlayerState();
}

class _BNDVideoPlayerState extends State<BNDVideoPlayer> with AutomaticKeepAliveClientMixin {
  final AppSettings appSettings = GetIt.I();

  String get _url => widget.url;
  late String _initialUrlRequest;

  double get _borderRadiusNumber => widget.borderRadiusNumber;
  late InAppWebViewController _controller;

  @override
  void initState() {
    super.initState();
    if (_url.contains(appSettings.configs.embedVideoUrl)) {
      _initialUrlRequest = _url;
    } else {
      _initialUrlRequest = appSettings.configs.embedVideoUrl + _url;
    }
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    print(_url.trim());
    if (_url.trim().isNotEmpty)
      return SizedBox(
        width: widget.width,
        height: widget.height,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(_borderRadiusNumber),
          child: InAppWebView(
              onEnterFullscreen: (controller) {
                print("onEnterFullscreen");
              },
              initialOptions: InAppWebViewGroupOptions(
                android: AndroidInAppWebViewOptions(
                  disableDefaultErrorPage: true,
                  displayZoomControls: true,
                  useHybridComposition: true,
                ),
                ios: IOSInAppWebViewOptions(
                  allowsInlineMediaPlayback: true,
                ),
                crossPlatform: InAppWebViewOptions(
                    supportZoom: false,
                    mediaPlaybackRequiresUserGesture: false,
                    horizontalScrollBarEnabled: false,
                    // userAgent: userAgent,
                    verticalScrollBarEnabled: false),
              ),
              androidOnPermissionRequest:
                  (InAppWebViewController controller, String origin, List<String> resources) async {
                return PermissionRequestResponse(resources: resources, action: PermissionRequestResponseAction.GRANT);
              },
              initialUrlRequest: URLRequest(url: Uri.parse(_initialUrlRequest)),
              onWebViewCreated: (InAppWebViewController controller) {
                _controller = controller;
                _controller.addJavaScriptHandler(
                    handlerName: "ended",
                    callback: (List<dynamic> args) {
                      if (widget.onEnded != null) widget.onEnded!();
                    });
              },
              onExitFullscreen: (InAppWebViewController controller) {
                print('exit');
              }),
        ),
      );

    return const SizedBox();
  }

  @override
  bool get wantKeepAlive => true;
}

// class BNDVideoPlayder extends StatefulWidget {
//   const BNDVideoPlayder({Key? key}) : super(key: key);

//   @override
//   _BNDVideoPlayderState createState() => _BNDVideoPlayderState();
// }

// class _BNDVideoPlayderState extends State<BNDVideoPlayder> {
//   TargetPlatform? _platform;
//   late VideoPlayerController _videoPlayerController1;
//   ChewieController? _chewieController;

//   @override
//   void initState() {
//     super.initState();
//     initializePlayer();
//   }

//   @override
//   void dispose() {
//     _videoPlayerController1.dispose();
//     _chewieController!.dispose();
//     super.dispose();
//   }

//   Future<void> initializePlayer() async {
//     _videoPlayerController1 = VideoPlayerController.network(
//         'https://player.bndtech.vn/embed?v=/file/RVhBTS81LzIwMjEvMDkvMTYvYzA4ZmM0MDgxYmQzNDFmOWJjOTc2ZjU4M2E0MWJhMTYvNjM3NjczOTc5MTQ2Njg2NTQxLm1wNA/file-637673979146686541.mp4');

//     await _videoPlayerController1.initialize();
//     _chewieController = ChewieController(
//         videoPlayerController: _videoPlayerController1,
//         autoPlay: true,
//         //looping: true,
//         subtitleBuilder: (context, dynamic subtitle) => Container(
//               padding: const EdgeInsets.all(10.0),
//               child: subtitle is InlineSpan
//                   ? RichText(
//                       text: subtitle,
//                     )
//                   : Text(
//                       subtitle.toString(),
//                       style: const TextStyle(color: Colors.black),
//                     ),
//             ));
//     setState(() {});
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: _chewieController != null && _chewieController!.videoPlayerController.value.isInitialized
//           ? Chewie(
//               controller: _chewieController!,
//             )
//           : Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: const <Widget>[
//                 CircularProgressIndicator(),
//                 SizedBox(height: 20),
//                 Text('Loading'),
//               ],
//             ),
//     );
//   }
// }
