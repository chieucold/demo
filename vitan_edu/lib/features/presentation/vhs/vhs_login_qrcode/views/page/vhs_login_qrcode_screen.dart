import 'package:core/common/text_style.dart';
import 'package:core/components/bnd_qrcode_scan.dart';
import 'package:core/language/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vitan_edu/core/common/injection.dart';
import 'package:vitan_edu/core/theme/custom.dart';
import 'package:core/common/dimension.dart';
import 'package:vitan_edu/features/presentation/vhs/vhs_login_qrcode/bloc/vhs_login_qrcode_bloc.dart';
import 'package:vitan_edu/features/presentation/vhs/vhs_login_qrcode/views/widgets/vhs_login_qrcode_error_widget.dart';
import 'package:vitan_edu/features/presentation/vhs/vhs_login_qrcode/views/widgets/vhs_login_qrcode_info_widget.dart';

// ignore: must_be_immutable
class VHSLoginQRCodeScreen extends StatefulWidget {
  VHSLoginQRCodeScreen({Key? key}) : super(key: key);

  @override
  _VHSLoginQRCodeScreenState createState() => _VHSLoginQRCodeScreenState();
}

class _VHSLoginQRCodeScreenState extends State<VHSLoginQRCodeScreen> {
  late String code = "";
  late VHSLoginQrcodeBloc _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = getItSuper();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _buildBody(context));
  }

  Widget _buildBody(BuildContext context) {
    return BlocProvider<VHSLoginQrcodeBloc>(
      create: (BuildContext context) => _bloc,
      child: BlocBuilder<VHSLoginQrcodeBloc, VHSLoginQrcodeState>(
        builder: (BuildContext context, VHSLoginQrcodeState state) {
          if (state is VHSLoginQrcodeInfo) return VHSLoginQRCodeInfoWidget(bloc: _bloc);
          if (state is VHSLoginQrcodeError) return VHSLoginQRCodeErrorWidget(message: state.error);
          return Stack(
            children: <Widget>[
              BndQrCodeScan(
                borderColor: CustomTheme.tileLeadingColor,
                getResult: (String code) {
                  _bloc.getQRCodeInfo(code);
                },
              ),
              Positioned(
                child: Container(
                    alignment: Alignment.center,
                    child: Text(
                      AppLocalizations.of(context)!.translate("move_to_scan_qr"),
                      style: textStyleBodyDefault.copyWith(color: CustomTheme.textWhiteColor),
                    )),
                top: height(context, 120),
                left: 10,
                right: 10,
              ),
              Positioned(
                child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: const CircleAvatar(backgroundColor: Colors.red, child: Icon(Icons.close))),
                top: height(context, 50),
                left: 10,
              ),
            ],
          );
        },
      ),
    );
  }
}
