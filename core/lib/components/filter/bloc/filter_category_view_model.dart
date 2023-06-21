import 'package:freezed_annotation/freezed_annotation.dart';
part 'filter_category_view_model.freezed.dart';

@freezed
class FilterCategoryViewModel with _$FilterCategoryViewModel {
  factory FilterCategoryViewModel({int? countData, List<int>? itemSelectedId}) =
      _FilterCategoryViewModel;
}
