import 'package:api/api/commondata_api.dart';

abstract class VNListRelativeNewsState {}

class VNListRelativeNewsInitial extends VNListRelativeNewsState {}

class VNListRelativeNewsLoading extends VNListRelativeNewsState {}

class VNListRelativeNewsLoaded extends VNListRelativeNewsState {
  final ContentResourceFilterResult data;
  VNListRelativeNewsLoaded({required this.data});
}

class VNListRelativeNewsError extends VNListRelativeNewsState {
  final String error;
  VNListRelativeNewsError({required this.error});
}
