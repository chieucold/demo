import 'dart:core';
import 'package:api/api/commondata_api.dart';
import 'package:common/components/event/veo/veo2_list_event/bloc/veo2_list_event_state.dart';
import 'package:common/components/event/veo/veo2_list_event/bloc/veo2_view_model.dart';
import 'package:common/usecases/event/event_use_cases.dart';
import 'package:core/common/common.dart';
import 'package:core/components/core_component.dart';
import 'package:core/language/app_localizations.dart';
import 'package:core/shared_preferences/local_storage_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:core/common/enums/event_enum.dart';

class VEO2ListEventBloc extends Cubit<VEO2ListEventState> {
  final EventUseCases _eventUseCases;
  VEO2ListEventBloc(this._eventUseCases) : super(VEO2ListEventInitial());

  VEO2ViewModel get _viewModel => state.viewModel;

  EventGetListEventByCurrentUserRequest get _myEventsRequest => state.viewModel.myEventsRequest;
  EventPublicFilter get _allEventRequest => state.viewModel.getAllEventRequest;

  Future<Either<String, EventUserResourceFilterResult>> getMyEvent() async {
    final Either<String, EventUserResourceFilterResult> data = await _eventUseCases.getMyEvents(_myEventsRequest);
    _myEventsRequest.pageIndex++;
    return data;
  }

  Future<Either<String, EventPublicResourceFilterResult>> getAllEvent() async {
    final Either<String, EventPublicResourceFilterResult> data = await _eventUseCases.getAllEvent(_allEventRequest);
    _allEventRequest.pageIndex++;
    return data;
  }

  Future<void> refresh(VEO2TabTypeEnum tab, EventEnum eventEnum) async {
    _myEventsRequest.pageIndex = 1;
    _allEventRequest.pageIndex = 1;

    _myEventsRequest.pageIndex = 1;
    _allEventRequest.pageIndex = 1;
    final int blockId = LocalStoreManager.getInt(BlockSettings.blockKey);
    _allEventRequest.blockId = blockId;
    switch (tab) {
      case VEO2TabTypeEnum.join:
        {
          _myEventsRequest.isJoin = true;
          _myEventsRequest.status = EventUserOptionStatus.empty.index; // đã dăng
          _myEventsRequest.type = eventEnum.index;
          break;
        }
      case VEO2TabTypeEnum.upcoming:
        {
          _allEventRequest.typePastEvent = TypePastEvent.comingSoon.index;
          _allEventRequest.type = eventEnum.index;
          break;
        }
      case VEO2TabTypeEnum.invitation:
        {
          _myEventsRequest.isJoin = false;
          _myEventsRequest.status = EventUserOptionStatus.waiting.index;
          _myEventsRequest.type = eventEnum.index;
          break;
        }
      case VEO2TabTypeEnum.past:
        {
          _allEventRequest.typePastEvent = TypePastEvent.past.index;
          _allEventRequest.type = eventEnum.index;
          break;
        }
      case VEO2TabTypeEnum.happening:
        {
          _allEventRequest.typePastEvent = TypePastEvent.goingOn.index;
          _allEventRequest.type = eventEnum.index;
          break;
        }
    }
    await getData(tab);
  }

  Future<List<EventUserResource>?> loadMoreMyEvent() async {
    List<EventUserResource>? temp;
    final Either<String, EventUserResourceFilterResult> data = await getMyEvent();
    data.fold((String l) {
      temp = null;
    }, (EventUserResourceFilterResult r) {
      temp = r.data;
    });
    return temp;
  }

  Future<List<EventPublicResource>?> loadMoreAllEvent() async {
    List<EventPublicResource>? temp;
    final Either<String, EventPublicResourceFilterResult> data = await getAllEvent();
    data.fold((String l) {
      temp = null;
    }, (EventPublicResourceFilterResult r) {
      temp = r.data;
    });
    return temp;
  }

