import 'package:api/system/model/system_index.dart';
import 'package:bloc/bloc.dart';
import 'package:core/common/app_settings/app_settings.dart';
import 'package:core/common/constants/block_settings.dart';
import 'package:core/common/enums/block_enum.dart';
import 'package:core/components/core_component.dart';
import 'package:core/model/user_info.dart';
import 'package:get_it/get_it.dart';

import 'block_state.dart';

class BlockBloc extends Cubit<BlockState> {
  BlockBloc() : super(BlockInitial());

  Future<void> refresh() async {
    emit(BlockLoading());
    await Future<void>.delayed(const Duration(milliseconds: 500));

    final List<UserTestGuide> _listUserTestGuide = GetIt.I<AppSettings>().configs.userTestGuide;
    final UserInfo? currentUser = GetIt.I<AuthenticateApp>().getUserInfo();
    List<String> _emailUser = _listUserTestGuide.map((e) => e.user).toList();
    if (_emailUser.contains(currentUser?.email ?? '')) {
      listBlock.where((element) => element.id == BlockEnum.Guide.index).first.isActive = true;
    } else {
      listBlock.where((element) => element.id == BlockEnum.Guide.index).first.isActive = false;
    }

    final List<int> _listAppActive = GetIt.I<AppSettings>().configs.miniAppActive?.map((e) => e.id).toList() ?? [];
    for (var e in listBlock) {
      for (int i in _listAppActive) {
        if (e.id == i) {
          e.isActive = true;
        }
      }
    }
    emit(BlockLoaded(listBlock: listBlock));
  }

  Future<void> getListBlock() async {
    emit(BlockLoading());

    emit(BlockLoaded(listBlock: listBlock));
  }
}
