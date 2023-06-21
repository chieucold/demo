import 'package:core/common/constants/const/enum.dart';
import 'package:flutter/cupertino.dart';
import 'package:vitan_edu/core/theme/custom.dart';
import 'package:vitan_edu/features/presentation/vhs/vhs6_personal/view/widgets/vhs6_webview_widget.dart';

class VHS3SignUpWidget extends StatefulWidget {
  const VHS3SignUpWidget({Key? key}) : super(key: key);

  @override
  State<VHS3SignUpWidget> createState() => _VHS3SignUpWidgetState();
}

class _VHS3SignUpWidgetState extends State<VHS3SignUpWidget> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Container(
      padding: CustomTheme.paddingBodyDefault,
      child: VHS6WebViewWidget(
        showAppbar: false,
        typeView: VHS6TypeWebView.register,
        classHide: ['box-l', 'block-title-login'], //"text-left", "logo-m", '',
        loadingWidget: _loading,
        disableVerticalScroll: true,
        disableHorizontalScroll: true,
        codeJavascriptAdd: _codeJavascriptAdd,
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;

  Widget get _loading => Center(child: CupertinoActivityIndicator());

  String get _codeJavascriptAdd => '''
              document.getElementsByClassName('inner')[0].style.width="100%";
              document.getElementsByClassName('container')[0].style.maxWidth="100%"
              document.getElementsByClassName('custom-input')[0].style.marginTop=0
              document.getElementsByClassName('container')[0].style.padding=0
              ''';
}
