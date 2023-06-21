import 'package:api/api/commondata_api_models.dart';
import 'package:api/common/model/event/event_offline_index.dart';
import 'package:bloc/bloc.dart';
import 'package:common/components/event/veo/veo6_list_member_event/bloc/veo6_list_member_event_state.dart';
import 'package:common/components/event/veo/veo6_list_member_event/bloc/veo6_view_model.dart';
import 'package:common/usecases/event/event_use_cases.dart';
import 'package:core/components/bnd_message.dart';
import 'package:core/language/app_localizations.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

class VEO6ListMemberEventBloc extends Cubit<VEO6ListMemberEventState> {
  final EventUseCases _eventUseCases;
  VEO6ListMemberEventBloc(this._eventUseCases) : super(VEO6ListMemberEventInitial());

  VEO6ViewModel get viewModel => state.viewModel;

  List<int> userIds = <int>[];
  EventGetEventListUserInvitedRequest request = EventGetEventListUserInvitedRequest(pageIndex: 1, pageSize: 10);

  Future<Either<String, EventListUserInvitedResourceFilterResult>> getUsers() async {
    final Either<String, EventListUserInvitedResourceFilterResult> data =
        await _eventUseCases.getEventListUserInvited(request);
    request.pageIndex++;
    return data;
  }

  Future<void> onRefresh({String keySearch = ""}) async {
    request.pageIndex = 1;
    await getUsers();
  }

  Future<void> getData(int eventId) async {
    request.eventId = eventId;
    request.pageIndex = 1;
    emit(VEO6ListMemberEventLoading());

    final Either<String, EventListUserInvitedResourceFilterResult> data = await getUsers();

    data.fold((String failure) {
      emit(VEO6ListMemberEventError(viewModel, failure));
      print(failure);
    }, (EventListUserInvitedResourceFilterResult res) {
      print(res.data);
      emit(VEO6ListMemberEventLoaded(
          viewModel.copyWith(listMember: res.data ?? <EventListUserInvitedResource>[], totalMember: res.totalRows)));
    });
  }

  Future<List<EventListUserInvitedResource>?> getDataLoadMore() async {
    List<EventListUserInvitedResource>? _listData;
    final Either<String, EventListUserInvitedResourceFilterResult> data = await getUsers();
    data.fold((String failure) => _listData = null, (EventListUserInvitedResourceFilterResult res) {
      _listData = res.data ?? <EventListUserInvitedResource>[];
    });
    return _listData;
  }

  Future<bool> inviteUser(BuildContext context, int userId, int eventId) async {
    bool isInviteSuccess = false;
    final Either<String, bool> data = await _eventUseCases.inviteUser(InviteUserRequest(userId, eventId));
    data.fold((String l) {
      showMessage(AppLocalizations.of(context)!.translate("invite_failure"));
      isInviteSuccess = false;
    }, (bool result) {
      isInviteSuccess = true;
      userIds.add(userId);
    });
    return isInviteSuccess;
  }

  Future<void> onInvite() async {
    emit(VEO6ListMemberEventLoaded(viewModel.copyWith(userIds: userIds)));
  }
}
