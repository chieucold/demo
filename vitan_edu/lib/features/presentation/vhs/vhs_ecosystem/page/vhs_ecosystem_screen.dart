import 'package:core/language/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:vitan_edu/core/widget/appbar_widget/app_bar_supper_app.dart';
import 'package:vitan_edu/features/presentation/vhs/vhs_ecosystem/widgets/vhs_ecosystem_widget.dart';

class VHSEcosystemScreen extends StatefulWidget {
  const VHSEcosystemScreen({Key? key}) : super(key: key);

  @override
  State<VHSEcosystemScreen> createState() => _VHSEcosystemScreenState();
}

class _VHSEcosystemScreenState extends State<VHSEcosystemScreen> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: AppBarSupperApp(
        title: AppLocalizations.of(context)!.translate("ecosystem"),
      ),
      body: VHSEcosystemWidget(),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
