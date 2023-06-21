import 'package:core/assets/images/images.dart';
import 'package:core/common/app_settings/app_settings.dart';
import 'package:core/common/common.dart';
import 'package:core/common/text_style.dart';
import 'package:core/components/core_component.dart';
import 'package:core/language/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:vitan_edu/core/theme/custom.dart';
import 'package:vitan_edu/core/widget/appbar_widget/app_bar_supper_app.dart';
import 'package:vitan_edu/features/presentation/vhs/vhs_3_login_user/widgets/login_user_widget.dart';
import 'package:vitan_edu/features/presentation/vhs/vhs_3_login_user/widgets/vhs3_sign_up_widget.dart';

class VHS3LoginUserScreen extends StatefulWidget {
  const VHS3LoginUserScreen({Key? key}) : super(key: key);

  @override
  State<VHS3LoginUserScreen> createState() => _VHS3LoginUserScreenState();
}

class _VHS3LoginUserScreenState extends State<VHS3LoginUserScreen> {
  late PageController _controller;
  int _indexPage = 0;
  String _username = '';

  @override
  void initState() {
    super.initState();
    _controller = PageController(initialPage: _indexPage, keepPage: true, viewportFraction: 1);
    // _listenerController();
  }

  void _listenerController() {
    _controller.addListener(() {
      _indexPage = toInt(_controller.page);
      setState(() {});
    });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  final AppSettings _appSettings = GetIt.I<AppSettings>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        SystemChannels.textInput.invokeMethod('TextInput.hide');
      },
      child: Scaffold(
        // resizeToAvoidBottomInset: false,
        appBar: AppBarSupperApp(height: 0),
        body: Stack(
          children: [
            Container(
                height: double.infinity,
                alignment: Alignment.bottomCenter,
                child: Images.svgAssets(Images.vhs3LoginBg, color: CustomTheme.vhsBorderColor)),
            _buildBody(),
          ],
        ),
      ),
    );
  }

  Widget _buildBody() {
    final String _imgLogo = _appSettings.configs.imgLogoLogin;
    return OrientationBuilder(builder: (_, Orientation ori) {
      return Container(
        width: double.infinity,
        child: Column(
          children: [
            SizedBox(height: 20),
            ori == Orientation.portrait ? BNDImage(imageUrl: _imgLogo, height: 150.sp) : SizedBox(height: 32.sp),
            Container(
              padding: CustomTheme.paddingBodyDefault,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  _title(0, 'login'),
                  SizedBox(width: 12),
                  _title(1, 'sign_up'),
                ],
              ),
            ),
            Expanded(
              child: IndexedStack(
                // controller: _controller,
                // physics: const NeverScrollableScrollPhysics(),
                sizing: StackFit.passthrough,
                index: _indexPage,
                children: [
                  LoginUserWidget(
                    pageController: _controller,
                    userName: _username,
                    onSuccessUser: (String username) {
                      // _bloc.streamBackController.add(true);
                      _username = username;
                      setState(() {});
                    },
                  ),
                  VHS3SignUpWidget(),
                ],
              ),
            ),
          ],
        ),
      );
    });
  }

  Widget _title(int i, String text) {
    return InkWell(
      onTap: _jumpPageView(i),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 12),
        alignment: Alignment.bottomCenter,
        child: AnimatedDefaultTextStyle(
          duration: const Duration(milliseconds: 350),
          style: _indexPage == i ? CustomTheme.selectLoginTitleStyle : CustomTheme.unSelectLoginTitleStyle,
          child: Text(AppLocalizations.of(context)!.translate(text)),
        ),
      ),
    );
  }

  Function()? _jumpPageView(int i) {
    if (_indexPage == i) return null;
    // return () => _controller.animateToPage(i, duration: Duration(milliseconds: 250), curve: Curves.ease);
    return () => setState(() => _indexPage = i);
  }
}
