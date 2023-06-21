import 'package:core/common/enums/block_enum.dart';
import 'package:core/components/notification/bloc/noti_count_state.dart';
import 'package:core/model/noti_count_model.dart';
import 'package:core/usecases/notification/notification_usecases.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bnd_message.dart';

class NotiCountBloc extends Cubit<NotiCountState> {
  final NotificationUsecases _notificationUsecases;
  NotiCountBloc(this._notificationUsecases) : super(NotiCountInitial());

  Future<void> getNotiNotSee({int? blockId}) async {
    int _totalNotSeen = 0;
    final NotiCountModel model = state.data;
    final Either<String, int> data = await _notificationUsecases.getNotificationNotSeen();
    data.fold((String failure) => showErrorMessage(failure), (int data) {
      _totalNotSeen = data;
    });
    if (blockId == null || blockId == BlockEnum.SupperApp.index)
      model.totalNotSeen = _totalNotSeen;
    else if (blockId == BlockEnum.Exam.index)
      model.examNotSeen = _totalNotSeen;
    else if (blockId == BlockEnum.Guide.index) model.guideNotSeen = _totalNotSeen;
    return emit(NotiCountLoaded(data: model));
  }
}
