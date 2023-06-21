import 'package:core/model/noti_count_model.dart';

abstract class NotiCountState {
  NotiCountModel data;
  NotiCountState(this.data);
}

class NotiCountInitial extends NotiCountState {
  NotiCountInitial() : super(NotiCountModel());
}

class NotiCountLoaded extends NotiCountState {
  final NotiCountModel data;
  NotiCountLoaded({required this.data}) : super(data);
}
