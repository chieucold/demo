import 'package:api/api/commondata_api.dart';
import 'package:common/common/color/common_color.dart';
import 'package:common/components/event/event_bloc/event_bloc.dart';
import 'package:common/components/event/event_bloc/event_state.dart';
import 'package:common/components/event/veo/event_item_widget.dart';
import 'package:common/components/event/widget/event_content_item_widget.dart';
import 'package:common/components/news/common/news_loading_widget.dart';
import 'package:common/route/route_goto.dart';
import 'package:core/common/color/core_color.dart';
import 'package:core/common/enums/event_enum.dart';
import 'package:core/components/button/button_title_widget.dart';
import 'package:core/language/app_localizations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class EventListWidget extends StatelessWidget {
  EventListWidget({Key? key, this.eventType}) : super(key: key);

  final EventBloc _eventBloc = GetIt.I<EventBloc>();
  final EventEnum? eventType;

  Widget _height(double height) => SizedBox(height: height);

  Widget get _noData => _height(0);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<EventBloc>(
      create: (context) => _eventBloc..getListEvent(eventType?.index ?? 0, isHot: true),
      child: Column(
        children: [
          BlocBuilder<EventBloc, EventState>(
            builder: (context, state) {
              if ((state is EventLoaded && state.data.totalRows > 0) || state is EventLoading) {
                return Column(
                  children: [
                    Divider(thickness: 6, color: CommonColor.driverColor),
                    _buildButtonTitle(context),
                  ],
                );
              }
              return _noData;
            },
          ),
          BlocBuilder<EventBloc, EventState>(
            builder: (context, state) {
              if (state is EventInitial) {
                return _noData;
              } else if (state is EventLoading) {
                return const VNListRelativeNewsLoadingWidget();
                // return LoadingWidget(LoadingEnum.event);
              } else if (state is EventLoaded) {
                if (state.data.totalRows == 0) return _noData;
                return _buildBody(context, state.data.data ?? []);
              } else if (state is EventError) {
                return _noData;
              }
              return _noData;
            },
          ),
        ],
      ),
    );
  }

  Widget _buildButtonTitle(BuildContext context) {
    return Column(
      children: [
        ButtonTitleWidget(
          title: AppLocalizations.of(context)!.translate(_getTitle),
          onPressed: () => goToVEO2ListEventScreen(context, eventEnum: eventType ?? EventEnum.All),
        ),
        _height(6),
      ],
    );
  }

  Widget _buildBody(BuildContext context, List<EventPublicResource> listEvent) {
    return Container(
      color: CoreColor.textWhiteColor,
      margin: const EdgeInsets.only(bottom: 16),
      child: MediaQuery.removePadding(
        context: context,
        removeTop: true,
        child: ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          scrollDirection: Axis.vertical,
          itemCount: listEvent.length > 5 ? listEvent.take(5).length : listEvent.length,
          itemBuilder: (BuildContext context, int index) {
            final EventPublicResource item = listEvent[index];
            return EventItemWidget(
              id: item.id,
              content: EventContentItemWidget(context, item),
              imageUrl: item.avatar,
              onTap: () => goToVEO5EventDetailScreen(context, item.id),
            );
          },
          separatorBuilder: (_, __) => _height(16),
        ),
      ),
    );
  }

  String get _getTitle {
    if (eventType != null) {
      if (eventType == EventEnum.Offline) {
        return 'exam_offline_event';
      } else if (eventType == EventEnum.Online) {
        return 'exam_online_event';
      }
    }
    return 'event';
  }
}
