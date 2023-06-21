import 'package:api/id/model/user_index.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'vhs_login_qrcode_view_model.freezed.dart';

@freezed
class VHSLoginQRCodeViewModel with _$VHSLoginQRCodeViewModel {
  factory VHSLoginQRCodeViewModel({
    required LoginQRCodeModel data,
    required String code,
  }) = _VHSLoginQRCodeViewModel;
}
