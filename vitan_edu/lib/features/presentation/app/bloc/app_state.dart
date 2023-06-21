
import 'package:api/exam/model/exam_index.dart';

abstract class AppState {
  final AppModel appModel;

  AppState( this.appModel);

}

class AppStateInitial extends AppState {
  AppStateInitial({AppModel? appModel})
      : super(appModel!);
}

class AppChangeState extends AppState {
  AppChangeState({AppModel? appModel})
      : super(appModel!);
}

