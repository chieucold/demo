import 'package:api/api/commondata_api_models.dart';
import 'package:common/components/event/veo/veo6_list_member_event/bloc/veo6_list_member_event_bloc.dart';
import 'package:common/components/event/veo/veo6_list_member_event/bloc/veo6_list_member_event_state.dart';
import 'package:common/components/event/veo/veo6_list_member_event/view/widgets/veo6_member_widget.dart';
import 'package:core/common/color/core_color.dart';
import 'package:core/common/constants/block_settings.dart';
import 'package:core/common/constants/const/shared_preference_key.dart';
import 'package:core/components/appbar/app_bar_default.dart';
import 'package:core/components/bnd_no_data.dart';
import 'package:core/components/custom_listview.dart';
import 'package:core/components/shimmer/shimmer_list_widget.dart';
import 'package:core/language/app_localizations.dart';
import 'package:core/components/common_leading_widget.dart';
import 'package:core/shared_preferences/local_storage_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class VEO6ListMemberEventScreen extends StatelessWidget {
  final int eventId;
  VEO6ListMemberEventScreen({
    Key? key,
    required this.eventId,
  }) : super(key: key);

  final VEO6ListMemberEventBloc _bloc = GetIt.I<VEO6ListMemberEventBloc>();
  final int _blockId = LocalStoreManager.getInt(BlockSettings.blockKey);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarDefault(context, AppLocalizations.of(context)!.translate("invite_members"),
          colorAppbar: listBlockWithVitan.firstWhere((BlockModel e) => e.id == _blockId).backgroundColor,
          leading: CommonLeadingWidget()),
      body: _body(context),
    );
  }

  Widget _body(BuildContext context) {
    return BlocProvider<VEO6ListMemberEventBloc>(
        create: (BuildContext context) => _bloc..getData(eventId),
        child: BlocBuilder<VEO6ListMemberEventBloc, VEO6ListMemberEventState>(
            builder: (BuildContext context, VEO6ListMemberEventState state) {
          if (state is VEO6ListMemberEventLoading) {
            return const ShimmerListWidget();
          } else if (state is VEO6ListMemberEventLoaded) {
            List<EventListUserInvitedResource> _listData = <EventListUserInvitedResource>[];
            _listData.addAll(state.viewModel.listMember);
            return CustomListView<EventListUserInvitedResource>(
              onRefresh: () {
                _bloc.onRefresh();
              },
              onLoading: _bloc.getDataLoadMore,
              itemBuilder: (BuildContext context, int index) {
                return VEO6MemberWidget(
                  model: _listData[index],
                  isInvited: _checkIsJoin(_listData[index]), //TODO: state.isInvite
                  bloc: _bloc,
                  eventId: eventId,
                );
              },
              totalItem: state.viewModel.totalMember,
              items: _listData,
              separatorWidget: Container(
                height: 6,
                color: CoreColor.veo6DividerColor,
              ),
            );
          } else if (state is VEO6ListMemberEventError) {
            return BnDNoData();
          } else {
            return const SizedBox();
          }
        }));
  }

  bool _checkIsJoin(EventListUserInvitedResource data) {
    if (data.isJoin || data.isInvited) {
      return true;
    }
    return false;
  }
}
