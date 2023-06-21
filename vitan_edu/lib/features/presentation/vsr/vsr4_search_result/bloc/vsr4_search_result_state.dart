
import 'package:api/common/model/common_index.dart';

abstract class VSR4SearchResultState{
final SearchFilterResultModel searchFilterResultModel;

  VSR4SearchResultState(this.searchFilterResultModel);
}

class VSR4SearchResultInitial extends VSR4SearchResultState{
  VSR4SearchResultInitial() : super(SearchFilterResultModel());

}

class VSR4SearchResultLoading extends VSR4SearchResultState{
  VSR4SearchResultLoading() : super(SearchFilterResultModel());

}

class VSR4SearchResultLoaded extends VSR4SearchResultState{
  VSR4SearchResultLoaded(SearchFilterResultModel searchFilterResultModel) : super(searchFilterResultModel);

}

class VSR4SearchResultError extends VSR4SearchResultState{
  VSR4SearchResultError() : super(SearchFilterResultModel());

}