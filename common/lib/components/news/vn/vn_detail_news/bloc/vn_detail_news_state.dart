import 'package:api/api/commondata_api.dart';

abstract class VNDetailNewsState {}

class VNDetailNewsInitial extends VNDetailNewsState {}

class VNDetailNewsLoading extends VNDetailNewsState {}

class VNDetailNewsLoaded extends VNDetailNewsState {
  final ContentResource newsDetail;
  VNDetailNewsLoaded({required this.newsDetail});
}

class VNDetailNewsError extends VNDetailNewsState {
  final String error;
  VNDetailNewsError({required this.error});
}
