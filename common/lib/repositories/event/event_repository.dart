import 'package:api/api/commondata_api.dart';
import 'package:api/common/model/common_index.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class EventRepository {
  final CommondataApi _eventDataResAPI;
  EventRepository(this._eventDataResAPI);

  Future<EventPublicResourceFilterResult> getEvent(EventPublicFilter param) async {
    return await _eventDataResAPI.eventGetAll(param);
  }

  Future<CountTabEventModel> countForTabEvent(int type) async {
    return await _eventDataResAPI.eventCountForTab(type);
  }

  Future<EventUserResourceFilterResult> getMyEvent(EventGetListEventByCurrentUserRequest request) async {
    return await _eventDataResAPI.eventGetListEventByCurrentUser(request);
  }

  Future<bool> inviteEvent(int id, int invitedId) async {
    return await _eventDataResAPI.eventUpdateEventUserInvited(id, invitedId);
  }

  Future<bool> cancelJoinEvent(EventParamResource request) async {
    return await _eventDataResAPI.eventUpdateEventUserIsJoin(request);
  }

  Future<EventPublicResource> getEventById(int eventId) async {
    return await _eventDataResAPI.eventGetById(eventId);
  }

  Future<bool> joinEvent(int eventId) async {
    return await _eventDataResAPI.eventJoinEvent(eventId);
  }

  Future<EventListUserInvitedResourceFilterResult> getEventListUserInvited(
      EventGetEventListUserInvitedRequest request) async {
    return await _eventDataResAPI.eventGetEventListUserInvited(request);
  }

  Future<bool> inviteUser(InviteUserRequest request) async {
    return await _eventDataResAPI.eventInviteUser(request.eventId, request.userId);
  }

  Future<bool> updateEventUserStatus(EventParamResource request) async {
    return await _eventDataResAPI.eventUpdateEventUserStatus(request);
  }
}
