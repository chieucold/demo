import 'package:api/api/commondata_api_models.dart';
import 'package:core/assets/images/images.dart';
import 'package:core/common/color/core_color.dart';
import 'package:core/common/constants/block_settings.dart';
import 'package:core/common/enums/block_enum.dart';
import 'package:core/components/appbar/app_bar_supper_app.dart';
import 'package:core/components/bnd_icon_svg_button.dart';
import 'package:core/components/common_leading_widget.dart';
import 'package:core/components/notification/bloc/noti_count_bloc.dart';
import 'package:core/components/vhs9_notification/bloc/vhs9_notification_bloc.dart';
import 'package:core/components/vhs9_notification/bloc/vhs9_notification_state.dart';
import 'package:core/components/vhs9_notification/view/widgets/vhs9_notification_loading_widget.dart';
import 'package:core/components/vhs9_notification/view/widgets/vhs9_notification_widget.dart';
import 'package:core/language/app_localizations.dart';
import 'package:core/shared_preferences/local_storage_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class VHS9NotificationScreen extends StatefulWidget {
  final Function onTap;
  final Function goToFilter;
  VHS9NotificationScreen({Key? key, required this.onTap, required this.goToFilter}) : super(key: key);

  @override
  State<VHS9NotificationScreen> createState() => _VHS9NotificationScreenState();
}

class _VHS9NotificationScreenState extends State<VHS9NotificationScreen> with AutomaticKeepAliveClientMixin {
  final VHS9NotificationBloc _bloc = GetIt.I();

  final int blockId = LocalStoreManager.getInt(BlockSettings.blockKey);

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BlocProvider<VHS9NotificationBloc>(
      create: (BuildContext blocContext) => _bloc
        ..init(blockId: blockId)
        ..getData().then((_) => GetIt.I<NotiCountBloc>().getNotiNotSee(blockId: blockId)),
      child: Scaffold(
        appBar: AppBarSupperApp(
          title: AppLocalizations.of(context)!.translate("notification"),
          leading: blockId != BlockEnum.SupperApp.index ? CommonLeadingWidget(iconColor: CoreColor.black) : null,
          actions: <Widget>[
            BlocBuilder<VHS9NotificationBloc, VHS9NotificationState>(
              builder: (BuildContext context, VHS9NotificationState state) {
                return Stack(
                  children: <Widget>[
                    BNDIconSvgButton(
                      width: 48,
                      icon: Images.vhs9Filter,
                      onTap: () {
                        widget.goToFilter(context, _bloc);
                        // goToVHS9NotificationFilter(context, _bloc);
                      },
                      colorIcon: CoreColor.textColor,
                    ),
                    if (_bloc.blocksId.isNotEmpty || _bloc.statusId.isNotEmpty)
                      Positioned(
                        right: 8,
                        top: 8,
                        child: Container(
                          height: 8,
                          width: 8,
                          decoration: const BoxDecoration(shape: BoxShape.circle, color: Colors.red),
                        ),
                      )
                  ],
                );
              },
            ),
            const SizedBox(width: 12)
          ],
        ),
        body: BlocBuilder<VHS9NotificationBloc, VHS9NotificationState>(
          builder: (BuildContext context, VHS9NotificationState state) {
            if (state is VHS9NotificationLoading) {
              return const VHS9NotificationLoadingWidget();
            } else if (state is VHS9NotificationLoaded) {
              final List<NotificationPublicResource>? _listNoti = state.data.data;
              return VHS9NotificationWidget(
                listNoti: _listNoti ?? <NotificationPublicResource>[],
                totalRows: state.data.totalRows,
                blockId: blockId,
                onTap: widget.onTap,
              );
            } else if (state is VHS9NotificationError) {
              return Text(AppLocalizations.of(context)!.translate("an_error_occurred"));
            } else {
              return const SizedBox();
            }
          },
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
