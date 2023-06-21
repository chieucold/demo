import 'package:api/api/commondata_api_models.dart';
import 'package:flutter/cupertino.dart';

@immutable
abstract class EventState {}

class EventInitial extends EventState {}

class EventLoading extends EventState {}

class EventLoaded extends EventState {
  final EventPublicResourceFilterResult data;

  EventLoaded({required this.data});
}

class EventError extends EventState {
  final String contentError;

  EventError({required this.contentError});
}
