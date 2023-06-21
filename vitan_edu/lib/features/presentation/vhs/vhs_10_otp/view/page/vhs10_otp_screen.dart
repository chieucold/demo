import 'package:core/components/common_leading_widget.dart';
import 'package:core/language/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:vitan_edu/core/theme/custom.dart';
import 'package:vitan_edu/core/widget/appbar_widget/app_bar_supper_app.dart';
import 'package:vitan_edu/features/presentation/vhs/vhs_10_otp/view/widgets/vhs10_otp_widget.dart';

class VHS10OtpScreen extends StatelessWidget {
  const VHS10OtpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarSupperApp(
          title: AppLocalizations.of(context)!.translate('verification_code_otp'),
          leading: CommonLeadingWidget(iconColor: CustomTheme.textColor)),
      body: const VHS10OtpWidget(),
    );
  }
}
