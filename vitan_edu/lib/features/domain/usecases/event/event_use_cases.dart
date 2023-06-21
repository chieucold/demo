import 'package:api/api/commondata_api.dart';
import 'package:api/common/model/common_index.dart';
import 'package:api/system/model/system_index.dart';
import 'package:core/common/log/bnd_log.dart';
import 'package:core/model/paging.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:vitan_edu/features/data/repositories/event_repository/event_repository.dart';

@injectable
class EventUseCases {
  final EventRepository _eventRepository;
  final BNDLog _log;
  EventUseCases(this._eventRepository, this._log);

  Future<Either<String, EventPublicResourceFilterResult>> getEvent(EventPublicFilter params) async {
    try {
      final EventPublicResourceFilterResult data = await _eventRepository.getEvent(params);
      return Right<String, EventPublicResourceFilterResult>(data);
    } catch (ex) {
      _log.logError(ex.toString());
      return Left<String, EventPublicResourceFilterResult>(ex.toString());
    }
  }

  Future<Either<String, CountTabEventModel>> countTabForEvent(int type) async {
    try {
      final CountTabEventModel data = await _eventRepository.countForTabEvent(type);

      return Right<String, CountTabEventModel>(data);
    } catch (ex) {
      _log.logError(ex.toString());
      return Left<String, CountTabEventModel>(ex.toString());
    }
  }

  Future<Either<String, EventUserResourceFilterResult>> getMyEvents(
      EventGetListEventByCurrentUserRequest request) async {
    try {
      final EventUserResourceFilterResult data = await _eventRepository.getMyEvent(request);

      return Right<String, EventUserResourceFilterResult>(data);
    } catch (ex) {
      return Left<String, EventUserResourceFilterResult>(ex.toString());
    }
  }

  // Future<Either<String, EventResourcePublicFilterResult>> getAllEvent(EventPublicFilter request) async {
  //   try {
  //     final EventResourcePublicFilterResult data = await _eventRepository.getAllEvent(request);

  //     return Right<String, EventResourcePublicFilterResult>(data);
  //   } catch (ex) {
  //     return Left<String, EventResourcePublicFilterResult>(ex.toString());
  //   }
  // }

  Future<Either<String, bool>> inviteEvent(InviteEventRequest request) async {
    try {
      final bool data = await _eventRepository.inviteEvent(request);

      return Right<String, bool>(data);
    } catch (ex) {
      return Left<String, bool>(ex.toString());
    }
  }

  Future<Either<String, bool>> cancelJoinEvent(EventParamResource request) async {
    try {
      final bool data = await _eventRepository.cancelJoinEvent(request);

      return Right<String, bool>(data);
    } catch (ex) {
      return Left<String, bool>(ex.toString());
    }
  }

  Future<Either<String, EventPublicResource>> getEventById(int eventId) async {
    try {
      final EventPublicResource data = await _eventRepository.getEventById(eventId);

      return Right<String, EventPublicResource>(data);
    } catch (ex) {
      return Left<String, EventPublicResource>(ex.toString());
    }
  }

  Future<Either<String, bool>> joinEvent(int eventId) async {
    try {
      final bool data = await _eventRepository.joinEvent(eventId);

      return Right<String, bool>(data);
    } catch (ex) {
      return Left<String, bool>(ex.toString());
    }
  }

  Future<Either<String, EventListUserInvitedResourceFilterResult>> getEventListUserInvited(
      EventGetEventListUserInvitedRequest request) async {
    try {
      final EventListUserInvitedResourceFilterResult data = await _eventRepository.getEventListUserInvited(request);

      return Right<String, EventListUserInvitedResourceFilterResult>(data);
    } catch (ex) {
      return Left<String, EventListUserInvitedResourceFilterResult>(ex.toString());
    }
  }

  Future<Either<String, bool>> inviteUser(InviteUserRequest request) async {
    try {
      final bool data = await _eventRepository.inviteUser(request);

      return Right<String, bool>(data);
    } catch (ex) {
      return Left<String, bool>(ex.toString());
    }
  }
}
