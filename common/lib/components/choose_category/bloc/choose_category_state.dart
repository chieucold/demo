import 'package:flutter/material.dart';

// abstract class ChooseCategoryState {
//   final List<Widget> widgets;
//   final int index;

//   final bool isPre;
//   final Widget backWidget;

//   ChooseCategoryState({
//     required this.widgets,
//     required this.index,
//     this.isPre = false,
//     this.backWidget = const SizedBox(),
//   });
// }

// class ChooseCategoryInitial extends ChooseCategoryState {
//   ChooseCategoryInitial() : super(widgets: [], index: -1);
// }

// class ChooseCategoryLoaded extends ChooseCategoryState {
//   ChooseCategoryLoaded(
//       {required List<Widget> widgets, required int index, required bool isPre, required Widget backWidget})
//       : super(widgets: widgets, index: index, isPre: isPre, backWidget: backWidget);
// }

abstract class ChooseCategoryState {
  final Map<int, Widget> widgets;
  final int parentId;
  ChooseCategoryState({required this.widgets, required this.parentId});
}

class ChooseCategoryInitial extends ChooseCategoryState {
  ChooseCategoryInitial() : super(widgets: <int, Widget>{}, parentId: 0);
}

class ChooseCategoryLoaded extends ChooseCategoryState {
  ChooseCategoryLoaded({required Map<int, Widget> widgets, required int parentId})
      : super(widgets: widgets, parentId: parentId);
}
