import 'dart:async';
import 'package:core/common/app_settings/app_settings.dart';
import 'package:core/common/bloc/bloc_index.dart';
import 'package:core/common/common.dart';
import 'package:core/components/advertisement_slider_widget/bloc/advertisement_slider_bloc.dart';
import 'package:core/components/bnd_webview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_inappwebview/src/in_app_webview/in_app_webview_controller.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CarouselSliderChildWidget extends StatefulWidget {
  final String url;
  final double height;
  final int index;

  const CarouselSliderChildWidget({Key? key, required this.url, required this.height, this.index = 0})
      : super(key: key);

  @override
  State<CarouselSliderChildWidget> createState() => _CarouselSliderChildWidgetState();
}

class _CarouselSliderChildWidgetState extends State<CarouselSliderChildWidget> with TickerProviderStateMixin {
  bool isOpacity = true;
  late AdvertisementSliderBloc _bloc;
  final int _durationAdvertisement = GetIt.I<AppSettings>().getAppSettings.configs.durationAdvertisement;
  int _currentPage = 0;
  String _url = '';
  late InAppWebViewController? _controller;

  @override
  void initState() {
    super.initState();
    _url = widget.url;
    _bloc = BlocProvider.of<AdvertisementSliderBloc>(context);
    _startTimer();
    // _delay();
  }

  Timer? _startTimer() {
    return Timer.periodic(Duration(seconds: _durationAdvertisement), (_) {
      if (_currentPage < _bloc.listUrl.length - 1) {
        _currentPage += 1;
      } else {
        _currentPage = 0;
      }
      _url = _bloc.listUrl[_currentPage];
      _controller!.loadUrl(urlRequest: URLRequest(url: Uri.parse(_url)));
      _delay();
    });
  }

  Future<void> _delay() async {
    await Future<void>.delayed(const Duration(milliseconds: 500));
    setState(() {
      isOpacity = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height.sp,
      // padding: const EdgeInsets.symmetric(horizontal: 80),
      child: BNDWebView(
          path: _url,
          isShowLoading: false,
          disableHorizontalScroll: true,
          disableVerticalScroll: true,
          onNewPage: _onNewPage,
          functionCallBacks: <BNDWebviewFunctionModel>[
            BNDWebviewFunctionModel("aBnDClick", (List data) {
              if (data != null) {
                Utils.openLaunch(data.first);
              }
            }),
          ]),
    );
  }

  void _onNewPage(Uri? uri, InAppWebViewController controller) {
    _controller = controller;
  }
}
