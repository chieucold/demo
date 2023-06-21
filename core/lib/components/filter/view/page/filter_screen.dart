// import 'package:core/assets/images/images.dart';
// import 'package:core/common/color/core_color.dart';
// import 'package:core/common/color/core_space.dart';
// import 'package:core/components/appbar/app_bar_default.dart';
// import 'package:core/components/bnd_button.dart';
// import 'package:core/components/bnd_safearea.dart';
// import 'package:core/components/common_leading_widget.dart';
// import 'package:core/components/core_component.dart';
// import 'package:core/components/filter/bloc/filter_category_bloc.dart';
// import 'package:core/components/filter/bloc/filter_category_state.dart';
// import 'package:core/language/app_localizations.dart';
// import 'package:core/shared_preferences/global_variable_resource.dart';
// import 'package:exam/core/common/injection.dart';
// import 'package:exam/core/theme/custom.dart';
// import 'package:core/common/text_style.dart';
// import 'package:exam/core/widget/appbar_widget/app_bar_text_right_widget.dart';
// import 'package:exam/core/widget/category_property/category_property_widget.dart';
// import 'package:exam/features/presentation/vde/vde2_exam_filter/bloc/filter_category_bloc.dart';
// import 'package:exam/features/presentation/vde/vde2_exam_filter/bloc/filter_category_state.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
//
// class VDE2ExamFilterScreen extends StatefulWidget {
//   final int categoryId;
//   final List<int>? initSelectedId;
//   VDE2ExamFilterScreen({Key? key, required this.categoryId, this.initSelectedId }) : super(key: key);
//
//   @override
//   _ExamFilterScreenState createState() => _ExamFilterScreenState();
// }
//
// class _ExamFilterScreenState extends State<VDE2ExamFilterScreen> {
//   final FilterCategoryBloc _examFilterBloc = getIt<VDE2ExamFilterBloc>();
//   final GlobalVariableResource _resource = getIt<GlobalVariableResource>();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBarDefault(
//             context,
//             AppLocalizations.of(context)!.translate("exam_filter"),
//             leading: CommonLeadingWidget()
//         ),
//         body: _buildBody(context));
//   }
//
//   Widget _buildBody(BuildContext context) {
//     return BndSafeAreaWidget(
//       child: BlocProvider<FilterCategoryBloc>(
//           create: (BuildContext context) => _examFilterBloc..loaded(),
//           child: BlocBuilder<FilterCategoryBloc, FilterCategoryState>(
//             builder: (BuildContext context, FilterCategoryState state) {
//               if (state is FilterCategoryLoaded)
//                 return Column(
//                   children: <Widget>[
//                     Expanded(
//                         child: SingleChildScrollView(
//                           padding: const EdgeInsets.only(top: 8),
//                           child: ExamCategoryPropertyWidget(
//                             categoryId: widget.categoryId,
//                             itemPaddingHorizontal: 30,
//                             itemSelectedId:
//                             widget.initSelectedId ?? _resource.examFilterSelectedIdKey,
//                             itemExpandId: _resource.examFilterExpandedIdKey,
//                             onSelectedChanged: (List<int> selectedIds) {
//                               _resource.examFilterSelectedIdKey = selectedIds;
//                             },
//                             onCollapseExpand: (List<int> expandIds) {
//                               _resource.examFilterExpandedIdKey = expandIds;
//                             },
//                           ),
//                         )),
//                     _buildVDE2BottomButtonWidget(context, state, () {
//                       setState(() {
//                         _resource.examFilterSelectedIdKey = List<int>.from(<int>[]);
//                       });
//                     })
//                   ],
//                 );
//               else
//                 return const SizedBox();
//             },
//           )),
//     );
//   }
//
//   Widget _buildFilterBottomButtonWidget(BuildContext context, VDE2ExamFilterState state, Function onDelete) {
//     return Container(
//       padding: CoreSpace.paddingBodyDefault
//           .copyWith(top: CoreSpace.bottomPaddingSpace, bottom: CoreSpace.bottomPaddingSpace),
//       decoration: const BoxDecoration(
//           color: CoreColor.white, border: Border(top: BorderSide(color: CustomTheme.vde2BottomBorder))),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: <Widget>[
//           _buildBottomLeftWidget(
//               title: AppLocalizations.of(context)!.translate("delete_filter"),
//               onPress: () {
//                 onDelete();
//               }),
//           BnDButton(
//             onPressed: () {
//               Navigator.of(context).pop(_resource.examFilterSelectedIdKey);
//             },
//             shape: const RoundedRectangleBorder(
//                 borderRadius: BorderRadius.all(Radius.circular(90))), // add to remove blue background
//             padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
//             radius: 90,
//             gradient: CustomTheme.bottomRightButton,
//             title: Row(
//               children: <Widget>[
//                 Text(
//                   AppLocalizations.of(context)!.translate("apply").toUpperCase(),
//                   style: textStyleBodySmallest.copyWith(color: CustomTheme.textWhiteColor, fontWeight: FontWeight.w700),
//                 ),
//
//                 //Todo Call api lấy số lượng
//                 // Container(
//                 //   margin: const EdgeInsets.only(left: 4, right: 4),
//                 //   width: 4,
//                 //   height: 4,
//                 //   decoration: BoxDecoration(color: CustomTheme.textWhiteColor, shape: BoxShape.circle),
//                 // ),
//                 // Text(
//                 //   state.viewModel.countData.toString(),
//                 //   style: textStyleBodySmallest.copyWith(color: CustomTheme.textWhiteColor, fontWeight: FontWeight.w700),
//                 // ),
//                 const SizedBox(
//                   width: 10,
//                 ),
//                 Images.svgAssets(Images.icChevronRight,
//                     color: CustomTheme.iconAppbar, width: 4, height: 7, package: "core"),
//               ],
//             ),
//           )
//         ],
//       ),
//     );
//   }
//
//   Widget _buildBottomLeftWidget({String title = "", VoidCallback? onPress}) {
//     return GestureDetector(
//         onTap: onPress,
//         child: Container(
//           decoration: BoxDecoration(border: Border(bottom: BorderSide(color: CustomTheme.textColor))),
//           child: Text(title.toUpperCase(), style: textStyleBodySmallest.copyWith(color: CustomTheme.textColor)),
//         ));
//   }
// }