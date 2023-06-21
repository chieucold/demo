import 'package:api/id/model/login_request_model.dart';
import 'package:core/common/bloc/bloc_index.dart';
import 'package:core/common/common.dart';
import 'package:core/common/core_module.dart';
import 'package:core/components/core_component.dart';
import 'package:core/language/app_localizations.dart';
import 'package:core/model/user_info.dart';
import 'package:vitan_edu/core/common/injection.dart';
import 'package:vitan_edu/features/domain/usecases/user/user_use_cases.dart';
import 'package:dartz/dartz.dart';

class VHSPromptBloc extends Cubit<int> {
  VHSPromptBloc(this._userUseCases) : super(0);

  final UserUseCases _userUseCases;

  Future<void> acceptPromt(String key) async {
    showLoading();
    final UserInfo? currentUser = getItSuper<AuthenticateApp>().getUserInfo();
    final _request = AcceptPromptRequestModel(key: key, userId: currentUser?.id.toInt() ?? 0);
    final Either<String, bool> data = await _userUseCases.acceptPromt(_request);
    data.fold((String failure) {
      showErrorMessage(failure);
    }, (bool _data) {
      showSuccessMessage(AppLocalizations.of(navigatorKey!.currentState!.context)!.translate('Đăng nhập thành công'));
    });
    hideLoading();
  }
}
