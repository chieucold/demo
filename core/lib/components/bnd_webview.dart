import 'dart:io';
import 'package:core/common/bnd_cupertino_will_pop_scope/cupertino_will_pop_scope.dart';
import 'package:core/common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:get_it/get_it.dart';
import 'package:core/common/app_settings/app_settings.dart';

// ignore: must_be_immutable
class BNDWebView extends StatefulWidget {
  BNDWebView(
      {Key? key,
      required this.path,
      this.functionCallBacks,
      this.codeJavascriptAdd = "",
      this.classHide,
      this.isShowLoading = true,
      this.paddingBottom = 0,
      this.loadingWidget,
      this.onNewPage,
      this.disableVerticalScroll = false,
      this.disableHorizontalScroll = false,
      this.isBackWillPopScope = false})
      : super(key: key);
  final String path;
  final List<BNDWebviewFunctionModel>? functionCallBacks;
  final String codeJavascriptAdd;
  final List<String>? classHide;
  final bool isShowLoading;
  final double paddingBottom;
  final Widget? loadingWidget;
  final bool disableVerticalScroll;
  final bool disableHorizontalScroll;
  final bool isBackWillPopScope;
  final Function(Uri? uri, InAppWebViewController controller)? onNewPage;

  @override
  State<BNDWebView> createState() => _BNDWebViewState();
}

class _BNDWebViewState extends State<BNDWebView> {
  late InAppWebViewController _controller;

  bool isShowLoadingPopup = false;
  bool isShowLoadingWidget = false;
  int _countPage = 0;
  late String _url;
  final _appsetting = GetIt.I<AppSettings>().getAppSettings.configs;

  @override
  void initState() {
    super.initState();
    isShowLoadingPopup = (widget.loadingWidget != null) ? false : widget.isShowLoading;
    isShowLoadingWidget = (widget.loadingWidget != null) ? true : false;
    _url = widget.path;
  }

  // bool _checkHomePage(){
  //   bool isHome = !_url.startsWith(_appsetting.contestHomeUrl) && _url != _appsetting.contestAppUrl;
  // print('isHome $isHome');
  //   return isHome;
  // }

  void _onPop() async {
    if (await _controller.canGoBack()) {
      _countPage--;
      await _controller.goBack();
    } else {
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (isShowLoadingPopup) showLoading();

    return widget.path.isNotEmpty
        ? Stack(
            alignment: Alignment.bottomLeft,
            children: <Widget>[_buildWillPopScope(), if (isShowLoadingWidget) widget.loadingWidget!],
          )
        : const SizedBox();
  }

  Widget _buildWillPopScope() {
    if (widget.isBackWillPopScope)
      return ConditionalWillPopScope(
          child: _buildWebView(),
          onWillPop: () async {
            _onPop();
            return Future<bool>.value(Platform.isIOS);
          },
          shouldAddCallback: false);
    return _buildWebView();
  }

  Widget _buildWebView() {
    return InAppWebView(
      initialOptions: InAppWebViewGroupOptions(
        crossPlatform: InAppWebViewOptions(
          supportZoom: false,
          disableVerticalScroll: widget.disableVerticalScroll,
          disableHorizontalScroll: widget.disableHorizontalScroll,
        ),
        android: AndroidInAppWebViewOptions(
          useHybridComposition: true,
        ),
        ios: IOSInAppWebViewOptions(
          allowsInlineMediaPlayback: true,
        ),
      ),
      onLoadStart: (InAppWebViewController controller, Uri? url) {
        //if (isShowLoading) showLoading();
      },
      onLoadStop: (InAppWebViewController controller, Uri? url) {
        if (isShowLoadingPopup) hideLoading();

        if (widget.loadingWidget != null) {
          isShowLoadingWidget = false;
          setState(() {});
        }
        _hideClass(controller);
      },
      onUpdateVisitedHistory: (InAppWebViewController controller, Uri? uri, ___) async {
        print("onUpdateVisitedHistory");
        // setState(() {
        //   _url = uri.toString();
        //   print(_countPage);
        // });
        if (widget.onNewPage != null) {
          widget.onNewPage!(uri, controller);
        }
        _hideClass(controller);
      },
      onConsoleMessage: (InAppWebViewController controller, ConsoleMessage consoleMessage) {
        print("console message: ${consoleMessage.message}");
      },
      onWebViewCreated: (InAppWebViewController controller) {
        _controller = controller;
        if (widget.functionCallBacks != null) {
          for (final BNDWebviewFunctionModel item in widget.functionCallBacks!) {
            _controller.addJavaScriptHandler(handlerName: item.handerName, callback: item.callback);
          }
        }
      },
      initialUrlRequest: URLRequest(
        url: Uri.parse(widget.path),
      ),
    );
  }

  void _hideClass(InAppWebViewController controller) {
    Future<void>.delayed(const Duration(milliseconds: 500), () {
      String temp = "";
      if (widget.codeJavascriptAdd != null && widget.codeJavascriptAdd.isNotEmpty) {
        temp = widget.codeJavascriptAdd;
      }

      if (widget.classHide != null && widget.classHide!.length > 0) {
        for (final String item in widget.classHide!) {
          temp += "; document.getElementsByClassName('$item')[0].hidden = true";
        }
      }

      if (widget.paddingBottom > 0)
        temp += "; document.getElementsByTagName('body')[0].style.paddingBottom = '${widget.paddingBottom}px'";

      if (temp.startsWith(';')) temp = temp.substring(1);
      if (!temp.isNullOrEmpty) controller.evaluateJavascript(source: temp);
    });
  }
}

class BNDWebviewFunctionModel {
  String handerName;
  JavaScriptHandlerCallback callback;

  BNDWebviewFunctionModel(this.handerName, this.callback);
}
