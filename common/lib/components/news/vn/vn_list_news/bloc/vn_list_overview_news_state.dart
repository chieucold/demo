import 'package:api/api/commondata_api.dart';

abstract class VNListOverviewNewsState {}

class VNListOverviewNewsInitial extends VNListOverviewNewsState {}

class VNListOverviewNewsLoading extends VNListOverviewNewsState {}

class VNListOverviewNewsLoaded extends VNListOverviewNewsState {
  final ContentListPublicResource data;
  VNListOverviewNewsLoaded({required this.data});
}

class VNListOverviewNewsError extends VNListOverviewNewsState {
  final String error;
  VNListOverviewNewsError({required this.error});
}
