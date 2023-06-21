class SearchFilterResultModel {
  SearchFilterResultModel({
    // this.totalByBlock = 0,
    this.groupByObjectType = const <GroupByObjectType>[],
    this.totalRows = 0,
    this.data = const <DataSearch>[],
  });

  // int totalByBlock;
  List<GroupByObjectType> groupByObjectType;
  int totalRows;
  List<DataSearch> data;

  factory SearchFilterResultModel.fromJson(Map<String, dynamic> json) => SearchFilterResultModel(
        // totalByBlock: json["totalByBlock"] ?? 0,
        groupByObjectType: (json['groupByObjectType'] as List<dynamic>?)
                ?.map((e) => GroupByObjectType.fromJson(e as Map<String, dynamic>))
                .toList() ??
            [],
        totalRows: json["totalRows"] ??0,
        data:
            (json['data'] as List<dynamic>?)?.map((e) => DataSearch.fromJson(e as Map<String, dynamic>)).toList() ?? [],
      );
}

class GroupByObjectType {
  GroupByObjectType({
    this.objectType = 0,
    this.title = '',
    this.total = 0,
    this.index = 0,
    this.data = const <DataSearch>[],
  });

  int objectType;
  String title;
  int total;
  int index;
  List<DataSearch> data;

  factory GroupByObjectType.fromJson(Map<String, dynamic> json) => GroupByObjectType(
        objectType: json["objectType"] ?? 0,
        title: json["title"] ?? '',
        total: json["total"] ?? 0,
        data: json["data"] != null
            ? List<DataSearch>.from(json["data"].map((x) => DataSearch.fromJson(x)))
            : <DataSearch>[],
      );
}

class DataSearch {
  DataSearch({
    this.id = '',
    this.title = '',
    this.description = '',
    this.blockId = 0,
    this.objectType = 0,
    this.objectId = 0,
    this.descriptionHighlight = '',
    this.titleHighlight = '',
    this.data,
  });

  String id;
  String title;
  String description;
  int blockId;
  int objectType;
  int objectId;
  String descriptionHighlight;
  String titleHighlight;
  DataResultModel? data;

  factory DataSearch.fromJson(Map<String, dynamic> json) => DataSearch(
        id: json["id"] == null ? '' : json["id"],
        title: json["title"] == null ? '' : json["title"],
        description: json["description"] == null ? '' : json["description"],
        blockId: json["blockId"] == null ? 0 : json["blockId"],
        objectType: json["objectType"] == 0 ? 0 : json["objectType"],
        objectId: json["objectId"] == null ? 0 : json["objectId"],
        descriptionHighlight: json["descriptionHighlight"] == null ? '' : json["descriptionHighlight"],
        titleHighlight: json["titleHighlight"] == null ? '' : json["titleHighlight"],
        data: json["data"] == null ? null : DataResultModel.fromMap(json["data"]),
      );
}

class DataResultModel {
  DataResultModel(
      {this.valueKind = 0,
      this.dataEventSearch,
      this.dataExamSearch,
      this.dataContent,
      this.dataContest,
      this.dataContestSubmission});

  int valueKind;
  DataEventSearch? dataEventSearch;
  DataExamSearch? dataExamSearch;
  DataContentSearch? dataContent;
  DataContentSearch? dataContest;
  DataContentSearch? dataContestSubmission;

  factory DataResultModel.fromMap(Map<String, dynamic> json) => DataResultModel(
        dataEventSearch: json['dataEvent'] != null ? DataEventSearch.fromJson(json['dataEvent']) : null,
        // dataExamSearch: json['dataExam'] != null ? DataExamSearch.fromJson(json['dataExam']) : null,
        dataContest: json['dataContest'] != null ? DataContentSearch.fromJson(json['dataContest']) : null,
        dataContestSubmission:
            json['dataContestSubmission'] != null ? DataContentSearch.fromJson(json['dataContestSubmission']) : null,
        dataContent: json['dataContent'] != null ? DataContentSearch.fromJson(json['dataContent']) : null
      );
}

class DataEventSearch {
  DataEventSearch(
      {this.id = 0,
      this.title = '',
      this.description = '',
      this.content = '',
      this.startDate,
      this.endDate,
      this.status = 0,
      this.type = 0,
      this.provinceId = 0,
      this.districtId = 0,
      this.address = '',
      this.location = '',
      this.totalEventUser = 0,
      this.isHot = false,
      this.avatar = ''});

  String title;
  String description;
  String content;
  DateTime? startDate;
  DateTime? endDate;
  String address;
  String location;
  String avatar;
  bool isHot;
  int id;
  int status;
  int type;
  int provinceId;
  int districtId;
  int totalEventUser;

