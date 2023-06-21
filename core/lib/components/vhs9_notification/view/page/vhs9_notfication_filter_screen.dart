import 'package:core/common/color/core_color.dart';
import 'package:core/components/appbar/app_bar_supper_app.dart';
import 'package:core/components/common_leading_widget.dart';
import 'package:core/components/vhs9_notification/bloc/vhs9_notification_bloc.dart';
import 'package:core/components/vhs9_notification/bloc/vhs9_notification_filter_bloc.dart';
import 'package:core/components/vhs9_notification/view/widgets/vhs9_notification_filter_widget.dart';
import 'package:core/language/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class VHS9NotificationFilterScreen extends StatelessWidget {
  final VHS9NotificationBloc notificationBloc;
  VHS9NotificationFilterScreen({Key? key, required this.notificationBloc}) : super(key: key);
  final VHS9NotificationFilterBloc _bloc = GetIt.I<VHS9NotificationFilterBloc>();
  // final VHS9NotificationBloc _notificationBloc = getItSuper();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarSupperApp(
        leading: CommonLeadingWidget(iconColor: CoreColor.vhs9BackColor),
        title: AppLocalizations.of(context)!.translate("filter"),
      ),
      body: BlocProvider<VHS9NotificationFilterBloc>(
        create: (BuildContext context) => _bloc..init(),
        child: VHS9NotificationFilterWidget(notificationBloc: notificationBloc),
      ),
    );
  }
}
