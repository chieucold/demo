import 'package:api/api/commondata_api_models.dart';
import 'package:common/components/event/veo/veo5_event_detail/bloc/veo5_event_detail_state.dart';
import 'package:common/components/event/veo/veo5_event_detail/bloc/veo5_view_model.dart';
import 'package:common/usecases/event/event_use_cases.dart';
import 'package:core/common/common.dart';
import 'package:core/components/core_component.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dartz/dartz.dart';

class VEO5EventDetailBloc extends Cubit<VEO5EventDetailState> {
  final EventUseCases _eventUseCases;
  final AuthenticateApp _authenticateApp;

  VEO5EventDetailBloc(this._eventUseCases, this._authenticateApp) : super(VEO5EventDetailInitial());

  VEO5ViewModel get viewModel => state.viewModel;

  Future<void> getEventById(int eventId) async {
    emit(VEO5EventDetailLoading());

    final Either<String, EventPublicResource> data = await _eventUseCases.getEventById(eventId);
    data.fold((String failure) {
      emit(VEO5EventDetailError(failure, viewModel));
    }, (EventPublicResource result) {
      emit(VEO5EventDetailLoaded(viewModel.copyWith(
          model: result, isShowInvite: _checkShowInvite(result), isShowSignUp: _checkShowSignup(result))));
    });
  }

  Future<void> updateValue() async {
    emit(VEO5EventDetailLoaded(viewModel.copyWith(isShowSignUp: false, isShowInvite: true)));
  }
  Future<bool> joinEvent(int eventId) async {
    bool isSingUpSuccess = false;
    showLoading();

    Either<String, bool> data = await _eventUseCases.joinEvent(eventId);
    hideLoading();
    data.fold((String failure) {
      isSingUpSuccess = false;
    }, (bool _value) {
      isSingUpSuccess = _value;
    });
    return isSingUpSuccess;
  }

  bool _checkShowInvite(EventPublicResource event) {
    return event.isJoin && event.startDate != null && event.startDate!.isAfter(DateTime.now()) && event.type != VEO2TabTypeEnum.past.index;
  }

  bool _checkShowSignup(EventPublicResource event) {
    return !event.isJoin && event.startDate != null && event.startDate!.isAfter(DateTime.now()) && event.type != VEO2TabTypeEnum.past.index;
  }
}