  factory DataEventSearch.fromJson(Map<String, dynamic> json) => DataEventSearch(
      id: json["Id"] ?? 0,
      title: json["Title"] ?? '',
      avatar: json["Avatar"] ?? '',
      description: json["Description"] ?? '',
      content: json["Content"] ?? '',
      startDate: json["StartDate"] == null ? null : DateTime.parse(json["StartDate"]),
      endDate: json["EndDate"] == null ? null : DateTime.parse(json["EndDate"]),
      status: json["Status"] ?? 0,
      type: json["Type"] ?? 0,
      provinceId: json["ProvinceId"] ?? 0,
      districtId: json["DistrictId"] ?? 0,
      address: json["Address"] ?? '',
      location: json["Location"] ?? '',
      totalEventUser: json["totalEventUser"] ?? 0,
      isHot: json["IsHot"] ?? false);
}

class DataContentSearch {
  DataContentSearch({
    this.blockId = 0,
    this.title = '',
    this.description = '',
    this.content = '',
    this.publishedDate,
    this.status = 0,
    this.priority = 0,
    this.displayStyle = 0,
    this.avatar = '',
    this.parentId = 0,
    this.contentType = 0,
    this.url = '',
    this.objectId = 0,
    this.isHot = false,
    this.id = 0,
  });

  int blockId;
  String title;
  String description;
  String content;
  DateTime? publishedDate;
  int status;
  bool isHot;
  int priority;
  int displayStyle;
  String avatar;
  int parentId;
  int contentType;
  String url;
  int objectId;
  int id;

  factory DataContentSearch.fromJson(Map<String, dynamic> json) => DataContentSearch(
        blockId: json["BlockId"] ?? 0,
        title: json["Title"] ?? '',
        description: json["Description"] ?? '',
        content: json["Content"] ?? '',
        publishedDate: json["PublishedDate"] != null ? DateTime.parse(json["PublishedDate"]) : null,
        status: json["Status"] ?? 0,
        priority: json["Priority"] ?? 0,
        avatar: json["Avatar"] ?? '',
        contentType: json["ContentType"] ?? 0,
        url: json["Url"] ?? '',
        objectId: json["ObjectId"] ?? 0,
        isHot: json["isHot"] ?? false,
        id: json["Id"] ?? 0,
      );
}

class DataExamSearch {
  DataExamSearch(
      {this.id = 0,
      this.examCategoryId = 0,
      this.duration = 0,
      this.title = '',
      this.examLevel = 0,
      this.description = '',
      this.type = 0,
      this.examType = 0,
      this.examLimit = 0,
      this.shareMode = 0,
      this.totalMark = 0,
      this.totalQuestion = 0,
      this.status = 0,
      this.examLimitNumber = 0,
      this.createdDate,
      this.isCompetition = false,
      this.examTimeFrom,
      this.examTimeTo});

  int id;
  int examCategoryId;
  int duration;
  String title;
  int examLevel;
  String description;
  int type;
  int examType;
  int examLimit;
  int shareMode;
  int totalMark;
  int totalQuestion;
  DateTime? examTimeFrom;
  DateTime? examTimeTo;
  int examLimitNumber;
  int status;
  DateTime? createdDate;
  bool isCompetition;

  factory DataExamSearch.fromJson(Map<String, dynamic> json) => DataExamSearch(
        id: json["Id"] ?? 0,
        examCategoryId: json["ExamCategoryId"] ?? 0,
        duration: json["Duration"] ?? 0,
        title: json["Title"] ?? '',
        examLevel: json["ExamLevel"] ?? 0,
        description: json["Description"] ?? '',
        type: json["Type"] ?? 0,
        examType: json["ExamType"] ?? 0,
        examLimit: json["ExamLimit"] ?? 0,
        shareMode: json["ShareMode"] ?? 0,
        totalMark: json["TotalMark"] ?? 0,
        totalQuestion: json["TotalQuestion"] ?? 0,
        examLimitNumber: json["ExamLimitNumber"] ?? 0,
        status: json["Status"] ?? 0,
        createdDate: json["CreatedDate"] != null ? DateTime.parse(json["CreatedDate"]) : null,
        examTimeFrom: json["ExamTimeFrom"] != null ? DateTime.parse(json["ExamTimeFrom"]) : null,
        examTimeTo: json["ExamTimeTo"] != null ? DateTime.parse(json["ExamTimeTo"]) : null,
        isCompetition: json["IsCompetition"] ?? false,
      );
}
