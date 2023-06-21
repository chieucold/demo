
import 'package:api/common/model/common_index.dart';

abstract class VSR4TabState{
  final SearchFilterResultModel searchFilterResultModel;

  VSR4TabState(this.searchFilterResultModel);
}

class VSR4TabInitial extends VSR4TabState{
  VSR4TabInitial() : super(SearchFilterResultModel());

}

class VSR4TabLoading extends VSR4TabState{
  VSR4TabLoading() : super(SearchFilterResultModel());

}

class VSR4TabLoaded extends VSR4TabState{
  VSR4TabLoaded(SearchFilterResultModel searchFilterResultModel) : super(searchFilterResultModel);
}


class VSR4TabError extends VSR4TabState{
  VSR4TabError() : super(SearchFilterResultModel());

}