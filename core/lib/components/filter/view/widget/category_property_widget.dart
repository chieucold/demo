// import 'package:api/exam/model/exam/exam_index.dart';
// import 'package:core/common/color/core_color.dart';
// import 'package:core/common/common.dart';
// import 'package:core/components/core_component.dart';
// import 'package:exam/core/common/injection.dart';
// import 'package:exam/core/theme/custom.dart';
// import 'package:core/common/text_style.dart';
// import 'package:exam/core/widget/category_property/bloc/category_property_bloc.dart';
// import 'package:exam/core/widget/category_property/bloc/category_property_state.dart';
// import 'package:exam/core/widget/category_property/bloc/category_property_view_model.dart';
// import 'package:exam/core/widget/category_property/category_property_checkbox.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:shimmer/shimmer.dart';
//
// final double spaceBetweenItem = 16;
//
// class CategoryPropertyWidget extends StatefulWidget {
//   CategoryPropertyWidget(
//       {Key? key,
//         required this.categoryId,
//         this.onSelectedChanged,
//         this.onCollapseExpand,
//         this.itemPaddingHorizontal = 0,
//         this.itemSelectedId,
//         this.itemExpandId,
//         this.isReturnObject = false})
//       : super(key: key);
//
//   final int categoryId;
//   final Function? onSelectedChanged;
//   final double itemPaddingHorizontal;
//   final List<int>? itemSelectedId;
//   final Function? onCollapseExpand;
//   final List<int>? itemExpandId;
//   final bool isReturnObject;
//
//   @override
//   _CategoryPropertyWidgetState createState() => _CategoryPropertyWidgetState();
// }
//
// class _CategoryPropertyWidgetState extends
// State<CategoryPropertyWidget> {
//   late CategoryPropertyBloc _examFilterBloc;
//
//   @override
//   void initState() {
//     super.initState();
//     _examFilterBloc = getIt();
//   }
//
//   @override
//   void didUpdateWidget(covariant ExamCategoryPropertyWidget oldWidget) {
//     if (oldWidget.itemSelectedId != widget.itemSelectedId) {
//       _examFilterBloc.setSelectedId(widget.itemSelectedId ?? <int>[]);
//     }
//git
//     if (oldWidget.categoryId != widget.categoryId) {
//       _examFilterBloc.initData(
//           itemSelectedIds: widget.itemSelectedId ?? <int>[], itemExpandIds: widget.itemExpandId ?? <int>[]);
//       _examFilterBloc.getPropertyFilterForExam(examCategoryId: widget.categoryId);
//     }
//     super.didUpdateWidget(oldWidget);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider<CategoryPropertyBloc>(
//         create: (BuildContext context) => _examFilterBloc
//           ..initData(itemSelectedIds: widget.itemSelectedId ?? <int>[], itemExpandIds: widget.itemExpandId ?? <int>[])
//           ..getPropertyFilterForExam(examCategoryId: widget.categoryId),
//         child: BlocBuilder<CategoryPropertyBloc, CategoryPropertyState>(
//           builder: (
//               BuildContext context,
//               CategoryPropertyState state,
//               ) {
//             if (state is CategoryPropertyLoading) {
//               return _buildLoading();
//             } else if (state is CategoryPropertyLoaded) {
//               return _buildBody(context, state.viewModel.items, state);
//             } else if (state is CategoryPropertyError) {
//               return Text(state.contentError);
//             } else {
//               return Container();
//             }
//           },
//         ));
//   }
//
//   Widget _buildLoading() {
//     return Shimmer.fromColors(
//       direction: ShimmerDirection.ltr,
//       period: const Duration(milliseconds: 500),
//       baseColor: CoreColor.colorLoadingShimmer,
//       highlightColor: CoreColor.colorHighlightLoadingShimmer,
//       child: ListView.builder(
//         shrinkWrap: true,
//         physics: const NeverScrollableScrollPhysics(),
//         itemBuilder: (_, __) {
//           return Column(
//             children: <Widget>[
//               Padding(
//                 padding: CustomTheme.paddingBodyDefault,
//                 child: loadingDefaultWidget(24),
//               ),
//               const SizedBox(height: 10),
//               ListView.separated(
//                 shrinkWrap: true,
//                 physics: const NeverScrollableScrollPhysics(),
//                 separatorBuilder: (_, __) {
//                   return const SizedBox(height: 10);
//                 },
//                 itemBuilder: (_, __) {
//                   return Padding(
//                     padding: CustomTheme.paddingBodyDefault,
//                     child: Row(children: <Widget>[
//                       loadingDefaultWidget(24, width: 24),
//                       const SizedBox(
//                         width: 10,
//                       ),
//                       Expanded(child: loadingDefaultWidget(24)),
//                     ]),
//                   );
//                 },
//                 itemCount: 4,
//               ),
//               Padding(
//                 padding: const EdgeInsets.symmetric(vertical: 10),
//                 child: Divider(
//                   thickness: 6,
//                   color: CustomTheme.dividerSecondColor,
//                 ),
//               )
//             ],
//           );
//         },
//         itemCount: 4,
//       ),
//     );
//   }
//
//   Widget _buildBody(BuildContext context, List<ExamFilterModel> examFilterModels, CategoryPropertyState state) {
//     // return ListView.builder(
//     //     physics: const NeverScrollableScrollPhysics(),
//     //     shrinkWrap: true,
//     //     itemCount: examFilterModels.length,
//     //     itemBuilder: (_, int i) {
//     //       return _buildItemBlock(examFilterModels[i], state, context, i == examFilterModels.length - 1);
//     //     });
//
//     return SingleChildScrollView(
//       physics: const NeverScrollableScrollPhysics(),
//       child: Column(
//         children: <Widget>[
//           for (int i = 0; i < examFilterModels.length; i++)
//             _buildItemBlock(examFilterModels[i], state, context, i == examFilterModels.length - 1),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildItemBlock(
//       ExamFilterModel examFilterModel, CategoryPropertyState state, BuildContext context, bool isLast) {
//     final int length = examFilterModel.listAllLevel.length;
//     return ListView.separated(
//         itemCount: length + 3,
//         physics: const NeverScrollableScrollPhysics(),
//         shrinkWrap: true,
//         separatorBuilder: (_, int index) {
//           if (index > 1)
//             return const SizedBox(
//               height: 12,
//             );
//           return const SizedBox();
//         },
//         itemBuilder: (_, int index) {
//           if (index == 0)
//             return _buildPaddingContainer(Text(
//               examFilterModel.title,
//               style: textStyleHeadline6.copyWith(color: kTextColor),
//             ));
//           else if (index == 1)
//             return SizedBox(
//               height: spaceBetweenItem,
//             );
//           else if (index == length + 2)
//             return !isLast
//                 ? Container(
//               height: 12,
//               margin: const EdgeInsets.only(bottom: 18),
//               decoration: BoxDecoration(
//                   border: Border(
//                     bottom: BorderSide(width: 6, color: CustomTheme.dividerSecondColor),
//                   )),
//             )
//                 : const SizedBox();
//           return _buildPaddingContainer(
//               _buildTreeCheckbox(examFilterModel.listAllLevel[index - 2], context, state, examFilterModel));
//         });
//   }
//
//   Widget _buildPaddingContainer(Widget child) {
//     return Padding(
//       padding: EdgeInsets.symmetric(horizontal: widget.itemPaddingHorizontal),
//       child: child,
//     );
//   }
//
//   Widget _buildTreeCheckbox(
//       ExamFilterLevel item,
//       BuildContext context,
//       CategoryPropertyState state,
//       ExamFilterModel examFilterModel,
//       ) {
//     final CategoryPropertyViewModel viewModel = state.viewModel;
//     final List<int>? expandIds = viewModel.itemExpandedId;
//     List<int>? selectedIds = viewModel.itemSelectedId;
//     final int id = item.item.propertyDetailId;
//     final int childrenLength = item.children.length;
//     final Function? onSelectedChanged = widget.onSelectedChanged;
//
//     return Column(
//       children: <Widget>[
//         CategoryPropertyCheckBox(
//           title: item.item.propertyDetailName,
//           isExpand: expandIds!.contains(id),
//           isSelected: selectedIds!.contains(id),
//           countChild: childrenLength,
//           countChildSelected: item.children
//               .where((ExamFilterLevel element) => selectedIds!.contains(element.item.propertyDetailId))
//               .length,
//           type: childrenLength > 0 ? CheckBoxTypeEnum.typeHaveNumber : CheckBoxTypeEnum.typeDefault,
//           onCollapseExpand: () async {
//             await _examFilterBloc.setCollapseExpand(id);
//             if (widget.onCollapseExpand != null) widget.onCollapseExpand!(viewModel.itemExpandedId);
//           },
//           onSelected: (bool isCheck) async {
//             selectedIds = await _examFilterBloc.setSelected(isCheck, item, examFilterModel);
//             if (onSelectedChanged != null) {
//               if (widget.isReturnObject)
//                 onSelectedChanged(_examFilterBloc.getItems(selectedIds));
//               else
//                 onSelectedChanged(selectedIds);
//             }
//           },
//         ),
//         if (expandIds.contains(id) && childrenLength > 0)
//           Padding(
//               padding: EdgeInsets.only(left: 30, top: spaceBetweenItem, bottom: spaceBetweenItem),
//               child: ListView.separated(
//                 itemCount: childrenLength,
//                 separatorBuilder: (_, __) {
//                   return const SizedBox(
//                     height: 12,
//                   );
//                 },
//                 shrinkWrap: true,
//                 physics: const NeverScrollableScrollPhysics(),
//                 itemBuilder: (_, int index) {
//                   return _buildTreeCheckbox(item.children[index], context, state, examFilterModel);
//                 },
//               ))
//       ],
//     );
//   }
// }
