// import 'dart:async';

// import 'package:core/common/app_settings/app_settings.dart';
// import 'package:core/common/constants/user_settings.dart';
// import 'package:core/shared_preferences/local_storage_manager.dart';
// import 'package:get_it/get_it.dart';
// import 'package:in_app_review/in_app_review.dart';

// class InAppReviewService {
//   InAppReviewService._();
//   static final AppSettings _appSettings = GetIt.I<AppSettings>();
//   static final InAppReview _inAppReview = InAppReview.instance;
//   static int _countTime = 0;
//   static final int _seconds = 3600;
//   static Timer? _timer;

//   static Future<void> incrementTime({bool isBackGround = false}) async {
//     if (isBackGround) {
//       _timer?.cancel();
//     } else {
//       if (LocalStoreManager.getInt(UserSettings.inAppReviewTime) != 0) {
//         _timer = Timer.periodic(const Duration(seconds: 1), (Timer timer) async {
//           if (LocalStoreManager.getInt(UserSettings.inAppReviewTime) < _seconds) {
//             _countTime = LocalStoreManager.getInt(UserSettings.inAppReviewTime);
//             _countTime = _countTime + 1;
//             await LocalStoreManager.setInt(UserSettings.inAppReviewTime, _countTime);
//           }
//         });
//       } else {
//         _timer = Timer.periodic(const Duration(seconds: 1), (Timer timer) async {
//           if (timer.tick < _seconds) {
//             await LocalStoreManager.setInt(UserSettings.inAppReviewTime, timer.tick);
//           }
//         });
//       }
//     }
//   }

//   static Future<void> showReviewApp() async {
//     try {
//       if (_appSettings.configs.appStoreId.isEmpty) return;
//       if (await _inAppReview.isAvailable()) {
//         if (LocalStoreManager.getInt(UserSettings.inAppReviewTime) == _seconds) {
//           await _inAppReview.requestReview();
//         }
//       } else {
//         // openAppInStore();
//       }
//     } catch (e) {
//       throw Exception("Error on server when call in_app_review : $e");
//     }
//     if (_timer?.isActive == null || _timer?.isActive == false) {
//       await incrementTime();
//     }
//   }

//   Future<void> openAppInStore() async {
//     await _inAppReview.openStoreListing(
//       appStoreId: _appSettings.configs.appStoreId,
//     );
//   }
// }

// // ignore: avoid_void_async
// void showInAppReview() async {
//   await InAppReviewService.showReviewApp();
// }
