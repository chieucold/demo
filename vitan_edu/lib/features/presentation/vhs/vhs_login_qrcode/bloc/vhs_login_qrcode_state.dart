part of 'vhs_login_qrcode_bloc.dart';

@immutable
abstract class VHSLoginQrcodeState extends Equatable {
  VHSLoginQrcodeState(this.model);
  final VHSLoginQRCodeViewModel model;

  @override
  List<Object?> get props => <Object?>[model];
}

class VHSLoginQrcodeInitial extends VHSLoginQrcodeState {
  VHSLoginQrcodeInitial() : super(VHSLoginQRCodeViewModel(code: "", data: LoginQRCodeModel()));
}

class VHSLoginQrcodeInfo extends VHSLoginQrcodeState {
  VHSLoginQrcodeInfo(String code, LoginQRCodeModel data) : super(VHSLoginQRCodeViewModel(code: code, data: data));
}

class VHSLoginQrcodeError extends VHSLoginQrcodeState {
  final String error;
  VHSLoginQrcodeError(this.error) : super(VHSLoginQRCodeViewModel(code: "", data: LoginQRCodeModel()));
}
