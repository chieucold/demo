import 'package:api/api/commondata_api.dart';
import 'package:common/components/event/veo/veo2_list_event/bloc/veo2_list_event_bloc.dart';
import 'package:common/components/event/veo/veo2_list_event/bloc/veo2_list_event_state.dart';
import 'package:common/components/event/veo/veo2_list_event/bloc/veo2_view_model.dart';
import 'package:common/components/event/veo/veo2_list_event/view/widgets/veo2_event_widget.dart';
import 'package:common/components/event/veo/veo2_list_event/view/widgets/veo2_no_event_widget.dart';
import 'package:core/common/color/core_color.dart';
import 'package:core/common/constants/const/enum.dart';
import 'package:core/components/core_component.dart';
import 'package:core/components/custom_listview.dart';
import 'package:core/components/shimmer/shimmer_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:core/common/enums/event_enum.dart';
import 'package:get_it/get_it.dart';

class ListEventPastWidget extends StatefulWidget {
  final EventEnum eventEnum;
  ListEventPastWidget({Key? key, required this.eventEnum}) : super(key: key);

  @override
  _ListEventPastWidgetState createState() => _ListEventPastWidgetState();
}

class _ListEventPastWidgetState extends State<ListEventPastWidget> with AutomaticKeepAliveClientMixin {
  late VEO2ListEventBloc _bloc;
  int totalEventPast = 0;
  @override
  void initState() {
    super.initState();
    _bloc = GetIt.I<VEO2ListEventBloc>();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BlocProvider<VEO2ListEventBloc>(
        create: (BuildContext context) => _bloc..refresh(VEO2TabTypeEnum.past, widget.eventEnum),
        child: BlocBuilder<VEO2ListEventBloc, VEO2ListEventState>(
            builder: (BuildContext context, VEO2ListEventState state) {
          if (state is VEO2ListEventLoading) {
            return const ShimmerListWidget();
          } else if (state is VEO2ListEventLoaded) {
            final VEO2ViewModel model = state.viewModel;
            totalEventPast = model.totalRow;
            // if (model.totalRow == 0) {
            //   return VEO2NoEventWidget();
            // } else {
            return CustomListView<EventPublicResource>(
              widgetNoData: VEO2NoEventWidget(),
              itemBuilder: (BuildContext context, int index) {
                return VEO2EventWidget(
                  dateColor: CoreColor.veo2TookPlaceDateColor,
                  model: model.past[index],
                  bloc: _bloc,
                );
              },
              separatorBuilder: (BuildContext context, int ind) {
                return const Divider(
                  thickness: 6,
                  color: CoreColor.veo2DividerColor,
                );
              },
              totalItem: model.totalRow,
              items: model.past,
              onRefresh: () {
                _bloc.refresh(VEO2TabTypeEnum.past, widget.eventEnum);
              },
              onLoading: _bloc.loadMoreAllEvent,
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
