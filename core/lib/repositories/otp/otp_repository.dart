import 'package:api/id/id_rest_api.dart';
import 'package:api/id/model/otp_user_model.dart';

class OtpRepository {
  final IdResAPI _idResAPI;

  OtpRepository(this._idResAPI);

  Future<OtpUserModel> getOtpUser() async {
    final OtpUserModel data = await _idResAPI.getOtpUser();
    return data;
  }
}
