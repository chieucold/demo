import 'package:api/id/model/user_index.dart';
import 'package:core/components/core_component.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:vitan_edu/features/domain/usecases/user/user_use_cases.dart';
import 'package:vitan_edu/features/presentation/vhs/vhs_login_qrcode/bloc/vhs_login_qrcode_view_model.dart';
import 'package:dartz/dartz.dart';
part 'vhs_login_qrcode_state.dart';



class VHSLoginQrcodeBloc extends Cubit<VHSLoginQrcodeState> {
  final UserUseCases _userUseCases;

  VHSLoginQrcodeBloc(this._userUseCases) : super(VHSLoginQrcodeInitial());

  VHSLoginQRCodeViewModel get _model => state.model;

  Future<void> getQRCodeInfo(String key) async {
    final Either<String, LoginQRCodeModel> result = await _userUseCases.getLoginQRCodeInfo(key);

    result.fold((String l) => emit(VHSLoginQrcodeError(l)), (LoginQRCodeModel r) {
      emit(VHSLoginQrcodeInfo(key, r));
    });
  }

  Future<bool> checkQRCode() async {
    final Either<String, bool> result = await _userUseCases.checkQRCode(_model.code);

    result.fold((_) {
      showErrorMessage("Không thành công");
    }, (_) {
      showSuccessMessage("Đăng nhập thành công");
    });

    return result.isRight();
  }

}
