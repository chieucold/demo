import 'package:core/common/common.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

class Token {
  final String accessToken;
  final String refreshToken;
  final String tokenType;
  final int expiresIn;

  Token(
      {required this.accessToken,
       required this.refreshToken,
        required this.tokenType,
        required this.expiresIn});

  bool isExpired([Duration? clockTolerance]) {
    if (clockTolerance == null) {
      return JwtDecoder.isExpired(accessToken);
    }
    return JwtDecoder.getRemainingTime(accessToken).compareTo(clockTolerance) <=
        0;
  }


  Token.fromJsonMap(Map<String,dynamic> map)
      : accessToken = map["access_token"],
        refreshToken = map["refresh_token"],
        expiresIn = toInt(map["expires_in"]),
        tokenType = map["token_type"];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['access_token'] = accessToken;
    data['expires_in'] = expiresIn;
    data['token_type'] = tokenType;
    data['refresh_token'] = refreshToken;
    return data;
  }

  @override
  String toString() {
    return 'Token{refreshToken: $refreshToken, accessToken: $accessToken, tokenType: $tokenType, expiresIn: $expiresIn}';
  }
}
