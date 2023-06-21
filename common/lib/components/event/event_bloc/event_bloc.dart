import 'package:api/api/commondata_api_models.dart';
import 'package:bloc/bloc.dart';
import 'package:common/usecases/event/event_use_cases.dart';
import 'package:core/common/enums/event_enum.dart';
import 'package:dartz/dartz.dart';

import 'event_state.dart';

class EventBloc extends Cubit<EventState> {
  final EventUseCases _eventUseCases;
  EventBloc(this._eventUseCases) : super(EventInitial());
  final EventEnum eventType = EventEnum.All;


  Future<void> getListEvent(int? eventType,{bool? isHot}) async {
    EventPublicFilter request = EventPublicFilter(pageIndex: 1, pageSize: 10, isHot: isHot ?? false,type: eventType??0);
    emit(EventLoading());
    final Either<String, EventPublicResourceFilterResult> data = await _eventUseCases.getEvent(request);
    data.fold((String failure) => emit(EventError(contentError: failure)), (EventPublicResourceFilterResult data) {
      emit(EventLoaded(data: data));
    });
  }
}
