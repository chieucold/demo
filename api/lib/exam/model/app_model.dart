import 'package:api/payment/model/exam_package/exam_package_add_cart_model.dart';

class AppModel {
  String language;
  bool theme;
  bool? isBiometric;
  bool isCountTime;
  bool isExit;
  int durationLockScreen;

  // List<ExamPackageAddCartModel> listExamPackageCart;
  // int countNotificationNotSeen;

  AppModel(
      {this.language = 'vi',
      this.theme = true,
      this.isBiometric,
      this.isCountTime = true,
      // this.listExamPackageCart = const <ExamPackageAddCartModel>[],
      this.isExit = false,
      this.durationLockScreen = 0
      // this.countNotificationNotSeen = 0,
      });

  AppModel copyWith(
          {String? language,
          bool? theme,
          bool? isBiometric,
          bool? isCountTime,
          bool? isExit,
          int? durationLockScreen,
          List<ExamPackageAddCartModel>? listExamPackageCart,
          int? countNotificationNotSeen}) =>
      AppModel(
        language: language ?? this.language,
        theme: theme ?? this.theme,
        durationLockScreen: durationLockScreen ?? this.durationLockScreen,
        isBiometric: isBiometric ?? this.isBiometric,
        isCountTime: isCountTime ?? this.isCountTime,
        isExit: isExit ?? this.isExit,
        // listExamPackageCart: listExamPackageCart ?? this.listExamPackageCart,
        // countNotificationNotSeen: countNotificationNotSeen ?? this.countNotificationNotSeen,
      );
}
