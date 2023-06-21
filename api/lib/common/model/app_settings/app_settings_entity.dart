import 'package:json_annotation/json_annotation.dart';
part 'app_settings_entity.g.dart';

@JsonSerializable()
class AppSettingsEntity {
  AppSettingsEntity({
    required this.configs,
    this.storageServers,
    this.versionLanguage = '',
  });
  @JsonKey(name: 'configs')
  final Configs configs;
  @JsonKey(name: 'storageServer')
  final List<StorageServer>? storageServers;
  @JsonKey(name: 'versionLanguage')
  final String versionLanguage;

  factory AppSettingsEntity.fromJson(Map<String, dynamic> json) => _$AppSettingsEntityFromJson(json);

  Map<String, dynamic> toJson() => _$AppSettingsEntityToJson(this);
}

@JsonSerializable()
class Configs {
  Configs({
    this.bndCompanyEmail = '',
    this.bndCompanyPhone = '',
    this.bndCompanyFacebook = '',
    this.bndCompanyAppStore = '',
    this.bndCompanyGooglePlay = '',
    this.facebookAppId = '',
    this.googleApiKey = '',
    this.googleClientId = '',
    this.bndCompanyName = '',
    this.publicDomain = '',
    this.calculatePointsUrl = '',
    this.bndCompanyTitle = '',
    this.bndSuperAppTitle = '',
    this.contactHelp = '',
    this.guideLink = '',
    this.onBoarding,
    this.embedVideoUrl = '',
    this.appVersion = '',
    this.miniAppActive,
    this.appStoreId = '',
    this.contestHomeUrl = '',
    this.contestAppUrl = '',
    this.imgLogoLogin = '',
    this.urlVitanNetWebview = '',
    this.durationAdvertisement = 0,
    this.isShowAppleLogin = 0,
    this.icCategoryDefaultExam = '',
    this.versionEnableInAppPurchase = const <AppInfo>[],
    this.googleMapAPIKEY = '',
    this.linkAudioAlertCompetition = '',
    this.userTestGuide = const <UserTestGuide>[],
  });
  @JsonKey(defaultValue: '')
  String bndCompanyEmail;
  @JsonKey(defaultValue: '')
  String bndCompanyPhone;
  @JsonKey(defaultValue: '')
  String bndCompanyFacebook;
  @JsonKey(defaultValue: '')
  String bndCompanyAppStore;
  @JsonKey(defaultValue: '')
  String bndCompanyGooglePlay;
  @JsonKey(defaultValue: '')
  String facebookAppId;
  @JsonKey(defaultValue: '')
  String googleApiKey;
  @JsonKey(defaultValue: '')
  String googleClientId;
  @JsonKey(defaultValue: '')
  String bndCompanyName;
  @JsonKey(defaultValue: '')
  String bndCompanyTitle;
  @JsonKey(defaultValue: '')
  String bndSuperAppTitle;
  @JsonKey(defaultValue: '')
  String publicDomain;
  @JsonKey(defaultValue: '')
  String calculatePointsUrl;
  @JsonKey(defaultValue: '')
  String contactHelp;
  @JsonKey(defaultValue: '')
  String guideLink;
  @JsonKey(defaultValue: '', name: "embed_video_url")
  String embedVideoUrl;
  @JsonKey(defaultValue: '')
  String appVersion;
  @JsonKey(defaultValue: '')
  String appStoreId;
  @JsonKey(defaultValue: '')
  String contestHomeUrl;
  @JsonKey(defaultValue: '')
  String contestAppUrl;
  @JsonKey(defaultValue: '')
  String imgLogoLogin;
  @JsonKey(defaultValue: '')
  String urlVitanNetWebview;
  @JsonKey(defaultValue: <OnBoarding>[])
  List<OnBoarding>? onBoarding;
  @JsonKey(defaultValue: <int>[])
  List<MiniAppActive>? miniAppActive;
  @JsonKey(defaultValue: 0)
  int durationAdvertisement;
  @JsonKey(defaultValue: <ConfigDeepLink>[])
  List<ConfigDeepLink>? configDeepLink;
  @JsonKey(defaultValue: 0)
  int isShowAppleLogin;
  @JsonKey(defaultValue: '')
  String icCategoryDefaultExam;
  @JsonKey(defaultValue: <String>[])
  List<AppInfo> versionEnableInAppPurchase;
  @JsonKey(defaultValue: '')
  String googleMapAPIKEY;
  @JsonKey(defaultValue: '')
  String linkAudioAlertCompetition;
  @JsonKey(defaultValue: [])
  List<UserTestGuide> userTestGuide;

  factory Configs.fromJson(Map<String, dynamic> json) => _$ConfigsFromJson(json);

  Map<String, dynamic> toJson() => _$ConfigsToJson(this);
}

@JsonSerializable()
class AppInfo {
  AppInfo({this.version = ''});

  @JsonKey(defaultValue: '')
  String version;

  factory AppInfo.fromJson(Map<String, dynamic> json) => _$AppInfoFromJson(json);

  Map<String, dynamic> toJson() => _$AppInfoToJson(this);
}

@JsonSerializable()
class StorageServer {
  StorageServer({
    this.name = '',
    this.publicDomain = '',
  });

  @JsonKey(defaultValue: '')
  final String name;
  @JsonKey(defaultValue: '')
  final String publicDomain;

  factory StorageServer.fromJson(Map<String, dynamic> json) => _$StorageServerFromJson(json);

  Map<String, dynamic> toJson() => _$StorageServerToJson(this);
}

@JsonSerializable()
class OnBoarding {
  OnBoarding({
    this.urlImage = '',
    this.title = '',
    this.content = '',
  });
  @JsonKey(defaultValue: '')
  String urlImage;
  @JsonKey(defaultValue: '')
  String title;
  @JsonKey(defaultValue: '')
  String content;

  factory OnBoarding.fromJson(Map<String, dynamic> json) => _$OnBoardingFromJson(json);

  Map<String, dynamic> toJson() => _$OnBoardingToJson(this);
}

@JsonSerializable()
class MiniAppActive {
  MiniAppActive({this.id = 0});
  @JsonKey(defaultValue: 0)
  int id;

  factory MiniAppActive.fromJson(Map<String, dynamic> json) => _$MiniAppActiveFromJson(json);

  Map<String, dynamic> toJson() => _$MiniAppActiveToJson(this);
}

@JsonSerializable()
class ConfigDeepLink {
  ConfigDeepLink({this.url = '', this.objectType = '', this.action = '', this.regexId = '', this.blockId = ''});
  @JsonKey(defaultValue: '')
  String url;
  @JsonKey(defaultValue: '')
  String objectType;
  @JsonKey(defaultValue: '')
  String action;
  @JsonKey(defaultValue: '')
  String regexId;
  @JsonKey(defaultValue: '')
  String blockId;

  factory ConfigDeepLink.fromJson(Map<String, dynamic> json) => _$ConfigDeepLinkFromJson(json);

  Map<String, dynamic> toJson() => _$ConfigDeepLinkToJson(this);
}

@JsonSerializable()
class UserTestGuide {
  UserTestGuide({this.user = ''});

  @JsonKey(defaultValue: '')
  String user;

  factory UserTestGuide.fromJson(Map<String, dynamic> json) => _$UserTestGuideFromJson(json);

  Map<String, dynamic> toJson() => _$UserTestGuideToJson(this);
}
