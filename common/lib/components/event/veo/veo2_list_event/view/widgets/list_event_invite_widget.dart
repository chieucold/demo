import 'package:api/api/commondata_api.dart';
import 'package:common/components/event/veo/veo2_list_event/bloc/veo2_list_event_bloc.dart';
import 'package:common/components/event/veo/veo2_list_event/bloc/veo2_list_event_state.dart';
import 'package:common/components/event/veo/veo2_list_event/bloc/veo2_tab_bloc.dart';
import 'package:common/components/event/veo/veo2_list_event/bloc/veo2_view_model.dart';
import 'package:common/components/event/veo/veo2_list_event/view/widgets/veo2_event_widget.dart';
import 'package:common/components/event/veo/veo2_list_event/view/widgets/veo2_no_event_widget.dart';
import 'package:core/common/color/core_color.dart';
import 'package:core/common/constants/const/enum.dart';
import 'package:core/components/core_component.dart';
import 'package:core/components/custom_listview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:core/components/shimmer/shimmer_list_widget.dart';
import 'package:core/common/enums/event_enum.dart';
import 'package:get_it/get_it.dart';

class ListEventInvitationWidget extends StatefulWidget {
  final VEO2TabBloc veo2TabBloc;
  final EventEnum eventEnum;
  ListEventInvitationWidget({
    Key? key,
    required this.veo2TabBloc,
    required this.eventEnum,
  }) : super(key: key);

  @override
  _ListEventInvitationWidgetState createState() => _ListEventInvitationWidgetState();
}

class _ListEventInvitationWidgetState extends State<ListEventInvitationWidget> with AutomaticKeepAliveClientMixin {
  VEO2TabBloc get _veo2TabBloc => widget.veo2TabBloc;
  late VEO2ListEventBloc _bloc;
  int totalEventInvite = 0;

  @override
  void initState() {
    super.initState();
    _bloc = GetIt.I<VEO2ListEventBloc>();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BlocProvider<VEO2ListEventBloc>(
        create: (BuildContext context) => _bloc..refresh(VEO2TabTypeEnum.invitation, widget.eventEnum),
        child: BlocBuilder<VEO2ListEventBloc, VEO2ListEventState>(
            builder: (BuildContext context, VEO2ListEventState state) {
          if (state is VEO2ListEventLoading) {
            return const ShimmerListWidget();
          } else if (state is VEO2ListEventLoaded) {
            final VEO2ViewModel model = state.viewModel;
            totalEventInvite = model.totalRow;
            // if (model.totalRow == 0) {
            //   return VEO2NoEventWidget();
            // } else {
            return CustomListView<EventUserResource>(
              widgetNoData: VEO2NoEventWidget(),
              key: ValueKey<int>(model.invitation.length),
              itemBuilder: (BuildContext context, int index) {
                final EventUserResource myEvent = model.invitation[index];
                final EventPublicResource eventModel = EventPublicResource(
                    id: myEvent.eventId,
                    startDate: myEvent.startDate,
                    totalEventUser: myEvent.totalEventUser,
                    avatar: myEvent.avatar,
                    title: myEvent.eventTitle);
                return VEO2EventWidget(
                    dateColor: CoreColor.veo2UpcomingColor,
                    model: eventModel,
                    bloc: _bloc,
                    veo2TabBloc: _veo2TabBloc,
                    isUpdateInvitation: true,
                    eventUserId: myEvent.eventUserId);
              },
              separatorBuilder: (BuildContext context, int ind) {
                return model.invitation.length == 1
                    ? const SizedBox()
                    : const Divider(
                        thickness: 6,
                        color: CoreColor.veo2DividerColor,
                      );
              },
              totalItem: model.totalRow,
              items: model.invitation,
              onRefresh: () {
                _bloc.refresh(VEO2TabTypeEnum.invitation, widget.eventEnum);
              },
              onLoading: _bloc.loadMoreMyEvent,
            );
            // }
          } else if (state is VEO2ListEventError) {
            return  BnDNoData();
          } else {
            return const SizedBox();
          }
        }));
  }

  @override
  bool get wantKeepAlive => true;
}
