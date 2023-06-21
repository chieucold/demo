// import 'package:api/api/commondata_api.dart';
// import 'package:common/common/color/common_color.dart';
// import 'package:common/components/event/event_bloc/event_bloc.dart';
// import 'package:common/components/event/event_bloc/event_state.dart';
// import 'package:common/route/route_goto.dart';
// import 'package:core/common/text_style.dart';
// import 'package:core/components/button/button_title_widget.dart';
// import 'package:core/language/app_localizations.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:core/common/dimension.dart';
// import 'package:get_it/get_it.dart';
//
// class VHS5SaleListWidget extends StatelessWidget {
//   VHS5SaleListWidget({Key? key}) : super(key: key);
//
//   final EventBloc _eventBloc = GetIt.I<EventBloc>();
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider<EventBloc>(
//         create: (BuildContext context) => _eventBloc..getListEvent(),
//         child: BlocBuilder<EventBloc, EventState>(
//           builder: (BuildContext context, EventState state) {
//             return _buildBody(context, []);
//             // if (state is EventInitial) {
//             //   return const SizedBox();
//             // } else if (state is EventLoading) {
//             //   return LoadingWidget(LoadingEnum.sale);
//             // } else if (state is EventLoaded) {
//             //   return buildSaleListView(context, state.listEvent);
//             // }
//             // if (state is EventError) {
//             //   return BnDNoData();
//             // } else {
//             //   return const SizedBox();
//             // }
//           },
//         ));
//   }
//
//   Widget _buildBody(BuildContext context, List<EventPublicResource> listEvent) {
//     return Column(
//       children: <Widget>[
//         Container(
//           // margin: EdgeInsets.only(left: width(context, 10)),
//           child: ButtonTitleWidget(
//             title: AppLocalizations.of(context)!.translate('do_not_miss'),
//             onPressed: () => goToVHS6Personal(context),
//           ),
//         ),
//         GestureDetector(
//           onTap: () {
//             print('Click into event');
//           },
//           child: MediaQuery.removePadding(
//             context: context,
//             removeTop: true,
//             child: Container(
//               margin: EdgeInsets.only(left: width(context, 30), right: width(context, 30)),
//               height: MediaQuery.of(context).size.width - 20 * 2,
//               child: GridView.count(
//                 physics: const NeverScrollableScrollPhysics(),
//                 crossAxisCount: 2,
//                 childAspectRatio: 1,
//                 crossAxisSpacing: 10,
//                 mainAxisSpacing: 10,
//                 children: List<Widget>.generate(4, (int index) {
//                   return GestureDetector(
//                       onTap: () {},
//                       child: Container(
//                         child: Column(
//                           children: <Widget>[
//                             Expanded(
//                               child: Container(
//                                 height: height(context, 130),
//                                 width: width(context, 150),
//                                 decoration: BoxDecoration(
//                                     borderRadius: BorderRadius.circular(15), color: CommonColor.primaryColor),
//                               ),
//                             ),
//                             Container(
//                               margin: EdgeInsets.only(left: width(context, 2)),
//                               child: Text(
//                                 'Săn thưởng mỗi ngày, quà đầy tay',
//                                 style: textStyleBodyDefault.copyWith(
//                                   height: 1.5,
//                                 ),
//                                 maxLines: 2,
//                                 overflow: TextOverflow.ellipsis,
//                               ),
//                             )
//                           ],
//                         ),
//                       ));
//                 }),
//               ),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }
