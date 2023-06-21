// import 'package:api/api/commondata_api.dart';
// import 'package:api/common/model/common_index.dart';

// class NotificationRepository {
//   final CommondataApi _commonDataResAPI;
//   NotificationRepository(this._commonDataResAPI);

//   Future<NotificationPublicResourceFilterResult> getListNotification(NotificationPublicFilterResource param) async {
//     final NotificationPublicResourceFilterResult data = await _commonDataResAPI.notificationGetListNotification(param);
//     return data;
//   }

//   Future<bool> changeNotiStatus(NotificationRequestSeen param) async {
//     await _commonDataResAPI.notificationChangeStatus(param.id, param.status);
//     return true;
//   }

//   Future<int> getNotificationNotSeen() async {
//     final int data = 0;
//     return data;
//   }
// }
