import 'package:api/api/commondata_api.dart';

abstract class VNListNewsState {}

// ContentResourceFilterResult get _defaultData =>
//     PagingResponse(data: [], totalRows: 0);

class VNListNewsInitial extends VNListNewsState {}

class VNListNewsLoading extends VNListNewsState {}

class VNListNewsLoaded extends VNListNewsState {
  final ContentListResourceFilterResult data;
  VNListNewsLoaded({required this.data});
}

class VNListNewsError extends VNListNewsState {
  final String error;
  VNListNewsError({required this.error});
}
