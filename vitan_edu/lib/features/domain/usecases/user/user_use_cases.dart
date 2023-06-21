import 'package:api/id/model/login_external_model.dart';
import 'package:api/id/model/login_otp_support_model.dart';
import 'package:api/id/model/login_request_model.dart';
import 'package:api/id/model/login_response_model.dart';
import 'package:api/id/model/update_account_request.dart';
import 'package:api/id/model/user_index.dart';
import 'package:core/common/constants/const/const_index.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:vitan_edu/features/data/repositories/user/user_repository.dart';

@injectable
class UserUseCases {
  final UserRepository _userRepository;

  UserUseCases(this._userRepository);

  Future<Either<String, UserInfoModel>> getUserInfo() async {
    try {
      return Right(await _userRepository.getUserInfo());
    } catch (ex) {
      print(ex);
      return Left("error");
    }
  }

  Future<Either<String, bool>> setRoleOfUser(int userType) async {
    try {
      bool result = await _userRepository.setRoleOfUser(userType);
      if (result) {
        return Right(true);
      }
      return Left("sai");
    } catch (ex) {
      print(ex);
      return Left(ex.toString());
    }
  }

  Future<Either<String, bool>> checkQRCode(String key) async {
    try {
      await _userRepository.checkQRCode(key);
      return const Right<String, bool>(true);
    } catch (ex) {
      print(ex);
      return Left<String, bool>(ex.toString());
    }
  }

  Future<Either<String, LoginQRCodeModel>> getLoginQRCodeInfo(String key) async {
    try {
      final LoginQRCodeModel result = await _userRepository.getLoginQRCodeInfo(key);
      return Right<String, LoginQRCodeModel>(result);
    } catch (ex) {
      if (ex is DioError) return Left<String, LoginQRCodeModel>(getIdError(ex.response?.data));
      return Left<String, LoginQRCodeModel>(ex.toString());
    }
  }

  Future<Either<String, DeviceTokenModel>> setUserMobileToken(TokenRequest request) async {
    try {
      final DeviceTokenModel result = await _userRepository.setUserMobileToken(request);
      return Right<String, DeviceTokenModel>(result);
    } catch (ex) {
      if (ex is DioError) return Left<String, DeviceTokenModel>(getIdError(ex.response?.data));
      return Left<String, DeviceTokenModel>(ex.toString());
    }
  }

  Future<Either<String, LoginResponseModel>> loginExternal(LoginExternalModel loginExternalModel) async {
    try {
      final LoginResponseModel result = await _userRepository.loginExternal(loginExternalModel);
      return Right<String, LoginResponseModel>(result);
    } catch (ex) {
      if (ex is DioError) return Left<String, LoginResponseModel>(getIdError(ex.response?.data));
      return Left<String, LoginResponseModel>(ex.toString());
    }
  }

  Future<Either<String, LoginResponseModel>> checkAccount(LoginRequestModel request) async {
    try {
      final LoginResponseModel result = await _userRepository.checkAccount(request);
      return Right<String, LoginResponseModel>(result);
    } catch (ex) {
      if (ex is DioError) return Left<String, LoginResponseModel>(getIdError(ex.response?.data));
      return Left<String, LoginResponseModel>(ex.toString());
    }
  }

  Future<Either<String, LoginResponseModel>> loginAccount(LoginRequestModel request) async {
    try {
      final LoginResponseModel result = await _userRepository.loginAccount(request);
      return Right<String, LoginResponseModel>(result);
    } catch (ex) {
      if (ex is DioError) return Left<String, LoginResponseModel>(getIdError(ex.response?.data));
      return Left<String, LoginResponseModel>(ex.toString());
    }
  }

  Future<Either<String, dynamic>> updateAccount(UpdateAccountRequest request) async {
    try {
      final dynamic result = await _userRepository.updateAccount(request);
      return Right<String, dynamic>(result);
    } catch (ex) {
      return Left<String, dynamic>(ex.toString());
    }
  }

  Future<Either<String, TwoFactorSendCodeResponse>> twoFactorLogin(LoginTwoFactorRequestModel request) async {
    try {
      final TwoFactorSendCodeResponse result = await _userRepository.twoFactorLogin(request);
      return Right<String, TwoFactorSendCodeResponse>(result);
    } catch (ex) {
      if (ex is DioError) return Left<String, TwoFactorSendCodeResponse>(getIdError(ex.response?.data));
      return Left<String, TwoFactorSendCodeResponse>(ex.toString());
    }
  }

  Future<Either<String, TwoFactorSendCodeResponse>> twoFactorLoginWithRecovery(
      LoginRecoveryCodeTwoFactorRequestModel request) async {
    try {
      final TwoFactorSendCodeResponse result = await _userRepository.twoFactorLoginWithRecovery(request);
      return Right<String, TwoFactorSendCodeResponse>(result);
    } catch (ex) {
      if (ex is DioError) return Left<String, TwoFactorSendCodeResponse>(getIdError(ex.response?.data));
      return Left<String, TwoFactorSendCodeResponse>(ex.toString());
    }
  }

  Future<Either<String, TwoFactorSendCodeResponse>> twoFactorSendCode(TwoFactorSendCode request) async {
    try {
      final TwoFactorSendCodeResponse result = await _userRepository.twoFactorSendCode(request);
      return Right<String, TwoFactorSendCodeResponse>(result);
    } catch (ex) {
      if (ex is DioError) return Left<String, TwoFactorSendCodeResponse>(getIdError(ex.response?.data));
      return Left<String, TwoFactorSendCodeResponse>(ex.toString());
    }
  }

  Future<Either<String, List<TwoFactorType>>> getLoginOTPSupport(String username) async {
    try {
      final List<TwoFactorType> result = await _userRepository.getLoginOTPSupport(username);
      result.removeWhere((element) =>
          element.type == TwoFactorTypeEnum.app.getValue || element.type == TwoFactorTypeEnum.prompt.getValue);
      return Right<String, List<TwoFactorType>>(result);
    } catch (ex) {
      if (ex is DioError) return Left<String, List<TwoFactorType>>(getIdError(ex.response?.data));
      return Left<String, List<TwoFactorType>>(ex.toString());
    }
  }

  Future<Either<String, bool>> acceptPromt(AcceptPromptRequestModel request) async {
    try {
      final bool result = await _userRepository.acceptPrompt(request);
      return Right<String, bool>(result);
    } catch (ex) {
      if (ex is DioError) return Left<String, bool>(getIdError(ex.response?.data));
      return Left<String, bool>(ex.toString());
    }
  }

  String getIdError(dynamic data) {
    try {
      if (data is String) {
        return data;
      } else if (data["errors"] != null) {
        List<String> errors = <String>[];
        Map<String, dynamic> errorObject = data["errors"] as Map<String, dynamic>;
        errorObject.forEach((key, value) {
          if (value is List) {
            for (var i = 0; i < value.length; i++) {
              errors.add(value[i].toString());
            }
          } else
            errors.add(value.toString());
        });

        return errors.join(", ");
      }
    } catch (e) {}

    return data.toString();
  }
}
