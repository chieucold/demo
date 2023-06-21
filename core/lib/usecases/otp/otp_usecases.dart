import 'package:core/common/log/bnd_log.dart';
import 'package:core/repositories/otp/otp_repository.dart';

import 'package:api/id/model/otp_user_model.dart';
import 'package:dartz/dartz.dart';

class OtpUsecases {
  final OtpRepository _otpRepository;
  final BNDLog _log;

  OtpUsecases(this._otpRepository, this._log);

  Future<Either<String, OtpUserModel>> getOtpUser() async {
    try {
      final OtpUserModel data = await _otpRepository.getOtpUser();
      return Right<String, OtpUserModel>(data);
    } catch (ex) {
      _log.logError(ex.toString());
      return Left<String, OtpUserModel>(ex.toString());
    }
  }
}
