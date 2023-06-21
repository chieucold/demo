import 'package:api/common/model/common_index.dart';
import 'package:common/components/event/veo/veo2_list_event/bloc/veo2_tab_bloc.dart';
import 'package:common/components/event/veo/veo2_list_event/bloc/veo2_tab_state.dart';
import 'package:common/components/event/veo/veo2_list_event/view/widgets/list_event_happening_widget.dart';
import 'package:common/components/event/veo/veo2_list_event/view/widgets/list_event_invite_widget.dart';
import 'package:common/components/event/veo/veo2_list_event/view/widgets/list_event_joined_widget.dart';
import 'package:common/components/event/veo/veo2_list_event/view/widgets/list_event_past_widget.dart';
import 'package:common/components/event/veo/veo2_list_event/view/widgets/list_event_up_coming_widget.dart';
import 'package:core/common/color/core_color.dart';
import 'package:core/common/constants/block_settings.dart';
import 'package:core/common/enums/event_enum.dart';
import 'package:core/components/bnd_tab.dart';
import 'package:core/language/app_localizations.dart';
import 'package:core/shared_preferences/local_storage_manager.dart';
import 'package:core/common/text_style.dart';
import 'package:core/components/common_leading_widget.dart';
import 'package:core/components/appbar/app_bar_default.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class VEO2ListEventScreen extends StatelessWidget {
  final EventEnum eventEnum;
  final VEO2TabBloc _veo2tabBloc = GetIt.I<VEO2TabBloc>();

  VEO2ListEventScreen({Key? key, this.eventEnum = EventEnum.All}) : super(key: key);

  final int _blockId = LocalStoreManager.getInt(BlockSettings.blockKey);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarDefault(
        context,
        AppLocalizations.of(context)!.translate('event'),
        colorAppbar: listBlockWithVitan.firstWhere((BlockModel e) => e.id == _blockId).backgroundColor,
        leading: CommonLeadingWidget(),
      ),
      body: _vEO2Body(context),
    );
  }

  Widget _vEO2Body(BuildContext context) {
    return BlocProvider<VEO2TabBloc>(
      create: (BuildContext context) => _veo2tabBloc..getData(eventEnum.index),
      child: BlocBuilder<VEO2TabBloc, VEO2TabState>(
        builder: (BuildContext context, VEO2TabState state) {
          if (state is VEO2TabLoaded) {
            final CountTabEventModel _model = state.tabEventModel;
            return BNDTab(
              items: <AppBarDoExamItemModel>[
                AppBarDoExamItemModel(
                  AppLocalizations.of(context)!.translate("joined"),
                  _model.Join,
                  widget: ListEventJoinedWidget(
                    veo2TabBloc: _veo2tabBloc,
                    eventEnum: eventEnum,
                  ),
                ),
                AppBarDoExamItemModel(
                  AppLocalizations.of(context)!.translate("invitation"),
                  _model.Invite,
                  widget: ListEventInvitationWidget(veo2TabBloc: _veo2tabBloc, eventEnum: eventEnum),
                ),
                AppBarDoExamItemModel(
                  AppLocalizations.of(context)!.translate("upcoming"),
                  _model.ComingSoon,
                  widget: ListEventUpComingWidget(eventEnum: eventEnum),
                ),
                AppBarDoExamItemModel(
                  AppLocalizations.of(context)!.translate("happening"),
                  _model.GoingOn,
                  widget: ListEventHappeningWidget(eventEnum: eventEnum),
                ),
                AppBarDoExamItemModel(
                  AppLocalizations.of(context)!.translate("took_place"),
                  _model.Past,
                  widget: ListEventPastWidget(eventEnum: eventEnum),
                )
              ],
              labelStyle: textStyleBodySmall.copyWith(color: CoreColor.textColor, fontWeight: FontWeight.w600),
              backgroundColor: CoreColor.veo2TabBackgroundColor,
              indicatorColor: listBlockWithVitan.firstWhere((BlockModel e) => e.id == _blockId).backgroundColor,
              // onTabChanged: (int _tabIndex) {},
              isScrollable: true,
            );
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}
