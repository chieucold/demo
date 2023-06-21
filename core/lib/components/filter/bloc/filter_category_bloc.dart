import 'package:bloc/bloc.dart';
import 'package:core/components/filter/bloc/filter_category_state.dart';
import 'package:core/components/filter/bloc/filter_category_view_model.dart';

class FilterCategoryBloc extends Cubit<FilterCategoryState> {

  FilterCategoryBloc() : super(FilterCategoryInitial());

  Future<void> loaded() async {
    await setStateLoaded(FilterCategoryViewModel(countData: 0));
  }

  Future<void> setStateLoaded(FilterCategoryViewModel viewModel) async {
    emit(FilterCategoryLoaded(viewModel));
  }
}
