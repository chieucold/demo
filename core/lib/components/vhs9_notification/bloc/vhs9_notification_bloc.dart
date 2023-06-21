import 'package:api/api/commondata_api.dart';
import 'package:api/common/model/common_index.dart';
import 'package:core/common/enums/block_enum.dart' as coreEnum;
import 'package:core/common/enums/status_enum.dart';
import 'package:core/components/core_component.dart';
import 'package:core/components/vhs9_notification/bloc/vhs9_notification_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:core/usecases/notification/notification_usecases.dart';

// @lazySingleton
class VHS9NotificationBloc extends Cubit<VHS9NotificationState> {
  VHS9NotificationBloc(this._notificationUsecases) : super(VHS9NotificationInitial());

  final NotificationUsecases _notificationUsecases;

  final NotificationPublicFilterResource _request =
      NotificationPublicFilterResource(pageIndex: 1, pageSize: 20, sortExpression: "string");
  List<int> blocksId = <int>[];
  List<int> statusId = <int>[];

  void clearFilter() {
    blocksId = <int>[];
    statusId = <int>[];
  }

  void saveFilter(List<int> listBlockId, List<int> listStatus) {
    blocksId = listBlockId;
    statusId = listStatus;
  }

  void init({int? blockId}) {
    clearFilter();
    _request.blockIds = blocksId =
        (blockId != null && blockId != coreEnum.BlockEnum.SupperApp.index) ? <int>[blockId] : <int>[]; // TODO
    _request.status = -1; // -1 = (Seen and NotSeen)
  }

  Future<void> getData() async {
    _request.pageIndex = 1;
    emit(VHS9NotificationLoading());

    await getListNotification(request: _request);
  }

  Future<void> getFilter(List<int> listBlockId, List<int> listStatus) async {
    _request.pageIndex = 1;
    init();
    if (listBlockId.isNotEmpty) {
      _request.blockIds = listBlockId;
    } else {}
    if (listStatus.isNotEmpty) {
      _request.status = listStatus[0];
    }
    saveFilter(listBlockId, listStatus);
    await getListNotification(request: _request);
  }

  Future<void> getListNotification({required NotificationPublicFilterResource request}) async {
    final Either<String, NotificationPublicResourceFilterResult> data =
        await _notificationUsecases.getListNotification(request);

    data.fold((String failure) => emit(VHS9NotificationError(error: failure)),
        (NotificationPublicResourceFilterResult data) {
      _request.pageIndex++;
      emit(VHS9NotificationLoaded(data: data));
    });
  }

  Future<List<NotificationPublicResource>?> getMoreNotification() async {
    final Either<String, NotificationPublicResourceFilterResult> data =
        await _notificationUsecases.getListNotification(_request);
    List<NotificationPublicResource>? temp;
    data.fold((String l) {
      temp = null;
    }, (NotificationPublicResourceFilterResult r) {
      _request.pageIndex++;
      temp = r.data;
    });
    return temp;
  }

  Future<void> changeNotiStatus(String idNoti) async {
    final NotificationRequestSeen requestSeen = NotificationRequestSeen(status: statusEnum.seen.index, id: idNoti);
    final Either<String, bool> data = await _notificationUsecases.changeNotiStatus(requestSeen);
    data.fold((String failure) => showErrorMessage(failure), (bool data) {});
  }
}
