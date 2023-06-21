import 'package:api/api/commondata_api.dart';

abstract class VHS9NotificationState {}

class VHS9NotificationInitial extends VHS9NotificationState {}

class VHS9NotificationLoading extends VHS9NotificationState {}

class VHS9NotificationLoaded extends VHS9NotificationState {
  final NotificationPublicResourceFilterResult data;
  VHS9NotificationLoaded({required this.data});
}

class VHS9NotificationError extends VHS9NotificationState {
  final String error;
  VHS9NotificationError({required this.error});
}
