import 'package:api/api/commondata_api.dart';
import 'package:bloc/bloc.dart';
import 'package:common/components/choose_category/bloc/choose_category_state.dart';
import 'package:common/components/choose_category/widgets/choose_category_widget.dart';
import 'package:flutter/material.dart';

class ChooseCategoryBloc extends Cubit<ChooseCategoryState> {
  ChooseCategoryBloc() : super(ChooseCategoryInitial());

  Map<int, Widget> get _widgets => state.widgets;

  void setWidget(BlockCategoryObjectResource category, {int categoryId = 0}) {
    final int currentId = category.id;
    if (!_widgets.containsKey(currentId)) {
      _widgets[currentId] = ChooseCategoryWidget(
        key: Key("ChooseCategoryWidget_" + currentId.toString()),
        category: category,
        currentId: categoryId,
        nextCategory: (BlockCategoryObjectResource category) {
          setWidget(category);
        },
        previousCategory: (int parentId, int currentId) {
          previousCategory(parentId, currentId);
        },
      );
    }

    emit(ChooseCategoryLoaded(widgets: _widgets, parentId: currentId));
  }

  void previousCategory(int parentId, int currentId) {
    if (!_widgets.containsKey(parentId)) {
      _widgets[parentId] = ChooseCategoryWidget(
        key: Key("ChooseCategoryWidget_" + parentId.toString()),
        currentId: currentId,
        nextCategory: (BlockCategoryObjectResource category) {
          setWidget(category);
        },
        previousCategory: (int parentId, int currentId) {
          previousCategory(
            parentId,
            currentId,
          );
        },
      );
    }
    emit(ChooseCategoryLoaded(widgets: _widgets, parentId: parentId));
  }
}
