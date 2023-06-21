// import 'package:api/api/commondata_api.dart';
// import 'package:api/common/model/common_index.dart';
// import 'package:core/model/paging.dart';
// import 'package:injectable/injectable.dart';
// import 'package:dartz/dartz.dart';
// import 'package:vitan_edu/features/data/repositories/notification_repository/notification_repository.dart';

// @injectable
// class NotificationUsecases {
//   final NotificationRepository _notificationRepository;
//   NotificationUsecases(this._notificationRepository);

//   Future<Either<String, NotificationPublicResourceFilterResult>> getListNotification(
//       NotificationPublicFilterResource param) async {
//     try {
//       final NotificationPublicResourceFilterResult data = await _notificationRepository.getListNotification(param);
//       return Right(data);
//     } catch (ex) {
//       return Left(ex.toString());
//     }
//   }

//   Future<Either<String, bool>> changeNotiStatus(NotificationRequestSeen param) async {
//     try {
//       final bool data = await _notificationRepository.changeNotiStatus(param);
//       return Right(data);
//     } catch (ex) {
//       return Left(ex.toString());
//     }
//   }

//   Future<Either<String, int>> getNotificationNotSeen( ) async {
//     try {
//       final int data = await _notificationRepository.getNotificationNotSeen();
//       return Right(data);
//     } catch (ex) {
//       return Left(ex.toString());
//     }
//   }
// }
