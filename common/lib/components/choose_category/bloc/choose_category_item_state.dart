import 'package:api/api/commondata_api.dart';
import 'package:equatable/equatable.dart';

abstract class ChooseCategoryItemState extends Equatable {
  final List<BlockCategoryResource> listCategory;
  final BlockCategoryObjectResource category;
  ChooseCategoryItemState(this.listCategory, this.category);

  @override
  List<Object> get props => <Object>[listCategory];
}

class ChooseCategoryItemInitial extends ChooseCategoryItemState {
  ChooseCategoryItemInitial() : super(<BlockCategoryResource>[], BlockCategoryObjectResource());
}

class ChooseCategoryItemLoading extends ChooseCategoryItemState {
  ChooseCategoryItemLoading() : super(<BlockCategoryResource>[], BlockCategoryObjectResource());
}

class ChooseCategoryItemLoaded extends ChooseCategoryItemState {
  ChooseCategoryItemLoaded({
    required List<BlockCategoryResource> listCategory,
    required BlockCategoryObjectResource category,
  }) : super(listCategory, category);
}

class ChooseCategoryItemError extends ChooseCategoryItemState {
  final String contentError;
  ChooseCategoryItemError({required this.contentError})
      : super(<BlockCategoryResource>[], BlockCategoryObjectResource());
}
