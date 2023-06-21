import 'package:core/components/filter/bloc/filter_category_view_model.dart';
import 'package:equatable/equatable.dart';

abstract class  FilterCategoryState extends Equatable {
    FilterCategoryState(this.viewModel);
  final   FilterCategoryViewModel viewModel;

  @override
  List<Object> get props => <Object>[viewModel];
}

class   FilterCategoryInitial extends   FilterCategoryState {
    FilterCategoryInitial({  FilterCategoryViewModel? model})
      : super(model ??   FilterCategoryViewModel(countData: 0));
}

class   FilterCategoryLoading extends   FilterCategoryState {
    FilterCategoryLoading({  FilterCategoryViewModel? model})
      : super(model ??   FilterCategoryViewModel(countData: 0));
}

class   FilterCategoryLoaded extends   FilterCategoryState {
    FilterCategoryLoaded(  FilterCategoryViewModel model) : super(model);
}

class   FilterCategoryError extends   FilterCategoryState {
  final String contentError;

    FilterCategoryError(
      {required this.contentError,   FilterCategoryViewModel? model})
      : super(model ??   FilterCategoryViewModel(countData: 0));
}
