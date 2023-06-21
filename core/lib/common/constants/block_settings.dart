import 'package:core/assets/images/images.dart';
import 'package:core/common/color/core_color.dart';
import 'package:core/common/enums/block_enum.dart';
import 'package:core/common/route/route_core_const.dart';
import 'package:flutter/material.dart';

class BlockSettings {
  static String blockKey = "currentBLock";
}

final List<BlockModel> listBlock = <BlockModel>[
  BlockModel(BlockEnum.Learn.index, 'VitanLearn', 'Learn', Images.icLearn, kPrimaryLearnColor,
      gradient: CoreColor.learnLinearGradient, routeName: avl1HomePage),
  BlockModel(BlockEnum.Exam.index, 'VitanExam', 'Exam', Images.icExam, kPrimaryExamColor,
      gradient: CoreColor.examLinearGradient, routeName: vhe8HomeScreenRouteName),
  BlockModel(BlockEnum.Guide.index, 'VitanGuide', 'Guide', Images.icCareerGuidance, kPrimaryGuideColor,
      gradient: CoreColor.guideLinearGradient, routeName: vge1HomePage),
  // BlockModel(BlockEnum.Event.index, 'VitanEvent', 'Event', Images.icEvent, kPrimaryEventColor,
  //     gradient: CoreColor.guideLinearGradient, routeName: eventHomePage),
  BlockModel(
    BlockEnum.Admissions.index,
    'VitanAdmission',
    'Admissions',
    Images.icAdmissions,
    const Color(0xFF45BDE5),
    gradient: CoreColor.admissionsLinearGradient,
  ),
  BlockModel(BlockEnum.VocationalTraining.index, 'VitanTraining', 'VocationalTraining', Images.icVocationalTraining,
      const Color(0xFF2E946F),
      gradient: CoreColor.trainingLinearGradient),
  BlockModel(
    BlockEnum.JobConnection.index,
    'VitanJob',
    'JobConnection',
    Images.icJobConnection,
    const Color(0xFF0099CC),
    gradient: CoreColor.jobLinearGradient,
  ),
  BlockModel(BlockEnum.CareerSocialNetwork.index, 'VitanNet', 'CareerSocialNetwork', Images.icCareerSocialNetwork,
      const Color(0xFFDDB526),
      gradient: CoreColor.netLinearGradient, mainFunction: true),
  BlockModel(BlockEnum.Tools.index, 'VitanToolkit', 'Tools', Images.icTools, const Color(0xFFCC9900),
      gradient: CoreColor.toolKitGradient, mainFunction: true),
  BlockModel(BlockEnum.Contest.index, 'VitanContest', 'Contest', Images.icContest, kPrimaryContestColor,
      gradient: CoreColor.contestLinearGradient, routeName: contestHomeRouteName, mainFunction: false),
  // BlockModel(BlockEnum.Event.index, 'VitanEvent', 'Event', Images.icContest, kPrimaryEventColor,
  //     gradient: CoreColor.contestLinearGradient, routeName: contestHomeRouteName, mainFunction: false),
];

final List<BlockModel> listBlockWithVitan = <BlockModel>[
  BlockModel(BlockEnum.SupperApp.index, 'VitanEdu', 'Edu', Images.icVitan, kPrimaryVitanColor,
      gradient: CoreColor.vitanLinearGradient, routeName: vhs5HomeSupperAppRouteName),
  ...listBlock
];

class BlockModel {
  int id;
  String name;
  String title;
  String icon;
  Color backgroundColor;
  String routeName;
  bool mainFunction;
  Gradient gradient;
  bool isActive;
  BlockModel(
    this.id,
    this.name,
    this.title,
    this.icon,
    this.backgroundColor, {
    this.gradient = CoreColor.vitanLinearGradient,
    this.routeName = "",
    this.mainFunction = true,
    this.isActive = false,
  });
  factory BlockModel.fromJson(Map<String, dynamic> json) => BlockModel(
        json['id'],
        json['name'],
        json['title'],
        json['icon'],
        json['backgroundColor'],
        gradient: json['gradient'],
        routeName: json['routeName'],
        mainFunction: json['mainFunction'],
        isActive: json['isActive'],
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
        'name': name,
        'title': title,
        'icon': icon,
        // 'backgroundColor': backgroundColor,
        'routeName': routeName,
      };
}
