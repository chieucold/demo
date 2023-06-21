import 'package:common/components/personal/personal_info_widget.dart';
import 'package:common/route/route_goto.dart';
import 'package:core/assets/images/images.dart';
import 'package:core/common/common.dart';
import 'package:core/common/text_style.dart';
import 'package:core/components/bnd_pull_to_refresh.dart';
import 'package:core/components/core_component.dart';
import 'package:core/language/app_localizations.dart';
import 'package:core/model/user_info.dart';
import 'package:core/shared_preferences/local_storage_manager.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:vitan_edu/core/theme/custom.dart';
import 'package:vitan_edu/features/presentation/vhs/vhs6_personal/bloc/vhs6_personal_bloc.dart';
import 'package:vitan_edu/features/presentation/vhs/vhs6_personal/view/widgets/vhs6_webview_widget.dart';
import 'package:vitan_edu/features/route/route_goto.dart';

// ignore: must_be_immutable
class VHS6PersonalWidget extends StatefulWidget {
  VHS6PersonalWidget({
    Key? key,
    required this.bloc,
  }) : super(key: key);
  final VHS6PersonalBloc bloc;

  @override
  State<VHS6PersonalWidget> createState() => _VHS6PersonalWidgetState();
}

class _VHS6PersonalWidgetState extends State<VHS6PersonalWidget> {
  late int selectedIndex = 0;
  late RefreshController _refreshController;

  @override
  void initState() {
    super.initState();
    _refreshController = RefreshController(initialRefresh: false);
  }

  @override
  Widget build(BuildContext context) {
    return BNDPullToRefresh(
      controller: _refreshController,
      onRefresh: () {
        setState(() {
          selectedIndex++;
        });
        Future<void>.delayed(const Duration(milliseconds: 500), () {
          _refreshController.loadComplete();
          _refreshController.refreshCompleted();
        });
      },
      child: SingleChildScrollView(
        padding: EdgeInsets.only(top: 32),
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            _buildBasicInfo(),
            _buildMenuOption(context),
            const SizedBox(height: 55),
            SizedBox(height: MediaQuery.of(context).size.height * 0.08),
          ],
        ),
      ),
    );
  }

  Widget _buildBasicInfo() {
    return BlocBuilder<VHS6PersonalBloc, UserInfo?>(
      builder: (BuildContext context, UserInfo? state) {
        return PersonalInfoWidget(
          imageUrl: state?.avatar ?? '',
          name: state?.name ?? 'A',
          email: state?.email ?? '',
        );
      },
    );
  }

  Widget _buildMenuOption(BuildContext context) {
    final List<PersonalOptionMenu> _menuOptions = <PersonalOptionMenu>[
      PersonalOptionMenu(Images.vhs6Personal, AppLocalizations.of(context)!.translate("manage_account"), () async {
        await Navigator.of(context).push(
          MaterialPageRoute<bool>(
              builder: (BuildContext context) {
                return VHS6WebViewWidget(
                  typeView: VHS6TypeWebView.info,
                );
              },
              fullscreenDialog: true),
        );
        widget.bloc.updateInfo();
      }),
      PersonalOptionMenu(Images.vhs6Shield, AppLocalizations.of(context)!.translate("change_password"), () async {
        await Navigator.of(context).push(
          MaterialPageRoute<bool>(
              builder: (BuildContext context) {
                return VHS6WebViewWidget(
                  typeView: VHS6TypeWebView.changePassword,
                  classHide: ['box-head'],
                );
              },
              fullscreenDialog: true),
        );
      }),
      PersonalOptionMenu(Images.vhs6QR, AppLocalizations.of(context)!.translate("login_by_qr"), () {
        goToVHSLoginQRCode(context);
      }),
      PersonalOptionMenu(Images.vhs6OTP, AppLocalizations.of(context)!.translate("get_otp_code"), () {
        goToVHS10Otp(context);
      }),
      PersonalOptionMenu(Images.icFinger, AppLocalizations.of(context)!.translate("security_setting"), () {
        goToVHS7SecuritySettings(context);
      }),
      PersonalOptionMenu(Images.vhs6AdvancedSettings, AppLocalizations.of(context)!.translate("advanced_settings"),
          () async {
        final String _token = LocalStoreManager.getString(UserSettings.tokenUser);
        final String _url = (kDebugMode ? ApiPath.Id : ApiPathRelease.Id) + '/app?token=$_token';
        if (!await launch(_url)) showMessage(AppLocalizations.of(context)!.translate('developing'));
      }),
      PersonalOptionMenu(
          Images.vhs6Help, AppLocalizations.of(context)!.translate("help"), () => goToContactScreen(context)),
      PersonalOptionMenu(Images.vhs6Logout, AppLocalizations.of(context)!.translate("logout"), () {
        widget.bloc.logout(context);
      })
    ];
    return ListView.separated(
      itemCount: _menuOptions.length,
      primary: false,
      shrinkWrap: true,
      padding: const EdgeInsets.symmetric(horizontal: 30),
      itemBuilder: (BuildContext context, int i) {
        return _buildTileItem(
          _menuOptions[i].title,
          _menuOptions[i].icon,
          Images.icChevronRight,
          12,
          CustomTheme.tileColor,
          context,
          _menuOptions[i].onTap,
        );
      },
      separatorBuilder: (BuildContext context, int i) {
        return const SizedBox(height: 16);
      },
    );
  }

  Widget _buildTileItem(
    String text,
    String leadingIcon,
    String trailingIcon,
    double radius,
    Color tileColor,
    BuildContext context,
    Function ontap,
  ) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        color: tileColor,
      ),
      child: ListTile(
        onTap: () {
          ontap();
        },
        tileColor: Colors.transparent,
        minLeadingWidth: 16,
        leading: Container(
          margin: const EdgeInsets.only(left: 8, top: 3),
          width: 20,
          height: 20,
          alignment: Alignment.center,
          child: Images.svgAssets(
            leadingIcon,
            color: CustomTheme.tileLeadingColor,
            width: 20,
            height: 20,
          ),
        ),
        title: Text(
          text,
          style: textStyleBodyMedium.copyWith(color: CustomTheme.textColor),
        ),
        trailing: Container(
          width: 12,
          height: 12,
          alignment: Alignment.center,
          child: Images.svgAssets(
            trailingIcon,
            color: CustomTheme.textColor,
            width: 20,
            height: 20,
          ),
        ),
      ),
    );
  }
}

class PersonalOptionMenu {
  String icon;
  String title;
  Function onTap;
  PersonalOptionMenu(this.icon, this.title, this.onTap);
}
