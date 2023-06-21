// import 'package:api/api/commondata_api.dart';
// import 'package:common/components/event/event_bloc/event_bloc.dart';
// import 'package:common/components/news/news_loading_widget.dart';
// import 'package:core/common/constants/block_settings.dart';
// import 'package:core/shared_preferences/local_storage_manager.dart';
// import 'package:common/components/event/widget/event_content_item_widget.dart';
// import 'package:core/components/bnd_no_data.dart';
// import 'package:core/components/veo/event_item_widget.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:core/common/enums/event_enum.dart';
// import 'package:get_it/get_it.dart';
//
// class VHE8EventWidget extends StatelessWidget {
//   VHE8EventWidget({Key? key, required this.eventType}) : super(key: key);
//   final EventEnum eventType;
//   final EventBloc _eventBloc = GetIt.I<EventBloc>();
//
//   @override
//   Widget build(BuildContext context) {
//     return _buildEvent(context);
//   }
//
//   BlocProvider<EventBloc> _buildEvent(BuildContext context) {
//     return BlocProvider<EventBloc>(
//         create: (BuildContext context) => _eventBloc..getListEvent(eventType.index, isHot: true),
//         child: BlocBuilder<EventBloc, VHE8EventState>(
//           builder: (BuildContext context, VHE8EventState state) {
//             if (state is VHE8EventInitial) {
//               return Container();
//             } else if (state is VHE8EventLoading) {
//               return const VNListRelativeNewsLoadingWidget();
//               // return LoadingWidget(LoadingEnum.event);
//             } else if (state is VHE8EventLoaded) {
//               final List<EventPublicResource> data = state.data.data ?? <EventPublicResource>[];
//               if (data.length > 0)
//                 return buildEventHappeningListView(context, data);
//               else
//                 return BnDNoData(
//                   isNodataText: true,
//                 );
//             }
//             if (state is VHE8EventError) {
//               return BnDNoData();
//             } else {
//               return const SizedBox();
//             }
//           },
//         ));
//   }
//
//   Widget buildEventHappeningListView(BuildContext context, List<EventPublicResource> listEvent) {
//     return Container(
//       child: Column(
//         children: <Widget>[
//           Container(
//             //height: listEvent.length > 5 ? listEvent.take(5).length * 100 : listEvent.length * 100,
//             margin: const EdgeInsets.only(bottom: 16),
//             child: ListView.separated(
//               shrinkWrap: true,
//               physics: const NeverScrollableScrollPhysics(),
//               scrollDirection: Axis.vertical,
//               itemCount: listEvent.length > 5 ? listEvent.take(5).length : listEvent.length,
//               itemBuilder: (BuildContext context, int index) {
//                 final EventPublicResource item = listEvent[index];
//                 return EventItemWidget(
//                   content: EventContentItemWidget(context, item),
//                   imageUrl: item.avatar,
//                   onTap: () => goToVEO5EventDetailScreen(context, item.id,
//                       blockId: LocalStoreManager.getInt(BlockSettings.blockKey)),
//                 );
//                 // return EventItemWidget(context, listEvent[index]);
//               },
//               separatorBuilder: (_, __) => const SizedBox(height: 16),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
