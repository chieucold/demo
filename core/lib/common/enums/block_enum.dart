// ignore_for_file: constant_identifier_names

import 'package:core/assets/images/images.dart';

enum BlockEnum {
  SupperApp,
  System,
  Exam,
  Learn,
  Guide, //"Hướng nghiệp"
  VocationalTraining, //"Đào tạo nghề"
  JobConnection, //"Kết nối việc làm"
  CareerSocialNetwork, //"Mạng xã hội việc làm"
  Admissions, //"Tuyen sinh"
  // Ecommerce, //"Thương mại điện tử"
  Tools, //"Bộ công cụ nghề nghiệp"
  CommonData,
  Contest,
  BnD,
  Search,
  Payment,
  Survey,
  Help,
  Event,
  Donate,
  Organization,
  VanHoaDoc,
  Settings,
}

extension ParseToString on BlockEnum {
  String get getValue {
    return toString().split('.').last;
  }
}

BlockEnum parseStringToBlockEnum(String value) {
  return BlockEnum.values
      .firstWhere((BlockEnum e) => e.toString().split('.')[1].toUpperCase() == value.toUpperCase());
}

final Map<String, String> getBlockIcon = <String, String>{
  BlockEnum.System.getValue: Images.icLearn,
  BlockEnum.Exam.getValue: Images.icExam,
  BlockEnum.Learn.getValue: Images.icLearn,
  BlockEnum.Admissions.getValue: Images.icAdmissions,
  BlockEnum.Guide.getValue: Images.icCareerGuidance,
  BlockEnum.VocationalTraining.getValue: Images.icVocationalTraining,
  BlockEnum.JobConnection.getValue: Images.icJobConnection,
  BlockEnum.CareerSocialNetwork.getValue: Images.icCareerSocialNetwork,
  // BlockEnum.Ecommerce.getValue: Images.icCareerSocialNetwork,
  BlockEnum.Tools.getValue: Images.icTools,
  BlockEnum.CommonData.getValue: Images.icVitan,
  BlockEnum.Settings.getValue: Images.icNotiSetting,
  BlockEnum.Contest.getValue: Images.icContest,
  BlockEnum.Event.getValue: Images.icContest,
};
