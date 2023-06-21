import 'package:api/common/model/common_index.dart';
import 'package:common/components/event/veo/veo2_list_event/bloc/veo2_tab_state.dart';
import 'package:common/usecases/event/event_use_cases.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dartz/dartz.dart';

class VEO2TabBloc extends Cubit<VEO2TabState> {
  final EventUseCases _eventUseCases;
  VEO2TabBloc(this._eventUseCases) : super(VEO2TabInitial());

  CountTabEventModel tabEventModel = CountTabEventModel();

  Future<Either<String, CountTabEventModel>> getData(int blockId) async {
    final Either<String, CountTabEventModel> data = await _eventUseCases.countTabForEvent(blockId);
    data.fold((String l) => null, (CountTabEventModel model) {
      tabEventModel = model;
      emit(VEO2TabLoaded(tabModel: model));
    });
    return data;
  }

  Future<void> updateTabCount({bool isJoinedChange = false, bool isInviteChange = false}) async {
    if (isJoinedChange) {
      tabEventModel.Join--;
    } else if (isInviteChange) {
      tabEventModel.Invite--;
    }
    emit(VEO2TabLoaded(tabModel: tabEventModel));
  }
}
