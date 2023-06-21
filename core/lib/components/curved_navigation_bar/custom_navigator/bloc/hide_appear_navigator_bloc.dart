import 'package:core/common/bloc/bloc_index.dart';
import 'package:injectable/injectable.dart';

import 'hide_appear_navigator_state.dart';

@lazySingleton
class HideAppearNavigatorBloc extends Cubit<HideAppearNavigatorState> {
  HideAppearNavigatorBloc() : super(AppearNavigatorState());

  void init() {
    return emit(AppearNavigatorState());
  }

  void changeStatus(bool hide) {
    if (hide) return emit(HideNavigatorState());
    return emit(AppearNavigatorState());
  }
}
