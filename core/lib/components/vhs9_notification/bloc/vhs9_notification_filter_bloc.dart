import 'package:core/components/vhs9_notification/bloc/vhs9_notification_filter_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VHS9NotificationFilterBloc extends Cubit<VHS9NotificationFilterState> {
  VHS9NotificationFilterBloc() : super(VHS9NotificationFilterInitial());

  void init() {
    emit(VHS9NotificationFilterInitial());
  }

  void clearAll() {
    emit(VHS9NotificationFilterClearAll());
  }
}
