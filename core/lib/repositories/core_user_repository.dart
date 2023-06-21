import 'package:core/components/user/bnd_token.dart';
import 'package:core/model/user_info.dart';

abstract class CoreUserRepository {
  bool get isLogin;
  Future<void> setIsLogin();
  Future<Token?> refreshToken({String clientId, String refreshToken});
  Future<UserInfoApiModel?> getUserInfo();
}