  Future<void> getData(VEO2TabTypeEnum tab) async {
    emit(VEO2ListEventLoading(_viewModel.copyWith(type: tab)));

    if (tab == VEO2TabTypeEnum.join || tab == VEO2TabTypeEnum.invitation) {
      final Either<String, EventUserResourceFilterResult> data = await getMyEvent();
      data.fold((String failure) {
        emit(VEO2ListEventError(failure, _viewModel));
      }, (EventUserResourceFilterResult _result) {
        if (tab == VEO2TabTypeEnum.join) {
          emit(VEO2ListEventLoaded(_viewModel.copyWith(
            register: _result.data ?? <EventUserResource>[],
            type: tab,
            totalRow: _result.totalRows,
          )));
        } else if (tab == VEO2TabTypeEnum.invitation) {
          emit(VEO2ListEventLoaded(_viewModel.copyWith(
              invitation: _result.data ?? <EventUserResource>[], type: tab, totalRow: _result.totalRows)));
        }
      });
    } else if (tab == VEO2TabTypeEnum.upcoming || tab == VEO2TabTypeEnum.past || tab == VEO2TabTypeEnum.happening) {
      final Either<String, EventPublicResourceFilterResult> data = await getAllEvent();
      data.fold((String failure) {
        emit(VEO2ListEventError(failure, _viewModel));
      }, (EventPublicResourceFilterResult _result) {
        if (tab == VEO2TabTypeEnum.upcoming) {
          emit(VEO2ListEventLoaded(_viewModel.copyWith(
              upcoming: _result.data ?? <EventPublicResource>[], type: tab, totalRow: _result.totalRows)));
        } else if (tab == VEO2TabTypeEnum.past) {
          emit(VEO2ListEventLoaded(_viewModel.copyWith(
              past: _result.data ?? <EventPublicResource>[], type: tab, totalRow: _result.totalRows)));
        } else if (tab == VEO2TabTypeEnum.happening) {
          emit(VEO2ListEventLoaded(_viewModel.copyWith(
              happening: _result.data ?? <EventPublicResource>[], type: tab, totalRow: _result.totalRows)));
        }
      });
    }
  }

  //toDo xem lai ischoose
  Future<bool> updateEventUserStatus(BuildContext context, EventParamResource request) async {
    bool isRequestSuccess = false;
    showLoading();

    final Either<String, bool> data = await _eventUseCases.updateEventUserStatus(request);
    hideLoading();
    data.fold((String failure) {
      isRequestSuccess = false;
      if (request.status == EventUserOptionStatus.accept.index) {
        showErrorMessage(AppLocalizations.of(context)!.translate("join_event_fail"));
      } else {
        showErrorMessage(AppLocalizations.of(context)!.translate("denied_join_event_fail"));
      }
    }, (bool result) {
      isRequestSuccess = result;
      if (result) {
        if (request.status == EventUserOptionStatus.accept.index) {
          showSuccessMessage(AppLocalizations.of(context)!.translate("join_event_success"));
        } else {
          showSuccessMessage(AppLocalizations.of(context)!.translate("denied_event_group"));
        }
      } else {
        if (request.status == EventUserOptionStatus.accept.index) {
          showErrorMessage(AppLocalizations.of(context)!.translate("join_event_fail"));
        } else {
          showErrorMessage(AppLocalizations.of(context)!.translate("denied_join_event_fail"));
        }
      }
    });
    return isRequestSuccess;
  }

  Future<bool> cancelJoinEvent(BuildContext context, EventParamResource cancelRequest) async {
    bool isRequestSuccess = false;
    showLoading();

    final Either<String, bool> data = await _eventUseCases.cancelJoinEvent(cancelRequest);
    hideLoading();
    data.fold((String failure) {
      isRequestSuccess = false;
      showErrorMessage(AppLocalizations.of(context)!.translate("denied_join_event_fail"));
    }, (bool result) {
      isRequestSuccess = result;
      if (result) {
        showSuccessMessage(AppLocalizations.of(context)!.translate("denied_event_group"));
      } else {
        showErrorMessage(AppLocalizations.of(context)!.translate("denied_join_event_fail"));
      }
    });
    return isRequestSuccess;
  }

  Future<void> updateList({required int index, bool isJoinedChange = false, bool isInviteChange = false}) async {
    if (isJoinedChange) {
      final List<EventUserResource> _listJoined = <EventUserResource>[];
      _listJoined.addAll(_viewModel.register);
      _listJoined.removeWhere((EventUserResource element) => element.eventId == index);
      emit(VEO2ListEventLoaded(_viewModel.copyWith(register: _listJoined)));
    } else if (isInviteChange) {
      List<EventUserResource> _listInvite = <EventUserResource>[];
      _listInvite.addAll(_viewModel.invitation);
      _listInvite.removeWhere((EventUserResource element) => element.eventId == index);
      emit(VEO2ListEventLoaded(_viewModel.copyWith(register: _listInvite)));
    }
  }
}
