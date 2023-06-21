import 'package:json_annotation/json_annotation.dart';
import 'package:collection/collection.dart';
import 'exam_api_enums.dart' as enums;

part 'exam_api_models.g.dart';

@JsonSerializable(explicitToJson: true)
class AddExamToGroupResource {
  AddExamToGroupResource({
    this.examId,
    this.examIds,
    this.groupId,
    this.lastDeadline,
  });

  factory AddExamToGroupResource.fromJson(Map<String, dynamic> json) =>
      _$AddExamToGroupResourceFromJson(json);

  @JsonKey(name: 'examId', includeIfNull: true)
  final int? examId;
  @JsonKey(name: 'examIds', includeIfNull: true, defaultValue: <int>[])
  final List<int>? examIds;
  @JsonKey(name: 'groupId', includeIfNull: true)
  final int? groupId;
  @JsonKey(name: 'lastDeadline', includeIfNull: true)
  final DateTime? lastDeadline;
  static const fromJsonFactory = _$AddExamToGroupResourceFromJson;
  static const toJsonFactory = _$AddExamToGroupResourceToJson;
  Map<String, dynamic> toJson() => _$AddExamToGroupResourceToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is AddExamToGroupResource &&
            (identical(other.examId, examId) ||
                const DeepCollectionEquality().equals(other.examId, examId)) &&
            (identical(other.examIds, examIds) ||
                const DeepCollectionEquality()
                    .equals(other.examIds, examIds)) &&
            (identical(other.groupId, groupId) ||
                const DeepCollectionEquality()
                    .equals(other.groupId, groupId)) &&
            (identical(other.lastDeadline, lastDeadline) ||
                const DeepCollectionEquality()
                    .equals(other.lastDeadline, lastDeadline)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(examId) ^
      const DeepCollectionEquality().hash(examIds) ^
      const DeepCollectionEquality().hash(groupId) ^
      const DeepCollectionEquality().hash(lastDeadline) ^
      runtimeType.hashCode;
}

extension $AddExamToGroupResourceExtension on AddExamToGroupResource {
  AddExamToGroupResource copyWith(
      {int? examId, List<int>? examIds, int? groupId, DateTime? lastDeadline}) {
    return AddExamToGroupResource(
        examId: examId ?? this.examId,
        examIds: examIds ?? this.examIds,
        groupId: groupId ?? this.groupId,
        lastDeadline: lastDeadline ?? this.lastDeadline);
  }
}

@JsonSerializable(explicitToJson: true)
class Answer {
  Answer({
    this.id,
    this.correctId,
    this.content,
    this.isCorrect,
    this.questionAnswer,
    this.items,
  });

  factory Answer.fromJson(Map<String, dynamic> json) => _$AnswerFromJson(json);

  @JsonKey(name: 'id', includeIfNull: true, defaultValue: '')
  final String? id;
  @JsonKey(name: 'correctId', includeIfNull: true, defaultValue: '')
  final String? correctId;
  @JsonKey(name: 'content', includeIfNull: true, defaultValue: '')
  final String? content;
  @JsonKey(name: 'isCorrect', includeIfNull: true)
  final bool? isCorrect;
  @JsonKey(name: 'questionAnswer', includeIfNull: true, defaultValue: '')
  final String? questionAnswer;
  @JsonKey(name: 'items', includeIfNull: true, defaultValue: <AnswerItems>[])
  final List<AnswerItems>? items;
  static const fromJsonFactory = _$AnswerFromJson;
  static const toJsonFactory = _$AnswerToJson;
  Map<String, dynamic> toJson() => _$AnswerToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is Answer &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.correctId, correctId) ||
                const DeepCollectionEquality()
                    .equals(other.correctId, correctId)) &&
            (identical(other.content, content) ||
                const DeepCollectionEquality()
                    .equals(other.content, content)) &&
            (identical(other.isCorrect, isCorrect) ||
                const DeepCollectionEquality()
                    .equals(other.isCorrect, isCorrect)) &&
            (identical(other.questionAnswer, questionAnswer) ||
                const DeepCollectionEquality()
                    .equals(other.questionAnswer, questionAnswer)) &&
            (identical(other.items, items) ||
                const DeepCollectionEquality().equals(other.items, items)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(correctId) ^
      const DeepCollectionEquality().hash(content) ^
      const DeepCollectionEquality().hash(isCorrect) ^
      const DeepCollectionEquality().hash(questionAnswer) ^
      const DeepCollectionEquality().hash(items) ^
      runtimeType.hashCode;
}

extension $AnswerExtension on Answer {
  Answer copyWith(
      {String? id,
      String? correctId,
      String? content,
      bool? isCorrect,
      String? questionAnswer,
      List<AnswerItems>? items}) {
    return Answer(
        id: id ?? this.id,
        correctId: correctId ?? this.correctId,
        content: content ?? this.content,
        isCorrect: isCorrect ?? this.isCorrect,
        questionAnswer: questionAnswer ?? this.questionAnswer,
        items: items ?? this.items);
  }
}

@JsonSerializable(explicitToJson: true)
class AnswerInExam {
  AnswerInExam({
    this.id,
    this.content,
    this.imageUrl,
    this.audioUrl,
    this.videoUrl,
  });

  factory AnswerInExam.fromJson(Map<String, dynamic> json) =>
      _$AnswerInExamFromJson(json);

  @JsonKey(name: 'id', includeIfNull: true)
  final int? id;
  @JsonKey(name: 'content', includeIfNull: true, defaultValue: '')
  final String? content;
  @JsonKey(name: 'imageUrl', includeIfNull: true, defaultValue: '')
  final String? imageUrl;
  @JsonKey(name: 'audioUrl', includeIfNull: true, defaultValue: '')
  final String? audioUrl;
  @JsonKey(name: 'videoUrl', includeIfNull: true, defaultValue: '')
  final String? videoUrl;
  static const fromJsonFactory = _$AnswerInExamFromJson;
  static const toJsonFactory = _$AnswerInExamToJson;
  Map<String, dynamic> toJson() => _$AnswerInExamToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is AnswerInExam &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.content, content) ||
                const DeepCollectionEquality()
                    .equals(other.content, content)) &&
            (identical(other.imageUrl, imageUrl) ||
                const DeepCollectionEquality()
                    .equals(other.imageUrl, imageUrl)) &&
            (identical(other.audioUrl, audioUrl) ||
                const DeepCollectionEquality()
                    .equals(other.audioUrl, audioUrl)) &&
            (identical(other.videoUrl, videoUrl) ||
                const DeepCollectionEquality()
                    .equals(other.videoUrl, videoUrl)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(content) ^
      const DeepCollectionEquality().hash(imageUrl) ^
      const DeepCollectionEquality().hash(audioUrl) ^
      const DeepCollectionEquality().hash(videoUrl) ^
      runtimeType.hashCode;
}

extension $AnswerInExamExtension on AnswerInExam {
  AnswerInExam copyWith(
      {int? id,
      String? content,
      String? imageUrl,
      String? audioUrl,
      String? videoUrl}) {
    return AnswerInExam(
        id: id ?? this.id,
        content: content ?? this.content,
        imageUrl: imageUrl ?? this.imageUrl,
        audioUrl: audioUrl ?? this.audioUrl,
        videoUrl: videoUrl ?? this.videoUrl);
  }
}

@JsonSerializable(explicitToJson: true)
class AnswerItems {
  AnswerItems({
    this.id,
    this.content,
  });

  factory AnswerItems.fromJson(Map<String, dynamic> json) =>
      _$AnswerItemsFromJson(json);

  @JsonKey(name: 'id', includeIfNull: true, defaultValue: '')
  final String? id;
  @JsonKey(name: 'content', includeIfNull: true, defaultValue: '')
  final String? content;
  static const fromJsonFactory = _$AnswerItemsFromJson;
  static const toJsonFactory = _$AnswerItemsToJson;
  Map<String, dynamic> toJson() => _$AnswerItemsToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is AnswerItems &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.content, content) ||
                const DeepCollectionEquality().equals(other.content, content)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(content) ^
      runtimeType.hashCode;
}

extension $AnswerItemsExtension on AnswerItems {
  AnswerItems copyWith({String? id, String? content}) {
    return AnswerItems(id: id ?? this.id, content: content ?? this.content);
  }
}

@JsonSerializable(explicitToJson: true)
class AnswerUser {
  AnswerUser({
    this.id,
    this.data,
    this.isCorrect,
  });

  factory AnswerUser.fromJson(Map<String, dynamic> json) =>
      _$AnswerUserFromJson(json);

  @JsonKey(name: 'id', includeIfNull: true, defaultValue: '')
  final String? id;
  @JsonKey(name: 'data', includeIfNull: true)
  final AnswerItems? data;
  @JsonKey(name: 'isCorrect', includeIfNull: true)
  final bool? isCorrect;
  static const fromJsonFactory = _$AnswerUserFromJson;
  static const toJsonFactory = _$AnswerUserToJson;
  Map<String, dynamic> toJson() => _$AnswerUserToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is AnswerUser &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.data, data) ||
                const DeepCollectionEquality().equals(other.data, data)) &&
            (identical(other.isCorrect, isCorrect) ||
                const DeepCollectionEquality()
                    .equals(other.isCorrect, isCorrect)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(data) ^
      const DeepCollectionEquality().hash(isCorrect) ^
      runtimeType.hashCode;
}

extension $AnswerUserExtension on AnswerUser {
  AnswerUser copyWith({String? id, AnswerItems? data, bool? isCorrect}) {
    return AnswerUser(
        id: id ?? this.id,
        data: data ?? this.data,
        isCorrect: isCorrect ?? this.isCorrect);
  }
}

@JsonSerializable(explicitToJson: true)
class Assembly {
  Assembly({
    this.definedTypes,
    this.exportedTypes,
    this.codeBase,
    this.entryPoint,
    this.fullName,
    this.imageRuntimeVersion,
    this.isDynamic,
    this.location,
    this.reflectionOnly,
    this.isCollectible,
    this.isFullyTrusted,
    this.customAttributes,
    this.escapedCodeBase,
    this.manifestModule,
    this.modules,
    this.globalAssemblyCache,
    this.hostContext,
    this.securityRuleSet,
  });

  factory Assembly.fromJson(Map<String, dynamic> json) =>
      _$AssemblyFromJson(json);

  @JsonKey(
      name: 'definedTypes', includeIfNull: true, defaultValue: <TypeInfo>[])
  final List<TypeInfo>? definedTypes;
  @JsonKey(name: 'exportedTypes', includeIfNull: true, defaultValue: <Type>[])
  final List<Type>? exportedTypes;
  @JsonKey(name: 'codeBase', includeIfNull: true, defaultValue: '')
  final String? codeBase;
  @JsonKey(name: 'entryPoint', includeIfNull: true)
  final MethodInfo? entryPoint;
  @JsonKey(name: 'fullName', includeIfNull: true, defaultValue: '')
  final String? fullName;
  @JsonKey(name: 'imageRuntimeVersion', includeIfNull: true, defaultValue: '')
  final String? imageRuntimeVersion;
  @JsonKey(name: 'isDynamic', includeIfNull: true)
  final bool? isDynamic;
  @JsonKey(name: 'location', includeIfNull: true, defaultValue: '')
  final String? location;
  @JsonKey(name: 'reflectionOnly', includeIfNull: true)
  final bool? reflectionOnly;
  @JsonKey(name: 'isCollectible', includeIfNull: true)
  final bool? isCollectible;
  @JsonKey(name: 'isFullyTrusted', includeIfNull: true)
  final bool? isFullyTrusted;
  @JsonKey(
      name: 'customAttributes',
      includeIfNull: true,
      defaultValue: <CustomAttributeData>[])
  final List<CustomAttributeData>? customAttributes;
  @JsonKey(name: 'escapedCodeBase', includeIfNull: true, defaultValue: '')
  final String? escapedCodeBase;
  @JsonKey(name: 'manifestModule', includeIfNull: true)
  final Module? manifestModule;
  @JsonKey(name: 'modules', includeIfNull: true, defaultValue: <Module>[])
  final List<Module>? modules;
  @JsonKey(name: 'globalAssemblyCache', includeIfNull: true)
  final bool? globalAssemblyCache;
  @JsonKey(name: 'hostContext', includeIfNull: true)
  final int? hostContext;
  @JsonKey(
      name: 'securityRuleSet',
      includeIfNull: true,
      toJson: securityRuleSetToJson,
      fromJson: securityRuleSetFromJson)
  final enums.SecurityRuleSet? securityRuleSet;
  static const fromJsonFactory = _$AssemblyFromJson;
  static const toJsonFactory = _$AssemblyToJson;
  Map<String, dynamic> toJson() => _$AssemblyToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is Assembly &&
            (identical(other.definedTypes, definedTypes) ||
                const DeepCollectionEquality()
                    .equals(other.definedTypes, definedTypes)) &&
            (identical(other.exportedTypes, exportedTypes) ||
                const DeepCollectionEquality()
                    .equals(other.exportedTypes, exportedTypes)) &&
            (identical(other.codeBase, codeBase) ||
                const DeepCollectionEquality()
                    .equals(other.codeBase, codeBase)) &&
            (identical(other.entryPoint, entryPoint) ||
                const DeepCollectionEquality()
                    .equals(other.entryPoint, entryPoint)) &&
            (identical(other.fullName, fullName) ||
                const DeepCollectionEquality()
                    .equals(other.fullName, fullName)) &&
            (identical(other.imageRuntimeVersion, imageRuntimeVersion) ||
                const DeepCollectionEquality()
                    .equals(other.imageRuntimeVersion, imageRuntimeVersion)) &&
            (identical(other.isDynamic, isDynamic) ||
                const DeepCollectionEquality()
                    .equals(other.isDynamic, isDynamic)) &&
            (identical(other.location, location) ||
                const DeepCollectionEquality()
                    .equals(other.location, location)) &&
            (identical(other.reflectionOnly, reflectionOnly) ||
                const DeepCollectionEquality()
                    .equals(other.reflectionOnly, reflectionOnly)) &&
            (identical(other.isCollectible, isCollectible) ||
                const DeepCollectionEquality()
                    .equals(other.isCollectible, isCollectible)) &&
            (identical(other.isFullyTrusted, isFullyTrusted) ||
                const DeepCollectionEquality()
                    .equals(other.isFullyTrusted, isFullyTrusted)) &&
            (identical(other.customAttributes, customAttributes) ||
                const DeepCollectionEquality()
                    .equals(other.customAttributes, customAttributes)) &&
            (identical(other.escapedCodeBase, escapedCodeBase) ||
                const DeepCollectionEquality()
                    .equals(other.escapedCodeBase, escapedCodeBase)) &&
            (identical(other.manifestModule, manifestModule) ||
                const DeepCollectionEquality()
                    .equals(other.manifestModule, manifestModule)) &&
            (identical(other.modules, modules) ||
                const DeepCollectionEquality()
                    .equals(other.modules, modules)) &&
            (identical(other.globalAssemblyCache, globalAssemblyCache) ||
                const DeepCollectionEquality()
                    .equals(other.globalAssemblyCache, globalAssemblyCache)) &&
            (identical(other.hostContext, hostContext) ||
                const DeepCollectionEquality()
                    .equals(other.hostContext, hostContext)) &&
            (identical(other.securityRuleSet, securityRuleSet) ||
                const DeepCollectionEquality()
                    .equals(other.securityRuleSet, securityRuleSet)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(definedTypes) ^
      const DeepCollectionEquality().hash(exportedTypes) ^
      const DeepCollectionEquality().hash(codeBase) ^
      const DeepCollectionEquality().hash(entryPoint) ^
      const DeepCollectionEquality().hash(fullName) ^
      const DeepCollectionEquality().hash(imageRuntimeVersion) ^
      const DeepCollectionEquality().hash(isDynamic) ^
      const DeepCollectionEquality().hash(location) ^
      const DeepCollectionEquality().hash(reflectionOnly) ^
      const DeepCollectionEquality().hash(isCollectible) ^
      const DeepCollectionEquality().hash(isFullyTrusted) ^
      const DeepCollectionEquality().hash(customAttributes) ^
      const DeepCollectionEquality().hash(escapedCodeBase) ^
      const DeepCollectionEquality().hash(manifestModule) ^
      const DeepCollectionEquality().hash(modules) ^
      const DeepCollectionEquality().hash(globalAssemblyCache) ^
      const DeepCollectionEquality().hash(hostContext) ^
      const DeepCollectionEquality().hash(securityRuleSet) ^
      runtimeType.hashCode;
}

extension $AssemblyExtension on Assembly {
  Assembly copyWith(
      {List<TypeInfo>? definedTypes,
      List<Type>? exportedTypes,
      String? codeBase,
      MethodInfo? entryPoint,
      String? fullName,
      String? imageRuntimeVersion,
      bool? isDynamic,
      String? location,
      bool? reflectionOnly,
      bool? isCollectible,
      bool? isFullyTrusted,
      List<CustomAttributeData>? customAttributes,
      String? escapedCodeBase,
      Module? manifestModule,
      List<Module>? modules,
      bool? globalAssemblyCache,
      int? hostContext,
      enums.SecurityRuleSet? securityRuleSet}) {
    return Assembly(
        definedTypes: definedTypes ?? this.definedTypes,
        exportedTypes: exportedTypes ?? this.exportedTypes,
        codeBase: codeBase ?? this.codeBase,
        entryPoint: entryPoint ?? this.entryPoint,
        fullName: fullName ?? this.fullName,
        imageRuntimeVersion: imageRuntimeVersion ?? this.imageRuntimeVersion,
        isDynamic: isDynamic ?? this.isDynamic,
        location: location ?? this.location,
        reflectionOnly: reflectionOnly ?? this.reflectionOnly,
        isCollectible: isCollectible ?? this.isCollectible,
        isFullyTrusted: isFullyTrusted ?? this.isFullyTrusted,
        customAttributes: customAttributes ?? this.customAttributes,
        escapedCodeBase: escapedCodeBase ?? this.escapedCodeBase,
        manifestModule: manifestModule ?? this.manifestModule,
        modules: modules ?? this.modules,
        globalAssemblyCache: globalAssemblyCache ?? this.globalAssemblyCache,
        hostContext: hostContext ?? this.hostContext,
        securityRuleSet: securityRuleSet ?? this.securityRuleSet);
  }
}

@JsonSerializable(explicitToJson: true)
class AssigneUsersResource {
  AssigneUsersResource({
    this.groupId,
    this.examId,
    this.groupExamId,
    this.userId,
    this.startDate,
    this.endDate,
    this.allowDeadline,
    this.allowSeeAnswerAfterComplete,
  });

  factory AssigneUsersResource.fromJson(Map<String, dynamic> json) =>
      _$AssigneUsersResourceFromJson(json);

  @JsonKey(name: 'groupId', includeIfNull: true)
  final int? groupId;
  @JsonKey(name: 'examId', includeIfNull: true)
  final int? examId;
  @JsonKey(name: 'groupExamId', includeIfNull: true)
  final int? groupExamId;
  @JsonKey(name: 'userId', includeIfNull: true, defaultValue: <int>[])
  final List<int>? userId;
  @JsonKey(name: 'startDate', includeIfNull: true)
  final DateTime? startDate;
  @JsonKey(name: 'endDate', includeIfNull: true)
  final DateTime? endDate;
  @JsonKey(name: 'allowDeadline', includeIfNull: true)
  final bool? allowDeadline;
  @JsonKey(name: 'allowSeeAnswerAfterComplete', includeIfNull: true)
  final bool? allowSeeAnswerAfterComplete;
  static const fromJsonFactory = _$AssigneUsersResourceFromJson;
  static const toJsonFactory = _$AssigneUsersResourceToJson;
  Map<String, dynamic> toJson() => _$AssigneUsersResourceToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is AssigneUsersResource &&
            (identical(other.groupId, groupId) ||
                const DeepCollectionEquality()
                    .equals(other.groupId, groupId)) &&
            (identical(other.examId, examId) ||
                const DeepCollectionEquality().equals(other.examId, examId)) &&
            (identical(other.groupExamId, groupExamId) ||
                const DeepCollectionEquality()
                    .equals(other.groupExamId, groupExamId)) &&
            (identical(other.userId, userId) ||
                const DeepCollectionEquality().equals(other.userId, userId)) &&
            (identical(other.startDate, startDate) ||
                const DeepCollectionEquality()
                    .equals(other.startDate, startDate)) &&
            (identical(other.endDate, endDate) ||
                const DeepCollectionEquality()
                    .equals(other.endDate, endDate)) &&
            (identical(other.allowDeadline, allowDeadline) ||
                const DeepCollectionEquality()
                    .equals(other.allowDeadline, allowDeadline)) &&
            (identical(other.allowSeeAnswerAfterComplete,
                    allowSeeAnswerAfterComplete) ||
                const DeepCollectionEquality().equals(
                    other.allowSeeAnswerAfterComplete,
                    allowSeeAnswerAfterComplete)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(groupId) ^
      const DeepCollectionEquality().hash(examId) ^
      const DeepCollectionEquality().hash(groupExamId) ^
      const DeepCollectionEquality().hash(userId) ^
      const DeepCollectionEquality().hash(startDate) ^
      const DeepCollectionEquality().hash(endDate) ^
      const DeepCollectionEquality().hash(allowDeadline) ^
      const DeepCollectionEquality().hash(allowSeeAnswerAfterComplete) ^
      runtimeType.hashCode;
}

extension $AssigneUsersResourceExtension on AssigneUsersResource {
  AssigneUsersResource copyWith(
      {int? groupId,
      int? examId,
      int? groupExamId,
      List<int>? userId,
      DateTime? startDate,
      DateTime? endDate,
      bool? allowDeadline,
      bool? allowSeeAnswerAfterComplete}) {
    return AssigneUsersResource(
        groupId: groupId ?? this.groupId,
        examId: examId ?? this.examId,
        groupExamId: groupExamId ?? this.groupExamId,
        userId: userId ?? this.userId,
        startDate: startDate ?? this.startDate,
        endDate: endDate ?? this.endDate,
        allowDeadline: allowDeadline ?? this.allowDeadline,
        allowSeeAnswerAfterComplete:
            allowSeeAnswerAfterComplete ?? this.allowSeeAnswerAfterComplete);
  }
}

@JsonSerializable(explicitToJson: true)
class CategoryEntity {
  CategoryEntity({
    this.id,
    this.title,
    this.icon,
  });

  factory CategoryEntity.fromJson(Map<String, dynamic> json) =>
      _$CategoryEntityFromJson(json);

  @JsonKey(name: 'id', includeIfNull: true)
  final int? id;
  @JsonKey(name: 'title', includeIfNull: true, defaultValue: '')
  final String? title;
  @JsonKey(name: 'icon', includeIfNull: true, defaultValue: '')
  final String? icon;
  static const fromJsonFactory = _$CategoryEntityFromJson;
  static const toJsonFactory = _$CategoryEntityToJson;
  Map<String, dynamic> toJson() => _$CategoryEntityToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is CategoryEntity &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.title, title) ||
                const DeepCollectionEquality().equals(other.title, title)) &&
            (identical(other.icon, icon) ||
                const DeepCollectionEquality().equals(other.icon, icon)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(title) ^
      const DeepCollectionEquality().hash(icon) ^
      runtimeType.hashCode;
}

extension $CategoryEntityExtension on CategoryEntity {
  CategoryEntity copyWith({int? id, String? title, String? icon}) {
    return CategoryEntity(
        id: id ?? this.id, title: title ?? this.title, icon: icon ?? this.icon);
  }
}

@JsonSerializable(explicitToJson: true)
class CategoryStaticResource {
  CategoryStaticResource({
    this.title,
    this.questionCount,
    this.id,
  });

  factory CategoryStaticResource.fromJson(Map<String, dynamic> json) =>
      _$CategoryStaticResourceFromJson(json);

  @JsonKey(name: 'title', includeIfNull: true, defaultValue: '')
  final String? title;
  @JsonKey(name: 'questionCount', includeIfNull: true)
  final int? questionCount;
  @JsonKey(name: 'id', includeIfNull: true)
  final int? id;
  static const fromJsonFactory = _$CategoryStaticResourceFromJson;
  static const toJsonFactory = _$CategoryStaticResourceToJson;
  Map<String, dynamic> toJson() => _$CategoryStaticResourceToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is CategoryStaticResource &&
            (identical(other.title, title) ||
                const DeepCollectionEquality().equals(other.title, title)) &&
            (identical(other.questionCount, questionCount) ||
                const DeepCollectionEquality()
                    .equals(other.questionCount, questionCount)) &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(title) ^
      const DeepCollectionEquality().hash(questionCount) ^
      const DeepCollectionEquality().hash(id) ^
      runtimeType.hashCode;
}

extension $CategoryStaticResourceExtension on CategoryStaticResource {
  CategoryStaticResource copyWith(
      {String? title, int? questionCount, int? id}) {
    return CategoryStaticResource(
        title: title ?? this.title,
        questionCount: questionCount ?? this.questionCount,
        id: id ?? this.id);
  }
}

@JsonSerializable(explicitToJson: true)
class CommonSearchRequest {
  CommonSearchRequest({
    this.skip,
    this.pageSize,
    this.query,
    this.id,
  });

  factory CommonSearchRequest.fromJson(Map<String, dynamic> json) =>
      _$CommonSearchRequestFromJson(json);

  @JsonKey(name: 'skip', includeIfNull: true)
  final int? skip;
  @JsonKey(name: 'pageSize', includeIfNull: true)
  final int? pageSize;
  @JsonKey(name: 'query', includeIfNull: true, defaultValue: '')
  final String? query;
  @JsonKey(name: 'id', includeIfNull: true)
  final int? id;
  static const fromJsonFactory = _$CommonSearchRequestFromJson;
  static const toJsonFactory = _$CommonSearchRequestToJson;
  Map<String, dynamic> toJson() => _$CommonSearchRequestToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is CommonSearchRequest &&
            (identical(other.skip, skip) ||
                const DeepCollectionEquality().equals(other.skip, skip)) &&
            (identical(other.pageSize, pageSize) ||
                const DeepCollectionEquality()
                    .equals(other.pageSize, pageSize)) &&
            (identical(other.query, query) ||
                const DeepCollectionEquality().equals(other.query, query)) &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(skip) ^
      const DeepCollectionEquality().hash(pageSize) ^
      const DeepCollectionEquality().hash(query) ^
      const DeepCollectionEquality().hash(id) ^
      runtimeType.hashCode;
}

extension $CommonSearchRequestExtension on CommonSearchRequest {
  CommonSearchRequest copyWith(
      {int? skip, int? pageSize, String? query, int? id}) {
    return CommonSearchRequest(
        skip: skip ?? this.skip,
        pageSize: pageSize ?? this.pageSize,
        query: query ?? this.query,
        id: id ?? this.id);
  }
}

@JsonSerializable(explicitToJson: true)
class CompetitionAllReadyResource {
  CompetitionAllReadyResource({
    this.title,
    this.time,
    this.competitionId,
  });

  factory CompetitionAllReadyResource.fromJson(Map<String, dynamic> json) =>
      _$CompetitionAllReadyResourceFromJson(json);

  @JsonKey(name: 'title', includeIfNull: true, defaultValue: '')
  final String? title;
  @JsonKey(name: 'time', includeIfNull: true)
  final DateTime? time;
  @JsonKey(name: 'competitionId', includeIfNull: true)
  final int? competitionId;
  static const fromJsonFactory = _$CompetitionAllReadyResourceFromJson;
  static const toJsonFactory = _$CompetitionAllReadyResourceToJson;
  Map<String, dynamic> toJson() => _$CompetitionAllReadyResourceToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is CompetitionAllReadyResource &&
            (identical(other.title, title) ||
                const DeepCollectionEquality().equals(other.title, title)) &&
            (identical(other.time, time) ||
                const DeepCollectionEquality().equals(other.time, time)) &&
            (identical(other.competitionId, competitionId) ||
                const DeepCollectionEquality()
                    .equals(other.competitionId, competitionId)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(title) ^
      const DeepCollectionEquality().hash(time) ^
      const DeepCollectionEquality().hash(competitionId) ^
      runtimeType.hashCode;
}

extension $CompetitionAllReadyResourceExtension on CompetitionAllReadyResource {
  CompetitionAllReadyResource copyWith(
      {String? title, DateTime? time, int? competitionId}) {
    return CompetitionAllReadyResource(
        title: title ?? this.title,
        time: time ?? this.time,
        competitionId: competitionId ?? this.competitionId);
  }
}

@JsonSerializable(explicitToJson: true)
class CompetitionCreateResource {
  CompetitionCreateResource({
    this.title,
    this.examId,
    this.examCategoryId,
    this.examCategoryIds,
    this.type,
    this.status,
    this.ownerType,
    this.startDate,
    this.endDate,
    this.maxUser,
    this.isPrivate,
    this.formatType,
    this.duration,
    this.propertyDetailIds,
    this.rounds,
    this.isMobile,
    this.userId,
    this.playNow,
    this.numberOfQuestions,
  });

  factory CompetitionCreateResource.fromJson(Map<String, dynamic> json) =>
      _$CompetitionCreateResourceFromJson(json);

  @JsonKey(name: 'title', includeIfNull: true, defaultValue: '')
  final String? title;
  @JsonKey(name: 'examId', includeIfNull: true)
  final int? examId;
  @JsonKey(name: 'examCategoryId', includeIfNull: true)
  final int? examCategoryId;
  @JsonKey(
      name: 'examCategoryIds', includeIfNull: true, defaultValue: <String>[])
  final List<String>? examCategoryIds;
  @JsonKey(name: 'type', includeIfNull: true)
  final int? type;
  @JsonKey(name: 'status', includeIfNull: true)
  final int? status;
  @JsonKey(name: 'ownerType', includeIfNull: true)
  final int? ownerType;
  @JsonKey(name: 'startDate', includeIfNull: true)
  final DateTime? startDate;
  @JsonKey(name: 'endDate', includeIfNull: true)
  final DateTime? endDate;
  @JsonKey(name: 'maxUser', includeIfNull: true)
  final int? maxUser;
  @JsonKey(name: 'isPrivate', includeIfNull: true)
  final bool? isPrivate;
  @JsonKey(name: 'formatType', includeIfNull: true)
  final int? formatType;
  @JsonKey(name: 'duration', includeIfNull: true)
  final int? duration;
  @JsonKey(
      name: 'propertyDetailIds', includeIfNull: true, defaultValue: <int>[])
  final List<int>? propertyDetailIds;
  @JsonKey(
      name: 'rounds',
      includeIfNull: true,
      defaultValue: <CompetitionRoundResource>[])
  final List<CompetitionRoundResource>? rounds;
  @JsonKey(name: 'isMobile', includeIfNull: true)
  final bool? isMobile;
  @JsonKey(name: 'userId', includeIfNull: true)
  final int? userId;
  @JsonKey(name: 'playNow', includeIfNull: true)
  final bool? playNow;
  @JsonKey(name: 'numberOfQuestions', includeIfNull: true)
  final int? numberOfQuestions;
  static const fromJsonFactory = _$CompetitionCreateResourceFromJson;
  static const toJsonFactory = _$CompetitionCreateResourceToJson;
  Map<String, dynamic> toJson() => _$CompetitionCreateResourceToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is CompetitionCreateResource &&
            (identical(other.title, title) ||
                const DeepCollectionEquality().equals(other.title, title)) &&
            (identical(other.examId, examId) ||
                const DeepCollectionEquality().equals(other.examId, examId)) &&
            (identical(other.examCategoryId, examCategoryId) ||
                const DeepCollectionEquality()
                    .equals(other.examCategoryId, examCategoryId)) &&
            (identical(other.examCategoryIds, examCategoryIds) ||
                const DeepCollectionEquality()
                    .equals(other.examCategoryIds, examCategoryIds)) &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)) &&
            (identical(other.status, status) ||
                const DeepCollectionEquality().equals(other.status, status)) &&
            (identical(other.ownerType, ownerType) ||
                const DeepCollectionEquality()
                    .equals(other.ownerType, ownerType)) &&
            (identical(other.startDate, startDate) ||
                const DeepCollectionEquality()
                    .equals(other.startDate, startDate)) &&
            (identical(other.endDate, endDate) ||
                const DeepCollectionEquality()
                    .equals(other.endDate, endDate)) &&
            (identical(other.maxUser, maxUser) ||
                const DeepCollectionEquality()
                    .equals(other.maxUser, maxUser)) &&
            (identical(other.isPrivate, isPrivate) ||
                const DeepCollectionEquality()
                    .equals(other.isPrivate, isPrivate)) &&
            (identical(other.formatType, formatType) ||
                const DeepCollectionEquality()
                    .equals(other.formatType, formatType)) &&
            (identical(other.duration, duration) ||
                const DeepCollectionEquality()
                    .equals(other.duration, duration)) &&
            (identical(other.propertyDetailIds, propertyDetailIds) ||
                const DeepCollectionEquality()
                    .equals(other.propertyDetailIds, propertyDetailIds)) &&
            (identical(other.rounds, rounds) ||
                const DeepCollectionEquality().equals(other.rounds, rounds)) &&
            (identical(other.isMobile, isMobile) ||
                const DeepCollectionEquality()
                    .equals(other.isMobile, isMobile)) &&
            (identical(other.userId, userId) ||
                const DeepCollectionEquality().equals(other.userId, userId)) &&
            (identical(other.playNow, playNow) ||
                const DeepCollectionEquality()
                    .equals(other.playNow, playNow)) &&
            (identical(other.numberOfQuestions, numberOfQuestions) ||
                const DeepCollectionEquality()
                    .equals(other.numberOfQuestions, numberOfQuestions)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(title) ^
      const DeepCollectionEquality().hash(examId) ^
      const DeepCollectionEquality().hash(examCategoryId) ^
      const DeepCollectionEquality().hash(examCategoryIds) ^
      const DeepCollectionEquality().hash(type) ^
      const DeepCollectionEquality().hash(status) ^
      const DeepCollectionEquality().hash(ownerType) ^
      const DeepCollectionEquality().hash(startDate) ^
      const DeepCollectionEquality().hash(endDate) ^
      const DeepCollectionEquality().hash(maxUser) ^
      const DeepCollectionEquality().hash(isPrivate) ^
      const DeepCollectionEquality().hash(formatType) ^
      const DeepCollectionEquality().hash(duration) ^
      const DeepCollectionEquality().hash(propertyDetailIds) ^
      const DeepCollectionEquality().hash(rounds) ^
      const DeepCollectionEquality().hash(isMobile) ^
      const DeepCollectionEquality().hash(userId) ^
      const DeepCollectionEquality().hash(playNow) ^
      const DeepCollectionEquality().hash(numberOfQuestions) ^
      runtimeType.hashCode;
}

extension $CompetitionCreateResourceExtension on CompetitionCreateResource {
  CompetitionCreateResource copyWith(
      {String? title,
      int? examId,
      int? examCategoryId,
      List<String>? examCategoryIds,
      int? type,
      int? status,
      int? ownerType,
      DateTime? startDate,
      DateTime? endDate,
      int? maxUser,
      bool? isPrivate,
      int? formatType,
      int? duration,
      List<int>? propertyDetailIds,
      List<CompetitionRoundResource>? rounds,
      bool? isMobile,
      int? userId,
      bool? playNow,
      int? numberOfQuestions}) {
    return CompetitionCreateResource(
        title: title ?? this.title,
        examId: examId ?? this.examId,
        examCategoryId: examCategoryId ?? this.examCategoryId,
        examCategoryIds: examCategoryIds ?? this.examCategoryIds,
        type: type ?? this.type,
        status: status ?? this.status,
        ownerType: ownerType ?? this.ownerType,
        startDate: startDate ?? this.startDate,
        endDate: endDate ?? this.endDate,
        maxUser: maxUser ?? this.maxUser,
        isPrivate: isPrivate ?? this.isPrivate,
        formatType: formatType ?? this.formatType,
        duration: duration ?? this.duration,
        propertyDetailIds: propertyDetailIds ?? this.propertyDetailIds,
        rounds: rounds ?? this.rounds,
        isMobile: isMobile ?? this.isMobile,
        userId: userId ?? this.userId,
        playNow: playNow ?? this.playNow,
        numberOfQuestions: numberOfQuestions ?? this.numberOfQuestions);
  }
}

@JsonSerializable(explicitToJson: true)
class CompetitionDataResource {
  CompetitionDataResource({
    this.totalCompetitionToday,
    this.totalCompetitionWait,
    this.totalCompetitionHistory,
    this.totalCompetitionInvited,
  });

  factory CompetitionDataResource.fromJson(Map<String, dynamic> json) =>
      _$CompetitionDataResourceFromJson(json);

  @JsonKey(name: 'totalCompetitionToday', includeIfNull: true)
  final int? totalCompetitionToday;
  @JsonKey(name: 'totalCompetitionWait', includeIfNull: true)
  final int? totalCompetitionWait;
  @JsonKey(name: 'totalCompetitionHistory', includeIfNull: true)
  final int? totalCompetitionHistory;
  @JsonKey(name: 'totalCompetitionInvited', includeIfNull: true)
  final int? totalCompetitionInvited;
  static const fromJsonFactory = _$CompetitionDataResourceFromJson;
  static const toJsonFactory = _$CompetitionDataResourceToJson;
  Map<String, dynamic> toJson() => _$CompetitionDataResourceToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is CompetitionDataResource &&
            (identical(other.totalCompetitionToday, totalCompetitionToday) ||
                const DeepCollectionEquality().equals(
                    other.totalCompetitionToday, totalCompetitionToday)) &&
            (identical(other.totalCompetitionWait, totalCompetitionWait) ||
                const DeepCollectionEquality().equals(
                    other.totalCompetitionWait, totalCompetitionWait)) &&
            (identical(
                    other.totalCompetitionHistory, totalCompetitionHistory) ||
                const DeepCollectionEquality().equals(
                    other.totalCompetitionHistory, totalCompetitionHistory)) &&
            (identical(
                    other.totalCompetitionInvited, totalCompetitionInvited) ||
                const DeepCollectionEquality().equals(
                    other.totalCompetitionInvited, totalCompetitionInvited)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(totalCompetitionToday) ^
      const DeepCollectionEquality().hash(totalCompetitionWait) ^
      const DeepCollectionEquality().hash(totalCompetitionHistory) ^
      const DeepCollectionEquality().hash(totalCompetitionInvited) ^
      runtimeType.hashCode;
}

extension $CompetitionDataResourceExtension on CompetitionDataResource {
  CompetitionDataResource copyWith(
      {int? totalCompetitionToday,
      int? totalCompetitionWait,
      int? totalCompetitionHistory,
      int? totalCompetitionInvited}) {
    return CompetitionDataResource(
        totalCompetitionToday:
            totalCompetitionToday ?? this.totalCompetitionToday,
        totalCompetitionWait: totalCompetitionWait ?? this.totalCompetitionWait,
        totalCompetitionHistory:
            totalCompetitionHistory ?? this.totalCompetitionHistory,
        totalCompetitionInvited:
            totalCompetitionInvited ?? this.totalCompetitionInvited);
  }
}

@JsonSerializable(explicitToJson: true)
class CompetitionInvitedResource {
  CompetitionInvitedResource({
    this.competitionId,
    this.invitedId,
  });

  factory CompetitionInvitedResource.fromJson(Map<String, dynamic> json) =>
      _$CompetitionInvitedResourceFromJson(json);

  @JsonKey(name: 'competitionId', includeIfNull: true)
  final int? competitionId;
  @JsonKey(name: 'invitedId', includeIfNull: true)
  final int? invitedId;
  static const fromJsonFactory = _$CompetitionInvitedResourceFromJson;
  static const toJsonFactory = _$CompetitionInvitedResourceToJson;
  Map<String, dynamic> toJson() => _$CompetitionInvitedResourceToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is CompetitionInvitedResource &&
            (identical(other.competitionId, competitionId) ||
                const DeepCollectionEquality()
                    .equals(other.competitionId, competitionId)) &&
            (identical(other.invitedId, invitedId) ||
                const DeepCollectionEquality()
                    .equals(other.invitedId, invitedId)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(competitionId) ^
      const DeepCollectionEquality().hash(invitedId) ^
      runtimeType.hashCode;
}

extension $CompetitionInvitedResourceExtension on CompetitionInvitedResource {
  CompetitionInvitedResource copyWith({int? competitionId, int? invitedId}) {
    return CompetitionInvitedResource(
        competitionId: competitionId ?? this.competitionId,
        invitedId: invitedId ?? this.invitedId);
  }
}

@JsonSerializable(explicitToJson: true)
class CompetitionListPublicResource {
  CompetitionListPublicResource({
    this.id,
    this.status,
    this.competitionUserCount,
    this.listUserInCompetitionIds,
    this.ownerType,
    this.startDate,
    this.endDate,
    this.maxUser,
    this.isPrivate,
    this.typeName,
    this.statusName,
    this.listUserInCompetition,
    this.title,
    this.propertyDetailName,
    this.categoryName,
    this.categoryId,
    this.examIds,
    this.formatType,
    this.roundCount,
    this.isJoined,
    this.duration,
    this.playNow,
  });

  factory CompetitionListPublicResource.fromJson(Map<String, dynamic> json) =>
      _$CompetitionListPublicResourceFromJson(json);

  @JsonKey(name: 'id', includeIfNull: true)
  final int? id;
  @JsonKey(name: 'status', includeIfNull: true)
  final int? status;
  @JsonKey(name: 'competitionUserCount', includeIfNull: true)
  final int? competitionUserCount;
  @JsonKey(
      name: 'listUserInCompetitionIds',
      includeIfNull: true,
      defaultValue: <int>[])
  final List<int>? listUserInCompetitionIds;
  @JsonKey(name: 'ownerType', includeIfNull: true)
  final int? ownerType;
  @JsonKey(name: 'startDate', includeIfNull: true)
  final DateTime? startDate;
  @JsonKey(name: 'endDate', includeIfNull: true)
  final DateTime? endDate;
  @JsonKey(name: 'maxUser', includeIfNull: true)
  final int? maxUser;
  @JsonKey(name: 'isPrivate', includeIfNull: true)
  final bool? isPrivate;
  @JsonKey(name: 'typeName', includeIfNull: true, defaultValue: '')
  final String? typeName;
  @JsonKey(name: 'statusName', includeIfNull: true, defaultValue: '')
  final String? statusName;
  @JsonKey(
      name: 'listUserInCompetition',
      includeIfNull: true,
      defaultValue: <SimpleUserEntity>[])
  final List<SimpleUserEntity>? listUserInCompetition;
  @JsonKey(name: 'title', includeIfNull: true, defaultValue: '')
  final String? title;
  @JsonKey(
      name: 'propertyDetailName', includeIfNull: true, defaultValue: <String>[])
  final List<String>? propertyDetailName;
  @JsonKey(name: 'categoryName', includeIfNull: true, defaultValue: '')
  final String? categoryName;
  @JsonKey(name: 'categoryId', includeIfNull: true, defaultValue: '')
  final String? categoryId;
  @JsonKey(name: 'examIds', includeIfNull: true, defaultValue: <int>[])
  final List<int>? examIds;
  @JsonKey(name: 'formatType', includeIfNull: true)
  final int? formatType;
  @JsonKey(name: 'roundCount', includeIfNull: true)
  final int? roundCount;
  @JsonKey(name: 'isJoined', includeIfNull: true)
  final bool? isJoined;
  @JsonKey(name: 'duration', includeIfNull: true)
  final int? duration;
  @JsonKey(name: 'playNow', includeIfNull: true)
  final bool? playNow;
  static const fromJsonFactory = _$CompetitionListPublicResourceFromJson;
  static const toJsonFactory = _$CompetitionListPublicResourceToJson;
  Map<String, dynamic> toJson() => _$CompetitionListPublicResourceToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is CompetitionListPublicResource &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.status, status) ||
                const DeepCollectionEquality().equals(other.status, status)) &&
            (identical(other.competitionUserCount, competitionUserCount) ||
                const DeepCollectionEquality().equals(
                    other.competitionUserCount, competitionUserCount)) &&
            (identical(other.listUserInCompetitionIds, listUserInCompetitionIds) ||
                const DeepCollectionEquality().equals(
                    other.listUserInCompetitionIds,
                    listUserInCompetitionIds)) &&
            (identical(other.ownerType, ownerType) ||
                const DeepCollectionEquality()
                    .equals(other.ownerType, ownerType)) &&
            (identical(other.startDate, startDate) ||
                const DeepCollectionEquality()
                    .equals(other.startDate, startDate)) &&
            (identical(other.endDate, endDate) ||
                const DeepCollectionEquality()
                    .equals(other.endDate, endDate)) &&
            (identical(other.maxUser, maxUser) ||
                const DeepCollectionEquality()
                    .equals(other.maxUser, maxUser)) &&
            (identical(other.isPrivate, isPrivate) ||
                const DeepCollectionEquality()
                    .equals(other.isPrivate, isPrivate)) &&
            (identical(other.typeName, typeName) ||
                const DeepCollectionEquality()
                    .equals(other.typeName, typeName)) &&
            (identical(other.statusName, statusName) ||
                const DeepCollectionEquality()
                    .equals(other.statusName, statusName)) &&
            (identical(other.listUserInCompetition, listUserInCompetition) ||
                const DeepCollectionEquality().equals(
                    other.listUserInCompetition, listUserInCompetition)) &&
            (identical(other.title, title) ||
                const DeepCollectionEquality().equals(other.title, title)) &&
            (identical(other.propertyDetailName, propertyDetailName) ||
                const DeepCollectionEquality()
                    .equals(other.propertyDetailName, propertyDetailName)) &&
            (identical(other.categoryName, categoryName) ||
                const DeepCollectionEquality()
                    .equals(other.categoryName, categoryName)) &&
            (identical(other.categoryId, categoryId) ||
                const DeepCollectionEquality()
                    .equals(other.categoryId, categoryId)) &&
            (identical(other.examIds, examIds) ||
                const DeepCollectionEquality()
                    .equals(other.examIds, examIds)) &&
            (identical(other.formatType, formatType) ||
                const DeepCollectionEquality().equals(other.formatType, formatType)) &&
            (identical(other.roundCount, roundCount) || const DeepCollectionEquality().equals(other.roundCount, roundCount)) &&
            (identical(other.isJoined, isJoined) || const DeepCollectionEquality().equals(other.isJoined, isJoined)) &&
            (identical(other.duration, duration) || const DeepCollectionEquality().equals(other.duration, duration)) &&
            (identical(other.playNow, playNow) || const DeepCollectionEquality().equals(other.playNow, playNow)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(status) ^
      const DeepCollectionEquality().hash(competitionUserCount) ^
      const DeepCollectionEquality().hash(listUserInCompetitionIds) ^
      const DeepCollectionEquality().hash(ownerType) ^
      const DeepCollectionEquality().hash(startDate) ^
      const DeepCollectionEquality().hash(endDate) ^
      const DeepCollectionEquality().hash(maxUser) ^
      const DeepCollectionEquality().hash(isPrivate) ^
      const DeepCollectionEquality().hash(typeName) ^
      const DeepCollectionEquality().hash(statusName) ^
      const DeepCollectionEquality().hash(listUserInCompetition) ^
      const DeepCollectionEquality().hash(title) ^
      const DeepCollectionEquality().hash(propertyDetailName) ^
      const DeepCollectionEquality().hash(categoryName) ^
      const DeepCollectionEquality().hash(categoryId) ^
      const DeepCollectionEquality().hash(examIds) ^
      const DeepCollectionEquality().hash(formatType) ^
      const DeepCollectionEquality().hash(roundCount) ^
      const DeepCollectionEquality().hash(isJoined) ^
      const DeepCollectionEquality().hash(duration) ^
      const DeepCollectionEquality().hash(playNow) ^
      runtimeType.hashCode;
}

extension $CompetitionListPublicResourceExtension
    on CompetitionListPublicResource {
  CompetitionListPublicResource copyWith(
      {int? id,
      int? status,
      int? competitionUserCount,
      List<int>? listUserInCompetitionIds,
      int? ownerType,
      DateTime? startDate,
      DateTime? endDate,
      int? maxUser,
      bool? isPrivate,
      String? typeName,
      String? statusName,
      List<SimpleUserEntity>? listUserInCompetition,
      String? title,
      List<String>? propertyDetailName,
      String? categoryName,
      String? categoryId,
      List<int>? examIds,
      int? formatType,
      int? roundCount,
      bool? isJoined,
      int? duration,
      bool? playNow}) {
    return CompetitionListPublicResource(
        id: id ?? this.id,
        status: status ?? this.status,
        competitionUserCount: competitionUserCount ?? this.competitionUserCount,
        listUserInCompetitionIds:
            listUserInCompetitionIds ?? this.listUserInCompetitionIds,
        ownerType: ownerType ?? this.ownerType,
        startDate: startDate ?? this.startDate,
        endDate: endDate ?? this.endDate,
        maxUser: maxUser ?? this.maxUser,
        isPrivate: isPrivate ?? this.isPrivate,
        typeName: typeName ?? this.typeName,
        statusName: statusName ?? this.statusName,
        listUserInCompetition:
            listUserInCompetition ?? this.listUserInCompetition,
        title: title ?? this.title,
        propertyDetailName: propertyDetailName ?? this.propertyDetailName,
        categoryName: categoryName ?? this.categoryName,
        categoryId: categoryId ?? this.categoryId,
        examIds: examIds ?? this.examIds,
        formatType: formatType ?? this.formatType,
        roundCount: roundCount ?? this.roundCount,
        isJoined: isJoined ?? this.isJoined,
        duration: duration ?? this.duration,
        playNow: playNow ?? this.playNow);
  }
}

@JsonSerializable(explicitToJson: true)
class CompetitionModel {
  CompetitionModel({
    this.totalRows,
    this.data,
  });

  factory CompetitionModel.fromJson(
          Map<String, dynamic> json) =>
      _$CompetitionModelFromJson(json);

  @JsonKey(name: 'totalRows', includeIfNull: true)
  final int? totalRows;
  @JsonKey(
      name: 'data',
      includeIfNull: true,
      defaultValue: <CompetitionListPublicResource>[])
  final List<CompetitionListPublicResource>? data;
  static const fromJsonFactory =
      _$CompetitionModelFromJson;
  static const toJsonFactory =
      _$CompetitionModelToJson;
  Map<String, dynamic> toJson() =>
      _$CompetitionModelToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is CompetitionModel &&
            (identical(other.totalRows, totalRows) ||
                const DeepCollectionEquality()
                    .equals(other.totalRows, totalRows)) &&
            (identical(other.data, data) ||
                const DeepCollectionEquality().equals(other.data, data)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(totalRows) ^
      const DeepCollectionEquality().hash(data) ^
      runtimeType.hashCode;
}

extension $CompetitionModelExtension
    on CompetitionModel {
  CompetitionModel copyWith(
      {int? totalRows, List<CompetitionListPublicResource>? data}) {
    return CompetitionModel(
        totalRows: totalRows ?? this.totalRows, data: data ?? this.data);
  }
}

@JsonSerializable(explicitToJson: true)
class CompetitionPublicDetailResource {
  CompetitionPublicDetailResource({
    this.id,
    this.title,
    this.propertyDetailName,
    this.type,
    this.status,
    this.maxUser,
    this.endDate,
    this.startDate,
    this.duration,
    this.categoryIds,
    this.categoryName,
    this.roundCount,
    this.userCount,
    this.formatType,
    this.listUserInCompetition,
    this.listRounds,
    this.createdBy,
    this.isManager,
    this.isJoined,
    this.isPrivate,
  });

  factory CompetitionPublicDetailResource.fromJson(Map<String, dynamic> json) =>
      _$CompetitionPublicDetailResourceFromJson(json);

  @JsonKey(name: 'id', includeIfNull: true)
  final int? id;
  @JsonKey(name: 'title', includeIfNull: true, defaultValue: '')
  final String? title;
  @JsonKey(
      name: 'propertyDetailName', includeIfNull: true, defaultValue: <String>[])
  final List<String>? propertyDetailName;
  @JsonKey(name: 'type', includeIfNull: true)
  final int? type;
  @JsonKey(name: 'status', includeIfNull: true)
  final int? status;
  @JsonKey(name: 'maxUser', includeIfNull: true)
  final int? maxUser;
  @JsonKey(name: 'endDate', includeIfNull: true)
  final DateTime? endDate;
  @JsonKey(name: 'startDate', includeIfNull: true)
  final DateTime? startDate;
  @JsonKey(name: 'duration', includeIfNull: true)
  final double? duration;
  @JsonKey(name: 'categoryIds', includeIfNull: true, defaultValue: <int>[])
  final List<int>? categoryIds;
  @JsonKey(name: 'categoryName', includeIfNull: true, defaultValue: '')
  final String? categoryName;
  @JsonKey(name: 'roundCount', includeIfNull: true)
  final int? roundCount;
  @JsonKey(name: 'userCount', includeIfNull: true)
  final int? userCount;
  @JsonKey(name: 'formatType', includeIfNull: true)
  final int? formatType;
  @JsonKey(
      name: 'listUserInCompetition',
      includeIfNull: true,
      defaultValue: <CompetitionUserPublicDetailResource>[])
  final List<CompetitionUserPublicDetailResource>? listUserInCompetition;
  @JsonKey(
      name: 'listRounds',
      includeIfNull: true,
      defaultValue: <CompetitionRoundDetailResource>[])
  final List<CompetitionRoundDetailResource>? listRounds;
  @JsonKey(name: 'createdBy', includeIfNull: true)
  final int? createdBy;
  @JsonKey(name: 'isManager', includeIfNull: true)
  final bool? isManager;
  @JsonKey(name: 'isJoined', includeIfNull: true)
  final bool? isJoined;
  @JsonKey(name: 'isPrivate', includeIfNull: true)
  final bool? isPrivate;
  static const fromJsonFactory = _$CompetitionPublicDetailResourceFromJson;
  static const toJsonFactory = _$CompetitionPublicDetailResourceToJson;
  Map<String, dynamic> toJson() =>
      _$CompetitionPublicDetailResourceToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is CompetitionPublicDetailResource &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.title, title) ||
                const DeepCollectionEquality().equals(other.title, title)) &&
            (identical(other.propertyDetailName, propertyDetailName) ||
                const DeepCollectionEquality()
                    .equals(other.propertyDetailName, propertyDetailName)) &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)) &&
            (identical(other.status, status) ||
                const DeepCollectionEquality().equals(other.status, status)) &&
            (identical(other.maxUser, maxUser) ||
                const DeepCollectionEquality()
                    .equals(other.maxUser, maxUser)) &&
            (identical(other.endDate, endDate) ||
                const DeepCollectionEquality()
                    .equals(other.endDate, endDate)) &&
            (identical(other.startDate, startDate) ||
                const DeepCollectionEquality()
                    .equals(other.startDate, startDate)) &&
            (identical(other.duration, duration) ||
                const DeepCollectionEquality()
                    .equals(other.duration, duration)) &&
            (identical(other.categoryIds, categoryIds) ||
                const DeepCollectionEquality()
                    .equals(other.categoryIds, categoryIds)) &&
            (identical(other.categoryName, categoryName) ||
                const DeepCollectionEquality()
                    .equals(other.categoryName, categoryName)) &&
            (identical(other.roundCount, roundCount) ||
                const DeepCollectionEquality()
                    .equals(other.roundCount, roundCount)) &&
            (identical(other.userCount, userCount) ||
                const DeepCollectionEquality()
                    .equals(other.userCount, userCount)) &&
            (identical(other.formatType, formatType) ||
                const DeepCollectionEquality()
                    .equals(other.formatType, formatType)) &&
            (identical(other.listUserInCompetition, listUserInCompetition) ||
                const DeepCollectionEquality().equals(
                    other.listUserInCompetition, listUserInCompetition)) &&
            (identical(other.listRounds, listRounds) ||
                const DeepCollectionEquality()
                    .equals(other.listRounds, listRounds)) &&
            (identical(other.createdBy, createdBy) ||
                const DeepCollectionEquality()
                    .equals(other.createdBy, createdBy)) &&
            (identical(other.isManager, isManager) ||
                const DeepCollectionEquality()
                    .equals(other.isManager, isManager)) &&
            (identical(other.isJoined, isJoined) ||
                const DeepCollectionEquality()
                    .equals(other.isJoined, isJoined)) &&
            (identical(other.isPrivate, isPrivate) ||
                const DeepCollectionEquality()
                    .equals(other.isPrivate, isPrivate)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(title) ^
      const DeepCollectionEquality().hash(propertyDetailName) ^
      const DeepCollectionEquality().hash(type) ^
      const DeepCollectionEquality().hash(status) ^
      const DeepCollectionEquality().hash(maxUser) ^
      const DeepCollectionEquality().hash(endDate) ^
      const DeepCollectionEquality().hash(startDate) ^
      const DeepCollectionEquality().hash(duration) ^
      const DeepCollectionEquality().hash(categoryIds) ^
      const DeepCollectionEquality().hash(categoryName) ^
      const DeepCollectionEquality().hash(roundCount) ^
      const DeepCollectionEquality().hash(userCount) ^
      const DeepCollectionEquality().hash(formatType) ^
      const DeepCollectionEquality().hash(listUserInCompetition) ^
      const DeepCollectionEquality().hash(listRounds) ^
      const DeepCollectionEquality().hash(createdBy) ^
      const DeepCollectionEquality().hash(isManager) ^
      const DeepCollectionEquality().hash(isJoined) ^
      const DeepCollectionEquality().hash(isPrivate) ^
      runtimeType.hashCode;
}

extension $CompetitionPublicDetailResourceExtension
    on CompetitionPublicDetailResource {
  CompetitionPublicDetailResource copyWith(
      {int? id,
      String? title,
      List<String>? propertyDetailName,
      int? type,
      int? status,
      int? maxUser,
      DateTime? endDate,
      DateTime? startDate,
      double? duration,
      List<int>? categoryIds,
      String? categoryName,
      int? roundCount,
      int? userCount,
      int? formatType,
      List<CompetitionUserPublicDetailResource>? listUserInCompetition,
      List<CompetitionRoundDetailResource>? listRounds,
      int? createdBy,
      bool? isManager,
      bool? isJoined,
      bool? isPrivate}) {
    return CompetitionPublicDetailResource(
        id: id ?? this.id,
        title: title ?? this.title,
        propertyDetailName: propertyDetailName ?? this.propertyDetailName,
        type: type ?? this.type,
        status: status ?? this.status,
        maxUser: maxUser ?? this.maxUser,
        endDate: endDate ?? this.endDate,
        startDate: startDate ?? this.startDate,
        duration: duration ?? this.duration,
        categoryIds: categoryIds ?? this.categoryIds,
        categoryName: categoryName ?? this.categoryName,
        roundCount: roundCount ?? this.roundCount,
        userCount: userCount ?? this.userCount,
        formatType: formatType ?? this.formatType,
        listUserInCompetition:
            listUserInCompetition ?? this.listUserInCompetition,
        listRounds: listRounds ?? this.listRounds,
        createdBy: createdBy ?? this.createdBy,
        isManager: isManager ?? this.isManager,
        isJoined: isJoined ?? this.isJoined,
        isPrivate: isPrivate ?? this.isPrivate);
  }
}

@JsonSerializable(explicitToJson: true)
class CompetitionQuestionUser {
  CompetitionQuestionUser({
    this.competitionRoundId,
    this.duration,
    this.userAnswerQuestion,
  });

  factory CompetitionQuestionUser.fromJson(Map<String, dynamic> json) =>
      _$CompetitionQuestionUserFromJson(json);

  @JsonKey(name: 'competitionRoundId', includeIfNull: true)
  final int? competitionRoundId;
  @JsonKey(name: 'duration', includeIfNull: true)
  final int? duration;
  @JsonKey(name: 'userAnswerQuestion', includeIfNull: true)
  final UserAnswerPublicResource? userAnswerQuestion;
  static const fromJsonFactory = _$CompetitionQuestionUserFromJson;
  static const toJsonFactory = _$CompetitionQuestionUserToJson;
  Map<String, dynamic> toJson() => _$CompetitionQuestionUserToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is CompetitionQuestionUser &&
            (identical(other.competitionRoundId, competitionRoundId) ||
                const DeepCollectionEquality()
                    .equals(other.competitionRoundId, competitionRoundId)) &&
            (identical(other.duration, duration) ||
                const DeepCollectionEquality()
                    .equals(other.duration, duration)) &&
            (identical(other.userAnswerQuestion, userAnswerQuestion) ||
                const DeepCollectionEquality()
                    .equals(other.userAnswerQuestion, userAnswerQuestion)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(competitionRoundId) ^
      const DeepCollectionEquality().hash(duration) ^
      const DeepCollectionEquality().hash(userAnswerQuestion) ^
      runtimeType.hashCode;
}

extension $CompetitionQuestionUserExtension on CompetitionQuestionUser {
  CompetitionQuestionUser copyWith(
      {int? competitionRoundId,
      int? duration,
      UserAnswerPublicResource? userAnswerQuestion}) {
    return CompetitionQuestionUser(
        competitionRoundId: competitionRoundId ?? this.competitionRoundId,
        duration: duration ?? this.duration,
        userAnswerQuestion: userAnswerQuestion ?? this.userAnswerQuestion);
  }
}

@JsonSerializable(explicitToJson: true)
class CompetitionResource {
  CompetitionResource({
    this.id,
    this.title,
    this.examCategoryId,
    this.examCategoryIds,
    this.type,
    this.status,
    this.ownerType,
    this.startDate,
    this.endDate,
    this.maxUser,
    this.isPrivate,
    this.typeName,
    this.statusName,
    this.examName,
    this.categoryName,
    this.examCategoryName,
    this.rounds,
    this.formatType,
  });

  factory CompetitionResource.fromJson(Map<String, dynamic> json) =>
      _$CompetitionResourceFromJson(json);

  @JsonKey(name: 'id', includeIfNull: true)
  final int? id;
  @JsonKey(name: 'title', includeIfNull: true, defaultValue: '')
  final String? title;
  @JsonKey(name: 'examCategoryId', includeIfNull: true, defaultValue: '')
  final String? examCategoryId;
  @JsonKey(name: 'examCategoryIds', includeIfNull: true, defaultValue: <int>[])
  final List<int>? examCategoryIds;
  @JsonKey(name: 'type', includeIfNull: true)
  final int? type;
  @JsonKey(name: 'status', includeIfNull: true)
  final int? status;
  @JsonKey(name: 'ownerType', includeIfNull: true)
  final int? ownerType;
  @JsonKey(name: 'startDate', includeIfNull: true)
  final DateTime? startDate;
  @JsonKey(name: 'endDate', includeIfNull: true)
  final DateTime? endDate;
  @JsonKey(name: 'maxUser', includeIfNull: true)
  final int? maxUser;
  @JsonKey(name: 'isPrivate', includeIfNull: true)
  final bool? isPrivate;
  @JsonKey(name: 'typeName', includeIfNull: true, defaultValue: '')
  final String? typeName;
  @JsonKey(name: 'statusName', includeIfNull: true, defaultValue: '')
  final String? statusName;
  @JsonKey(name: 'examName', includeIfNull: true, defaultValue: '')
  final String? examName;
  @JsonKey(name: 'categoryName', includeIfNull: true, defaultValue: '')
  final String? categoryName;
  @JsonKey(name: 'examCategoryName', includeIfNull: true, defaultValue: '')
  final String? examCategoryName;
  @JsonKey(
      name: 'rounds',
      includeIfNull: true,
      defaultValue: <CompetitionRoundResource>[])
  final List<CompetitionRoundResource>? rounds;
  @JsonKey(name: 'formatType', includeIfNull: true)
  final int? formatType;
  static const fromJsonFactory = _$CompetitionResourceFromJson;
  static const toJsonFactory = _$CompetitionResourceToJson;
  Map<String, dynamic> toJson() => _$CompetitionResourceToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is CompetitionResource &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.title, title) ||
                const DeepCollectionEquality().equals(other.title, title)) &&
            (identical(other.examCategoryId, examCategoryId) ||
                const DeepCollectionEquality()
                    .equals(other.examCategoryId, examCategoryId)) &&
            (identical(other.examCategoryIds, examCategoryIds) ||
                const DeepCollectionEquality()
                    .equals(other.examCategoryIds, examCategoryIds)) &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)) &&
            (identical(other.status, status) ||
                const DeepCollectionEquality().equals(other.status, status)) &&
            (identical(other.ownerType, ownerType) ||
                const DeepCollectionEquality()
                    .equals(other.ownerType, ownerType)) &&
            (identical(other.startDate, startDate) ||
                const DeepCollectionEquality()
                    .equals(other.startDate, startDate)) &&
            (identical(other.endDate, endDate) ||
                const DeepCollectionEquality()
                    .equals(other.endDate, endDate)) &&
            (identical(other.maxUser, maxUser) ||
                const DeepCollectionEquality()
                    .equals(other.maxUser, maxUser)) &&
            (identical(other.isPrivate, isPrivate) ||
                const DeepCollectionEquality()
                    .equals(other.isPrivate, isPrivate)) &&
            (identical(other.typeName, typeName) ||
                const DeepCollectionEquality()
                    .equals(other.typeName, typeName)) &&
            (identical(other.statusName, statusName) ||
                const DeepCollectionEquality()
                    .equals(other.statusName, statusName)) &&
            (identical(other.examName, examName) ||
                const DeepCollectionEquality()
                    .equals(other.examName, examName)) &&
            (identical(other.categoryName, categoryName) ||
                const DeepCollectionEquality()
                    .equals(other.categoryName, categoryName)) &&
            (identical(other.examCategoryName, examCategoryName) ||
                const DeepCollectionEquality()
                    .equals(other.examCategoryName, examCategoryName)) &&
            (identical(other.rounds, rounds) ||
                const DeepCollectionEquality().equals(other.rounds, rounds)) &&
            (identical(other.formatType, formatType) ||
                const DeepCollectionEquality()
                    .equals(other.formatType, formatType)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(title) ^
      const DeepCollectionEquality().hash(examCategoryId) ^
      const DeepCollectionEquality().hash(examCategoryIds) ^
      const DeepCollectionEquality().hash(type) ^
      const DeepCollectionEquality().hash(status) ^
      const DeepCollectionEquality().hash(ownerType) ^
      const DeepCollectionEquality().hash(startDate) ^
      const DeepCollectionEquality().hash(endDate) ^
      const DeepCollectionEquality().hash(maxUser) ^
      const DeepCollectionEquality().hash(isPrivate) ^
      const DeepCollectionEquality().hash(typeName) ^
      const DeepCollectionEquality().hash(statusName) ^
      const DeepCollectionEquality().hash(examName) ^
      const DeepCollectionEquality().hash(categoryName) ^
      const DeepCollectionEquality().hash(examCategoryName) ^
      const DeepCollectionEquality().hash(rounds) ^
      const DeepCollectionEquality().hash(formatType) ^
      runtimeType.hashCode;
}

extension $CompetitionResourceExtension on CompetitionResource {
  CompetitionResource copyWith(
      {int? id,
      String? title,
      String? examCategoryId,
      List<int>? examCategoryIds,
      int? type,
      int? status,
      int? ownerType,
      DateTime? startDate,
      DateTime? endDate,
      int? maxUser,
      bool? isPrivate,
      String? typeName,
      String? statusName,
      String? examName,
      String? categoryName,
      String? examCategoryName,
      List<CompetitionRoundResource>? rounds,
      int? formatType}) {
    return CompetitionResource(
        id: id ?? this.id,
        title: title ?? this.title,
        examCategoryId: examCategoryId ?? this.examCategoryId,
        examCategoryIds: examCategoryIds ?? this.examCategoryIds,
        type: type ?? this.type,
        status: status ?? this.status,
        ownerType: ownerType ?? this.ownerType,
        startDate: startDate ?? this.startDate,
        endDate: endDate ?? this.endDate,
        maxUser: maxUser ?? this.maxUser,
        isPrivate: isPrivate ?? this.isPrivate,
        typeName: typeName ?? this.typeName,
        statusName: statusName ?? this.statusName,
        examName: examName ?? this.examName,
        categoryName: categoryName ?? this.categoryName,
        examCategoryName: examCategoryName ?? this.examCategoryName,
        rounds: rounds ?? this.rounds,
        formatType: formatType ?? this.formatType);
  }
}

@JsonSerializable(explicitToJson: true)
class CompetitionResourceFilterResult {
  CompetitionResourceFilterResult({
    this.totalRows,
    this.data,
  });

  factory CompetitionResourceFilterResult.fromJson(Map<String, dynamic> json) =>
      _$CompetitionResourceFilterResultFromJson(json);

  @JsonKey(name: 'totalRows', includeIfNull: true)
  final int? totalRows;
  @JsonKey(
      name: 'data', includeIfNull: true, defaultValue: <CompetitionResource>[])
  final List<CompetitionResource>? data;
  static const fromJsonFactory = _$CompetitionResourceFilterResultFromJson;
  static const toJsonFactory = _$CompetitionResourceFilterResultToJson;
  Map<String, dynamic> toJson() =>
      _$CompetitionResourceFilterResultToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is CompetitionResourceFilterResult &&
            (identical(other.totalRows, totalRows) ||
                const DeepCollectionEquality()
                    .equals(other.totalRows, totalRows)) &&
            (identical(other.data, data) ||
                const DeepCollectionEquality().equals(other.data, data)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(totalRows) ^
      const DeepCollectionEquality().hash(data) ^
      runtimeType.hashCode;
}

extension $CompetitionResourceFilterResultExtension
    on CompetitionResourceFilterResult {
  CompetitionResourceFilterResult copyWith(
      {int? totalRows, List<CompetitionResource>? data}) {
    return CompetitionResourceFilterResult(
        totalRows: totalRows ?? this.totalRows, data: data ?? this.data);
  }
}

@JsonSerializable(explicitToJson: true)
class CompetitionRoundDetailResource {
  CompetitionRoundDetailResource({
    this.id,
    this.title,
    this.examCategoryId,
    this.competitionId,
    this.examId,
    this.status,
    this.startDate,
    this.endDate,
    this.duration,
    this.numberOfQuestions,
    this.examPropertys,
    this.propertyDetailName,
    this.categoryName,
    this.durationDone,
    this.rank,
    this.mark,
  });

  factory CompetitionRoundDetailResource.fromJson(Map<String, dynamic> json) =>
      _$CompetitionRoundDetailResourceFromJson(json);

  @JsonKey(name: 'id', includeIfNull: true)
  final int? id;
  @JsonKey(name: 'title', includeIfNull: true, defaultValue: '')
  final String? title;
  @JsonKey(name: 'examCategoryId', includeIfNull: true)
  final int? examCategoryId;
  @JsonKey(name: 'competitionId', includeIfNull: true)
  final int? competitionId;
  @JsonKey(name: 'examId', includeIfNull: true)
  final int? examId;
  @JsonKey(name: 'status', includeIfNull: true)
  final int? status;
  @JsonKey(name: 'startDate', includeIfNull: true)
  final DateTime? startDate;
  @JsonKey(name: 'endDate', includeIfNull: true)
  final DateTime? endDate;
  @JsonKey(name: 'duration', includeIfNull: true)
  final int? duration;
  @JsonKey(name: 'numberOfQuestions', includeIfNull: true)
  final int? numberOfQuestions;
  @JsonKey(name: 'examPropertys', includeIfNull: true, defaultValue: <int>[])
  final List<int>? examPropertys;
  @JsonKey(
      name: 'propertyDetailName', includeIfNull: true, defaultValue: <String>[])
  final List<String>? propertyDetailName;
  @JsonKey(name: 'categoryName', includeIfNull: true, defaultValue: '')
  final String? categoryName;
  @JsonKey(name: 'durationDone', includeIfNull: true)
  final int? durationDone;
  @JsonKey(name: 'rank', includeIfNull: true)
  final int? rank;
  @JsonKey(name: 'mark', includeIfNull: true)
  final double? mark;
  static const fromJsonFactory = _$CompetitionRoundDetailResourceFromJson;
  static const toJsonFactory = _$CompetitionRoundDetailResourceToJson;
  Map<String, dynamic> toJson() => _$CompetitionRoundDetailResourceToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is CompetitionRoundDetailResource &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.title, title) ||
                const DeepCollectionEquality().equals(other.title, title)) &&
            (identical(other.examCategoryId, examCategoryId) ||
                const DeepCollectionEquality()
                    .equals(other.examCategoryId, examCategoryId)) &&
            (identical(other.competitionId, competitionId) ||
                const DeepCollectionEquality()
                    .equals(other.competitionId, competitionId)) &&
            (identical(other.examId, examId) ||
                const DeepCollectionEquality().equals(other.examId, examId)) &&
            (identical(other.status, status) ||
                const DeepCollectionEquality().equals(other.status, status)) &&
            (identical(other.startDate, startDate) ||
                const DeepCollectionEquality()
                    .equals(other.startDate, startDate)) &&
            (identical(other.endDate, endDate) ||
                const DeepCollectionEquality()
                    .equals(other.endDate, endDate)) &&
            (identical(other.duration, duration) ||
                const DeepCollectionEquality()
                    .equals(other.duration, duration)) &&
            (identical(other.numberOfQuestions, numberOfQuestions) ||
                const DeepCollectionEquality()
                    .equals(other.numberOfQuestions, numberOfQuestions)) &&
            (identical(other.examPropertys, examPropertys) ||
                const DeepCollectionEquality()
                    .equals(other.examPropertys, examPropertys)) &&
            (identical(other.propertyDetailName, propertyDetailName) ||
                const DeepCollectionEquality()
                    .equals(other.propertyDetailName, propertyDetailName)) &&
            (identical(other.categoryName, categoryName) ||
                const DeepCollectionEquality()
                    .equals(other.categoryName, categoryName)) &&
            (identical(other.durationDone, durationDone) ||
                const DeepCollectionEquality()
                    .equals(other.durationDone, durationDone)) &&
            (identical(other.rank, rank) ||
                const DeepCollectionEquality().equals(other.rank, rank)) &&
            (identical(other.mark, mark) ||
                const DeepCollectionEquality().equals(other.mark, mark)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(title) ^
      const DeepCollectionEquality().hash(examCategoryId) ^
      const DeepCollectionEquality().hash(competitionId) ^
      const DeepCollectionEquality().hash(examId) ^
      const DeepCollectionEquality().hash(status) ^
      const DeepCollectionEquality().hash(startDate) ^
      const DeepCollectionEquality().hash(endDate) ^
      const DeepCollectionEquality().hash(duration) ^
      const DeepCollectionEquality().hash(numberOfQuestions) ^
      const DeepCollectionEquality().hash(examPropertys) ^
      const DeepCollectionEquality().hash(propertyDetailName) ^
      const DeepCollectionEquality().hash(categoryName) ^
      const DeepCollectionEquality().hash(durationDone) ^
      const DeepCollectionEquality().hash(rank) ^
      const DeepCollectionEquality().hash(mark) ^
      runtimeType.hashCode;
}

extension $CompetitionRoundDetailResourceExtension
    on CompetitionRoundDetailResource {
  CompetitionRoundDetailResource copyWith(
      {int? id,
      String? title,
      int? examCategoryId,
      int? competitionId,
      int? examId,
      int? status,
      DateTime? startDate,
      DateTime? endDate,
      int? duration,
      int? numberOfQuestions,
      List<int>? examPropertys,
      List<String>? propertyDetailName,
      String? categoryName,
      int? durationDone,
      int? rank,
      double? mark}) {
    return CompetitionRoundDetailResource(
        id: id ?? this.id,
        title: title ?? this.title,
        examCategoryId: examCategoryId ?? this.examCategoryId,
        competitionId: competitionId ?? this.competitionId,
        examId: examId ?? this.examId,
        status: status ?? this.status,
        startDate: startDate ?? this.startDate,
        endDate: endDate ?? this.endDate,
        duration: duration ?? this.duration,
        numberOfQuestions: numberOfQuestions ?? this.numberOfQuestions,
        examPropertys: examPropertys ?? this.examPropertys,
        propertyDetailName: propertyDetailName ?? this.propertyDetailName,
        categoryName: categoryName ?? this.categoryName,
        durationDone: durationDone ?? this.durationDone,
        rank: rank ?? this.rank,
        mark: mark ?? this.mark);
  }
}

@JsonSerializable(explicitToJson: true)
class CompetitionRoundListResource {
  CompetitionRoundListResource({
    this.id,
    this.title,
    this.duration,
    this.startDate,
    this.rank,
    this.totalMark,
    this.totalTime,
    this.categoryName,
    this.examPropertys,
    this.categoryId,
    this.propertyDetailName,
  });

  factory CompetitionRoundListResource.fromJson(Map<String, dynamic> json) =>
      _$CompetitionRoundListResourceFromJson(json);

  @JsonKey(name: 'id', includeIfNull: true)
  final int? id;
  @JsonKey(name: 'title', includeIfNull: true, defaultValue: '')
  final String? title;
  @JsonKey(name: 'duration', includeIfNull: true)
  final int? duration;
  @JsonKey(name: 'startDate', includeIfNull: true)
  final DateTime? startDate;
  @JsonKey(name: 'rank', includeIfNull: true)
  final int? rank;
  @JsonKey(name: 'totalMark', includeIfNull: true)
  final double? totalMark;
  @JsonKey(name: 'totalTime', includeIfNull: true)
  final int? totalTime;
  @JsonKey(name: 'categoryName', includeIfNull: true, defaultValue: '')
  final String? categoryName;
  @JsonKey(name: 'examPropertys', includeIfNull: true, defaultValue: <int>[])
  final List<int>? examPropertys;
  @JsonKey(name: 'categoryId', includeIfNull: true)
  final int? categoryId;
  @JsonKey(
      name: 'propertyDetailName', includeIfNull: true, defaultValue: <String>[])
  final List<String>? propertyDetailName;
  static const fromJsonFactory = _$CompetitionRoundListResourceFromJson;
  static const toJsonFactory = _$CompetitionRoundListResourceToJson;
  Map<String, dynamic> toJson() => _$CompetitionRoundListResourceToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is CompetitionRoundListResource &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.title, title) ||
                const DeepCollectionEquality().equals(other.title, title)) &&
            (identical(other.duration, duration) ||
                const DeepCollectionEquality()
                    .equals(other.duration, duration)) &&
            (identical(other.startDate, startDate) ||
                const DeepCollectionEquality()
                    .equals(other.startDate, startDate)) &&
            (identical(other.rank, rank) ||
                const DeepCollectionEquality().equals(other.rank, rank)) &&
            (identical(other.totalMark, totalMark) ||
                const DeepCollectionEquality()
                    .equals(other.totalMark, totalMark)) &&
            (identical(other.totalTime, totalTime) ||
                const DeepCollectionEquality()
                    .equals(other.totalTime, totalTime)) &&
            (identical(other.categoryName, categoryName) ||
                const DeepCollectionEquality()
                    .equals(other.categoryName, categoryName)) &&
            (identical(other.examPropertys, examPropertys) ||
                const DeepCollectionEquality()
                    .equals(other.examPropertys, examPropertys)) &&
            (identical(other.categoryId, categoryId) ||
                const DeepCollectionEquality()
                    .equals(other.categoryId, categoryId)) &&
            (identical(other.propertyDetailName, propertyDetailName) ||
                const DeepCollectionEquality()
                    .equals(other.propertyDetailName, propertyDetailName)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(title) ^
      const DeepCollectionEquality().hash(duration) ^
      const DeepCollectionEquality().hash(startDate) ^
      const DeepCollectionEquality().hash(rank) ^
      const DeepCollectionEquality().hash(totalMark) ^
      const DeepCollectionEquality().hash(totalTime) ^
      const DeepCollectionEquality().hash(categoryName) ^
      const DeepCollectionEquality().hash(examPropertys) ^
      const DeepCollectionEquality().hash(categoryId) ^
      const DeepCollectionEquality().hash(propertyDetailName) ^
      runtimeType.hashCode;
}

extension $CompetitionRoundListResourceExtension
    on CompetitionRoundListResource {
  CompetitionRoundListResource copyWith(
      {int? id,
      String? title,
      int? duration,
      DateTime? startDate,
      int? rank,
      double? totalMark,
      int? totalTime,
      String? categoryName,
      List<int>? examPropertys,
      int? categoryId,
      List<String>? propertyDetailName}) {
    return CompetitionRoundListResource(
        id: id ?? this.id,
        title: title ?? this.title,
        duration: duration ?? this.duration,
        startDate: startDate ?? this.startDate,
        rank: rank ?? this.rank,
        totalMark: totalMark ?? this.totalMark,
        totalTime: totalTime ?? this.totalTime,
        categoryName: categoryName ?? this.categoryName,
        examPropertys: examPropertys ?? this.examPropertys,
        categoryId: categoryId ?? this.categoryId,
        propertyDetailName: propertyDetailName ?? this.propertyDetailName);
  }
}

@JsonSerializable(explicitToJson: true)
class CompetitionRoundResource {
  CompetitionRoundResource({
    this.id,
    this.renderId,
    this.title,
    this.competitionId,
    this.examId,
    this.examCategoryId,
    this.startDate,
    this.endDate,
    this.examName,
    this.numberOfQuestions,
    this.duration,
    this.propertyDetailIds,
    this.examPropertys,
  });

  factory CompetitionRoundResource.fromJson(Map<String, dynamic> json) =>
      _$CompetitionRoundResourceFromJson(json);

  @JsonKey(name: 'id', includeIfNull: true)
  final int? id;
  @JsonKey(name: 'renderId', includeIfNull: true, defaultValue: '')
  final String? renderId;
  @JsonKey(name: 'title', includeIfNull: true, defaultValue: '')
  final String? title;
  @JsonKey(name: 'competitionId', includeIfNull: true)
  final int? competitionId;
  @JsonKey(name: 'examId', includeIfNull: true)
  final int? examId;
  @JsonKey(name: 'examCategoryId', includeIfNull: true)
  final int? examCategoryId;
  @JsonKey(name: 'startDate', includeIfNull: true)
  final DateTime? startDate;
  @JsonKey(name: 'endDate', includeIfNull: true)
  final DateTime? endDate;
  @JsonKey(name: 'examName', includeIfNull: true, defaultValue: '')
  final String? examName;
  @JsonKey(name: 'numberOfQuestions', includeIfNull: true)
  final int? numberOfQuestions;
  @JsonKey(name: 'duration', includeIfNull: true)
  final int? duration;
  @JsonKey(
      name: 'propertyDetailIds', includeIfNull: true, defaultValue: <int>[])
  final List<int>? propertyDetailIds;
  @JsonKey(name: 'examPropertys', includeIfNull: true, defaultValue: <int>[])
  final List<int>? examPropertys;
  static const fromJsonFactory = _$CompetitionRoundResourceFromJson;
  static const toJsonFactory = _$CompetitionRoundResourceToJson;
  Map<String, dynamic> toJson() => _$CompetitionRoundResourceToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is CompetitionRoundResource &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.renderId, renderId) ||
                const DeepCollectionEquality()
                    .equals(other.renderId, renderId)) &&
            (identical(other.title, title) ||
                const DeepCollectionEquality().equals(other.title, title)) &&
            (identical(other.competitionId, competitionId) ||
                const DeepCollectionEquality()
                    .equals(other.competitionId, competitionId)) &&
            (identical(other.examId, examId) ||
                const DeepCollectionEquality().equals(other.examId, examId)) &&
            (identical(other.examCategoryId, examCategoryId) ||
                const DeepCollectionEquality()
                    .equals(other.examCategoryId, examCategoryId)) &&
            (identical(other.startDate, startDate) ||
                const DeepCollectionEquality()
                    .equals(other.startDate, startDate)) &&
            (identical(other.endDate, endDate) ||
                const DeepCollectionEquality()
                    .equals(other.endDate, endDate)) &&
            (identical(other.examName, examName) ||
                const DeepCollectionEquality()
                    .equals(other.examName, examName)) &&
            (identical(other.numberOfQuestions, numberOfQuestions) ||
                const DeepCollectionEquality()
                    .equals(other.numberOfQuestions, numberOfQuestions)) &&
            (identical(other.duration, duration) ||
                const DeepCollectionEquality()
                    .equals(other.duration, duration)) &&
            (identical(other.propertyDetailIds, propertyDetailIds) ||
                const DeepCollectionEquality()
                    .equals(other.propertyDetailIds, propertyDetailIds)) &&
            (identical(other.examPropertys, examPropertys) ||
                const DeepCollectionEquality()
                    .equals(other.examPropertys, examPropertys)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(renderId) ^
      const DeepCollectionEquality().hash(title) ^
      const DeepCollectionEquality().hash(competitionId) ^
      const DeepCollectionEquality().hash(examId) ^
      const DeepCollectionEquality().hash(examCategoryId) ^
      const DeepCollectionEquality().hash(startDate) ^
      const DeepCollectionEquality().hash(endDate) ^
      const DeepCollectionEquality().hash(examName) ^
      const DeepCollectionEquality().hash(numberOfQuestions) ^
      const DeepCollectionEquality().hash(duration) ^
      const DeepCollectionEquality().hash(propertyDetailIds) ^
      const DeepCollectionEquality().hash(examPropertys) ^
      runtimeType.hashCode;
}

extension $CompetitionRoundResourceExtension on CompetitionRoundResource {
  CompetitionRoundResource copyWith(
      {int? id,
      String? renderId,
      String? title,
      int? competitionId,
      int? examId,
      int? examCategoryId,
      DateTime? startDate,
      DateTime? endDate,
      String? examName,
      int? numberOfQuestions,
      int? duration,
      List<int>? propertyDetailIds,
      List<int>? examPropertys}) {
    return CompetitionRoundResource(
        id: id ?? this.id,
        renderId: renderId ?? this.renderId,
        title: title ?? this.title,
        competitionId: competitionId ?? this.competitionId,
        examId: examId ?? this.examId,
        examCategoryId: examCategoryId ?? this.examCategoryId,
        startDate: startDate ?? this.startDate,
        endDate: endDate ?? this.endDate,
        examName: examName ?? this.examName,
        numberOfQuestions: numberOfQuestions ?? this.numberOfQuestions,
        duration: duration ?? this.duration,
        propertyDetailIds: propertyDetailIds ?? this.propertyDetailIds,
        examPropertys: examPropertys ?? this.examPropertys);
  }
}

@JsonSerializable(explicitToJson: true)
class CompetitionUpdateResource {
  CompetitionUpdateResource({
    this.id,
    this.title,
    this.examCategoryId,
    this.examCategoryIds,
    this.type,
    this.status,
    this.ownerType,
    this.startDate,
    this.endDate,
    this.maxUser,
    this.isPrivate,
    this.rounds,
    this.numberOfQuestions,
    this.duration,
    this.playNow,
    this.formatType,
  });

  factory CompetitionUpdateResource.fromJson(Map<String, dynamic> json) =>
      _$CompetitionUpdateResourceFromJson(json);

  @JsonKey(name: 'id', includeIfNull: true)
  final int? id;
  @JsonKey(name: 'title', includeIfNull: true, defaultValue: '')
  final String? title;
  @JsonKey(name: 'examCategoryId', includeIfNull: true, defaultValue: '')
  final String? examCategoryId;
  @JsonKey(name: 'examCategoryIds', includeIfNull: true, defaultValue: <int>[])
  final List<int>? examCategoryIds;
  @JsonKey(name: 'type', includeIfNull: true)
  final int? type;
  @JsonKey(name: 'status', includeIfNull: true)
  final int? status;
  @JsonKey(name: 'ownerType', includeIfNull: true)
  final int? ownerType;
  @JsonKey(name: 'startDate', includeIfNull: true)
  final DateTime? startDate;
  @JsonKey(name: 'endDate', includeIfNull: true)
  final DateTime? endDate;
  @JsonKey(name: 'maxUser', includeIfNull: true)
  final int? maxUser;
  @JsonKey(name: 'isPrivate', includeIfNull: true)
  final bool? isPrivate;
  @JsonKey(
      name: 'rounds',
      includeIfNull: true,
      defaultValue: <CompetitionRoundResource>[])
  final List<CompetitionRoundResource>? rounds;
  @JsonKey(name: 'numberOfQuestions', includeIfNull: true)
  final int? numberOfQuestions;
  @JsonKey(name: 'duration', includeIfNull: true)
  final int? duration;
  @JsonKey(name: 'playNow', includeIfNull: true)
  final bool? playNow;
  @JsonKey(name: 'formatType', includeIfNull: true)
  final int? formatType;
  static const fromJsonFactory = _$CompetitionUpdateResourceFromJson;
  static const toJsonFactory = _$CompetitionUpdateResourceToJson;
  Map<String, dynamic> toJson() => _$CompetitionUpdateResourceToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is CompetitionUpdateResource &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.title, title) ||
                const DeepCollectionEquality().equals(other.title, title)) &&
            (identical(other.examCategoryId, examCategoryId) ||
                const DeepCollectionEquality()
                    .equals(other.examCategoryId, examCategoryId)) &&
            (identical(other.examCategoryIds, examCategoryIds) ||
                const DeepCollectionEquality()
                    .equals(other.examCategoryIds, examCategoryIds)) &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)) &&
            (identical(other.status, status) ||
                const DeepCollectionEquality().equals(other.status, status)) &&
            (identical(other.ownerType, ownerType) ||
                const DeepCollectionEquality()
                    .equals(other.ownerType, ownerType)) &&
            (identical(other.startDate, startDate) ||
                const DeepCollectionEquality()
                    .equals(other.startDate, startDate)) &&
            (identical(other.endDate, endDate) ||
                const DeepCollectionEquality()
                    .equals(other.endDate, endDate)) &&
            (identical(other.maxUser, maxUser) ||
                const DeepCollectionEquality()
                    .equals(other.maxUser, maxUser)) &&
            (identical(other.isPrivate, isPrivate) ||
                const DeepCollectionEquality()
                    .equals(other.isPrivate, isPrivate)) &&
            (identical(other.rounds, rounds) ||
                const DeepCollectionEquality().equals(other.rounds, rounds)) &&
            (identical(other.numberOfQuestions, numberOfQuestions) ||
                const DeepCollectionEquality()
                    .equals(other.numberOfQuestions, numberOfQuestions)) &&
            (identical(other.duration, duration) ||
                const DeepCollectionEquality()
                    .equals(other.duration, duration)) &&
            (identical(other.playNow, playNow) ||
                const DeepCollectionEquality()
                    .equals(other.playNow, playNow)) &&
            (identical(other.formatType, formatType) ||
                const DeepCollectionEquality()
                    .equals(other.formatType, formatType)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(title) ^
      const DeepCollectionEquality().hash(examCategoryId) ^
      const DeepCollectionEquality().hash(examCategoryIds) ^
      const DeepCollectionEquality().hash(type) ^
      const DeepCollectionEquality().hash(status) ^
      const DeepCollectionEquality().hash(ownerType) ^
      const DeepCollectionEquality().hash(startDate) ^
      const DeepCollectionEquality().hash(endDate) ^
      const DeepCollectionEquality().hash(maxUser) ^
      const DeepCollectionEquality().hash(isPrivate) ^
      const DeepCollectionEquality().hash(rounds) ^
      const DeepCollectionEquality().hash(numberOfQuestions) ^
      const DeepCollectionEquality().hash(duration) ^
      const DeepCollectionEquality().hash(playNow) ^
      const DeepCollectionEquality().hash(formatType) ^
      runtimeType.hashCode;
}

extension $CompetitionUpdateResourceExtension on CompetitionUpdateResource {
  CompetitionUpdateResource copyWith(
      {int? id,
      String? title,
      String? examCategoryId,
      List<int>? examCategoryIds,
      int? type,
      int? status,
      int? ownerType,
      DateTime? startDate,
      DateTime? endDate,
      int? maxUser,
      bool? isPrivate,
      List<CompetitionRoundResource>? rounds,
      int? numberOfQuestions,
      int? duration,
      bool? playNow,
      int? formatType}) {
    return CompetitionUpdateResource(
        id: id ?? this.id,
        title: title ?? this.title,
        examCategoryId: examCategoryId ?? this.examCategoryId,
        examCategoryIds: examCategoryIds ?? this.examCategoryIds,
        type: type ?? this.type,
        status: status ?? this.status,
        ownerType: ownerType ?? this.ownerType,
        startDate: startDate ?? this.startDate,
        endDate: endDate ?? this.endDate,
        maxUser: maxUser ?? this.maxUser,
        isPrivate: isPrivate ?? this.isPrivate,
        rounds: rounds ?? this.rounds,
        numberOfQuestions: numberOfQuestions ?? this.numberOfQuestions,
        duration: duration ?? this.duration,
        playNow: playNow ?? this.playNow,
        formatType: formatType ?? this.formatType);
  }
}

@JsonSerializable(explicitToJson: true)
class CompetitionUserPublicDetailResource {
  CompetitionUserPublicDetailResource({
    this.id,
    this.competitionId,
    this.championCount,
    this.isOwner,
    this.invited,
    this.userInfo,
    this.userId,
  });

  factory CompetitionUserPublicDetailResource.fromJson(
          Map<String, dynamic> json) =>
      _$CompetitionUserPublicDetailResourceFromJson(json);

  @JsonKey(name: 'id', includeIfNull: true)
  final int? id;
  @JsonKey(name: 'competitionId', includeIfNull: true)
  final int? competitionId;
  @JsonKey(name: 'championCount', includeIfNull: true)
  final int? championCount;
  @JsonKey(name: 'isOwner', includeIfNull: true)
  final bool? isOwner;
  @JsonKey(name: 'invited', includeIfNull: true)
  final bool? invited;
  @JsonKey(name: 'userInfo', includeIfNull: true)
  final SimpleUserEntity? userInfo;
  @JsonKey(name: 'userId', includeIfNull: true)
  final int? userId;
  static const fromJsonFactory = _$CompetitionUserPublicDetailResourceFromJson;
  static const toJsonFactory = _$CompetitionUserPublicDetailResourceToJson;
  Map<String, dynamic> toJson() =>
      _$CompetitionUserPublicDetailResourceToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is CompetitionUserPublicDetailResource &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.competitionId, competitionId) ||
                const DeepCollectionEquality()
                    .equals(other.competitionId, competitionId)) &&
            (identical(other.championCount, championCount) ||
                const DeepCollectionEquality()
                    .equals(other.championCount, championCount)) &&
            (identical(other.isOwner, isOwner) ||
                const DeepCollectionEquality()
                    .equals(other.isOwner, isOwner)) &&
            (identical(other.invited, invited) ||
                const DeepCollectionEquality()
                    .equals(other.invited, invited)) &&
            (identical(other.userInfo, userInfo) ||
                const DeepCollectionEquality()
                    .equals(other.userInfo, userInfo)) &&
            (identical(other.userId, userId) ||
                const DeepCollectionEquality().equals(other.userId, userId)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(competitionId) ^
      const DeepCollectionEquality().hash(championCount) ^
      const DeepCollectionEquality().hash(isOwner) ^
      const DeepCollectionEquality().hash(invited) ^
      const DeepCollectionEquality().hash(userInfo) ^
      const DeepCollectionEquality().hash(userId) ^
      runtimeType.hashCode;
}

extension $CompetitionUserPublicDetailResourceExtension
    on CompetitionUserPublicDetailResource {
  CompetitionUserPublicDetailResource copyWith(
      {int? id,
      int? competitionId,
      int? championCount,
      bool? isOwner,
      bool? invited,
      SimpleUserEntity? userInfo,
      int? userId}) {
    return CompetitionUserPublicDetailResource(
        id: id ?? this.id,
        competitionId: competitionId ?? this.competitionId,
        championCount: championCount ?? this.championCount,
        isOwner: isOwner ?? this.isOwner,
        invited: invited ?? this.invited,
        userInfo: userInfo ?? this.userInfo,
        userId: userId ?? this.userId);
  }
}

@JsonSerializable(explicitToJson: true)
class CompetitionUserPublicDetailResourceFilterResult {
  CompetitionUserPublicDetailResourceFilterResult({
    this.totalRows,
    this.data,
  });

  factory CompetitionUserPublicDetailResourceFilterResult.fromJson(
          Map<String, dynamic> json) =>
      _$CompetitionUserPublicDetailResourceFilterResultFromJson(json);

  @JsonKey(name: 'totalRows', includeIfNull: true)
  final int? totalRows;
  @JsonKey(
      name: 'data',
      includeIfNull: true,
      defaultValue: <CompetitionUserPublicDetailResource>[])
  final List<CompetitionUserPublicDetailResource>? data;
  static const fromJsonFactory =
      _$CompetitionUserPublicDetailResourceFilterResultFromJson;
  static const toJsonFactory =
      _$CompetitionUserPublicDetailResourceFilterResultToJson;
  Map<String, dynamic> toJson() =>
      _$CompetitionUserPublicDetailResourceFilterResultToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is CompetitionUserPublicDetailResourceFilterResult &&
            (identical(other.totalRows, totalRows) ||
                const DeepCollectionEquality()
                    .equals(other.totalRows, totalRows)) &&
            (identical(other.data, data) ||
                const DeepCollectionEquality().equals(other.data, data)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(totalRows) ^
      const DeepCollectionEquality().hash(data) ^
      runtimeType.hashCode;
}

extension $CompetitionUserPublicDetailResourceFilterResultExtension
    on CompetitionUserPublicDetailResourceFilterResult {
  CompetitionUserPublicDetailResourceFilterResult copyWith(
      {int? totalRows, List<CompetitionUserPublicDetailResource>? data}) {
    return CompetitionUserPublicDetailResourceFilterResult(
        totalRows: totalRows ?? this.totalRows, data: data ?? this.data);
  }
}

@JsonSerializable(explicitToJson: true)
class CompetitionUserPublicResource {
  CompetitionUserPublicResource({
    this.id,
    this.competitionRoundId,
    this.status,
    this.competitionUserCount,
    this.listUserInCompetitionIds,
    this.ownerType,
    this.startDate,
    this.endDate,
    this.maxUser,
    this.isPrivate,
    this.typeName,
    this.statusName,
    this.listUserInCompetition,
    this.title,
    this.propertyDetailName,
    this.examIds,
    this.formatType,
    this.duration,
    this.rank,
    this.totalMark,
    this.userStatus,
    this.userStatusName,
    this.roundCount,
    this.examCategoryId,
    this.examCategoryName,
  });

  factory CompetitionUserPublicResource.fromJson(Map<String, dynamic> json) =>
      _$CompetitionUserPublicResourceFromJson(json);

  @JsonKey(name: 'id', includeIfNull: true)
  final int? id;
  @JsonKey(name: 'competitionRoundId', includeIfNull: true)
  final int? competitionRoundId;
  @JsonKey(name: 'status', includeIfNull: true)
  final int? status;
  @JsonKey(name: 'competitionUserCount', includeIfNull: true)
  final int? competitionUserCount;
  @JsonKey(
      name: 'listUserInCompetitionIds',
      includeIfNull: true,
      defaultValue: <int>[])
  final List<int>? listUserInCompetitionIds;
  @JsonKey(name: 'ownerType', includeIfNull: true)
  final int? ownerType;
  @JsonKey(name: 'startDate', includeIfNull: true)
  final DateTime? startDate;
  @JsonKey(name: 'endDate', includeIfNull: true)
  final DateTime? endDate;
  @JsonKey(name: 'maxUser', includeIfNull: true)
  final int? maxUser;
  @JsonKey(name: 'isPrivate', includeIfNull: true)
  final bool? isPrivate;
  @JsonKey(name: 'typeName', includeIfNull: true, defaultValue: '')
  final String? typeName;
  @JsonKey(name: 'statusName', includeIfNull: true, defaultValue: '')
  final String? statusName;
  @JsonKey(
      name: 'listUserInCompetition',
      includeIfNull: true,
      defaultValue: <SimpleUserEntity>[])
  final List<SimpleUserEntity>? listUserInCompetition;
  @JsonKey(name: 'title', includeIfNull: true, defaultValue: '')
  final String? title;
  @JsonKey(
      name: 'propertyDetailName', includeIfNull: true, defaultValue: <String>[])
  final List<String>? propertyDetailName;
  @JsonKey(name: 'examIds', includeIfNull: true, defaultValue: <int>[])
  final List<int>? examIds;
  @JsonKey(name: 'formatType', includeIfNull: true)
  final int? formatType;
  @JsonKey(name: 'duration', includeIfNull: true)
  final double? duration;
  @JsonKey(name: 'rank', includeIfNull: true)
  final int? rank;
  @JsonKey(name: 'totalMark', includeIfNull: true)
  final double? totalMark;
  @JsonKey(name: 'userStatus', includeIfNull: true)
  final int? userStatus;
  @JsonKey(name: 'userStatusName', includeIfNull: true, defaultValue: '')
  final String? userStatusName;
  @JsonKey(name: 'roundCount', includeIfNull: true)
  final int? roundCount;
  @JsonKey(name: 'examCategoryId', includeIfNull: true)
  final int? examCategoryId;
  @JsonKey(name: 'examCategoryName', includeIfNull: true, defaultValue: '')
  final String? examCategoryName;
  static const fromJsonFactory = _$CompetitionUserPublicResourceFromJson;
  static const toJsonFactory = _$CompetitionUserPublicResourceToJson;
  Map<String, dynamic> toJson() => _$CompetitionUserPublicResourceToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is CompetitionUserPublicResource &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.competitionRoundId, competitionRoundId) ||
                const DeepCollectionEquality()
                    .equals(other.competitionRoundId, competitionRoundId)) &&
            (identical(other.status, status) ||
                const DeepCollectionEquality().equals(other.status, status)) &&
            (identical(other.competitionUserCount, competitionUserCount) ||
                const DeepCollectionEquality().equals(
                    other.competitionUserCount, competitionUserCount)) &&
            (identical(other.listUserInCompetitionIds, listUserInCompetitionIds) ||
                const DeepCollectionEquality().equals(
                    other.listUserInCompetitionIds,
                    listUserInCompetitionIds)) &&
            (identical(other.ownerType, ownerType) ||
                const DeepCollectionEquality()
                    .equals(other.ownerType, ownerType)) &&
            (identical(other.startDate, startDate) ||
                const DeepCollectionEquality()
                    .equals(other.startDate, startDate)) &&
            (identical(other.endDate, endDate) ||
                const DeepCollectionEquality()
                    .equals(other.endDate, endDate)) &&
            (identical(other.maxUser, maxUser) ||
                const DeepCollectionEquality()
                    .equals(other.maxUser, maxUser)) &&
            (identical(other.isPrivate, isPrivate) ||
                const DeepCollectionEquality()
                    .equals(other.isPrivate, isPrivate)) &&
            (identical(other.typeName, typeName) ||
                const DeepCollectionEquality()
                    .equals(other.typeName, typeName)) &&
            (identical(other.statusName, statusName) ||
                const DeepCollectionEquality()
                    .equals(other.statusName, statusName)) &&
            (identical(other.listUserInCompetition, listUserInCompetition) ||
                const DeepCollectionEquality().equals(
                    other.listUserInCompetition, listUserInCompetition)) &&
            (identical(other.title, title) ||
                const DeepCollectionEquality().equals(other.title, title)) &&
            (identical(other.propertyDetailName, propertyDetailName) ||
                const DeepCollectionEquality()
                    .equals(other.propertyDetailName, propertyDetailName)) &&
            (identical(other.examIds, examIds) ||
                const DeepCollectionEquality()
                    .equals(other.examIds, examIds)) &&
            (identical(other.formatType, formatType) ||
                const DeepCollectionEquality()
                    .equals(other.formatType, formatType)) &&
            (identical(other.duration, duration) ||
                const DeepCollectionEquality().equals(other.duration, duration)) &&
            (identical(other.rank, rank) || const DeepCollectionEquality().equals(other.rank, rank)) &&
            (identical(other.totalMark, totalMark) || const DeepCollectionEquality().equals(other.totalMark, totalMark)) &&
            (identical(other.userStatus, userStatus) || const DeepCollectionEquality().equals(other.userStatus, userStatus)) &&
            (identical(other.userStatusName, userStatusName) || const DeepCollectionEquality().equals(other.userStatusName, userStatusName)) &&
            (identical(other.roundCount, roundCount) || const DeepCollectionEquality().equals(other.roundCount, roundCount)) &&
            (identical(other.examCategoryId, examCategoryId) || const DeepCollectionEquality().equals(other.examCategoryId, examCategoryId)) &&
            (identical(other.examCategoryName, examCategoryName) || const DeepCollectionEquality().equals(other.examCategoryName, examCategoryName)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(competitionRoundId) ^
      const DeepCollectionEquality().hash(status) ^
      const DeepCollectionEquality().hash(competitionUserCount) ^
      const DeepCollectionEquality().hash(listUserInCompetitionIds) ^
      const DeepCollectionEquality().hash(ownerType) ^
      const DeepCollectionEquality().hash(startDate) ^
      const DeepCollectionEquality().hash(endDate) ^
      const DeepCollectionEquality().hash(maxUser) ^
      const DeepCollectionEquality().hash(isPrivate) ^
      const DeepCollectionEquality().hash(typeName) ^
      const DeepCollectionEquality().hash(statusName) ^
      const DeepCollectionEquality().hash(listUserInCompetition) ^
      const DeepCollectionEquality().hash(title) ^
      const DeepCollectionEquality().hash(propertyDetailName) ^
      const DeepCollectionEquality().hash(examIds) ^
      const DeepCollectionEquality().hash(formatType) ^
      const DeepCollectionEquality().hash(duration) ^
      const DeepCollectionEquality().hash(rank) ^
      const DeepCollectionEquality().hash(totalMark) ^
      const DeepCollectionEquality().hash(userStatus) ^
      const DeepCollectionEquality().hash(userStatusName) ^
      const DeepCollectionEquality().hash(roundCount) ^
      const DeepCollectionEquality().hash(examCategoryId) ^
      const DeepCollectionEquality().hash(examCategoryName) ^
      runtimeType.hashCode;
}

extension $CompetitionUserPublicResourceExtension
    on CompetitionUserPublicResource {
  CompetitionUserPublicResource copyWith(
      {int? id,
      int? competitionRoundId,
      int? status,
      int? competitionUserCount,
      List<int>? listUserInCompetitionIds,
      int? ownerType,
      DateTime? startDate,
      DateTime? endDate,
      int? maxUser,
      bool? isPrivate,
      String? typeName,
      String? statusName,
      List<SimpleUserEntity>? listUserInCompetition,
      String? title,
      List<String>? propertyDetailName,
      List<int>? examIds,
      int? formatType,
      double? duration,
      int? rank,
      double? totalMark,
      int? userStatus,
      String? userStatusName,
      int? roundCount,
      int? examCategoryId,
      String? examCategoryName}) {
    return CompetitionUserPublicResource(
        id: id ?? this.id,
        competitionRoundId: competitionRoundId ?? this.competitionRoundId,
        status: status ?? this.status,
        competitionUserCount: competitionUserCount ?? this.competitionUserCount,
        listUserInCompetitionIds:
            listUserInCompetitionIds ?? this.listUserInCompetitionIds,
        ownerType: ownerType ?? this.ownerType,
        startDate: startDate ?? this.startDate,
        endDate: endDate ?? this.endDate,
        maxUser: maxUser ?? this.maxUser,
        isPrivate: isPrivate ?? this.isPrivate,
        typeName: typeName ?? this.typeName,
        statusName: statusName ?? this.statusName,
        listUserInCompetition:
            listUserInCompetition ?? this.listUserInCompetition,
        title: title ?? this.title,
        propertyDetailName: propertyDetailName ?? this.propertyDetailName,
        examIds: examIds ?? this.examIds,
        formatType: formatType ?? this.formatType,
        duration: duration ?? this.duration,
        rank: rank ?? this.rank,
        totalMark: totalMark ?? this.totalMark,
        userStatus: userStatus ?? this.userStatus,
        userStatusName: userStatusName ?? this.userStatusName,
        roundCount: roundCount ?? this.roundCount,
        examCategoryId: examCategoryId ?? this.examCategoryId,
        examCategoryName: examCategoryName ?? this.examCategoryName);
  }
}

@JsonSerializable(explicitToJson: true)
class CompetitionUserPublicResourceFilterResult {
  CompetitionUserPublicResourceFilterResult({
    this.totalRows,
    this.data,
  });

  factory CompetitionUserPublicResourceFilterResult.fromJson(
          Map<String, dynamic> json) =>
      _$CompetitionUserPublicResourceFilterResultFromJson(json);

  @JsonKey(name: 'totalRows', includeIfNull: true)
  final int? totalRows;
  @JsonKey(
      name: 'data',
      includeIfNull: true,
      defaultValue: <CompetitionUserPublicResource>[])
  final List<CompetitionUserPublicResource>? data;
  static const fromJsonFactory =
      _$CompetitionUserPublicResourceFilterResultFromJson;
  static const toJsonFactory =
      _$CompetitionUserPublicResourceFilterResultToJson;
  Map<String, dynamic> toJson() =>
      _$CompetitionUserPublicResourceFilterResultToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is CompetitionUserPublicResourceFilterResult &&
            (identical(other.totalRows, totalRows) ||
                const DeepCollectionEquality()
                    .equals(other.totalRows, totalRows)) &&
            (identical(other.data, data) ||
                const DeepCollectionEquality().equals(other.data, data)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(totalRows) ^
      const DeepCollectionEquality().hash(data) ^
      runtimeType.hashCode;
}

extension $CompetitionUserPublicResourceFilterResultExtension
    on CompetitionUserPublicResourceFilterResult {
  CompetitionUserPublicResourceFilterResult copyWith(
      {int? totalRows, List<CompetitionUserPublicResource>? data}) {
    return CompetitionUserPublicResourceFilterResult(
        totalRows: totalRows ?? this.totalRows, data: data ?? this.data);
  }
}

@JsonSerializable(explicitToJson: true)
class CompetitionUserRankingResource {
  CompetitionUserRankingResource({
    this.userInfo,
    this.mark,
    this.duration,
    this.rank,
  });

  factory CompetitionUserRankingResource.fromJson(Map<String, dynamic> json) =>
      _$CompetitionUserRankingResourceFromJson(json);

  @JsonKey(name: 'userInfo', includeIfNull: true)
  final SimpleUserEntity? userInfo;
  @JsonKey(name: 'mark', includeIfNull: true)
  final double? mark;
  @JsonKey(name: 'duration', includeIfNull: true)
  final int? duration;
  @JsonKey(name: 'rank', includeIfNull: true)
  final int? rank;
  static const fromJsonFactory = _$CompetitionUserRankingResourceFromJson;
  static const toJsonFactory = _$CompetitionUserRankingResourceToJson;
  Map<String, dynamic> toJson() => _$CompetitionUserRankingResourceToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is CompetitionUserRankingResource &&
            (identical(other.userInfo, userInfo) ||
                const DeepCollectionEquality()
                    .equals(other.userInfo, userInfo)) &&
            (identical(other.mark, mark) ||
                const DeepCollectionEquality().equals(other.mark, mark)) &&
            (identical(other.duration, duration) ||
                const DeepCollectionEquality()
                    .equals(other.duration, duration)) &&
            (identical(other.rank, rank) ||
                const DeepCollectionEquality().equals(other.rank, rank)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(userInfo) ^
      const DeepCollectionEquality().hash(mark) ^
      const DeepCollectionEquality().hash(duration) ^
      const DeepCollectionEquality().hash(rank) ^
      runtimeType.hashCode;
}

extension $CompetitionUserRankingResourceExtension
    on CompetitionUserRankingResource {
  CompetitionUserRankingResource copyWith(
      {SimpleUserEntity? userInfo, double? mark, int? duration, int? rank}) {
    return CompetitionUserRankingResource(
        userInfo: userInfo ?? this.userInfo,
        mark: mark ?? this.mark,
        duration: duration ?? this.duration,
        rank: rank ?? this.rank);
  }
}

@JsonSerializable(explicitToJson: true)
class CompetitionUsersResultResource {
  CompetitionUsersResultResource({
    this.usersResult,
    this.roundCount,
  });

  factory CompetitionUsersResultResource.fromJson(Map<String, dynamic> json) =>
      _$CompetitionUsersResultResourceFromJson(json);

  @JsonKey(
      name: 'usersResult',
      includeIfNull: true,
      defaultValue: <CompetitionUserRankingResource>[])
  final List<CompetitionUserRankingResource>? usersResult;
  @JsonKey(name: 'roundCount', includeIfNull: true)
  final int? roundCount;
  static const fromJsonFactory = _$CompetitionUsersResultResourceFromJson;
  static const toJsonFactory = _$CompetitionUsersResultResourceToJson;
  Map<String, dynamic> toJson() => _$CompetitionUsersResultResourceToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is CompetitionUsersResultResource &&
            (identical(other.usersResult, usersResult) ||
                const DeepCollectionEquality()
                    .equals(other.usersResult, usersResult)) &&
            (identical(other.roundCount, roundCount) ||
                const DeepCollectionEquality()
                    .equals(other.roundCount, roundCount)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(usersResult) ^
      const DeepCollectionEquality().hash(roundCount) ^
      runtimeType.hashCode;
}

extension $CompetitionUsersResultResourceExtension
    on CompetitionUsersResultResource {
  CompetitionUsersResultResource copyWith(
      {List<CompetitionUserRankingResource>? usersResult, int? roundCount}) {
    return CompetitionUsersResultResource(
        usersResult: usersResult ?? this.usersResult,
        roundCount: roundCount ?? this.roundCount);
  }
}

@JsonSerializable(explicitToJson: true)
class CompettionResultResource {
  CompettionResultResource({
    this.id,
    this.title,
    this.formatType,
    this.usersResult,
    this.listRounds,
    this.roundCount,
  });

  factory CompettionResultResource.fromJson(Map<String, dynamic> json) =>
      _$CompettionResultResourceFromJson(json);

  @JsonKey(name: 'id', includeIfNull: true)
  final int? id;
  @JsonKey(name: 'title', includeIfNull: true, defaultValue: '')
  final String? title;
  @JsonKey(name: 'formatType', includeIfNull: true)
  final int? formatType;
  @JsonKey(name: 'usersResult', includeIfNull: true)
  final CompetitionUserRankingResource? usersResult;
  @JsonKey(
      name: 'listRounds',
      includeIfNull: true,
      defaultValue: <CompettionRoundInfoResource>[])
  final List<CompettionRoundInfoResource>? listRounds;
  @JsonKey(name: 'roundCount', includeIfNull: true)
  final int? roundCount;
  static const fromJsonFactory = _$CompettionResultResourceFromJson;
  static const toJsonFactory = _$CompettionResultResourceToJson;
  Map<String, dynamic> toJson() => _$CompettionResultResourceToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is CompettionResultResource &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.title, title) ||
                const DeepCollectionEquality().equals(other.title, title)) &&
            (identical(other.formatType, formatType) ||
                const DeepCollectionEquality()
                    .equals(other.formatType, formatType)) &&
            (identical(other.usersResult, usersResult) ||
                const DeepCollectionEquality()
                    .equals(other.usersResult, usersResult)) &&
            (identical(other.listRounds, listRounds) ||
                const DeepCollectionEquality()
                    .equals(other.listRounds, listRounds)) &&
            (identical(other.roundCount, roundCount) ||
                const DeepCollectionEquality()
                    .equals(other.roundCount, roundCount)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(title) ^
      const DeepCollectionEquality().hash(formatType) ^
      const DeepCollectionEquality().hash(usersResult) ^
      const DeepCollectionEquality().hash(listRounds) ^
      const DeepCollectionEquality().hash(roundCount) ^
      runtimeType.hashCode;
}

extension $CompettionResultResourceExtension on CompettionResultResource {
  CompettionResultResource copyWith(
      {int? id,
      String? title,
      int? formatType,
      CompetitionUserRankingResource? usersResult,
      List<CompettionRoundInfoResource>? listRounds,
      int? roundCount}) {
    return CompettionResultResource(
        id: id ?? this.id,
        title: title ?? this.title,
        formatType: formatType ?? this.formatType,
        usersResult: usersResult ?? this.usersResult,
        listRounds: listRounds ?? this.listRounds,
        roundCount: roundCount ?? this.roundCount);
  }
}

@JsonSerializable(explicitToJson: true)
class CompettionRoundInfoResource {
  CompettionRoundInfoResource({
    this.id,
    this.title,
  });

  factory CompettionRoundInfoResource.fromJson(Map<String, dynamic> json) =>
      _$CompettionRoundInfoResourceFromJson(json);

  @JsonKey(name: 'id', includeIfNull: true)
  final int? id;
  @JsonKey(name: 'title', includeIfNull: true, defaultValue: '')
  final String? title;
  static const fromJsonFactory = _$CompettionRoundInfoResourceFromJson;
  static const toJsonFactory = _$CompettionRoundInfoResourceToJson;
  Map<String, dynamic> toJson() => _$CompettionRoundInfoResourceToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is CompettionRoundInfoResource &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.title, title) ||
                const DeepCollectionEquality().equals(other.title, title)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(title) ^
      runtimeType.hashCode;
}

extension $CompettionRoundInfoResourceExtension on CompettionRoundInfoResource {
  CompettionRoundInfoResource copyWith({int? id, String? title}) {
    return CompettionRoundInfoResource(
        id: id ?? this.id, title: title ?? this.title);
  }
}

@JsonSerializable(explicitToJson: true)
class ConstructorInfo {
  ConstructorInfo({
    this.name,
    this.declaringType,
    this.reflectedType,
    this.module,
    this.customAttributes,
    this.isCollectible,
    this.metadataToken,
    this.attributes,
    this.methodImplementationFlags,
    this.callingConvention,
    this.isAbstract,
    this.isConstructor,
    this.isFinal,
    this.isHideBySig,
    this.isSpecialName,
    this.isStatic,
    this.isVirtual,
    this.isAssembly,
    this.isFamily,
    this.isFamilyAndAssembly,
    this.isFamilyOrAssembly,
    this.isPrivate,
    this.isPublic,
    this.isConstructedGenericMethod,
    this.isGenericMethod,
    this.isGenericMethodDefinition,
    this.containsGenericParameters,
    this.methodHandle,
    this.isSecurityCritical,
    this.isSecuritySafeCritical,
    this.isSecurityTransparent,
    this.memberType,
  });

  factory ConstructorInfo.fromJson(Map<String, dynamic> json) =>
      _$ConstructorInfoFromJson(json);

  @JsonKey(name: 'name', includeIfNull: true, defaultValue: '')
  final String? name;
  @JsonKey(name: 'declaringType', includeIfNull: true)
  final Type? declaringType;
  @JsonKey(name: 'reflectedType', includeIfNull: true)
  final Type? reflectedType;
  @JsonKey(name: 'module', includeIfNull: true)
  final Module? module;
  @JsonKey(
      name: 'customAttributes',
      includeIfNull: true,
      defaultValue: <CustomAttributeData>[])
  final List<CustomAttributeData>? customAttributes;
  @JsonKey(name: 'isCollectible', includeIfNull: true)
  final bool? isCollectible;
  @JsonKey(name: 'metadataToken', includeIfNull: true)
  final int? metadataToken;
  @JsonKey(
      name: 'attributes',
      includeIfNull: true,
      toJson: methodAttributesToJson,
      fromJson: methodAttributesFromJson)
  final enums.MethodAttributes? attributes;
  @JsonKey(
      name: 'methodImplementationFlags',
      includeIfNull: true,
      toJson: methodImplAttributesToJson,
      fromJson: methodImplAttributesFromJson)
  final enums.MethodImplAttributes? methodImplementationFlags;
  @JsonKey(
      name: 'callingConvention',
      includeIfNull: true,
      toJson: callingConventionsToJson,
      fromJson: callingConventionsFromJson)
  final enums.CallingConventions? callingConvention;
  @JsonKey(name: 'isAbstract', includeIfNull: true)
  final bool? isAbstract;
  @JsonKey(name: 'isConstructor', includeIfNull: true)
  final bool? isConstructor;
  @JsonKey(name: 'isFinal', includeIfNull: true)
  final bool? isFinal;
  @JsonKey(name: 'isHideBySig', includeIfNull: true)
  final bool? isHideBySig;
  @JsonKey(name: 'isSpecialName', includeIfNull: true)
  final bool? isSpecialName;
  @JsonKey(name: 'isStatic', includeIfNull: true)
  final bool? isStatic;
  @JsonKey(name: 'isVirtual', includeIfNull: true)
  final bool? isVirtual;
  @JsonKey(name: 'isAssembly', includeIfNull: true)
  final bool? isAssembly;
  @JsonKey(name: 'isFamily', includeIfNull: true)
  final bool? isFamily;
  @JsonKey(name: 'isFamilyAndAssembly', includeIfNull: true)
  final bool? isFamilyAndAssembly;
  @JsonKey(name: 'isFamilyOrAssembly', includeIfNull: true)
  final bool? isFamilyOrAssembly;
  @JsonKey(name: 'isPrivate', includeIfNull: true)
  final bool? isPrivate;
  @JsonKey(name: 'isPublic', includeIfNull: true)
  final bool? isPublic;
  @JsonKey(name: 'isConstructedGenericMethod', includeIfNull: true)
  final bool? isConstructedGenericMethod;
  @JsonKey(name: 'isGenericMethod', includeIfNull: true)
  final bool? isGenericMethod;
  @JsonKey(name: 'isGenericMethodDefinition', includeIfNull: true)
  final bool? isGenericMethodDefinition;
  @JsonKey(name: 'containsGenericParameters', includeIfNull: true)
  final bool? containsGenericParameters;
  @JsonKey(name: 'methodHandle', includeIfNull: true)
  final RuntimeMethodHandle? methodHandle;
  @JsonKey(name: 'isSecurityCritical', includeIfNull: true)
  final bool? isSecurityCritical;
  @JsonKey(name: 'isSecuritySafeCritical', includeIfNull: true)
  final bool? isSecuritySafeCritical;
  @JsonKey(name: 'isSecurityTransparent', includeIfNull: true)
  final bool? isSecurityTransparent;
  @JsonKey(
      name: 'memberType',
      includeIfNull: true,
      toJson: memberTypesToJson,
      fromJson: memberTypesFromJson)
  final enums.MemberTypes? memberType;
  static const fromJsonFactory = _$ConstructorInfoFromJson;
  static const toJsonFactory = _$ConstructorInfoToJson;
  Map<String, dynamic> toJson() => _$ConstructorInfoToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ConstructorInfo &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.declaringType, declaringType) ||
                const DeepCollectionEquality()
                    .equals(other.declaringType, declaringType)) &&
            (identical(other.reflectedType, reflectedType) ||
                const DeepCollectionEquality()
                    .equals(other.reflectedType, reflectedType)) &&
            (identical(other.module, module) ||
                const DeepCollectionEquality().equals(other.module, module)) &&
            (identical(other.customAttributes, customAttributes) ||
                const DeepCollectionEquality()
                    .equals(other.customAttributes, customAttributes)) &&
            (identical(other.isCollectible, isCollectible) ||
                const DeepCollectionEquality()
                    .equals(other.isCollectible, isCollectible)) &&
            (identical(other.metadataToken, metadataToken) ||
                const DeepCollectionEquality()
                    .equals(other.metadataToken, metadataToken)) &&
            (identical(other.attributes, attributes) ||
                const DeepCollectionEquality()
                    .equals(other.attributes, attributes)) &&
            (identical(other.methodImplementationFlags, methodImplementationFlags) ||
                const DeepCollectionEquality().equals(
                    other.methodImplementationFlags,
                    methodImplementationFlags)) &&
            (identical(other.callingConvention, callingConvention) ||
                const DeepCollectionEquality()
                    .equals(other.callingConvention, callingConvention)) &&
            (identical(other.isAbstract, isAbstract) ||
                const DeepCollectionEquality()
                    .equals(other.isAbstract, isAbstract)) &&
            (identical(other.isConstructor, isConstructor) ||
                const DeepCollectionEquality()
                    .equals(other.isConstructor, isConstructor)) &&
            (identical(other.isFinal, isFinal) ||
                const DeepCollectionEquality()
                    .equals(other.isFinal, isFinal)) &&
            (identical(other.isHideBySig, isHideBySig) ||
                const DeepCollectionEquality()
                    .equals(other.isHideBySig, isHideBySig)) &&
            (identical(other.isSpecialName, isSpecialName) ||
                const DeepCollectionEquality()
                    .equals(other.isSpecialName, isSpecialName)) &&
            (identical(other.isStatic, isStatic) ||
                const DeepCollectionEquality()
                    .equals(other.isStatic, isStatic)) &&
            (identical(other.isVirtual, isVirtual) ||
                const DeepCollectionEquality()
                    .equals(other.isVirtual, isVirtual)) &&
            (identical(other.isAssembly, isAssembly) ||
                const DeepCollectionEquality()
                    .equals(other.isAssembly, isAssembly)) &&
            (identical(other.isFamily, isFamily) ||
                const DeepCollectionEquality()
                    .equals(other.isFamily, isFamily)) &&
            (identical(other.isFamilyAndAssembly, isFamilyAndAssembly) || const DeepCollectionEquality().equals(other.isFamilyAndAssembly, isFamilyAndAssembly)) &&
            (identical(other.isFamilyOrAssembly, isFamilyOrAssembly) || const DeepCollectionEquality().equals(other.isFamilyOrAssembly, isFamilyOrAssembly)) &&
            (identical(other.isPrivate, isPrivate) || const DeepCollectionEquality().equals(other.isPrivate, isPrivate)) &&
            (identical(other.isPublic, isPublic) || const DeepCollectionEquality().equals(other.isPublic, isPublic)) &&
            (identical(other.isConstructedGenericMethod, isConstructedGenericMethod) || const DeepCollectionEquality().equals(other.isConstructedGenericMethod, isConstructedGenericMethod)) &&
            (identical(other.isGenericMethod, isGenericMethod) || const DeepCollectionEquality().equals(other.isGenericMethod, isGenericMethod)) &&
            (identical(other.isGenericMethodDefinition, isGenericMethodDefinition) || const DeepCollectionEquality().equals(other.isGenericMethodDefinition, isGenericMethodDefinition)) &&
            (identical(other.containsGenericParameters, containsGenericParameters) || const DeepCollectionEquality().equals(other.containsGenericParameters, containsGenericParameters)) &&
            (identical(other.methodHandle, methodHandle) || const DeepCollectionEquality().equals(other.methodHandle, methodHandle)) &&
            (identical(other.isSecurityCritical, isSecurityCritical) || const DeepCollectionEquality().equals(other.isSecurityCritical, isSecurityCritical)) &&
            (identical(other.isSecuritySafeCritical, isSecuritySafeCritical) || const DeepCollectionEquality().equals(other.isSecuritySafeCritical, isSecuritySafeCritical)) &&
            (identical(other.isSecurityTransparent, isSecurityTransparent) || const DeepCollectionEquality().equals(other.isSecurityTransparent, isSecurityTransparent)) &&
            (identical(other.memberType, memberType) || const DeepCollectionEquality().equals(other.memberType, memberType)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(declaringType) ^
      const DeepCollectionEquality().hash(reflectedType) ^
      const DeepCollectionEquality().hash(module) ^
      const DeepCollectionEquality().hash(customAttributes) ^
      const DeepCollectionEquality().hash(isCollectible) ^
      const DeepCollectionEquality().hash(metadataToken) ^
      const DeepCollectionEquality().hash(attributes) ^
      const DeepCollectionEquality().hash(methodImplementationFlags) ^
      const DeepCollectionEquality().hash(callingConvention) ^
      const DeepCollectionEquality().hash(isAbstract) ^
      const DeepCollectionEquality().hash(isConstructor) ^
      const DeepCollectionEquality().hash(isFinal) ^
      const DeepCollectionEquality().hash(isHideBySig) ^
      const DeepCollectionEquality().hash(isSpecialName) ^
      const DeepCollectionEquality().hash(isStatic) ^
      const DeepCollectionEquality().hash(isVirtual) ^
      const DeepCollectionEquality().hash(isAssembly) ^
      const DeepCollectionEquality().hash(isFamily) ^
      const DeepCollectionEquality().hash(isFamilyAndAssembly) ^
      const DeepCollectionEquality().hash(isFamilyOrAssembly) ^
      const DeepCollectionEquality().hash(isPrivate) ^
      const DeepCollectionEquality().hash(isPublic) ^
      const DeepCollectionEquality().hash(isConstructedGenericMethod) ^
      const DeepCollectionEquality().hash(isGenericMethod) ^
      const DeepCollectionEquality().hash(isGenericMethodDefinition) ^
      const DeepCollectionEquality().hash(containsGenericParameters) ^
      const DeepCollectionEquality().hash(methodHandle) ^
      const DeepCollectionEquality().hash(isSecurityCritical) ^
      const DeepCollectionEquality().hash(isSecuritySafeCritical) ^
      const DeepCollectionEquality().hash(isSecurityTransparent) ^
      const DeepCollectionEquality().hash(memberType) ^
      runtimeType.hashCode;
}

extension $ConstructorInfoExtension on ConstructorInfo {
  ConstructorInfo copyWith(
      {String? name,
      Type? declaringType,
      Type? reflectedType,
      Module? module,
      List<CustomAttributeData>? customAttributes,
      bool? isCollectible,
      int? metadataToken,
      enums.MethodAttributes? attributes,
      enums.MethodImplAttributes? methodImplementationFlags,
      enums.CallingConventions? callingConvention,
      bool? isAbstract,
      bool? isConstructor,
      bool? isFinal,
      bool? isHideBySig,
      bool? isSpecialName,
      bool? isStatic,
      bool? isVirtual,
      bool? isAssembly,
      bool? isFamily,
      bool? isFamilyAndAssembly,
      bool? isFamilyOrAssembly,
      bool? isPrivate,
      bool? isPublic,
      bool? isConstructedGenericMethod,
      bool? isGenericMethod,
      bool? isGenericMethodDefinition,
      bool? containsGenericParameters,
      RuntimeMethodHandle? methodHandle,
      bool? isSecurityCritical,
      bool? isSecuritySafeCritical,
      bool? isSecurityTransparent,
      enums.MemberTypes? memberType}) {
    return ConstructorInfo(
        name: name ?? this.name,
        declaringType: declaringType ?? this.declaringType,
        reflectedType: reflectedType ?? this.reflectedType,
        module: module ?? this.module,
        customAttributes: customAttributes ?? this.customAttributes,
        isCollectible: isCollectible ?? this.isCollectible,
        metadataToken: metadataToken ?? this.metadataToken,
        attributes: attributes ?? this.attributes,
        methodImplementationFlags:
            methodImplementationFlags ?? this.methodImplementationFlags,
        callingConvention: callingConvention ?? this.callingConvention,
        isAbstract: isAbstract ?? this.isAbstract,
        isConstructor: isConstructor ?? this.isConstructor,
        isFinal: isFinal ?? this.isFinal,
        isHideBySig: isHideBySig ?? this.isHideBySig,
        isSpecialName: isSpecialName ?? this.isSpecialName,
        isStatic: isStatic ?? this.isStatic,
        isVirtual: isVirtual ?? this.isVirtual,
        isAssembly: isAssembly ?? this.isAssembly,
        isFamily: isFamily ?? this.isFamily,
        isFamilyAndAssembly: isFamilyAndAssembly ?? this.isFamilyAndAssembly,
        isFamilyOrAssembly: isFamilyOrAssembly ?? this.isFamilyOrAssembly,
        isPrivate: isPrivate ?? this.isPrivate,
        isPublic: isPublic ?? this.isPublic,
        isConstructedGenericMethod:
            isConstructedGenericMethod ?? this.isConstructedGenericMethod,
        isGenericMethod: isGenericMethod ?? this.isGenericMethod,
        isGenericMethodDefinition:
            isGenericMethodDefinition ?? this.isGenericMethodDefinition,
        containsGenericParameters:
            containsGenericParameters ?? this.containsGenericParameters,
        methodHandle: methodHandle ?? this.methodHandle,
        isSecurityCritical: isSecurityCritical ?? this.isSecurityCritical,
        isSecuritySafeCritical:
            isSecuritySafeCritical ?? this.isSecuritySafeCritical,
        isSecurityTransparent:
            isSecurityTransparent ?? this.isSecurityTransparent,
        memberType: memberType ?? this.memberType);
  }
}

@JsonSerializable(explicitToJson: true)
class ContestCreateResource {
  ContestCreateResource({
    this.title,
    this.avatar,
    this.rule,
    this.organizer,
    this.startDate,
    this.endDate,
    this.status,
  });

  factory ContestCreateResource.fromJson(Map<String, dynamic> json) =>
      _$ContestCreateResourceFromJson(json);

  @JsonKey(name: 'title', includeIfNull: true, defaultValue: '')
  final String? title;
  @JsonKey(name: 'avatar', includeIfNull: true, defaultValue: '')
  final String? avatar;
  @JsonKey(name: 'rule', includeIfNull: true, defaultValue: '')
  final String? rule;
  @JsonKey(name: 'organizer', includeIfNull: true, defaultValue: '')
  final String? organizer;
  @JsonKey(name: 'startDate', includeIfNull: true)
  final DateTime? startDate;
  @JsonKey(name: 'endDate', includeIfNull: true)
  final DateTime? endDate;
  @JsonKey(name: 'status', includeIfNull: true)
  final int? status;
  static const fromJsonFactory = _$ContestCreateResourceFromJson;
  static const toJsonFactory = _$ContestCreateResourceToJson;
  Map<String, dynamic> toJson() => _$ContestCreateResourceToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ContestCreateResource &&
            (identical(other.title, title) ||
                const DeepCollectionEquality().equals(other.title, title)) &&
            (identical(other.avatar, avatar) ||
                const DeepCollectionEquality().equals(other.avatar, avatar)) &&
            (identical(other.rule, rule) ||
                const DeepCollectionEquality().equals(other.rule, rule)) &&
            (identical(other.organizer, organizer) ||
                const DeepCollectionEquality()
                    .equals(other.organizer, organizer)) &&
            (identical(other.startDate, startDate) ||
                const DeepCollectionEquality()
                    .equals(other.startDate, startDate)) &&
            (identical(other.endDate, endDate) ||
                const DeepCollectionEquality()
                    .equals(other.endDate, endDate)) &&
            (identical(other.status, status) ||
                const DeepCollectionEquality().equals(other.status, status)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(title) ^
      const DeepCollectionEquality().hash(avatar) ^
      const DeepCollectionEquality().hash(rule) ^
      const DeepCollectionEquality().hash(organizer) ^
      const DeepCollectionEquality().hash(startDate) ^
      const DeepCollectionEquality().hash(endDate) ^
      const DeepCollectionEquality().hash(status) ^
      runtimeType.hashCode;
}

extension $ContestCreateResourceExtension on ContestCreateResource {
  ContestCreateResource copyWith(
      {String? title,
      String? avatar,
      String? rule,
      String? organizer,
      DateTime? startDate,
      DateTime? endDate,
      int? status}) {
    return ContestCreateResource(
        title: title ?? this.title,
        avatar: avatar ?? this.avatar,
        rule: rule ?? this.rule,
        organizer: organizer ?? this.organizer,
        startDate: startDate ?? this.startDate,
        endDate: endDate ?? this.endDate,
        status: status ?? this.status);
  }
}

@JsonSerializable(explicitToJson: true)
class ContestResource {
  ContestResource({
    this.id,
    this.title,
    this.avatar,
    this.rule,
    this.organizer,
    this.startDate,
    this.endDate,
    this.status,
  });

  factory ContestResource.fromJson(Map<String, dynamic> json) =>
      _$ContestResourceFromJson(json);

  @JsonKey(name: 'id', includeIfNull: true)
  final int? id;
  @JsonKey(name: 'title', includeIfNull: true, defaultValue: '')
  final String? title;
  @JsonKey(name: 'avatar', includeIfNull: true, defaultValue: '')
  final String? avatar;
  @JsonKey(name: 'rule', includeIfNull: true, defaultValue: '')
  final String? rule;
  @JsonKey(name: 'organizer', includeIfNull: true, defaultValue: '')
  final String? organizer;
  @JsonKey(name: 'startDate', includeIfNull: true)
  final DateTime? startDate;
  @JsonKey(name: 'endDate', includeIfNull: true)
  final DateTime? endDate;
  @JsonKey(name: 'status', includeIfNull: true)
  final int? status;
  static const fromJsonFactory = _$ContestResourceFromJson;
  static const toJsonFactory = _$ContestResourceToJson;
  Map<String, dynamic> toJson() => _$ContestResourceToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ContestResource &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.title, title) ||
                const DeepCollectionEquality().equals(other.title, title)) &&
            (identical(other.avatar, avatar) ||
                const DeepCollectionEquality().equals(other.avatar, avatar)) &&
            (identical(other.rule, rule) ||
                const DeepCollectionEquality().equals(other.rule, rule)) &&
            (identical(other.organizer, organizer) ||
                const DeepCollectionEquality()
                    .equals(other.organizer, organizer)) &&
            (identical(other.startDate, startDate) ||
                const DeepCollectionEquality()
                    .equals(other.startDate, startDate)) &&
            (identical(other.endDate, endDate) ||
                const DeepCollectionEquality()
                    .equals(other.endDate, endDate)) &&
            (identical(other.status, status) ||
                const DeepCollectionEquality().equals(other.status, status)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(title) ^
      const DeepCollectionEquality().hash(avatar) ^
      const DeepCollectionEquality().hash(rule) ^
      const DeepCollectionEquality().hash(organizer) ^
      const DeepCollectionEquality().hash(startDate) ^
      const DeepCollectionEquality().hash(endDate) ^
      const DeepCollectionEquality().hash(status) ^
      runtimeType.hashCode;
}

extension $ContestResourceExtension on ContestResource {
  ContestResource copyWith(
      {int? id,
      String? title,
      String? avatar,
      String? rule,
      String? organizer,
      DateTime? startDate,
      DateTime? endDate,
      int? status}) {
    return ContestResource(
        id: id ?? this.id,
        title: title ?? this.title,
        avatar: avatar ?? this.avatar,
        rule: rule ?? this.rule,
        organizer: organizer ?? this.organizer,
        startDate: startDate ?? this.startDate,
        endDate: endDate ?? this.endDate,
        status: status ?? this.status);
  }
}

@JsonSerializable(explicitToJson: true)
class ContestResourceFilterResult {
  ContestResourceFilterResult({
    this.totalRows,
    this.data,
  });

  factory ContestResourceFilterResult.fromJson(Map<String, dynamic> json) =>
      _$ContestResourceFilterResultFromJson(json);

  @JsonKey(name: 'totalRows', includeIfNull: true)
  final int? totalRows;
  @JsonKey(name: 'data', includeIfNull: true, defaultValue: <ContestResource>[])
  final List<ContestResource>? data;
  static const fromJsonFactory = _$ContestResourceFilterResultFromJson;
  static const toJsonFactory = _$ContestResourceFilterResultToJson;
  Map<String, dynamic> toJson() => _$ContestResourceFilterResultToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ContestResourceFilterResult &&
            (identical(other.totalRows, totalRows) ||
                const DeepCollectionEquality()
                    .equals(other.totalRows, totalRows)) &&
            (identical(other.data, data) ||
                const DeepCollectionEquality().equals(other.data, data)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(totalRows) ^
      const DeepCollectionEquality().hash(data) ^
      runtimeType.hashCode;
}

extension $ContestResourceFilterResultExtension on ContestResourceFilterResult {
  ContestResourceFilterResult copyWith(
      {int? totalRows, List<ContestResource>? data}) {
    return ContestResourceFilterResult(
        totalRows: totalRows ?? this.totalRows, data: data ?? this.data);
  }
}

@JsonSerializable(explicitToJson: true)
class ContestSubmissionCreateResource {
  ContestSubmissionCreateResource({
    this.contestId,
    this.title,
    this.attachFiles,
    this.userId,
    this.status,
    this.note,
    this.content,
    this.isAdmin,
  });

  factory ContestSubmissionCreateResource.fromJson(Map<String, dynamic> json) =>
      _$ContestSubmissionCreateResourceFromJson(json);

  @JsonKey(name: 'contestId', includeIfNull: true)
  final int? contestId;
  @JsonKey(name: 'title', includeIfNull: true, defaultValue: '')
  final String? title;
  @JsonKey(name: 'attachFiles', includeIfNull: true, defaultValue: <String>[])
  final List<String>? attachFiles;
  @JsonKey(name: 'userId', includeIfNull: true)
  final int? userId;
  @JsonKey(name: 'status', includeIfNull: true)
  final int? status;
  @JsonKey(name: 'note', includeIfNull: true, defaultValue: '')
  final String? note;
  @JsonKey(name: 'content', includeIfNull: true, defaultValue: '')
  final String? content;
  @JsonKey(name: 'isAdmin', includeIfNull: true)
  final bool? isAdmin;
  static const fromJsonFactory = _$ContestSubmissionCreateResourceFromJson;
  static const toJsonFactory = _$ContestSubmissionCreateResourceToJson;
  Map<String, dynamic> toJson() =>
      _$ContestSubmissionCreateResourceToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ContestSubmissionCreateResource &&
            (identical(other.contestId, contestId) ||
                const DeepCollectionEquality()
                    .equals(other.contestId, contestId)) &&
            (identical(other.title, title) ||
                const DeepCollectionEquality().equals(other.title, title)) &&
            (identical(other.attachFiles, attachFiles) ||
                const DeepCollectionEquality()
                    .equals(other.attachFiles, attachFiles)) &&
            (identical(other.userId, userId) ||
                const DeepCollectionEquality().equals(other.userId, userId)) &&
            (identical(other.status, status) ||
                const DeepCollectionEquality().equals(other.status, status)) &&
            (identical(other.note, note) ||
                const DeepCollectionEquality().equals(other.note, note)) &&
            (identical(other.content, content) ||
                const DeepCollectionEquality()
                    .equals(other.content, content)) &&
            (identical(other.isAdmin, isAdmin) ||
                const DeepCollectionEquality().equals(other.isAdmin, isAdmin)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(contestId) ^
      const DeepCollectionEquality().hash(title) ^
      const DeepCollectionEquality().hash(attachFiles) ^
      const DeepCollectionEquality().hash(userId) ^
      const DeepCollectionEquality().hash(status) ^
      const DeepCollectionEquality().hash(note) ^
      const DeepCollectionEquality().hash(content) ^
      const DeepCollectionEquality().hash(isAdmin) ^
      runtimeType.hashCode;
}

extension $ContestSubmissionCreateResourceExtension
    on ContestSubmissionCreateResource {
  ContestSubmissionCreateResource copyWith(
      {int? contestId,
      String? title,
      List<String>? attachFiles,
      int? userId,
      int? status,
      String? note,
      String? content,
      bool? isAdmin}) {
    return ContestSubmissionCreateResource(
        contestId: contestId ?? this.contestId,
        title: title ?? this.title,
        attachFiles: attachFiles ?? this.attachFiles,
        userId: userId ?? this.userId,
        status: status ?? this.status,
        note: note ?? this.note,
        content: content ?? this.content,
        isAdmin: isAdmin ?? this.isAdmin);
  }
}

@JsonSerializable(explicitToJson: true)
class ContestSubmissionResource {
  ContestSubmissionResource({
    this.id,
    this.contestId,
    this.contestName,
    this.title,
    this.attachFiles,
    this.userId,
    this.userName,
    this.status,
    this.statusName,
    this.note,
    this.content,
    this.isAdmin,
  });

  factory ContestSubmissionResource.fromJson(Map<String, dynamic> json) =>
      _$ContestSubmissionResourceFromJson(json);

  @JsonKey(name: 'id', includeIfNull: true)
  final int? id;
  @JsonKey(name: 'contestId', includeIfNull: true)
  final int? contestId;
  @JsonKey(name: 'contestName', includeIfNull: true, defaultValue: '')
  final String? contestName;
  @JsonKey(name: 'title', includeIfNull: true, defaultValue: '')
  final String? title;
  @JsonKey(name: 'attachFiles', includeIfNull: true, defaultValue: <String>[])
  final List<String>? attachFiles;
  @JsonKey(name: 'userId', includeIfNull: true)
  final int? userId;
  @JsonKey(name: 'userName', includeIfNull: true, defaultValue: '')
  final String? userName;
  @JsonKey(name: 'status', includeIfNull: true)
  final int? status;
  @JsonKey(name: 'statusName', includeIfNull: true, defaultValue: '')
  final String? statusName;
  @JsonKey(name: 'note', includeIfNull: true, defaultValue: '')
  final String? note;
  @JsonKey(name: 'content', includeIfNull: true, defaultValue: '')
  final String? content;
  @JsonKey(name: 'isAdmin', includeIfNull: true)
  final bool? isAdmin;
  static const fromJsonFactory = _$ContestSubmissionResourceFromJson;
  static const toJsonFactory = _$ContestSubmissionResourceToJson;
  Map<String, dynamic> toJson() => _$ContestSubmissionResourceToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ContestSubmissionResource &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.contestId, contestId) ||
                const DeepCollectionEquality()
                    .equals(other.contestId, contestId)) &&
            (identical(other.contestName, contestName) ||
                const DeepCollectionEquality()
                    .equals(other.contestName, contestName)) &&
            (identical(other.title, title) ||
                const DeepCollectionEquality().equals(other.title, title)) &&
            (identical(other.attachFiles, attachFiles) ||
                const DeepCollectionEquality()
                    .equals(other.attachFiles, attachFiles)) &&
            (identical(other.userId, userId) ||
                const DeepCollectionEquality().equals(other.userId, userId)) &&
            (identical(other.userName, userName) ||
                const DeepCollectionEquality()
                    .equals(other.userName, userName)) &&
            (identical(other.status, status) ||
                const DeepCollectionEquality().equals(other.status, status)) &&
            (identical(other.statusName, statusName) ||
                const DeepCollectionEquality()
                    .equals(other.statusName, statusName)) &&
            (identical(other.note, note) ||
                const DeepCollectionEquality().equals(other.note, note)) &&
            (identical(other.content, content) ||
                const DeepCollectionEquality()
                    .equals(other.content, content)) &&
            (identical(other.isAdmin, isAdmin) ||
                const DeepCollectionEquality().equals(other.isAdmin, isAdmin)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(contestId) ^
      const DeepCollectionEquality().hash(contestName) ^
      const DeepCollectionEquality().hash(title) ^
      const DeepCollectionEquality().hash(attachFiles) ^
      const DeepCollectionEquality().hash(userId) ^
      const DeepCollectionEquality().hash(userName) ^
      const DeepCollectionEquality().hash(status) ^
      const DeepCollectionEquality().hash(statusName) ^
      const DeepCollectionEquality().hash(note) ^
      const DeepCollectionEquality().hash(content) ^
      const DeepCollectionEquality().hash(isAdmin) ^
      runtimeType.hashCode;
}

extension $ContestSubmissionResourceExtension on ContestSubmissionResource {
  ContestSubmissionResource copyWith(
      {int? id,
      int? contestId,
      String? contestName,
      String? title,
      List<String>? attachFiles,
      int? userId,
      String? userName,
      int? status,
      String? statusName,
      String? note,
      String? content,
      bool? isAdmin}) {
    return ContestSubmissionResource(
        id: id ?? this.id,
        contestId: contestId ?? this.contestId,
        contestName: contestName ?? this.contestName,
        title: title ?? this.title,
        attachFiles: attachFiles ?? this.attachFiles,
        userId: userId ?? this.userId,
        userName: userName ?? this.userName,
        status: status ?? this.status,
        statusName: statusName ?? this.statusName,
        note: note ?? this.note,
        content: content ?? this.content,
        isAdmin: isAdmin ?? this.isAdmin);
  }
}

@JsonSerializable(explicitToJson: true)
class ContestSubmissionResourceFilterResult {
  ContestSubmissionResourceFilterResult({
    this.totalRows,
    this.data,
  });

  factory ContestSubmissionResourceFilterResult.fromJson(
          Map<String, dynamic> json) =>
      _$ContestSubmissionResourceFilterResultFromJson(json);

  @JsonKey(name: 'totalRows', includeIfNull: true)
  final int? totalRows;
  @JsonKey(
      name: 'data',
      includeIfNull: true,
      defaultValue: <ContestSubmissionResource>[])
  final List<ContestSubmissionResource>? data;
  static const fromJsonFactory =
      _$ContestSubmissionResourceFilterResultFromJson;
  static const toJsonFactory = _$ContestSubmissionResourceFilterResultToJson;
  Map<String, dynamic> toJson() =>
      _$ContestSubmissionResourceFilterResultToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ContestSubmissionResourceFilterResult &&
            (identical(other.totalRows, totalRows) ||
                const DeepCollectionEquality()
                    .equals(other.totalRows, totalRows)) &&
            (identical(other.data, data) ||
                const DeepCollectionEquality().equals(other.data, data)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(totalRows) ^
      const DeepCollectionEquality().hash(data) ^
      runtimeType.hashCode;
}

extension $ContestSubmissionResourceFilterResultExtension
    on ContestSubmissionResourceFilterResult {
  ContestSubmissionResourceFilterResult copyWith(
      {int? totalRows, List<ContestSubmissionResource>? data}) {
    return ContestSubmissionResourceFilterResult(
        totalRows: totalRows ?? this.totalRows, data: data ?? this.data);
  }
}

@JsonSerializable(explicitToJson: true)
class ContestSubmissionUpdateResource {
  ContestSubmissionUpdateResource({
    this.id,
    this.contestId,
    this.title,
    this.attachFiles,
    this.userId,
    this.status,
    this.note,
    this.content,
    this.isAdmin,
  });

  factory ContestSubmissionUpdateResource.fromJson(Map<String, dynamic> json) =>
      _$ContestSubmissionUpdateResourceFromJson(json);

  @JsonKey(name: 'id', includeIfNull: true)
  final int? id;
  @JsonKey(name: 'contestId', includeIfNull: true)
  final int? contestId;
  @JsonKey(name: 'title', includeIfNull: true, defaultValue: '')
  final String? title;
  @JsonKey(name: 'attachFiles', includeIfNull: true, defaultValue: <String>[])
  final List<String>? attachFiles;
  @JsonKey(name: 'userId', includeIfNull: true)
  final int? userId;
  @JsonKey(name: 'status', includeIfNull: true)
  final int? status;
  @JsonKey(name: 'note', includeIfNull: true, defaultValue: '')
  final String? note;
  @JsonKey(name: 'content', includeIfNull: true, defaultValue: '')
  final String? content;
  @JsonKey(name: 'isAdmin', includeIfNull: true)
  final bool? isAdmin;
  static const fromJsonFactory = _$ContestSubmissionUpdateResourceFromJson;
  static const toJsonFactory = _$ContestSubmissionUpdateResourceToJson;
  Map<String, dynamic> toJson() =>
      _$ContestSubmissionUpdateResourceToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ContestSubmissionUpdateResource &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.contestId, contestId) ||
                const DeepCollectionEquality()
                    .equals(other.contestId, contestId)) &&
            (identical(other.title, title) ||
                const DeepCollectionEquality().equals(other.title, title)) &&
            (identical(other.attachFiles, attachFiles) ||
                const DeepCollectionEquality()
                    .equals(other.attachFiles, attachFiles)) &&
            (identical(other.userId, userId) ||
                const DeepCollectionEquality().equals(other.userId, userId)) &&
            (identical(other.status, status) ||
                const DeepCollectionEquality().equals(other.status, status)) &&
            (identical(other.note, note) ||
                const DeepCollectionEquality().equals(other.note, note)) &&
            (identical(other.content, content) ||
                const DeepCollectionEquality()
                    .equals(other.content, content)) &&
            (identical(other.isAdmin, isAdmin) ||
                const DeepCollectionEquality().equals(other.isAdmin, isAdmin)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(contestId) ^
      const DeepCollectionEquality().hash(title) ^
      const DeepCollectionEquality().hash(attachFiles) ^
      const DeepCollectionEquality().hash(userId) ^
      const DeepCollectionEquality().hash(status) ^
      const DeepCollectionEquality().hash(note) ^
      const DeepCollectionEquality().hash(content) ^
      const DeepCollectionEquality().hash(isAdmin) ^
      runtimeType.hashCode;
}

extension $ContestSubmissionUpdateResourceExtension
    on ContestSubmissionUpdateResource {
  ContestSubmissionUpdateResource copyWith(
      {int? id,
      int? contestId,
      String? title,
      List<String>? attachFiles,
      int? userId,
      int? status,
      String? note,
      String? content,
      bool? isAdmin}) {
    return ContestSubmissionUpdateResource(
        id: id ?? this.id,
        contestId: contestId ?? this.contestId,
        title: title ?? this.title,
        attachFiles: attachFiles ?? this.attachFiles,
        userId: userId ?? this.userId,
        status: status ?? this.status,
        note: note ?? this.note,
        content: content ?? this.content,
        isAdmin: isAdmin ?? this.isAdmin);
  }
}

@JsonSerializable(explicitToJson: true)
class ContestUpdateResource {
  ContestUpdateResource({
    this.id,
    this.title,
    this.avatar,
    this.rule,
    this.organizer,
    this.startDate,
    this.endDate,
    this.status,
  });

  factory ContestUpdateResource.fromJson(Map<String, dynamic> json) =>
      _$ContestUpdateResourceFromJson(json);

  @JsonKey(name: 'id', includeIfNull: true)
  final int? id;
  @JsonKey(name: 'title', includeIfNull: true, defaultValue: '')
  final String? title;
  @JsonKey(name: 'avatar', includeIfNull: true, defaultValue: '')
  final String? avatar;
  @JsonKey(name: 'rule', includeIfNull: true, defaultValue: '')
  final String? rule;
  @JsonKey(name: 'organizer', includeIfNull: true, defaultValue: '')
  final String? organizer;
  @JsonKey(name: 'startDate', includeIfNull: true)
  final DateTime? startDate;
  @JsonKey(name: 'endDate', includeIfNull: true)
  final DateTime? endDate;
  @JsonKey(name: 'status', includeIfNull: true)
  final int? status;
  static const fromJsonFactory = _$ContestUpdateResourceFromJson;
  static const toJsonFactory = _$ContestUpdateResourceToJson;
  Map<String, dynamic> toJson() => _$ContestUpdateResourceToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ContestUpdateResource &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.title, title) ||
                const DeepCollectionEquality().equals(other.title, title)) &&
            (identical(other.avatar, avatar) ||
                const DeepCollectionEquality().equals(other.avatar, avatar)) &&
            (identical(other.rule, rule) ||
                const DeepCollectionEquality().equals(other.rule, rule)) &&
            (identical(other.organizer, organizer) ||
                const DeepCollectionEquality()
                    .equals(other.organizer, organizer)) &&
            (identical(other.startDate, startDate) ||
                const DeepCollectionEquality()
                    .equals(other.startDate, startDate)) &&
            (identical(other.endDate, endDate) ||
                const DeepCollectionEquality()
                    .equals(other.endDate, endDate)) &&
            (identical(other.status, status) ||
                const DeepCollectionEquality().equals(other.status, status)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(title) ^
      const DeepCollectionEquality().hash(avatar) ^
      const DeepCollectionEquality().hash(rule) ^
      const DeepCollectionEquality().hash(organizer) ^
      const DeepCollectionEquality().hash(startDate) ^
      const DeepCollectionEquality().hash(endDate) ^
      const DeepCollectionEquality().hash(status) ^
      runtimeType.hashCode;
}

extension $ContestUpdateResourceExtension on ContestUpdateResource {
  ContestUpdateResource copyWith(
      {int? id,
      String? title,
      String? avatar,
      String? rule,
      String? organizer,
      DateTime? startDate,
      DateTime? endDate,
      int? status}) {
    return ContestUpdateResource(
        id: id ?? this.id,
        title: title ?? this.title,
        avatar: avatar ?? this.avatar,
        rule: rule ?? this.rule,
        organizer: organizer ?? this.organizer,
        startDate: startDate ?? this.startDate,
        endDate: endDate ?? this.endDate,
        status: status ?? this.status);
  }
}

@JsonSerializable(explicitToJson: true)
class CustomAttributeData {
  CustomAttributeData({
    this.attributeType,
    this.constructor,
    this.constructorArguments,
    this.namedArguments,
  });

  factory CustomAttributeData.fromJson(Map<String, dynamic> json) =>
      _$CustomAttributeDataFromJson(json);

  @JsonKey(name: 'attributeType', includeIfNull: true)
  final Type? attributeType;
  @JsonKey(name: 'constructor', includeIfNull: true)
  final ConstructorInfo? constructor;
  @JsonKey(
      name: 'constructorArguments',
      includeIfNull: true,
      defaultValue: <CustomAttributeTypedArgument>[])
  final List<CustomAttributeTypedArgument>? constructorArguments;
  @JsonKey(
      name: 'namedArguments',
      includeIfNull: true,
      defaultValue: <CustomAttributeNamedArgument>[])
  final List<CustomAttributeNamedArgument>? namedArguments;
  static const fromJsonFactory = _$CustomAttributeDataFromJson;
  static const toJsonFactory = _$CustomAttributeDataToJson;
  Map<String, dynamic> toJson() => _$CustomAttributeDataToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is CustomAttributeData &&
            (identical(other.attributeType, attributeType) ||
                const DeepCollectionEquality()
                    .equals(other.attributeType, attributeType)) &&
            (identical(other.constructor, constructor) ||
                const DeepCollectionEquality()
                    .equals(other.constructor, constructor)) &&
            (identical(other.constructorArguments, constructorArguments) ||
                const DeepCollectionEquality().equals(
                    other.constructorArguments, constructorArguments)) &&
            (identical(other.namedArguments, namedArguments) ||
                const DeepCollectionEquality()
                    .equals(other.namedArguments, namedArguments)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(attributeType) ^
      const DeepCollectionEquality().hash(constructor) ^
      const DeepCollectionEquality().hash(constructorArguments) ^
      const DeepCollectionEquality().hash(namedArguments) ^
      runtimeType.hashCode;
}

extension $CustomAttributeDataExtension on CustomAttributeData {
  CustomAttributeData copyWith(
      {Type? attributeType,
      ConstructorInfo? constructor,
      List<CustomAttributeTypedArgument>? constructorArguments,
      List<CustomAttributeNamedArgument>? namedArguments}) {
    return CustomAttributeData(
        attributeType: attributeType ?? this.attributeType,
        constructor: constructor ?? this.constructor,
        constructorArguments: constructorArguments ?? this.constructorArguments,
        namedArguments: namedArguments ?? this.namedArguments);
  }
}

@JsonSerializable(explicitToJson: true)
class CustomAttributeNamedArgument {
  CustomAttributeNamedArgument({
    this.memberInfo,
    this.typedValue,
    this.memberName,
    this.isField,
  });

  factory CustomAttributeNamedArgument.fromJson(Map<String, dynamic> json) =>
      _$CustomAttributeNamedArgumentFromJson(json);

  @JsonKey(name: 'memberInfo', includeIfNull: true)
  final MemberInfo? memberInfo;
  @JsonKey(name: 'typedValue', includeIfNull: true)
  final CustomAttributeTypedArgument? typedValue;
  @JsonKey(name: 'memberName', includeIfNull: true, defaultValue: '')
  final String? memberName;
  @JsonKey(name: 'isField', includeIfNull: true)
  final bool? isField;
  static const fromJsonFactory = _$CustomAttributeNamedArgumentFromJson;
  static const toJsonFactory = _$CustomAttributeNamedArgumentToJson;
  Map<String, dynamic> toJson() => _$CustomAttributeNamedArgumentToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is CustomAttributeNamedArgument &&
            (identical(other.memberInfo, memberInfo) ||
                const DeepCollectionEquality()
                    .equals(other.memberInfo, memberInfo)) &&
            (identical(other.typedValue, typedValue) ||
                const DeepCollectionEquality()
                    .equals(other.typedValue, typedValue)) &&
            (identical(other.memberName, memberName) ||
                const DeepCollectionEquality()
                    .equals(other.memberName, memberName)) &&
            (identical(other.isField, isField) ||
                const DeepCollectionEquality().equals(other.isField, isField)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(memberInfo) ^
      const DeepCollectionEquality().hash(typedValue) ^
      const DeepCollectionEquality().hash(memberName) ^
      const DeepCollectionEquality().hash(isField) ^
      runtimeType.hashCode;
}

extension $CustomAttributeNamedArgumentExtension
    on CustomAttributeNamedArgument {
  CustomAttributeNamedArgument copyWith(
      {MemberInfo? memberInfo,
      CustomAttributeTypedArgument? typedValue,
      String? memberName,
      bool? isField}) {
    return CustomAttributeNamedArgument(
        memberInfo: memberInfo ?? this.memberInfo,
        typedValue: typedValue ?? this.typedValue,
        memberName: memberName ?? this.memberName,
        isField: isField ?? this.isField);
  }
}

@JsonSerializable(explicitToJson: true)
class CustomAttributeTypedArgument {
  CustomAttributeTypedArgument({
    this.argumentType,
    this.value,
  });

  factory CustomAttributeTypedArgument.fromJson(Map<String, dynamic> json) =>
      _$CustomAttributeTypedArgumentFromJson(json);

  @JsonKey(name: 'argumentType', includeIfNull: true)
  final Type? argumentType;
  @JsonKey(name: 'value', includeIfNull: true)
  final dynamic value;
  static const fromJsonFactory = _$CustomAttributeTypedArgumentFromJson;
  static const toJsonFactory = _$CustomAttributeTypedArgumentToJson;
  Map<String, dynamic> toJson() => _$CustomAttributeTypedArgumentToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is CustomAttributeTypedArgument &&
            (identical(other.argumentType, argumentType) ||
                const DeepCollectionEquality()
                    .equals(other.argumentType, argumentType)) &&
            (identical(other.value, value) ||
                const DeepCollectionEquality().equals(other.value, value)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(argumentType) ^
      const DeepCollectionEquality().hash(value) ^
      runtimeType.hashCode;
}

extension $CustomAttributeTypedArgumentExtension
    on CustomAttributeTypedArgument {
  CustomAttributeTypedArgument copyWith({Type? argumentType, dynamic? value}) {
    return CustomAttributeTypedArgument(
        argumentType: argumentType ?? this.argumentType,
        value: value ?? this.value);
  }
}

@JsonSerializable(explicitToJson: true)
class EventInfo {
  EventInfo({
    this.name,
    this.declaringType,
    this.reflectedType,
    this.module,
    this.customAttributes,
    this.isCollectible,
    this.metadataToken,
    this.memberType,
    this.attributes,
    this.isSpecialName,
    this.addMethod,
    this.removeMethod,
    this.raiseMethod,
    this.isMulticast,
    this.eventHandlerType,
  });

  factory EventInfo.fromJson(Map<String, dynamic> json) =>
      _$EventInfoFromJson(json);

  @JsonKey(name: 'name', includeIfNull: true, defaultValue: '')
  final String? name;
  @JsonKey(name: 'declaringType', includeIfNull: true)
  final Type? declaringType;
  @JsonKey(name: 'reflectedType', includeIfNull: true)
  final Type? reflectedType;
  @JsonKey(name: 'module', includeIfNull: true)
  final Module? module;
  @JsonKey(
      name: 'customAttributes',
      includeIfNull: true,
      defaultValue: <CustomAttributeData>[])
  final List<CustomAttributeData>? customAttributes;
  @JsonKey(name: 'isCollectible', includeIfNull: true)
  final bool? isCollectible;
  @JsonKey(name: 'metadataToken', includeIfNull: true)
  final int? metadataToken;
  @JsonKey(
      name: 'memberType',
      includeIfNull: true,
      toJson: memberTypesToJson,
      fromJson: memberTypesFromJson)
  final enums.MemberTypes? memberType;
  @JsonKey(
      name: 'attributes',
      includeIfNull: true,
      toJson: eventAttributesToJson,
      fromJson: eventAttributesFromJson)
  final enums.EventAttributes? attributes;
  @JsonKey(name: 'isSpecialName', includeIfNull: true)
  final bool? isSpecialName;
  @JsonKey(name: 'addMethod', includeIfNull: true)
  final MethodInfo? addMethod;
  @JsonKey(name: 'removeMethod', includeIfNull: true)
  final MethodInfo? removeMethod;
  @JsonKey(name: 'raiseMethod', includeIfNull: true)
  final MethodInfo? raiseMethod;
  @JsonKey(name: 'isMulticast', includeIfNull: true)
  final bool? isMulticast;
  @JsonKey(name: 'eventHandlerType', includeIfNull: true)
  final Type? eventHandlerType;
  static const fromJsonFactory = _$EventInfoFromJson;
  static const toJsonFactory = _$EventInfoToJson;
  Map<String, dynamic> toJson() => _$EventInfoToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is EventInfo &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.declaringType, declaringType) ||
                const DeepCollectionEquality()
                    .equals(other.declaringType, declaringType)) &&
            (identical(other.reflectedType, reflectedType) ||
                const DeepCollectionEquality()
                    .equals(other.reflectedType, reflectedType)) &&
            (identical(other.module, module) ||
                const DeepCollectionEquality().equals(other.module, module)) &&
            (identical(other.customAttributes, customAttributes) ||
                const DeepCollectionEquality()
                    .equals(other.customAttributes, customAttributes)) &&
            (identical(other.isCollectible, isCollectible) ||
                const DeepCollectionEquality()
                    .equals(other.isCollectible, isCollectible)) &&
            (identical(other.metadataToken, metadataToken) ||
                const DeepCollectionEquality()
                    .equals(other.metadataToken, metadataToken)) &&
            (identical(other.memberType, memberType) ||
                const DeepCollectionEquality()
                    .equals(other.memberType, memberType)) &&
            (identical(other.attributes, attributes) ||
                const DeepCollectionEquality()
                    .equals(other.attributes, attributes)) &&
            (identical(other.isSpecialName, isSpecialName) ||
                const DeepCollectionEquality()
                    .equals(other.isSpecialName, isSpecialName)) &&
            (identical(other.addMethod, addMethod) ||
                const DeepCollectionEquality()
                    .equals(other.addMethod, addMethod)) &&
            (identical(other.removeMethod, removeMethod) ||
                const DeepCollectionEquality()
                    .equals(other.removeMethod, removeMethod)) &&
            (identical(other.raiseMethod, raiseMethod) ||
                const DeepCollectionEquality()
                    .equals(other.raiseMethod, raiseMethod)) &&
            (identical(other.isMulticast, isMulticast) ||
                const DeepCollectionEquality()
                    .equals(other.isMulticast, isMulticast)) &&
            (identical(other.eventHandlerType, eventHandlerType) ||
                const DeepCollectionEquality()
                    .equals(other.eventHandlerType, eventHandlerType)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(declaringType) ^
      const DeepCollectionEquality().hash(reflectedType) ^
      const DeepCollectionEquality().hash(module) ^
      const DeepCollectionEquality().hash(customAttributes) ^
      const DeepCollectionEquality().hash(isCollectible) ^
      const DeepCollectionEquality().hash(metadataToken) ^
      const DeepCollectionEquality().hash(memberType) ^
      const DeepCollectionEquality().hash(attributes) ^
      const DeepCollectionEquality().hash(isSpecialName) ^
      const DeepCollectionEquality().hash(addMethod) ^
      const DeepCollectionEquality().hash(removeMethod) ^
      const DeepCollectionEquality().hash(raiseMethod) ^
      const DeepCollectionEquality().hash(isMulticast) ^
      const DeepCollectionEquality().hash(eventHandlerType) ^
      runtimeType.hashCode;
}

extension $EventInfoExtension on EventInfo {
  EventInfo copyWith(
      {String? name,
      Type? declaringType,
      Type? reflectedType,
      Module? module,
      List<CustomAttributeData>? customAttributes,
      bool? isCollectible,
      int? metadataToken,
      enums.MemberTypes? memberType,
      enums.EventAttributes? attributes,
      bool? isSpecialName,
      MethodInfo? addMethod,
      MethodInfo? removeMethod,
      MethodInfo? raiseMethod,
      bool? isMulticast,
      Type? eventHandlerType}) {
    return EventInfo(
        name: name ?? this.name,
        declaringType: declaringType ?? this.declaringType,
        reflectedType: reflectedType ?? this.reflectedType,
        module: module ?? this.module,
        customAttributes: customAttributes ?? this.customAttributes,
        isCollectible: isCollectible ?? this.isCollectible,
        metadataToken: metadataToken ?? this.metadataToken,
        memberType: memberType ?? this.memberType,
        attributes: attributes ?? this.attributes,
        isSpecialName: isSpecialName ?? this.isSpecialName,
        addMethod: addMethod ?? this.addMethod,
        removeMethod: removeMethod ?? this.removeMethod,
        raiseMethod: raiseMethod ?? this.raiseMethod,
        isMulticast: isMulticast ?? this.isMulticast,
        eventHandlerType: eventHandlerType ?? this.eventHandlerType);
  }
}

@JsonSerializable(explicitToJson: true)
class EventPublicFilterResource {
  EventPublicFilterResource({
    this.pageSize,
    this.pageIndex,
    this.topEvent,
    this.blockId,
  });

  factory EventPublicFilterResource.fromJson(Map<String, dynamic> json) =>
      _$EventPublicFilterResourceFromJson(json);

  @JsonKey(name: 'pageSize', includeIfNull: true)
  final int? pageSize;
  @JsonKey(name: 'pageIndex', includeIfNull: true)
  final int? pageIndex;
  @JsonKey(name: 'topEvent', includeIfNull: true)
  final int? topEvent;
  @JsonKey(name: 'blockId', includeIfNull: true)
  final int? blockId;
  static const fromJsonFactory = _$EventPublicFilterResourceFromJson;
  static const toJsonFactory = _$EventPublicFilterResourceToJson;
  Map<String, dynamic> toJson() => _$EventPublicFilterResourceToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is EventPublicFilterResource &&
            (identical(other.pageSize, pageSize) ||
                const DeepCollectionEquality()
                    .equals(other.pageSize, pageSize)) &&
            (identical(other.pageIndex, pageIndex) ||
                const DeepCollectionEquality()
                    .equals(other.pageIndex, pageIndex)) &&
            (identical(other.topEvent, topEvent) ||
                const DeepCollectionEquality()
                    .equals(other.topEvent, topEvent)) &&
            (identical(other.blockId, blockId) ||
                const DeepCollectionEquality().equals(other.blockId, blockId)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(pageSize) ^
      const DeepCollectionEquality().hash(pageIndex) ^
      const DeepCollectionEquality().hash(topEvent) ^
      const DeepCollectionEquality().hash(blockId) ^
      runtimeType.hashCode;
}

extension $EventPublicFilterResourceExtension on EventPublicFilterResource {
  EventPublicFilterResource copyWith(
      {int? pageSize, int? pageIndex, int? topEvent, int? blockId}) {
    return EventPublicFilterResource(
        pageSize: pageSize ?? this.pageSize,
        pageIndex: pageIndex ?? this.pageIndex,
        topEvent: topEvent ?? this.topEvent,
        blockId: blockId ?? this.blockId);
  }
}

@JsonSerializable(explicitToJson: true)
class EventResourcePublic {
  EventResourcePublic({
    this.id,
    this.title,
    this.startDate,
    this.endDate,
    this.status,
    this.type,
    this.statusText,
    this.blockId,
  });

  factory EventResourcePublic.fromJson(Map<String, dynamic> json) =>
      _$EventResourcePublicFromJson(json);

  @JsonKey(name: 'id', includeIfNull: true)
  final int? id;
  @JsonKey(name: 'title', includeIfNull: true, defaultValue: '')
  final String? title;
  @JsonKey(name: 'startDate', includeIfNull: true)
  final DateTime? startDate;
  @JsonKey(name: 'endDate', includeIfNull: true)
  final DateTime? endDate;
  @JsonKey(name: 'status', includeIfNull: true)
  final int? status;
  @JsonKey(name: 'type', includeIfNull: true)
  final int? type;
  @JsonKey(name: 'statusText', includeIfNull: true, defaultValue: '')
  final String? statusText;
  @JsonKey(name: 'blockId', includeIfNull: true)
  final int? blockId;
  static const fromJsonFactory = _$EventResourcePublicFromJson;
  static const toJsonFactory = _$EventResourcePublicToJson;
  Map<String, dynamic> toJson() => _$EventResourcePublicToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is EventResourcePublic &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.title, title) ||
                const DeepCollectionEquality().equals(other.title, title)) &&
            (identical(other.startDate, startDate) ||
                const DeepCollectionEquality()
                    .equals(other.startDate, startDate)) &&
            (identical(other.endDate, endDate) ||
                const DeepCollectionEquality()
                    .equals(other.endDate, endDate)) &&
            (identical(other.status, status) ||
                const DeepCollectionEquality().equals(other.status, status)) &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)) &&
            (identical(other.statusText, statusText) ||
                const DeepCollectionEquality()
                    .equals(other.statusText, statusText)) &&
            (identical(other.blockId, blockId) ||
                const DeepCollectionEquality().equals(other.blockId, blockId)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(title) ^
      const DeepCollectionEquality().hash(startDate) ^
      const DeepCollectionEquality().hash(endDate) ^
      const DeepCollectionEquality().hash(status) ^
      const DeepCollectionEquality().hash(type) ^
      const DeepCollectionEquality().hash(statusText) ^
      const DeepCollectionEquality().hash(blockId) ^
      runtimeType.hashCode;
}

extension $EventResourcePublicExtension on EventResourcePublic {
  EventResourcePublic copyWith(
      {int? id,
      String? title,
      DateTime? startDate,
      DateTime? endDate,
      int? status,
      int? type,
      String? statusText,
      int? blockId}) {
    return EventResourcePublic(
        id: id ?? this.id,
        title: title ?? this.title,
        startDate: startDate ?? this.startDate,
        endDate: endDate ?? this.endDate,
        status: status ?? this.status,
        type: type ?? this.type,
        statusText: statusText ?? this.statusText,
        blockId: blockId ?? this.blockId);
  }
}

@JsonSerializable(explicitToJson: true)
class ExamBaseDetailResource {
  ExamBaseDetailResource({
    this.id,
    this.examCategoryId,
    this.title,
    this.status,
    this.duration,
    this.examLevel,
    this.propertyDetails,
    this.propertieValueName,
    this.examCategoryName,
    this.totalSearchProperty,
    this.examsetIds,
    this.members,
    this.numberOfMembers,
    this.numberOfExamTime,
    this.isApproved,
    this.isLike,
    this.type,
    this.isFree,
    this.examTimeFrom,
    this.examTimeTo,
    this.tags,
    this.categories,
  });

  factory ExamBaseDetailResource.fromJson(Map<String, dynamic> json) =>
      _$ExamBaseDetailResourceFromJson(json);

  @JsonKey(name: 'id', includeIfNull: true)
  final int? id;
  @JsonKey(name: 'examCategoryId', includeIfNull: true)
  final int? examCategoryId;
  @JsonKey(name: 'title', includeIfNull: true, defaultValue: '')
  final String? title;
  @JsonKey(name: 'status', includeIfNull: true)
  final int? status;
  @JsonKey(name: 'duration', includeIfNull: true)
  final int? duration;
  @JsonKey(name: 'examLevel', includeIfNull: true)
  final int? examLevel;
  @JsonKey(name: 'propertyDetails', includeIfNull: true, defaultValue: <int>[])
  final List<int>? propertyDetails;
  @JsonKey(
      name: 'propertieValueName', includeIfNull: true, defaultValue: <String>[])
  final List<String>? propertieValueName;
  @JsonKey(name: 'examCategoryName', includeIfNull: true, defaultValue: '')
  final String? examCategoryName;
  @JsonKey(name: 'totalSearchProperty', includeIfNull: true)
  final int? totalSearchProperty;
  @JsonKey(name: 'examsetIds', includeIfNull: true, defaultValue: <int>[])
  final List<int>? examsetIds;
  @JsonKey(
      name: 'members', includeIfNull: true, defaultValue: <SimpleUserEntity>[])
  final List<SimpleUserEntity>? members;
  @JsonKey(name: 'numberOfMembers', includeIfNull: true)
  final int? numberOfMembers;
  @JsonKey(name: 'numberOfExamTime', includeIfNull: true)
  final int? numberOfExamTime;
  @JsonKey(name: 'isApproved', includeIfNull: true)
  final bool? isApproved;
  @JsonKey(name: 'isLike', includeIfNull: true)
  final bool? isLike;
  @JsonKey(name: 'type', includeIfNull: true)
  final int? type;
  @JsonKey(name: 'isFree', includeIfNull: true)
  final bool? isFree;
  @JsonKey(name: 'examTimeFrom', includeIfNull: true)
  final DateTime? examTimeFrom;
  @JsonKey(name: 'examTimeTo', includeIfNull: true)
  final DateTime? examTimeTo;
  @JsonKey(name: 'tags', includeIfNull: true, defaultValue: <int>[])
  final List<int>? tags;
  @JsonKey(
      name: 'categories',
      includeIfNull: true,
      defaultValue: <CategoryStaticResource>[])
  final List<CategoryStaticResource>? categories;
  static const fromJsonFactory = _$ExamBaseDetailResourceFromJson;
  static const toJsonFactory = _$ExamBaseDetailResourceToJson;
  Map<String, dynamic> toJson() => _$ExamBaseDetailResourceToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ExamBaseDetailResource &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.examCategoryId, examCategoryId) ||
                const DeepCollectionEquality()
                    .equals(other.examCategoryId, examCategoryId)) &&
            (identical(other.title, title) ||
                const DeepCollectionEquality().equals(other.title, title)) &&
            (identical(other.status, status) ||
                const DeepCollectionEquality().equals(other.status, status)) &&
            (identical(other.duration, duration) ||
                const DeepCollectionEquality()
                    .equals(other.duration, duration)) &&
            (identical(other.examLevel, examLevel) ||
                const DeepCollectionEquality()
                    .equals(other.examLevel, examLevel)) &&
            (identical(other.propertyDetails, propertyDetails) ||
                const DeepCollectionEquality()
                    .equals(other.propertyDetails, propertyDetails)) &&
            (identical(other.propertieValueName, propertieValueName) ||
                const DeepCollectionEquality()
                    .equals(other.propertieValueName, propertieValueName)) &&
            (identical(other.examCategoryName, examCategoryName) ||
                const DeepCollectionEquality()
                    .equals(other.examCategoryName, examCategoryName)) &&
            (identical(other.totalSearchProperty, totalSearchProperty) ||
                const DeepCollectionEquality()
                    .equals(other.totalSearchProperty, totalSearchProperty)) &&
            (identical(other.examsetIds, examsetIds) ||
                const DeepCollectionEquality()
                    .equals(other.examsetIds, examsetIds)) &&
            (identical(other.members, members) ||
                const DeepCollectionEquality()
                    .equals(other.members, members)) &&
            (identical(other.numberOfMembers, numberOfMembers) ||
                const DeepCollectionEquality()
                    .equals(other.numberOfMembers, numberOfMembers)) &&
            (identical(other.numberOfExamTime, numberOfExamTime) ||
                const DeepCollectionEquality()
                    .equals(other.numberOfExamTime, numberOfExamTime)) &&
            (identical(other.isApproved, isApproved) ||
                const DeepCollectionEquality()
                    .equals(other.isApproved, isApproved)) &&
            (identical(other.isLike, isLike) ||
                const DeepCollectionEquality().equals(other.isLike, isLike)) &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)) &&
            (identical(other.isFree, isFree) ||
                const DeepCollectionEquality().equals(other.isFree, isFree)) &&
            (identical(other.examTimeFrom, examTimeFrom) ||
                const DeepCollectionEquality()
                    .equals(other.examTimeFrom, examTimeFrom)) &&
            (identical(other.examTimeTo, examTimeTo) ||
                const DeepCollectionEquality()
                    .equals(other.examTimeTo, examTimeTo)) &&
            (identical(other.tags, tags) ||
                const DeepCollectionEquality().equals(other.tags, tags)) &&
            (identical(other.categories, categories) ||
                const DeepCollectionEquality()
                    .equals(other.categories, categories)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(examCategoryId) ^
      const DeepCollectionEquality().hash(title) ^
      const DeepCollectionEquality().hash(status) ^
      const DeepCollectionEquality().hash(duration) ^
      const DeepCollectionEquality().hash(examLevel) ^
      const DeepCollectionEquality().hash(propertyDetails) ^
      const DeepCollectionEquality().hash(propertieValueName) ^
      const DeepCollectionEquality().hash(examCategoryName) ^
      const DeepCollectionEquality().hash(totalSearchProperty) ^
      const DeepCollectionEquality().hash(examsetIds) ^
      const DeepCollectionEquality().hash(members) ^
      const DeepCollectionEquality().hash(numberOfMembers) ^
      const DeepCollectionEquality().hash(numberOfExamTime) ^
      const DeepCollectionEquality().hash(isApproved) ^
      const DeepCollectionEquality().hash(isLike) ^
      const DeepCollectionEquality().hash(type) ^
      const DeepCollectionEquality().hash(isFree) ^
      const DeepCollectionEquality().hash(examTimeFrom) ^
      const DeepCollectionEquality().hash(examTimeTo) ^
      const DeepCollectionEquality().hash(tags) ^
      const DeepCollectionEquality().hash(categories) ^
      runtimeType.hashCode;
}

extension $ExamBaseDetailResourceExtension on ExamBaseDetailResource {
  ExamBaseDetailResource copyWith(
      {int? id,
      int? examCategoryId,
      String? title,
      int? status,
      int? duration,
      int? examLevel,
      List<int>? propertyDetails,
      List<String>? propertieValueName,
      String? examCategoryName,
      int? totalSearchProperty,
      List<int>? examsetIds,
      List<SimpleUserEntity>? members,
      int? numberOfMembers,
      int? numberOfExamTime,
      bool? isApproved,
      bool? isLike,
      int? type,
      bool? isFree,
      DateTime? examTimeFrom,
      DateTime? examTimeTo,
      List<int>? tags,
      List<CategoryStaticResource>? categories}) {
    return ExamBaseDetailResource(
        id: id ?? this.id,
        examCategoryId: examCategoryId ?? this.examCategoryId,
        title: title ?? this.title,
        status: status ?? this.status,
        duration: duration ?? this.duration,
        examLevel: examLevel ?? this.examLevel,
        propertyDetails: propertyDetails ?? this.propertyDetails,
        propertieValueName: propertieValueName ?? this.propertieValueName,
        examCategoryName: examCategoryName ?? this.examCategoryName,
        totalSearchProperty: totalSearchProperty ?? this.totalSearchProperty,
        examsetIds: examsetIds ?? this.examsetIds,
        members: members ?? this.members,
        numberOfMembers: numberOfMembers ?? this.numberOfMembers,
        numberOfExamTime: numberOfExamTime ?? this.numberOfExamTime,
        isApproved: isApproved ?? this.isApproved,
        isLike: isLike ?? this.isLike,
        type: type ?? this.type,
        isFree: isFree ?? this.isFree,
        examTimeFrom: examTimeFrom ?? this.examTimeFrom,
        examTimeTo: examTimeTo ?? this.examTimeTo,
        tags: tags ?? this.tags,
        categories: categories ?? this.categories);
  }
}

@JsonSerializable(explicitToJson: true)
class ExamBaseFilterResource {
  ExamBaseFilterResource({
    this.sortExpression,
    this.pageSize,
    this.pageIndex,
    this.examIds,
    this.propertyDetails,
    this.examSetId,
    this.examCategoryId,
    this.status,
    this.keyWord,
  });

  factory ExamBaseFilterResource.fromJson(Map<String, dynamic> json) =>
      _$ExamBaseFilterResourceFromJson(json);

  @JsonKey(name: 'sortExpression', includeIfNull: true, defaultValue: '')
  final String? sortExpression;
  @JsonKey(name: 'pageSize', includeIfNull: true)
  final int? pageSize;
  @JsonKey(name: 'pageIndex', includeIfNull: true)
  final int? pageIndex;
  @JsonKey(name: 'examIds', includeIfNull: true, defaultValue: <int>[])
  final List<int>? examIds;
  @JsonKey(name: 'propertyDetails', includeIfNull: true, defaultValue: <int>[])
  final List<int>? propertyDetails;
  @JsonKey(name: 'examSetId', includeIfNull: true)
  final int? examSetId;
  @JsonKey(name: 'examCategoryId', includeIfNull: true)
  final int? examCategoryId;
  @JsonKey(name: 'status', includeIfNull: true)
  final int? status;
  @JsonKey(name: 'keyWord', includeIfNull: true, defaultValue: '')
  final String? keyWord;
  static const fromJsonFactory = _$ExamBaseFilterResourceFromJson;
  static const toJsonFactory = _$ExamBaseFilterResourceToJson;
  Map<String, dynamic> toJson() => _$ExamBaseFilterResourceToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ExamBaseFilterResource &&
            (identical(other.sortExpression, sortExpression) ||
                const DeepCollectionEquality()
                    .equals(other.sortExpression, sortExpression)) &&
            (identical(other.pageSize, pageSize) ||
                const DeepCollectionEquality()
                    .equals(other.pageSize, pageSize)) &&
            (identical(other.pageIndex, pageIndex) ||
                const DeepCollectionEquality()
                    .equals(other.pageIndex, pageIndex)) &&
            (identical(other.examIds, examIds) ||
                const DeepCollectionEquality()
                    .equals(other.examIds, examIds)) &&
            (identical(other.propertyDetails, propertyDetails) ||
                const DeepCollectionEquality()
                    .equals(other.propertyDetails, propertyDetails)) &&
            (identical(other.examSetId, examSetId) ||
                const DeepCollectionEquality()
                    .equals(other.examSetId, examSetId)) &&
            (identical(other.examCategoryId, examCategoryId) ||
                const DeepCollectionEquality()
                    .equals(other.examCategoryId, examCategoryId)) &&
            (identical(other.status, status) ||
                const DeepCollectionEquality().equals(other.status, status)) &&
            (identical(other.keyWord, keyWord) ||
                const DeepCollectionEquality().equals(other.keyWord, keyWord)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(sortExpression) ^
      const DeepCollectionEquality().hash(pageSize) ^
      const DeepCollectionEquality().hash(pageIndex) ^
      const DeepCollectionEquality().hash(examIds) ^
      const DeepCollectionEquality().hash(propertyDetails) ^
      const DeepCollectionEquality().hash(examSetId) ^
      const DeepCollectionEquality().hash(examCategoryId) ^
      const DeepCollectionEquality().hash(status) ^
      const DeepCollectionEquality().hash(keyWord) ^
      runtimeType.hashCode;
}

extension $ExamBaseFilterResourceExtension on ExamBaseFilterResource {
  ExamBaseFilterResource copyWith(
      {String? sortExpression,
      int? pageSize,
      int? pageIndex,
      List<int>? examIds,
      List<int>? propertyDetails,
      int? examSetId,
      int? examCategoryId,
      int? status,
      String? keyWord}) {
    return ExamBaseFilterResource(
        sortExpression: sortExpression ?? this.sortExpression,
        pageSize: pageSize ?? this.pageSize,
        pageIndex: pageIndex ?? this.pageIndex,
        examIds: examIds ?? this.examIds,
        propertyDetails: propertyDetails ?? this.propertyDetails,
        examSetId: examSetId ?? this.examSetId,
        examCategoryId: examCategoryId ?? this.examCategoryId,
        status: status ?? this.status,
        keyWord: keyWord ?? this.keyWord);
  }
}

@JsonSerializable(explicitToJson: true)
class ExamBaseResource {
  ExamBaseResource({
    this.id,
    this.examCategoryId,
    this.title,
    this.status,
    this.duration,
    this.examLevel,
    this.propertyDetails,
    this.propertieValueName,
    this.examCategoryName,
    this.totalSearchProperty,
    this.examsetIds,
    this.members,
    this.numberOfMembers,
    this.numberOfExamTime,
    this.isApproved,
    this.isLike,
    this.type,
    this.examTimeTo,
    this.examTimeFrom,
    this.isFree,
  });

  factory ExamBaseResource.fromJson(Map<String, dynamic> json) =>
      _$ExamBaseResourceFromJson(json);

  @JsonKey(name: 'id', includeIfNull: true)
  final int? id;
  @JsonKey(name: 'examCategoryId', includeIfNull: true)
  final int? examCategoryId;
  @JsonKey(name: 'title', includeIfNull: true, defaultValue: '')
  final String? title;
  @JsonKey(name: 'status', includeIfNull: true)
  final int? status;
  @JsonKey(name: 'duration', includeIfNull: true)
  final int? duration;
  @JsonKey(name: 'examLevel', includeIfNull: true)
  final int? examLevel;
  @JsonKey(name: 'propertyDetails', includeIfNull: true, defaultValue: <int>[])
  final List<int>? propertyDetails;
  @JsonKey(
      name: 'propertieValueName', includeIfNull: true, defaultValue: <String>[])
  final List<String>? propertieValueName;
  @JsonKey(name: 'examCategoryName', includeIfNull: true, defaultValue: '')
  final String? examCategoryName;
  @JsonKey(name: 'totalSearchProperty', includeIfNull: true)
  final int? totalSearchProperty;
  @JsonKey(name: 'examsetIds', includeIfNull: true, defaultValue: <int>[])
  final List<int>? examsetIds;
  @JsonKey(
      name: 'members', includeIfNull: true, defaultValue: <SimpleUserEntity>[])
  final List<SimpleUserEntity>? members;
  @JsonKey(name: 'numberOfMembers', includeIfNull: true)
  final int? numberOfMembers;
  @JsonKey(name: 'numberOfExamTime', includeIfNull: true)
  final int? numberOfExamTime;
  @JsonKey(name: 'isApproved', includeIfNull: true)
  final bool? isApproved;
  @JsonKey(name: 'isLike', includeIfNull: true)
  final bool? isLike;
  @JsonKey(name: 'type', includeIfNull: true)
  final int? type;
  @JsonKey(name: 'examTimeTo', includeIfNull: true)
  final DateTime? examTimeTo;
  @JsonKey(name: 'examTimeFrom', includeIfNull: true)
  final DateTime? examTimeFrom;
  @JsonKey(name: 'isFree', includeIfNull: true)
  final bool? isFree;
  static const fromJsonFactory = _$ExamBaseResourceFromJson;
  static const toJsonFactory = _$ExamBaseResourceToJson;
  Map<String, dynamic> toJson() => _$ExamBaseResourceToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ExamBaseResource &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.examCategoryId, examCategoryId) ||
                const DeepCollectionEquality()
                    .equals(other.examCategoryId, examCategoryId)) &&
            (identical(other.title, title) ||
                const DeepCollectionEquality().equals(other.title, title)) &&
            (identical(other.status, status) ||
                const DeepCollectionEquality().equals(other.status, status)) &&
            (identical(other.duration, duration) ||
                const DeepCollectionEquality()
                    .equals(other.duration, duration)) &&
            (identical(other.examLevel, examLevel) ||
                const DeepCollectionEquality()
                    .equals(other.examLevel, examLevel)) &&
            (identical(other.propertyDetails, propertyDetails) ||
                const DeepCollectionEquality()
                    .equals(other.propertyDetails, propertyDetails)) &&
            (identical(other.propertieValueName, propertieValueName) ||
                const DeepCollectionEquality()
                    .equals(other.propertieValueName, propertieValueName)) &&
            (identical(other.examCategoryName, examCategoryName) ||
                const DeepCollectionEquality()
                    .equals(other.examCategoryName, examCategoryName)) &&
            (identical(other.totalSearchProperty, totalSearchProperty) ||
                const DeepCollectionEquality()
                    .equals(other.totalSearchProperty, totalSearchProperty)) &&
            (identical(other.examsetIds, examsetIds) ||
                const DeepCollectionEquality()
                    .equals(other.examsetIds, examsetIds)) &&
            (identical(other.members, members) ||
                const DeepCollectionEquality()
                    .equals(other.members, members)) &&
            (identical(other.numberOfMembers, numberOfMembers) ||
                const DeepCollectionEquality()
                    .equals(other.numberOfMembers, numberOfMembers)) &&
            (identical(other.numberOfExamTime, numberOfExamTime) ||
                const DeepCollectionEquality()
                    .equals(other.numberOfExamTime, numberOfExamTime)) &&
            (identical(other.isApproved, isApproved) ||
                const DeepCollectionEquality()
                    .equals(other.isApproved, isApproved)) &&
            (identical(other.isLike, isLike) ||
                const DeepCollectionEquality().equals(other.isLike, isLike)) &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)) &&
            (identical(other.examTimeTo, examTimeTo) ||
                const DeepCollectionEquality()
                    .equals(other.examTimeTo, examTimeTo)) &&
            (identical(other.examTimeFrom, examTimeFrom) ||
                const DeepCollectionEquality()
                    .equals(other.examTimeFrom, examTimeFrom)) &&
            (identical(other.isFree, isFree) ||
                const DeepCollectionEquality().equals(other.isFree, isFree)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(examCategoryId) ^
      const DeepCollectionEquality().hash(title) ^
      const DeepCollectionEquality().hash(status) ^
      const DeepCollectionEquality().hash(duration) ^
      const DeepCollectionEquality().hash(examLevel) ^
      const DeepCollectionEquality().hash(propertyDetails) ^
      const DeepCollectionEquality().hash(propertieValueName) ^
      const DeepCollectionEquality().hash(examCategoryName) ^
      const DeepCollectionEquality().hash(totalSearchProperty) ^
      const DeepCollectionEquality().hash(examsetIds) ^
      const DeepCollectionEquality().hash(members) ^
      const DeepCollectionEquality().hash(numberOfMembers) ^
      const DeepCollectionEquality().hash(numberOfExamTime) ^
      const DeepCollectionEquality().hash(isApproved) ^
      const DeepCollectionEquality().hash(isLike) ^
      const DeepCollectionEquality().hash(type) ^
      const DeepCollectionEquality().hash(examTimeTo) ^
      const DeepCollectionEquality().hash(examTimeFrom) ^
      const DeepCollectionEquality().hash(isFree) ^
      runtimeType.hashCode;
}

extension $ExamBaseResourceExtension on ExamBaseResource {
  ExamBaseResource copyWith(
      {int? id,
      int? examCategoryId,
      String? title,
      int? status,
      int? duration,
      int? examLevel,
      List<int>? propertyDetails,
      List<String>? propertieValueName,
      String? examCategoryName,
      int? totalSearchProperty,
      List<int>? examsetIds,
      List<SimpleUserEntity>? members,
      int? numberOfMembers,
      int? numberOfExamTime,
      bool? isApproved,
      bool? isLike,
      int? type,
      DateTime? examTimeTo,
      DateTime? examTimeFrom,
      bool? isFree}) {
    return ExamBaseResource(
        id: id ?? this.id,
        examCategoryId: examCategoryId ?? this.examCategoryId,
        title: title ?? this.title,
        status: status ?? this.status,
        duration: duration ?? this.duration,
        examLevel: examLevel ?? this.examLevel,
        propertyDetails: propertyDetails ?? this.propertyDetails,
        propertieValueName: propertieValueName ?? this.propertieValueName,
        examCategoryName: examCategoryName ?? this.examCategoryName,
        totalSearchProperty: totalSearchProperty ?? this.totalSearchProperty,
        examsetIds: examsetIds ?? this.examsetIds,
        members: members ?? this.members,
        numberOfMembers: numberOfMembers ?? this.numberOfMembers,
        numberOfExamTime: numberOfExamTime ?? this.numberOfExamTime,
        isApproved: isApproved ?? this.isApproved,
        isLike: isLike ?? this.isLike,
        type: type ?? this.type,
        examTimeTo: examTimeTo ?? this.examTimeTo,
        examTimeFrom: examTimeFrom ?? this.examTimeFrom,
        isFree: isFree ?? this.isFree);
  }
}

@JsonSerializable(explicitToJson: true)
class ExamBaseResourceFilterResult {
  ExamBaseResourceFilterResult({
    this.totalRows,
    this.data,
  });

  factory ExamBaseResourceFilterResult.fromJson(Map<String, dynamic> json) =>
      _$ExamBaseResourceFilterResultFromJson(json);

  @JsonKey(name: 'totalRows', includeIfNull: true)
  final int? totalRows;
  @JsonKey(
      name: 'data', includeIfNull: true, defaultValue: <ExamBaseResource>[])
  final List<ExamBaseResource>? data;
  static const fromJsonFactory = _$ExamBaseResourceFilterResultFromJson;
  static const toJsonFactory = _$ExamBaseResourceFilterResultToJson;
  Map<String, dynamic> toJson() => _$ExamBaseResourceFilterResultToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ExamBaseResourceFilterResult &&
            (identical(other.totalRows, totalRows) ||
                const DeepCollectionEquality()
                    .equals(other.totalRows, totalRows)) &&
            (identical(other.data, data) ||
                const DeepCollectionEquality().equals(other.data, data)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(totalRows) ^
      const DeepCollectionEquality().hash(data) ^
      runtimeType.hashCode;
}

extension $ExamBaseResourceFilterResultExtension
    on ExamBaseResourceFilterResult {
  ExamBaseResourceFilterResult copyWith(
      {int? totalRows, List<ExamBaseResource>? data}) {
    return ExamBaseResourceFilterResult(
        totalRows: totalRows ?? this.totalRows, data: data ?? this.data);
  }
}

@JsonSerializable(explicitToJson: true)
class ExamCreateResource {
  ExamCreateResource({
    this.id,
    this.examStructureId,
    this.examCategoryId,
    this.data,
    this.duration,
    this.title,
    this.examLevel,
    this.description,
    this.examType,
    this.type,
    this.examLimit,
    this.shareMode,
    this.totalMark,
    this.totalQuestion,
    this.isFree,
    this.examTimeFrom,
    this.examTimeTo,
    this.examLimitNumber,
    this.tags,
    this.status,
    this.propertyDetails,
  });

  factory ExamCreateResource.fromJson(Map<String, dynamic> json) =>
      _$ExamCreateResourceFromJson(json);

  @JsonKey(name: 'id', includeIfNull: true)
  final int? id;
  @JsonKey(name: 'examStructureId', includeIfNull: true)
  final int? examStructureId;
  @JsonKey(name: 'examCategoryId', includeIfNull: true)
  final int? examCategoryId;
  @JsonKey(name: 'data', includeIfNull: true, defaultValue: '')
  final String? data;
  @JsonKey(name: 'duration', includeIfNull: true)
  final int? duration;
  @JsonKey(name: 'title', includeIfNull: true, defaultValue: '')
  final String? title;
  @JsonKey(name: 'examLevel', includeIfNull: true)
  final int? examLevel;
  @JsonKey(name: 'description', includeIfNull: true, defaultValue: '')
  final String? description;
  @JsonKey(name: 'examType', includeIfNull: true)
  final int? examType;
  @JsonKey(name: 'type', includeIfNull: true)
  final int? type;
  @JsonKey(name: 'examLimit', includeIfNull: true)
  final int? examLimit;
  @JsonKey(name: 'shareMode', includeIfNull: true)
  final int? shareMode;
  @JsonKey(name: 'totalMark', includeIfNull: true)
  final double? totalMark;
  @JsonKey(name: 'totalQuestion', includeIfNull: true)
  final int? totalQuestion;
  @JsonKey(name: 'isFree', includeIfNull: true)
  final bool? isFree;
  @JsonKey(name: 'examTimeFrom', includeIfNull: true)
  final DateTime? examTimeFrom;
  @JsonKey(name: 'examTimeTo', includeIfNull: true)
  final DateTime? examTimeTo;
  @JsonKey(name: 'examLimitNumber', includeIfNull: true)
  final int? examLimitNumber;
  @JsonKey(name: 'tags', includeIfNull: true, defaultValue: <int>[])
  final List<int>? tags;
  @JsonKey(name: 'status', includeIfNull: true)
  final int? status;
  @JsonKey(name: 'propertyDetails', includeIfNull: true, defaultValue: <int>[])
  final List<int>? propertyDetails;
  static const fromJsonFactory = _$ExamCreateResourceFromJson;
  static const toJsonFactory = _$ExamCreateResourceToJson;
  Map<String, dynamic> toJson() => _$ExamCreateResourceToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ExamCreateResource &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.examStructureId, examStructureId) ||
                const DeepCollectionEquality()
                    .equals(other.examStructureId, examStructureId)) &&
            (identical(other.examCategoryId, examCategoryId) ||
                const DeepCollectionEquality()
                    .equals(other.examCategoryId, examCategoryId)) &&
            (identical(other.data, data) ||
                const DeepCollectionEquality().equals(other.data, data)) &&
            (identical(other.duration, duration) ||
                const DeepCollectionEquality()
                    .equals(other.duration, duration)) &&
            (identical(other.title, title) ||
                const DeepCollectionEquality().equals(other.title, title)) &&
            (identical(other.examLevel, examLevel) ||
                const DeepCollectionEquality()
                    .equals(other.examLevel, examLevel)) &&
            (identical(other.description, description) ||
                const DeepCollectionEquality()
                    .equals(other.description, description)) &&
            (identical(other.examType, examType) ||
                const DeepCollectionEquality()
                    .equals(other.examType, examType)) &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)) &&
            (identical(other.examLimit, examLimit) ||
                const DeepCollectionEquality()
                    .equals(other.examLimit, examLimit)) &&
            (identical(other.shareMode, shareMode) ||
                const DeepCollectionEquality()
                    .equals(other.shareMode, shareMode)) &&
            (identical(other.totalMark, totalMark) ||
                const DeepCollectionEquality()
                    .equals(other.totalMark, totalMark)) &&
            (identical(other.totalQuestion, totalQuestion) ||
                const DeepCollectionEquality()
                    .equals(other.totalQuestion, totalQuestion)) &&
            (identical(other.isFree, isFree) ||
                const DeepCollectionEquality().equals(other.isFree, isFree)) &&
            (identical(other.examTimeFrom, examTimeFrom) ||
                const DeepCollectionEquality()
                    .equals(other.examTimeFrom, examTimeFrom)) &&
            (identical(other.examTimeTo, examTimeTo) ||
                const DeepCollectionEquality()
                    .equals(other.examTimeTo, examTimeTo)) &&
            (identical(other.examLimitNumber, examLimitNumber) ||
                const DeepCollectionEquality()
                    .equals(other.examLimitNumber, examLimitNumber)) &&
            (identical(other.tags, tags) ||
                const DeepCollectionEquality().equals(other.tags, tags)) &&
            (identical(other.status, status) ||
                const DeepCollectionEquality().equals(other.status, status)) &&
            (identical(other.propertyDetails, propertyDetails) ||
                const DeepCollectionEquality()
                    .equals(other.propertyDetails, propertyDetails)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(examStructureId) ^
      const DeepCollectionEquality().hash(examCategoryId) ^
      const DeepCollectionEquality().hash(data) ^
      const DeepCollectionEquality().hash(duration) ^
      const DeepCollectionEquality().hash(title) ^
      const DeepCollectionEquality().hash(examLevel) ^
      const DeepCollectionEquality().hash(description) ^
      const DeepCollectionEquality().hash(examType) ^
      const DeepCollectionEquality().hash(type) ^
      const DeepCollectionEquality().hash(examLimit) ^
      const DeepCollectionEquality().hash(shareMode) ^
      const DeepCollectionEquality().hash(totalMark) ^
      const DeepCollectionEquality().hash(totalQuestion) ^
      const DeepCollectionEquality().hash(isFree) ^
      const DeepCollectionEquality().hash(examTimeFrom) ^
      const DeepCollectionEquality().hash(examTimeTo) ^
      const DeepCollectionEquality().hash(examLimitNumber) ^
      const DeepCollectionEquality().hash(tags) ^
      const DeepCollectionEquality().hash(status) ^
      const DeepCollectionEquality().hash(propertyDetails) ^
      runtimeType.hashCode;
}

extension $ExamCreateResourceExtension on ExamCreateResource {
  ExamCreateResource copyWith(
      {int? id,
      int? examStructureId,
      int? examCategoryId,
      String? data,
      int? duration,
      String? title,
      int? examLevel,
      String? description,
      int? examType,
      int? type,
      int? examLimit,
      int? shareMode,
      double? totalMark,
      int? totalQuestion,
      bool? isFree,
      DateTime? examTimeFrom,
      DateTime? examTimeTo,
      int? examLimitNumber,
      List<int>? tags,
      int? status,
      List<int>? propertyDetails}) {
    return ExamCreateResource(
        id: id ?? this.id,
        examStructureId: examStructureId ?? this.examStructureId,
        examCategoryId: examCategoryId ?? this.examCategoryId,
        data: data ?? this.data,
        duration: duration ?? this.duration,
        title: title ?? this.title,
        examLevel: examLevel ?? this.examLevel,
        description: description ?? this.description,
        examType: examType ?? this.examType,
        type: type ?? this.type,
        examLimit: examLimit ?? this.examLimit,
        shareMode: shareMode ?? this.shareMode,
        totalMark: totalMark ?? this.totalMark,
        totalQuestion: totalQuestion ?? this.totalQuestion,
        isFree: isFree ?? this.isFree,
        examTimeFrom: examTimeFrom ?? this.examTimeFrom,
        examTimeTo: examTimeTo ?? this.examTimeTo,
        examLimitNumber: examLimitNumber ?? this.examLimitNumber,
        tags: tags ?? this.tags,
        status: status ?? this.status,
        propertyDetails: propertyDetails ?? this.propertyDetails);
  }
}

@JsonSerializable(explicitToJson: true)
class ExamDetailResource {
  ExamDetailResource({
    this.id,
    this.examCategoryId,
    this.title,
    this.status,
    this.duration,
    this.examLevel,
    this.propertyDetails,
    this.propertieValueName,
    this.examCategoryName,
    this.totalSearchProperty,
    this.examsetIds,
    this.members,
    this.numberOfMembers,
    this.numberOfExamTime,
    this.isApproved,
    this.isLike,
    this.type,
    this.examTimeTo,
    this.examTimeFrom,
    this.isFree,
    this.questions,
  });

  factory ExamDetailResource.fromJson(Map<String, dynamic> json) =>
      _$ExamDetailResourceFromJson(json);

  @JsonKey(name: 'id', includeIfNull: true)
  final int? id;
  @JsonKey(name: 'examCategoryId', includeIfNull: true)
  final int? examCategoryId;
  @JsonKey(name: 'title', includeIfNull: true, defaultValue: '')
  final String? title;
  @JsonKey(name: 'status', includeIfNull: true)
  final int? status;
  @JsonKey(name: 'duration', includeIfNull: true)
  final int? duration;
  @JsonKey(name: 'examLevel', includeIfNull: true)
  final int? examLevel;
  @JsonKey(name: 'propertyDetails', includeIfNull: true, defaultValue: <int>[])
  final List<int>? propertyDetails;
  @JsonKey(
      name: 'propertieValueName', includeIfNull: true, defaultValue: <String>[])
  final List<String>? propertieValueName;
  @JsonKey(name: 'examCategoryName', includeIfNull: true, defaultValue: '')
  final String? examCategoryName;
  @JsonKey(name: 'totalSearchProperty', includeIfNull: true)
  final int? totalSearchProperty;
  @JsonKey(name: 'examsetIds', includeIfNull: true, defaultValue: <int>[])
  final List<int>? examsetIds;
  @JsonKey(
      name: 'members', includeIfNull: true, defaultValue: <SimpleUserEntity>[])
  final List<SimpleUserEntity>? members;
  @JsonKey(name: 'numberOfMembers', includeIfNull: true)
  final int? numberOfMembers;
  @JsonKey(name: 'numberOfExamTime', includeIfNull: true)
  final int? numberOfExamTime;
  @JsonKey(name: 'isApproved', includeIfNull: true)
  final bool? isApproved;
  @JsonKey(name: 'isLike', includeIfNull: true)
  final bool? isLike;
  @JsonKey(name: 'type', includeIfNull: true)
  final int? type;
  @JsonKey(name: 'examTimeTo', includeIfNull: true)
  final DateTime? examTimeTo;
  @JsonKey(name: 'examTimeFrom', includeIfNull: true)
  final DateTime? examTimeFrom;
  @JsonKey(name: 'isFree', includeIfNull: true)
  final bool? isFree;
  @JsonKey(
      name: 'questions', includeIfNull: true, defaultValue: <QuestionInExam>[])
  final List<QuestionInExam>? questions;
  static const fromJsonFactory = _$ExamDetailResourceFromJson;
  static const toJsonFactory = _$ExamDetailResourceToJson;
  Map<String, dynamic> toJson() => _$ExamDetailResourceToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ExamDetailResource &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.examCategoryId, examCategoryId) ||
                const DeepCollectionEquality()
                    .equals(other.examCategoryId, examCategoryId)) &&
            (identical(other.title, title) ||
                const DeepCollectionEquality().equals(other.title, title)) &&
            (identical(other.status, status) ||
                const DeepCollectionEquality().equals(other.status, status)) &&
            (identical(other.duration, duration) ||
                const DeepCollectionEquality()
                    .equals(other.duration, duration)) &&
            (identical(other.examLevel, examLevel) ||
                const DeepCollectionEquality()
                    .equals(other.examLevel, examLevel)) &&
            (identical(other.propertyDetails, propertyDetails) ||
                const DeepCollectionEquality()
                    .equals(other.propertyDetails, propertyDetails)) &&
            (identical(other.propertieValueName, propertieValueName) ||
                const DeepCollectionEquality()
                    .equals(other.propertieValueName, propertieValueName)) &&
            (identical(other.examCategoryName, examCategoryName) ||
                const DeepCollectionEquality()
                    .equals(other.examCategoryName, examCategoryName)) &&
            (identical(other.totalSearchProperty, totalSearchProperty) ||
                const DeepCollectionEquality()
                    .equals(other.totalSearchProperty, totalSearchProperty)) &&
            (identical(other.examsetIds, examsetIds) ||
                const DeepCollectionEquality()
                    .equals(other.examsetIds, examsetIds)) &&
            (identical(other.members, members) ||
                const DeepCollectionEquality()
                    .equals(other.members, members)) &&
            (identical(other.numberOfMembers, numberOfMembers) ||
                const DeepCollectionEquality()
                    .equals(other.numberOfMembers, numberOfMembers)) &&
            (identical(other.numberOfExamTime, numberOfExamTime) ||
                const DeepCollectionEquality()
                    .equals(other.numberOfExamTime, numberOfExamTime)) &&
            (identical(other.isApproved, isApproved) ||
                const DeepCollectionEquality()
                    .equals(other.isApproved, isApproved)) &&
            (identical(other.isLike, isLike) ||
                const DeepCollectionEquality().equals(other.isLike, isLike)) &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)) &&
            (identical(other.examTimeTo, examTimeTo) ||
                const DeepCollectionEquality()
                    .equals(other.examTimeTo, examTimeTo)) &&
            (identical(other.examTimeFrom, examTimeFrom) ||
                const DeepCollectionEquality()
                    .equals(other.examTimeFrom, examTimeFrom)) &&
            (identical(other.isFree, isFree) ||
                const DeepCollectionEquality().equals(other.isFree, isFree)) &&
            (identical(other.questions, questions) ||
                const DeepCollectionEquality()
                    .equals(other.questions, questions)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(examCategoryId) ^
      const DeepCollectionEquality().hash(title) ^
      const DeepCollectionEquality().hash(status) ^
      const DeepCollectionEquality().hash(duration) ^
      const DeepCollectionEquality().hash(examLevel) ^
      const DeepCollectionEquality().hash(propertyDetails) ^
      const DeepCollectionEquality().hash(propertieValueName) ^
      const DeepCollectionEquality().hash(examCategoryName) ^
      const DeepCollectionEquality().hash(totalSearchProperty) ^
      const DeepCollectionEquality().hash(examsetIds) ^
      const DeepCollectionEquality().hash(members) ^
      const DeepCollectionEquality().hash(numberOfMembers) ^
      const DeepCollectionEquality().hash(numberOfExamTime) ^
      const DeepCollectionEquality().hash(isApproved) ^
      const DeepCollectionEquality().hash(isLike) ^
      const DeepCollectionEquality().hash(type) ^
      const DeepCollectionEquality().hash(examTimeTo) ^
      const DeepCollectionEquality().hash(examTimeFrom) ^
      const DeepCollectionEquality().hash(isFree) ^
      const DeepCollectionEquality().hash(questions) ^
      runtimeType.hashCode;
}

extension $ExamDetailResourceExtension on ExamDetailResource {
  ExamDetailResource copyWith(
      {int? id,
      int? examCategoryId,
      String? title,
      int? status,
      int? duration,
      int? examLevel,
      List<int>? propertyDetails,
      List<String>? propertieValueName,
      String? examCategoryName,
      int? totalSearchProperty,
      List<int>? examsetIds,
      List<SimpleUserEntity>? members,
      int? numberOfMembers,
      int? numberOfExamTime,
      bool? isApproved,
      bool? isLike,
      int? type,
      DateTime? examTimeTo,
      DateTime? examTimeFrom,
      bool? isFree,
      List<QuestionInExam>? questions}) {
    return ExamDetailResource(
        id: id ?? this.id,
        examCategoryId: examCategoryId ?? this.examCategoryId,
        title: title ?? this.title,
        status: status ?? this.status,
        duration: duration ?? this.duration,
        examLevel: examLevel ?? this.examLevel,
        propertyDetails: propertyDetails ?? this.propertyDetails,
        propertieValueName: propertieValueName ?? this.propertieValueName,
        examCategoryName: examCategoryName ?? this.examCategoryName,
        totalSearchProperty: totalSearchProperty ?? this.totalSearchProperty,
        examsetIds: examsetIds ?? this.examsetIds,
        members: members ?? this.members,
        numberOfMembers: numberOfMembers ?? this.numberOfMembers,
        numberOfExamTime: numberOfExamTime ?? this.numberOfExamTime,
        isApproved: isApproved ?? this.isApproved,
        isLike: isLike ?? this.isLike,
        type: type ?? this.type,
        examTimeTo: examTimeTo ?? this.examTimeTo,
        examTimeFrom: examTimeFrom ?? this.examTimeFrom,
        isFree: isFree ?? this.isFree,
        questions: questions ?? this.questions);
  }
}

@JsonSerializable(explicitToJson: true)
class ExamGroupHomeworkResource {
  ExamGroupHomeworkResource({
    this.id,
    this.examCategoryId,
    this.title,
    this.status,
    this.duration,
    this.examLevel,
    this.propertyDetails,
    this.propertieValueName,
    this.examCategoryName,
    this.totalSearchProperty,
    this.examsetIds,
    this.members,
    this.numberOfMembers,
    this.numberOfExamTime,
    this.isApproved,
    this.isLike,
    this.type,
    this.examTimeTo,
    this.examTimeFrom,
    this.isFree,
    this.examTimeLimit,
    this.examTimeStart,
    this.createdBy,
    this.avatar,
  });

  factory ExamGroupHomeworkResource.fromJson(Map<String, dynamic> json) =>
      _$ExamGroupHomeworkResourceFromJson(json);

  @JsonKey(name: 'id', includeIfNull: true)
  final int? id;
  @JsonKey(name: 'examCategoryId', includeIfNull: true)
  final int? examCategoryId;
  @JsonKey(name: 'title', includeIfNull: true, defaultValue: '')
  final String? title;
  @JsonKey(name: 'status', includeIfNull: true)
  final int? status;
  @JsonKey(name: 'duration', includeIfNull: true)
  final int? duration;
  @JsonKey(name: 'examLevel', includeIfNull: true)
  final int? examLevel;
  @JsonKey(name: 'propertyDetails', includeIfNull: true, defaultValue: <int>[])
  final List<int>? propertyDetails;
  @JsonKey(
      name: 'propertieValueName', includeIfNull: true, defaultValue: <String>[])
  final List<String>? propertieValueName;
  @JsonKey(name: 'examCategoryName', includeIfNull: true, defaultValue: '')
  final String? examCategoryName;
  @JsonKey(name: 'totalSearchProperty', includeIfNull: true)
  final int? totalSearchProperty;
  @JsonKey(name: 'examsetIds', includeIfNull: true, defaultValue: <int>[])
  final List<int>? examsetIds;
  @JsonKey(
      name: 'members', includeIfNull: true, defaultValue: <SimpleUserEntity>[])
  final List<SimpleUserEntity>? members;
  @JsonKey(name: 'numberOfMembers', includeIfNull: true)
  final int? numberOfMembers;
  @JsonKey(name: 'numberOfExamTime', includeIfNull: true)
  final int? numberOfExamTime;
  @JsonKey(name: 'isApproved', includeIfNull: true)
  final bool? isApproved;
  @JsonKey(name: 'isLike', includeIfNull: true)
  final bool? isLike;
  @JsonKey(name: 'type', includeIfNull: true)
  final int? type;
  @JsonKey(name: 'examTimeTo', includeIfNull: true)
  final DateTime? examTimeTo;
  @JsonKey(name: 'examTimeFrom', includeIfNull: true)
  final DateTime? examTimeFrom;
  @JsonKey(name: 'isFree', includeIfNull: true)
  final bool? isFree;
  @JsonKey(name: 'examTimeLimit', includeIfNull: true)
  final DateTime? examTimeLimit;
  @JsonKey(name: 'examTimeStart', includeIfNull: true)
  final DateTime? examTimeStart;
  @JsonKey(name: 'createdBy', includeIfNull: true)
  final int? createdBy;
  @JsonKey(name: 'avatar', includeIfNull: true, defaultValue: '')
  final String? avatar;
  static const fromJsonFactory = _$ExamGroupHomeworkResourceFromJson;
  static const toJsonFactory = _$ExamGroupHomeworkResourceToJson;
  Map<String, dynamic> toJson() => _$ExamGroupHomeworkResourceToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ExamGroupHomeworkResource &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.examCategoryId, examCategoryId) ||
                const DeepCollectionEquality()
                    .equals(other.examCategoryId, examCategoryId)) &&
            (identical(other.title, title) ||
                const DeepCollectionEquality().equals(other.title, title)) &&
            (identical(other.status, status) ||
                const DeepCollectionEquality().equals(other.status, status)) &&
            (identical(other.duration, duration) ||
                const DeepCollectionEquality()
                    .equals(other.duration, duration)) &&
            (identical(other.examLevel, examLevel) ||
                const DeepCollectionEquality()
                    .equals(other.examLevel, examLevel)) &&
            (identical(other.propertyDetails, propertyDetails) ||
                const DeepCollectionEquality()
                    .equals(other.propertyDetails, propertyDetails)) &&
            (identical(other.propertieValueName, propertieValueName) ||
                const DeepCollectionEquality()
                    .equals(other.propertieValueName, propertieValueName)) &&
            (identical(other.examCategoryName, examCategoryName) ||
                const DeepCollectionEquality()
                    .equals(other.examCategoryName, examCategoryName)) &&
            (identical(other.totalSearchProperty, totalSearchProperty) ||
                const DeepCollectionEquality()
                    .equals(other.totalSearchProperty, totalSearchProperty)) &&
            (identical(other.examsetIds, examsetIds) ||
                const DeepCollectionEquality()
                    .equals(other.examsetIds, examsetIds)) &&
            (identical(other.members, members) ||
                const DeepCollectionEquality()
                    .equals(other.members, members)) &&
            (identical(other.numberOfMembers, numberOfMembers) ||
                const DeepCollectionEquality()
                    .equals(other.numberOfMembers, numberOfMembers)) &&
            (identical(other.numberOfExamTime, numberOfExamTime) ||
                const DeepCollectionEquality()
                    .equals(other.numberOfExamTime, numberOfExamTime)) &&
            (identical(other.isApproved, isApproved) ||
                const DeepCollectionEquality()
                    .equals(other.isApproved, isApproved)) &&
            (identical(other.isLike, isLike) ||
                const DeepCollectionEquality().equals(other.isLike, isLike)) &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)) &&
            (identical(other.examTimeTo, examTimeTo) ||
                const DeepCollectionEquality()
                    .equals(other.examTimeTo, examTimeTo)) &&
            (identical(other.examTimeFrom, examTimeFrom) ||
                const DeepCollectionEquality()
                    .equals(other.examTimeFrom, examTimeFrom)) &&
            (identical(other.isFree, isFree) ||
                const DeepCollectionEquality().equals(other.isFree, isFree)) &&
            (identical(other.examTimeLimit, examTimeLimit) ||
                const DeepCollectionEquality()
                    .equals(other.examTimeLimit, examTimeLimit)) &&
            (identical(other.examTimeStart, examTimeStart) ||
                const DeepCollectionEquality()
                    .equals(other.examTimeStart, examTimeStart)) &&
            (identical(other.createdBy, createdBy) ||
                const DeepCollectionEquality()
                    .equals(other.createdBy, createdBy)) &&
            (identical(other.avatar, avatar) ||
                const DeepCollectionEquality().equals(other.avatar, avatar)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(examCategoryId) ^
      const DeepCollectionEquality().hash(title) ^
      const DeepCollectionEquality().hash(status) ^
      const DeepCollectionEquality().hash(duration) ^
      const DeepCollectionEquality().hash(examLevel) ^
      const DeepCollectionEquality().hash(propertyDetails) ^
      const DeepCollectionEquality().hash(propertieValueName) ^
      const DeepCollectionEquality().hash(examCategoryName) ^
      const DeepCollectionEquality().hash(totalSearchProperty) ^
      const DeepCollectionEquality().hash(examsetIds) ^
      const DeepCollectionEquality().hash(members) ^
      const DeepCollectionEquality().hash(numberOfMembers) ^
      const DeepCollectionEquality().hash(numberOfExamTime) ^
      const DeepCollectionEquality().hash(isApproved) ^
      const DeepCollectionEquality().hash(isLike) ^
      const DeepCollectionEquality().hash(type) ^
      const DeepCollectionEquality().hash(examTimeTo) ^
      const DeepCollectionEquality().hash(examTimeFrom) ^
      const DeepCollectionEquality().hash(isFree) ^
      const DeepCollectionEquality().hash(examTimeLimit) ^
      const DeepCollectionEquality().hash(examTimeStart) ^
      const DeepCollectionEquality().hash(createdBy) ^
      const DeepCollectionEquality().hash(avatar) ^
      runtimeType.hashCode;
}

extension $ExamGroupHomeworkResourceExtension on ExamGroupHomeworkResource {
  ExamGroupHomeworkResource copyWith(
      {int? id,
      int? examCategoryId,
      String? title,
      int? status,
      int? duration,
      int? examLevel,
      List<int>? propertyDetails,
      List<String>? propertieValueName,
      String? examCategoryName,
      int? totalSearchProperty,
      List<int>? examsetIds,
      List<SimpleUserEntity>? members,
      int? numberOfMembers,
      int? numberOfExamTime,
      bool? isApproved,
      bool? isLike,
      int? type,
      DateTime? examTimeTo,
      DateTime? examTimeFrom,
      bool? isFree,
      DateTime? examTimeLimit,
      DateTime? examTimeStart,
      int? createdBy,
      String? avatar}) {
    return ExamGroupHomeworkResource(
        id: id ?? this.id,
        examCategoryId: examCategoryId ?? this.examCategoryId,
        title: title ?? this.title,
        status: status ?? this.status,
        duration: duration ?? this.duration,
        examLevel: examLevel ?? this.examLevel,
        propertyDetails: propertyDetails ?? this.propertyDetails,
        propertieValueName: propertieValueName ?? this.propertieValueName,
        examCategoryName: examCategoryName ?? this.examCategoryName,
        totalSearchProperty: totalSearchProperty ?? this.totalSearchProperty,
        examsetIds: examsetIds ?? this.examsetIds,
        members: members ?? this.members,
        numberOfMembers: numberOfMembers ?? this.numberOfMembers,
        numberOfExamTime: numberOfExamTime ?? this.numberOfExamTime,
        isApproved: isApproved ?? this.isApproved,
        isLike: isLike ?? this.isLike,
        type: type ?? this.type,
        examTimeTo: examTimeTo ?? this.examTimeTo,
        examTimeFrom: examTimeFrom ?? this.examTimeFrom,
        isFree: isFree ?? this.isFree,
        examTimeLimit: examTimeLimit ?? this.examTimeLimit,
        examTimeStart: examTimeStart ?? this.examTimeStart,
        createdBy: createdBy ?? this.createdBy,
        avatar: avatar ?? this.avatar);
  }
}

@JsonSerializable(explicitToJson: true)
class ExamGroupHomeworkResourceFilterResult {
  ExamGroupHomeworkResourceFilterResult({
    this.totalRows,
    this.data,
  });

  factory ExamGroupHomeworkResourceFilterResult.fromJson(
          Map<String, dynamic> json) =>
      _$ExamGroupHomeworkResourceFilterResultFromJson(json);

  @JsonKey(name: 'totalRows', includeIfNull: true)
  final int? totalRows;
  @JsonKey(
      name: 'data',
      includeIfNull: true,
      defaultValue: <ExamGroupHomeworkResource>[])
  final List<ExamGroupHomeworkResource>? data;
  static const fromJsonFactory =
      _$ExamGroupHomeworkResourceFilterResultFromJson;
  static const toJsonFactory = _$ExamGroupHomeworkResourceFilterResultToJson;
  Map<String, dynamic> toJson() =>
      _$ExamGroupHomeworkResourceFilterResultToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ExamGroupHomeworkResourceFilterResult &&
            (identical(other.totalRows, totalRows) ||
                const DeepCollectionEquality()
                    .equals(other.totalRows, totalRows)) &&
            (identical(other.data, data) ||
                const DeepCollectionEquality().equals(other.data, data)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(totalRows) ^
      const DeepCollectionEquality().hash(data) ^
      runtimeType.hashCode;
}

extension $ExamGroupHomeworkResourceFilterResultExtension
    on ExamGroupHomeworkResourceFilterResult {
  ExamGroupHomeworkResourceFilterResult copyWith(
      {int? totalRows, List<ExamGroupHomeworkResource>? data}) {
    return ExamGroupHomeworkResourceFilterResult(
        totalRows: totalRows ?? this.totalRows, data: data ?? this.data);
  }
}

@JsonSerializable(explicitToJson: true)
class ExamInfo {
  ExamInfo({
    this.type,
    this.title,
    this.duration,
    this.examId,
    this.description,
    this.isApproved,
    this.user,
    this.numberDoExam,
    this.isLiked,
    this.data,
  });

  factory ExamInfo.fromJson(Map<String, dynamic> json) =>
      _$ExamInfoFromJson(json);

  @JsonKey(name: 'type', includeIfNull: true)
  final int? type;
  @JsonKey(name: 'title', includeIfNull: true, defaultValue: '')
  final String? title;
  @JsonKey(name: 'duration', includeIfNull: true)
  final double? duration;
  @JsonKey(name: 'examId', includeIfNull: true)
  final int? examId;
  @JsonKey(name: 'description', includeIfNull: true, defaultValue: '')
  final String? description;
  @JsonKey(name: 'isApproved', includeIfNull: true)
  final bool? isApproved;
  @JsonKey(name: 'user', includeIfNull: true)
  final SimpleUserEntity? user;
  @JsonKey(name: 'numberDoExam', includeIfNull: true)
  final int? numberDoExam;
  @JsonKey(name: 'isLiked', includeIfNull: true)
  final bool? isLiked;
  @JsonKey(
      name: 'data',
      includeIfNull: true,
      defaultValue: <PropertyDetailTreeNodeExtInt64NullableTreeNode>[])
  final List<PropertyDetailTreeNodeExtInt64NullableTreeNode>? data;
  static const fromJsonFactory = _$ExamInfoFromJson;
  static const toJsonFactory = _$ExamInfoToJson;
  Map<String, dynamic> toJson() => _$ExamInfoToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ExamInfo &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)) &&
            (identical(other.title, title) ||
                const DeepCollectionEquality().equals(other.title, title)) &&
            (identical(other.duration, duration) ||
                const DeepCollectionEquality()
                    .equals(other.duration, duration)) &&
            (identical(other.examId, examId) ||
                const DeepCollectionEquality().equals(other.examId, examId)) &&
            (identical(other.description, description) ||
                const DeepCollectionEquality()
                    .equals(other.description, description)) &&
            (identical(other.isApproved, isApproved) ||
                const DeepCollectionEquality()
                    .equals(other.isApproved, isApproved)) &&
            (identical(other.user, user) ||
                const DeepCollectionEquality().equals(other.user, user)) &&
            (identical(other.numberDoExam, numberDoExam) ||
                const DeepCollectionEquality()
                    .equals(other.numberDoExam, numberDoExam)) &&
            (identical(other.isLiked, isLiked) ||
                const DeepCollectionEquality()
                    .equals(other.isLiked, isLiked)) &&
            (identical(other.data, data) ||
                const DeepCollectionEquality().equals(other.data, data)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(type) ^
      const DeepCollectionEquality().hash(title) ^
      const DeepCollectionEquality().hash(duration) ^
      const DeepCollectionEquality().hash(examId) ^
      const DeepCollectionEquality().hash(description) ^
      const DeepCollectionEquality().hash(isApproved) ^
      const DeepCollectionEquality().hash(user) ^
      const DeepCollectionEquality().hash(numberDoExam) ^
      const DeepCollectionEquality().hash(isLiked) ^
      const DeepCollectionEquality().hash(data) ^
      runtimeType.hashCode;
}

extension $ExamInfoExtension on ExamInfo {
  ExamInfo copyWith(
      {int? type,
      String? title,
      double? duration,
      int? examId,
      String? description,
      bool? isApproved,
      SimpleUserEntity? user,
      int? numberDoExam,
      bool? isLiked,
      List<PropertyDetailTreeNodeExtInt64NullableTreeNode>? data}) {
    return ExamInfo(
        type: type ?? this.type,
        title: title ?? this.title,
        duration: duration ?? this.duration,
        examId: examId ?? this.examId,
        description: description ?? this.description,
        isApproved: isApproved ?? this.isApproved,
        user: user ?? this.user,
        numberDoExam: numberDoExam ?? this.numberDoExam,
        isLiked: isLiked ?? this.isLiked,
        data: data ?? this.data);
  }
}

@JsonSerializable(explicitToJson: true)
class ExamInfoDetailPublicResource {
  ExamInfoDetailPublicResource({
    this.type,
    this.title,
    this.duration,
    this.infoExam,
    this.mark,
    this.listQuestionAnswerUserExam,
    this.examType,
    this.examCategoryId,
    this.examTimeFrom,
    this.examTimeTo,
    this.isRegisted,
    this.isFree,
    this.isBuy,
    this.typeButtonRegister,
  });

  factory ExamInfoDetailPublicResource.fromJson(Map<String, dynamic> json) =>
      _$ExamInfoDetailPublicResourceFromJson(json);

  @JsonKey(name: 'type', includeIfNull: true)
  final int? type;
  @JsonKey(name: 'title', includeIfNull: true, defaultValue: '')
  final String? title;
  @JsonKey(name: 'duration', includeIfNull: true)
  final int? duration;
  @JsonKey(name: 'infoExam', includeIfNull: true)
  final InfoExam? infoExam;
  @JsonKey(name: 'mark', includeIfNull: true)
  final double? mark;
  @JsonKey(
      name: 'listQuestionAnswerUserExam',
      includeIfNull: true,
      defaultValue: <UserAnswerPublicResource>[])
  final List<UserAnswerPublicResource>? listQuestionAnswerUserExam;
  @JsonKey(name: 'examType', includeIfNull: true)
  final int? examType;
  @JsonKey(name: 'examCategoryId', includeIfNull: true)
  final int? examCategoryId;
  @JsonKey(name: 'examTimeFrom', includeIfNull: true)
  final DateTime? examTimeFrom;
  @JsonKey(name: 'examTimeTo', includeIfNull: true)
  final DateTime? examTimeTo;
  @JsonKey(name: 'isRegisted', includeIfNull: true)
  final bool? isRegisted;
  @JsonKey(name: 'isFree', includeIfNull: true)
  final bool? isFree;
  @JsonKey(name: 'isBuy', includeIfNull: true)
  final bool? isBuy;
  @JsonKey(name: 'typeButtonRegister', includeIfNull: true)
  final int? typeButtonRegister;
  static const fromJsonFactory = _$ExamInfoDetailPublicResourceFromJson;
  static const toJsonFactory = _$ExamInfoDetailPublicResourceToJson;
  Map<String, dynamic> toJson() => _$ExamInfoDetailPublicResourceToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ExamInfoDetailPublicResource &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)) &&
            (identical(other.title, title) ||
                const DeepCollectionEquality().equals(other.title, title)) &&
            (identical(other.duration, duration) ||
                const DeepCollectionEquality()
                    .equals(other.duration, duration)) &&
            (identical(other.infoExam, infoExam) ||
                const DeepCollectionEquality()
                    .equals(other.infoExam, infoExam)) &&
            (identical(other.mark, mark) ||
                const DeepCollectionEquality().equals(other.mark, mark)) &&
            (identical(other.listQuestionAnswerUserExam,
                    listQuestionAnswerUserExam) ||
                const DeepCollectionEquality().equals(
                    other.listQuestionAnswerUserExam,
                    listQuestionAnswerUserExam)) &&
            (identical(other.examType, examType) ||
                const DeepCollectionEquality()
                    .equals(other.examType, examType)) &&
            (identical(other.examCategoryId, examCategoryId) ||
                const DeepCollectionEquality()
                    .equals(other.examCategoryId, examCategoryId)) &&
            (identical(other.examTimeFrom, examTimeFrom) ||
                const DeepCollectionEquality()
                    .equals(other.examTimeFrom, examTimeFrom)) &&
            (identical(other.examTimeTo, examTimeTo) ||
                const DeepCollectionEquality()
                    .equals(other.examTimeTo, examTimeTo)) &&
            (identical(other.isRegisted, isRegisted) ||
                const DeepCollectionEquality()
                    .equals(other.isRegisted, isRegisted)) &&
            (identical(other.isFree, isFree) ||
                const DeepCollectionEquality().equals(other.isFree, isFree)) &&
            (identical(other.isBuy, isBuy) ||
                const DeepCollectionEquality().equals(other.isBuy, isBuy)) &&
            (identical(other.typeButtonRegister, typeButtonRegister) ||
                const DeepCollectionEquality()
                    .equals(other.typeButtonRegister, typeButtonRegister)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(type) ^
      const DeepCollectionEquality().hash(title) ^
      const DeepCollectionEquality().hash(duration) ^
      const DeepCollectionEquality().hash(infoExam) ^
      const DeepCollectionEquality().hash(mark) ^
      const DeepCollectionEquality().hash(listQuestionAnswerUserExam) ^
      const DeepCollectionEquality().hash(examType) ^
      const DeepCollectionEquality().hash(examCategoryId) ^
      const DeepCollectionEquality().hash(examTimeFrom) ^
      const DeepCollectionEquality().hash(examTimeTo) ^
      const DeepCollectionEquality().hash(isRegisted) ^
      const DeepCollectionEquality().hash(isFree) ^
      const DeepCollectionEquality().hash(isBuy) ^
      const DeepCollectionEquality().hash(typeButtonRegister) ^
      runtimeType.hashCode;
}

extension $ExamInfoDetailPublicResourceExtension
    on ExamInfoDetailPublicResource {
  ExamInfoDetailPublicResource copyWith(
      {int? type,
      String? title,
      int? duration,
      InfoExam? infoExam,
      double? mark,
      List<UserAnswerPublicResource>? listQuestionAnswerUserExam,
      int? examType,
      int? examCategoryId,
      DateTime? examTimeFrom,
      DateTime? examTimeTo,
      bool? isRegisted,
      bool? isFree,
      bool? isBuy,
      int? typeButtonRegister}) {
    return ExamInfoDetailPublicResource(
        type: type ?? this.type,
        title: title ?? this.title,
        duration: duration ?? this.duration,
        infoExam: infoExam ?? this.infoExam,
        mark: mark ?? this.mark,
        listQuestionAnswerUserExam:
            listQuestionAnswerUserExam ?? this.listQuestionAnswerUserExam,
        examType: examType ?? this.examType,
        examCategoryId: examCategoryId ?? this.examCategoryId,
        examTimeFrom: examTimeFrom ?? this.examTimeFrom,
        examTimeTo: examTimeTo ?? this.examTimeTo,
        isRegisted: isRegisted ?? this.isRegisted,
        isFree: isFree ?? this.isFree,
        isBuy: isBuy ?? this.isBuy,
        typeButtonRegister: typeButtonRegister ?? this.typeButtonRegister);
  }
}

@JsonSerializable(explicitToJson: true)
class ExamPackageFilterResource {
  ExamPackageFilterResource({
    this.sortExpression,
    this.pageSize,
    this.pageIndex,
    this.keyWord,
    this.status,
    this.price,
    this.discountPrice,
    this.startDate,
    this.endDate,
    this.isHot,
    this.categoryIds,
  });

  factory ExamPackageFilterResource.fromJson(Map<String, dynamic> json) =>
      _$ExamPackageFilterResourceFromJson(json);

  @JsonKey(name: 'sortExpression', includeIfNull: true, defaultValue: '')
  final String? sortExpression;
  @JsonKey(name: 'pageSize', includeIfNull: true)
  final int? pageSize;
  @JsonKey(name: 'pageIndex', includeIfNull: true)
  final int? pageIndex;
  @JsonKey(name: 'keyWord', includeIfNull: true, defaultValue: '')
  final String? keyWord;
  @JsonKey(name: 'status', includeIfNull: true)
  final int? status;
  @JsonKey(name: 'price', includeIfNull: true)
  final double? price;
  @JsonKey(name: 'discountPrice', includeIfNull: true)
  final double? discountPrice;
  @JsonKey(name: 'startDate', includeIfNull: true)
  final DateTime? startDate;
  @JsonKey(name: 'endDate', includeIfNull: true)
  final DateTime? endDate;
  @JsonKey(name: 'isHot', includeIfNull: true)
  final bool? isHot;
  @JsonKey(name: 'categoryIds', includeIfNull: true, defaultValue: <int>[])
  final List<int>? categoryIds;
  static const fromJsonFactory = _$ExamPackageFilterResourceFromJson;
  static const toJsonFactory = _$ExamPackageFilterResourceToJson;
  Map<String, dynamic> toJson() => _$ExamPackageFilterResourceToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ExamPackageFilterResource &&
            (identical(other.sortExpression, sortExpression) ||
                const DeepCollectionEquality()
                    .equals(other.sortExpression, sortExpression)) &&
            (identical(other.pageSize, pageSize) ||
                const DeepCollectionEquality()
                    .equals(other.pageSize, pageSize)) &&
            (identical(other.pageIndex, pageIndex) ||
                const DeepCollectionEquality()
                    .equals(other.pageIndex, pageIndex)) &&
            (identical(other.keyWord, keyWord) ||
                const DeepCollectionEquality()
                    .equals(other.keyWord, keyWord)) &&
            (identical(other.status, status) ||
                const DeepCollectionEquality().equals(other.status, status)) &&
            (identical(other.price, price) ||
                const DeepCollectionEquality().equals(other.price, price)) &&
            (identical(other.discountPrice, discountPrice) ||
                const DeepCollectionEquality()
                    .equals(other.discountPrice, discountPrice)) &&
            (identical(other.startDate, startDate) ||
                const DeepCollectionEquality()
                    .equals(other.startDate, startDate)) &&
            (identical(other.endDate, endDate) ||
                const DeepCollectionEquality()
                    .equals(other.endDate, endDate)) &&
            (identical(other.isHot, isHot) ||
                const DeepCollectionEquality().equals(other.isHot, isHot)) &&
            (identical(other.categoryIds, categoryIds) ||
                const DeepCollectionEquality()
                    .equals(other.categoryIds, categoryIds)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(sortExpression) ^
      const DeepCollectionEquality().hash(pageSize) ^
      const DeepCollectionEquality().hash(pageIndex) ^
      const DeepCollectionEquality().hash(keyWord) ^
      const DeepCollectionEquality().hash(status) ^
      const DeepCollectionEquality().hash(price) ^
      const DeepCollectionEquality().hash(discountPrice) ^
      const DeepCollectionEquality().hash(startDate) ^
      const DeepCollectionEquality().hash(endDate) ^
      const DeepCollectionEquality().hash(isHot) ^
      const DeepCollectionEquality().hash(categoryIds) ^
      runtimeType.hashCode;
}

extension $ExamPackageFilterResourceExtension on ExamPackageFilterResource {
  ExamPackageFilterResource copyWith(
      {String? sortExpression,
      int? pageSize,
      int? pageIndex,
      String? keyWord,
      int? status,
      double? price,
      double? discountPrice,
      DateTime? startDate,
      DateTime? endDate,
      bool? isHot,
      List<int>? categoryIds}) {
    return ExamPackageFilterResource(
        sortExpression: sortExpression ?? this.sortExpression,
        pageSize: pageSize ?? this.pageSize,
        pageIndex: pageIndex ?? this.pageIndex,
        keyWord: keyWord ?? this.keyWord,
        status: status ?? this.status,
        price: price ?? this.price,
        discountPrice: discountPrice ?? this.discountPrice,
        startDate: startDate ?? this.startDate,
        endDate: endDate ?? this.endDate,
        isHot: isHot ?? this.isHot,
        categoryIds: categoryIds ?? this.categoryIds);
  }
}

@JsonSerializable(explicitToJson: true)
class ExamPackagePublicResource {
  ExamPackagePublicResource({
    this.id,
    this.avatar,
    this.title,
    this.description,
    this.price,
    this.discountPrice,
    this.saleOffTitle,
    this.totalMonth,
    this.startDate,
    this.endDate,
    this.status,
    this.categories,
    this.listCategory,
    this.isHot,
    this.listUserBought,
    this.isBuy,
    this.listExamInExamPackage,
  });

  factory ExamPackagePublicResource.fromJson(Map<String, dynamic> json) =>
      _$ExamPackagePublicResourceFromJson(json);

  @JsonKey(name: 'id', includeIfNull: true)
  final int? id;
  @JsonKey(name: 'avatar', includeIfNull: true, defaultValue: '')
  final String? avatar;
  @JsonKey(name: 'title', includeIfNull: true, defaultValue: '')
  final String? title;
  @JsonKey(name: 'description', includeIfNull: true, defaultValue: '')
  final String? description;
  @JsonKey(name: 'price', includeIfNull: true)
  final double? price;
  @JsonKey(name: 'discountPrice', includeIfNull: true)
  final double? discountPrice;
  @JsonKey(name: 'saleOffTitle', includeIfNull: true, defaultValue: '')
  final String? saleOffTitle;
  @JsonKey(name: 'totalMonth', includeIfNull: true)
  final int? totalMonth;
  @JsonKey(name: 'startDate', includeIfNull: true)
  final DateTime? startDate;
  @JsonKey(name: 'endDate', includeIfNull: true)
  final DateTime? endDate;
  @JsonKey(name: 'status', includeIfNull: true)
  final int? status;
  @JsonKey(name: 'categories', includeIfNull: true, defaultValue: <int>[])
  final List<int>? categories;
  @JsonKey(
      name: 'listCategory',
      includeIfNull: true,
      defaultValue: <CategoryEntity>[])
  final List<CategoryEntity>? listCategory;
  @JsonKey(name: 'isHot', includeIfNull: true)
  final bool? isHot;
  @JsonKey(name: 'listUserBought', includeIfNull: true)
  final SimpleUserEntityFilterResult? listUserBought;
  @JsonKey(name: 'isBuy', includeIfNull: true)
  final bool? isBuy;
  @JsonKey(name: 'listExamInExamPackage', includeIfNull: true)
  final ExamResourceFilterResult? listExamInExamPackage;
  static const fromJsonFactory = _$ExamPackagePublicResourceFromJson;
  static const toJsonFactory = _$ExamPackagePublicResourceToJson;
  Map<String, dynamic> toJson() => _$ExamPackagePublicResourceToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ExamPackagePublicResource &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.avatar, avatar) ||
                const DeepCollectionEquality().equals(other.avatar, avatar)) &&
            (identical(other.title, title) ||
                const DeepCollectionEquality().equals(other.title, title)) &&
            (identical(other.description, description) ||
                const DeepCollectionEquality()
                    .equals(other.description, description)) &&
            (identical(other.price, price) ||
                const DeepCollectionEquality().equals(other.price, price)) &&
            (identical(other.discountPrice, discountPrice) ||
                const DeepCollectionEquality()
                    .equals(other.discountPrice, discountPrice)) &&
            (identical(other.saleOffTitle, saleOffTitle) ||
                const DeepCollectionEquality()
                    .equals(other.saleOffTitle, saleOffTitle)) &&
            (identical(other.totalMonth, totalMonth) ||
                const DeepCollectionEquality()
                    .equals(other.totalMonth, totalMonth)) &&
            (identical(other.startDate, startDate) ||
                const DeepCollectionEquality()
                    .equals(other.startDate, startDate)) &&
            (identical(other.endDate, endDate) ||
                const DeepCollectionEquality()
                    .equals(other.endDate, endDate)) &&
            (identical(other.status, status) ||
                const DeepCollectionEquality().equals(other.status, status)) &&
            (identical(other.categories, categories) ||
                const DeepCollectionEquality()
                    .equals(other.categories, categories)) &&
            (identical(other.listCategory, listCategory) ||
                const DeepCollectionEquality()
                    .equals(other.listCategory, listCategory)) &&
            (identical(other.isHot, isHot) ||
                const DeepCollectionEquality().equals(other.isHot, isHot)) &&
            (identical(other.listUserBought, listUserBought) ||
                const DeepCollectionEquality()
                    .equals(other.listUserBought, listUserBought)) &&
            (identical(other.isBuy, isBuy) ||
                const DeepCollectionEquality().equals(other.isBuy, isBuy)) &&
            (identical(other.listExamInExamPackage, listExamInExamPackage) ||
                const DeepCollectionEquality().equals(
                    other.listExamInExamPackage, listExamInExamPackage)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(avatar) ^
      const DeepCollectionEquality().hash(title) ^
      const DeepCollectionEquality().hash(description) ^
      const DeepCollectionEquality().hash(price) ^
      const DeepCollectionEquality().hash(discountPrice) ^
      const DeepCollectionEquality().hash(saleOffTitle) ^
      const DeepCollectionEquality().hash(totalMonth) ^
      const DeepCollectionEquality().hash(startDate) ^
      const DeepCollectionEquality().hash(endDate) ^
      const DeepCollectionEquality().hash(status) ^
      const DeepCollectionEquality().hash(categories) ^
      const DeepCollectionEquality().hash(listCategory) ^
      const DeepCollectionEquality().hash(isHot) ^
      const DeepCollectionEquality().hash(listUserBought) ^
      const DeepCollectionEquality().hash(isBuy) ^
      const DeepCollectionEquality().hash(listExamInExamPackage) ^
      runtimeType.hashCode;
}

extension $ExamPackagePublicResourceExtension on ExamPackagePublicResource {
  ExamPackagePublicResource copyWith(
      {int? id,
      String? avatar,
      String? title,
      String? description,
      double? price,
      double? discountPrice,
      String? saleOffTitle,
      int? totalMonth,
      DateTime? startDate,
      DateTime? endDate,
      int? status,
      List<int>? categories,
      List<CategoryEntity>? listCategory,
      bool? isHot,
      SimpleUserEntityFilterResult? listUserBought,
      bool? isBuy,
      ExamResourceFilterResult? listExamInExamPackage}) {
    return ExamPackagePublicResource(
        id: id ?? this.id,
        avatar: avatar ?? this.avatar,
        title: title ?? this.title,
        description: description ?? this.description,
        price: price ?? this.price,
        discountPrice: discountPrice ?? this.discountPrice,
        saleOffTitle: saleOffTitle ?? this.saleOffTitle,
        totalMonth: totalMonth ?? this.totalMonth,
        startDate: startDate ?? this.startDate,
        endDate: endDate ?? this.endDate,
        status: status ?? this.status,
        categories: categories ?? this.categories,
        listCategory: listCategory ?? this.listCategory,
        isHot: isHot ?? this.isHot,
        listUserBought: listUserBought ?? this.listUserBought,
        isBuy: isBuy ?? this.isBuy,
        listExamInExamPackage:
            listExamInExamPackage ?? this.listExamInExamPackage);
  }
}

@JsonSerializable(explicitToJson: true)
class ExamPreviewResource {
  ExamPreviewResource({
    this.id,
    this.examStructureId,
    this.examCategoryId,
    this.examCategoryIds,
    this.data,
    this.duration,
    this.title,
    this.examLevel,
    this.type,
    this.examType,
    this.examLimit,
    this.shareMode,
    this.totalMark,
    this.totalQuestion,
    this.examTimeFrom,
    this.examTimeTo,
    this.examLimitNumber,
    this.status,
    this.propertyDetails,
    this.examName,
    this.examCategoryName,
    this.examLevelName,
    this.shareModeName,
  });

  factory ExamPreviewResource.fromJson(Map<String, dynamic> json) =>
      _$ExamPreviewResourceFromJson(json);

  @JsonKey(name: 'id', includeIfNull: true)
  final int? id;
  @JsonKey(name: 'examStructureId', includeIfNull: true)
  final int? examStructureId;
  @JsonKey(name: 'examCategoryId', includeIfNull: true)
  final int? examCategoryId;
  @JsonKey(name: 'examCategoryIds', includeIfNull: true, defaultValue: <int>[])
  final List<int>? examCategoryIds;
  @JsonKey(name: 'data', includeIfNull: true, defaultValue: '')
  final String? data;
  @JsonKey(name: 'duration', includeIfNull: true)
  final int? duration;
  @JsonKey(name: 'title', includeIfNull: true, defaultValue: '')
  final String? title;
  @JsonKey(name: 'examLevel', includeIfNull: true)
  final int? examLevel;
  @JsonKey(name: 'type', includeIfNull: true)
  final int? type;
  @JsonKey(name: 'examType', includeIfNull: true)
  final int? examType;
  @JsonKey(name: 'examLimit', includeIfNull: true)
  final int? examLimit;
  @JsonKey(name: 'shareMode', includeIfNull: true)
  final int? shareMode;
  @JsonKey(name: 'totalMark', includeIfNull: true)
  final double? totalMark;
  @JsonKey(name: 'totalQuestion', includeIfNull: true)
  final int? totalQuestion;
  @JsonKey(name: 'examTimeFrom', includeIfNull: true)
  final DateTime? examTimeFrom;
  @JsonKey(name: 'examTimeTo', includeIfNull: true)
  final DateTime? examTimeTo;
  @JsonKey(name: 'examLimitNumber', includeIfNull: true)
  final int? examLimitNumber;
  @JsonKey(name: 'status', includeIfNull: true)
  final int? status;
  @JsonKey(name: 'propertyDetails', includeIfNull: true, defaultValue: <int>[])
  final List<int>? propertyDetails;
  @JsonKey(name: 'examName', includeIfNull: true, defaultValue: '')
  final String? examName;
  @JsonKey(name: 'examCategoryName', includeIfNull: true, defaultValue: '')
  final String? examCategoryName;
  @JsonKey(name: 'examLevelName', includeIfNull: true, defaultValue: '')
  final String? examLevelName;
  @JsonKey(name: 'shareModeName', includeIfNull: true, defaultValue: '')
  final String? shareModeName;
  static const fromJsonFactory = _$ExamPreviewResourceFromJson;
  static const toJsonFactory = _$ExamPreviewResourceToJson;
  Map<String, dynamic> toJson() => _$ExamPreviewResourceToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ExamPreviewResource &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.examStructureId, examStructureId) ||
                const DeepCollectionEquality()
                    .equals(other.examStructureId, examStructureId)) &&
            (identical(other.examCategoryId, examCategoryId) ||
                const DeepCollectionEquality()
                    .equals(other.examCategoryId, examCategoryId)) &&
            (identical(other.examCategoryIds, examCategoryIds) ||
                const DeepCollectionEquality()
                    .equals(other.examCategoryIds, examCategoryIds)) &&
            (identical(other.data, data) ||
                const DeepCollectionEquality().equals(other.data, data)) &&
            (identical(other.duration, duration) ||
                const DeepCollectionEquality()
                    .equals(other.duration, duration)) &&
            (identical(other.title, title) ||
                const DeepCollectionEquality().equals(other.title, title)) &&
            (identical(other.examLevel, examLevel) ||
                const DeepCollectionEquality()
                    .equals(other.examLevel, examLevel)) &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)) &&
            (identical(other.examType, examType) ||
                const DeepCollectionEquality()
                    .equals(other.examType, examType)) &&
            (identical(other.examLimit, examLimit) ||
                const DeepCollectionEquality()
                    .equals(other.examLimit, examLimit)) &&
            (identical(other.shareMode, shareMode) ||
                const DeepCollectionEquality()
                    .equals(other.shareMode, shareMode)) &&
            (identical(other.totalMark, totalMark) ||
                const DeepCollectionEquality()
                    .equals(other.totalMark, totalMark)) &&
            (identical(other.totalQuestion, totalQuestion) ||
                const DeepCollectionEquality()
                    .equals(other.totalQuestion, totalQuestion)) &&
            (identical(other.examTimeFrom, examTimeFrom) ||
                const DeepCollectionEquality()
                    .equals(other.examTimeFrom, examTimeFrom)) &&
            (identical(other.examTimeTo, examTimeTo) ||
                const DeepCollectionEquality()
                    .equals(other.examTimeTo, examTimeTo)) &&
            (identical(other.examLimitNumber, examLimitNumber) ||
                const DeepCollectionEquality()
                    .equals(other.examLimitNumber, examLimitNumber)) &&
            (identical(other.status, status) ||
                const DeepCollectionEquality().equals(other.status, status)) &&
            (identical(other.propertyDetails, propertyDetails) ||
                const DeepCollectionEquality()
                    .equals(other.propertyDetails, propertyDetails)) &&
            (identical(other.examName, examName) ||
                const DeepCollectionEquality()
                    .equals(other.examName, examName)) &&
            (identical(other.examCategoryName, examCategoryName) ||
                const DeepCollectionEquality()
                    .equals(other.examCategoryName, examCategoryName)) &&
            (identical(other.examLevelName, examLevelName) ||
                const DeepCollectionEquality()
                    .equals(other.examLevelName, examLevelName)) &&
            (identical(other.shareModeName, shareModeName) ||
                const DeepCollectionEquality()
                    .equals(other.shareModeName, shareModeName)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(examStructureId) ^
      const DeepCollectionEquality().hash(examCategoryId) ^
      const DeepCollectionEquality().hash(examCategoryIds) ^
      const DeepCollectionEquality().hash(data) ^
      const DeepCollectionEquality().hash(duration) ^
      const DeepCollectionEquality().hash(title) ^
      const DeepCollectionEquality().hash(examLevel) ^
      const DeepCollectionEquality().hash(type) ^
      const DeepCollectionEquality().hash(examType) ^
      const DeepCollectionEquality().hash(examLimit) ^
      const DeepCollectionEquality().hash(shareMode) ^
      const DeepCollectionEquality().hash(totalMark) ^
      const DeepCollectionEquality().hash(totalQuestion) ^
      const DeepCollectionEquality().hash(examTimeFrom) ^
      const DeepCollectionEquality().hash(examTimeTo) ^
      const DeepCollectionEquality().hash(examLimitNumber) ^
      const DeepCollectionEquality().hash(status) ^
      const DeepCollectionEquality().hash(propertyDetails) ^
      const DeepCollectionEquality().hash(examName) ^
      const DeepCollectionEquality().hash(examCategoryName) ^
      const DeepCollectionEquality().hash(examLevelName) ^
      const DeepCollectionEquality().hash(shareModeName) ^
      runtimeType.hashCode;
}

extension $ExamPreviewResourceExtension on ExamPreviewResource {
  ExamPreviewResource copyWith(
      {int? id,
      int? examStructureId,
      int? examCategoryId,
      List<int>? examCategoryIds,
      String? data,
      int? duration,
      String? title,
      int? examLevel,
      int? type,
      int? examType,
      int? examLimit,
      int? shareMode,
      double? totalMark,
      int? totalQuestion,
      DateTime? examTimeFrom,
      DateTime? examTimeTo,
      int? examLimitNumber,
      int? status,
      List<int>? propertyDetails,
      String? examName,
      String? examCategoryName,
      String? examLevelName,
      String? shareModeName}) {
    return ExamPreviewResource(
        id: id ?? this.id,
        examStructureId: examStructureId ?? this.examStructureId,
        examCategoryId: examCategoryId ?? this.examCategoryId,
        examCategoryIds: examCategoryIds ?? this.examCategoryIds,
        data: data ?? this.data,
        duration: duration ?? this.duration,
        title: title ?? this.title,
        examLevel: examLevel ?? this.examLevel,
        type: type ?? this.type,
        examType: examType ?? this.examType,
        examLimit: examLimit ?? this.examLimit,
        shareMode: shareMode ?? this.shareMode,
        totalMark: totalMark ?? this.totalMark,
        totalQuestion: totalQuestion ?? this.totalQuestion,
        examTimeFrom: examTimeFrom ?? this.examTimeFrom,
        examTimeTo: examTimeTo ?? this.examTimeTo,
        examLimitNumber: examLimitNumber ?? this.examLimitNumber,
        status: status ?? this.status,
        propertyDetails: propertyDetails ?? this.propertyDetails,
        examName: examName ?? this.examName,
        examCategoryName: examCategoryName ?? this.examCategoryName,
        examLevelName: examLevelName ?? this.examLevelName,
        shareModeName: shareModeName ?? this.shareModeName);
  }
}

@JsonSerializable(explicitToJson: true)
class ExamQuestionData {
  ExamQuestionData({
    this.questionId,
    this.questionMark,
    this.versionId,
    this.mark,
    this.parentId,
    this.childs,
  });

  factory ExamQuestionData.fromJson(Map<String, dynamic> json) =>
      _$ExamQuestionDataFromJson(json);

  @JsonKey(name: 'questionId', includeIfNull: true)
  final int? questionId;
  @JsonKey(name: 'questionMark', includeIfNull: true)
  final double? questionMark;
  @JsonKey(name: 'versionId', includeIfNull: true)
  final int? versionId;
  @JsonKey(name: 'mark', includeIfNull: true)
  final double? mark;
  @JsonKey(name: 'parentId', includeIfNull: true)
  final int? parentId;
  @JsonKey(
      name: 'childs', includeIfNull: true, defaultValue: <ExamQuestionData>[])
  final List<ExamQuestionData>? childs;
  static const fromJsonFactory = _$ExamQuestionDataFromJson;
  static const toJsonFactory = _$ExamQuestionDataToJson;
  Map<String, dynamic> toJson() => _$ExamQuestionDataToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ExamQuestionData &&
            (identical(other.questionId, questionId) ||
                const DeepCollectionEquality()
                    .equals(other.questionId, questionId)) &&
            (identical(other.questionMark, questionMark) ||
                const DeepCollectionEquality()
                    .equals(other.questionMark, questionMark)) &&
            (identical(other.versionId, versionId) ||
                const DeepCollectionEquality()
                    .equals(other.versionId, versionId)) &&
            (identical(other.mark, mark) ||
                const DeepCollectionEquality().equals(other.mark, mark)) &&
            (identical(other.parentId, parentId) ||
                const DeepCollectionEquality()
                    .equals(other.parentId, parentId)) &&
            (identical(other.childs, childs) ||
                const DeepCollectionEquality().equals(other.childs, childs)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(questionId) ^
      const DeepCollectionEquality().hash(questionMark) ^
      const DeepCollectionEquality().hash(versionId) ^
      const DeepCollectionEquality().hash(mark) ^
      const DeepCollectionEquality().hash(parentId) ^
      const DeepCollectionEquality().hash(childs) ^
      runtimeType.hashCode;
}

extension $ExamQuestionDataExtension on ExamQuestionData {
  ExamQuestionData copyWith(
      {int? questionId,
      double? questionMark,
      int? versionId,
      double? mark,
      int? parentId,
      List<ExamQuestionData>? childs}) {
    return ExamQuestionData(
        questionId: questionId ?? this.questionId,
        questionMark: questionMark ?? this.questionMark,
        versionId: versionId ?? this.versionId,
        mark: mark ?? this.mark,
        parentId: parentId ?? this.parentId,
        childs: childs ?? this.childs);
  }
}

@JsonSerializable(explicitToJson: true)
class ExamResource {
  ExamResource({
    this.id,
    this.examStructureId,
    this.examCategoryId,
    this.examCategoryIds,
    this.data,
    this.duration,
    this.title,
    this.examLevel,
    this.description,
    this.type,
    this.examType,
    this.examLimit,
    this.shareMode,
    this.totalMark,
    this.totalQuestion,
    this.examTimeFrom,
    this.examTimeTo,
    this.examLimitNumber,
    this.tags,
    this.status,
    this.createdDate,
    this.propertyDetails,
  });

  factory ExamResource.fromJson(Map<String, dynamic> json) =>
      _$ExamResourceFromJson(json);

  @JsonKey(name: 'id', includeIfNull: true)
  final int? id;
  @JsonKey(name: 'examStructureId', includeIfNull: true)
  final int? examStructureId;
  @JsonKey(name: 'examCategoryId', includeIfNull: true)
  final int? examCategoryId;
  @JsonKey(name: 'examCategoryIds', includeIfNull: true, defaultValue: <int>[])
  final List<int>? examCategoryIds;
  @JsonKey(name: 'data', includeIfNull: true, defaultValue: '')
  final String? data;
  @JsonKey(name: 'duration', includeIfNull: true)
  final int? duration;
  @JsonKey(name: 'title', includeIfNull: true, defaultValue: '')
  final String? title;
  @JsonKey(name: 'examLevel', includeIfNull: true)
  final int? examLevel;
  @JsonKey(name: 'description', includeIfNull: true, defaultValue: '')
  final String? description;
  @JsonKey(name: 'type', includeIfNull: true)
  final int? type;
  @JsonKey(name: 'examType', includeIfNull: true)
  final int? examType;
  @JsonKey(name: 'examLimit', includeIfNull: true)
  final int? examLimit;
  @JsonKey(name: 'shareMode', includeIfNull: true)
  final int? shareMode;
  @JsonKey(name: 'totalMark', includeIfNull: true)
  final double? totalMark;
  @JsonKey(name: 'totalQuestion', includeIfNull: true)
  final int? totalQuestion;
  @JsonKey(name: 'examTimeFrom', includeIfNull: true)
  final DateTime? examTimeFrom;
  @JsonKey(name: 'examTimeTo', includeIfNull: true)
  final DateTime? examTimeTo;
  @JsonKey(name: 'examLimitNumber', includeIfNull: true)
  final int? examLimitNumber;
  @JsonKey(name: 'tags', includeIfNull: true, defaultValue: <int>[])
  final List<int>? tags;
  @JsonKey(name: 'status', includeIfNull: true)
  final int? status;
  @JsonKey(name: 'createdDate', includeIfNull: true)
  final DateTime? createdDate;
  @JsonKey(name: 'propertyDetails', includeIfNull: true, defaultValue: <int>[])
  final List<int>? propertyDetails;
  static const fromJsonFactory = _$ExamResourceFromJson;
  static const toJsonFactory = _$ExamResourceToJson;
  Map<String, dynamic> toJson() => _$ExamResourceToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ExamResource &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.examStructureId, examStructureId) ||
                const DeepCollectionEquality()
                    .equals(other.examStructureId, examStructureId)) &&
            (identical(other.examCategoryId, examCategoryId) ||
                const DeepCollectionEquality()
                    .equals(other.examCategoryId, examCategoryId)) &&
            (identical(other.examCategoryIds, examCategoryIds) ||
                const DeepCollectionEquality()
                    .equals(other.examCategoryIds, examCategoryIds)) &&
            (identical(other.data, data) ||
                const DeepCollectionEquality().equals(other.data, data)) &&
            (identical(other.duration, duration) ||
                const DeepCollectionEquality()
                    .equals(other.duration, duration)) &&
            (identical(other.title, title) ||
                const DeepCollectionEquality().equals(other.title, title)) &&
            (identical(other.examLevel, examLevel) ||
                const DeepCollectionEquality()
                    .equals(other.examLevel, examLevel)) &&
            (identical(other.description, description) ||
                const DeepCollectionEquality()
                    .equals(other.description, description)) &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)) &&
            (identical(other.examType, examType) ||
                const DeepCollectionEquality()
                    .equals(other.examType, examType)) &&
            (identical(other.examLimit, examLimit) ||
                const DeepCollectionEquality()
                    .equals(other.examLimit, examLimit)) &&
            (identical(other.shareMode, shareMode) ||
                const DeepCollectionEquality()
                    .equals(other.shareMode, shareMode)) &&
            (identical(other.totalMark, totalMark) ||
                const DeepCollectionEquality()
                    .equals(other.totalMark, totalMark)) &&
            (identical(other.totalQuestion, totalQuestion) ||
                const DeepCollectionEquality()
                    .equals(other.totalQuestion, totalQuestion)) &&
            (identical(other.examTimeFrom, examTimeFrom) ||
                const DeepCollectionEquality()
                    .equals(other.examTimeFrom, examTimeFrom)) &&
            (identical(other.examTimeTo, examTimeTo) ||
                const DeepCollectionEquality()
                    .equals(other.examTimeTo, examTimeTo)) &&
            (identical(other.examLimitNumber, examLimitNumber) ||
                const DeepCollectionEquality()
                    .equals(other.examLimitNumber, examLimitNumber)) &&
            (identical(other.tags, tags) ||
                const DeepCollectionEquality().equals(other.tags, tags)) &&
            (identical(other.status, status) ||
                const DeepCollectionEquality().equals(other.status, status)) &&
            (identical(other.createdDate, createdDate) ||
                const DeepCollectionEquality()
                    .equals(other.createdDate, createdDate)) &&
            (identical(other.propertyDetails, propertyDetails) ||
                const DeepCollectionEquality()
                    .equals(other.propertyDetails, propertyDetails)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(examStructureId) ^
      const DeepCollectionEquality().hash(examCategoryId) ^
      const DeepCollectionEquality().hash(examCategoryIds) ^
      const DeepCollectionEquality().hash(data) ^
      const DeepCollectionEquality().hash(duration) ^
      const DeepCollectionEquality().hash(title) ^
      const DeepCollectionEquality().hash(examLevel) ^
      const DeepCollectionEquality().hash(description) ^
      const DeepCollectionEquality().hash(type) ^
      const DeepCollectionEquality().hash(examType) ^
      const DeepCollectionEquality().hash(examLimit) ^
      const DeepCollectionEquality().hash(shareMode) ^
      const DeepCollectionEquality().hash(totalMark) ^
      const DeepCollectionEquality().hash(totalQuestion) ^
      const DeepCollectionEquality().hash(examTimeFrom) ^
      const DeepCollectionEquality().hash(examTimeTo) ^
      const DeepCollectionEquality().hash(examLimitNumber) ^
      const DeepCollectionEquality().hash(tags) ^
      const DeepCollectionEquality().hash(status) ^
      const DeepCollectionEquality().hash(createdDate) ^
      const DeepCollectionEquality().hash(propertyDetails) ^
      runtimeType.hashCode;
}

extension $ExamResourceExtension on ExamResource {
  ExamResource copyWith(
      {int? id,
      int? examStructureId,
      int? examCategoryId,
      List<int>? examCategoryIds,
      String? data,
      int? duration,
      String? title,
      int? examLevel,
      String? description,
      int? type,
      int? examType,
      int? examLimit,
      int? shareMode,
      double? totalMark,
      int? totalQuestion,
      DateTime? examTimeFrom,
      DateTime? examTimeTo,
      int? examLimitNumber,
      List<int>? tags,
      int? status,
      DateTime? createdDate,
      List<int>? propertyDetails}) {
    return ExamResource(
        id: id ?? this.id,
        examStructureId: examStructureId ?? this.examStructureId,
        examCategoryId: examCategoryId ?? this.examCategoryId,
        examCategoryIds: examCategoryIds ?? this.examCategoryIds,
        data: data ?? this.data,
        duration: duration ?? this.duration,
        title: title ?? this.title,
        examLevel: examLevel ?? this.examLevel,
        description: description ?? this.description,
        type: type ?? this.type,
        examType: examType ?? this.examType,
        examLimit: examLimit ?? this.examLimit,
        shareMode: shareMode ?? this.shareMode,
        totalMark: totalMark ?? this.totalMark,
        totalQuestion: totalQuestion ?? this.totalQuestion,
        examTimeFrom: examTimeFrom ?? this.examTimeFrom,
        examTimeTo: examTimeTo ?? this.examTimeTo,
        examLimitNumber: examLimitNumber ?? this.examLimitNumber,
        tags: tags ?? this.tags,
        status: status ?? this.status,
        createdDate: createdDate ?? this.createdDate,
        propertyDetails: propertyDetails ?? this.propertyDetails);
  }
}

@JsonSerializable(explicitToJson: true)
class ExamResourceFilterResult {
  ExamResourceFilterResult({
    this.totalRows,
    this.data,
  });

  factory ExamResourceFilterResult.fromJson(Map<String, dynamic> json) =>
      _$ExamResourceFilterResultFromJson(json);

  @JsonKey(name: 'totalRows', includeIfNull: true)
  final int? totalRows;
  @JsonKey(name: 'data', includeIfNull: true, defaultValue: <ExamResource>[])
  final List<ExamResource>? data;
  static const fromJsonFactory = _$ExamResourceFilterResultFromJson;
  static const toJsonFactory = _$ExamResourceFilterResultToJson;
  Map<String, dynamic> toJson() => _$ExamResourceFilterResultToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ExamResourceFilterResult &&
            (identical(other.totalRows, totalRows) ||
                const DeepCollectionEquality()
                    .equals(other.totalRows, totalRows)) &&
            (identical(other.data, data) ||
                const DeepCollectionEquality().equals(other.data, data)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(totalRows) ^
      const DeepCollectionEquality().hash(data) ^
      runtimeType.hashCode;
}

extension $ExamResourceFilterResultExtension on ExamResourceFilterResult {
  ExamResourceFilterResult copyWith(
      {int? totalRows, List<ExamResource>? data}) {
    return ExamResourceFilterResult(
        totalRows: totalRows ?? this.totalRows, data: data ?? this.data);
  }
}

@JsonSerializable(explicitToJson: true)
class ExamSetCreateResource {
  ExamSetCreateResource({
    this.title,
    this.description,
    this.status,
    this.examIds,
    this.categoryIds,
    this.price,
    this.discountPrice,
  });

  factory ExamSetCreateResource.fromJson(Map<String, dynamic> json) =>
      _$ExamSetCreateResourceFromJson(json);

  @JsonKey(name: 'title', includeIfNull: true, defaultValue: '')
  final String? title;
  @JsonKey(name: 'description', includeIfNull: true, defaultValue: '')
  final String? description;
  @JsonKey(name: 'status', includeIfNull: true)
  final int? status;
  @JsonKey(name: 'examIds', includeIfNull: true, defaultValue: <int>[])
  final List<int>? examIds;
  @JsonKey(name: 'categoryIds', includeIfNull: true, defaultValue: <int>[])
  final List<int>? categoryIds;
  @JsonKey(name: 'price', includeIfNull: true)
  final double? price;
  @JsonKey(name: 'discountPrice', includeIfNull: true)
  final double? discountPrice;
  static const fromJsonFactory = _$ExamSetCreateResourceFromJson;
  static const toJsonFactory = _$ExamSetCreateResourceToJson;
  Map<String, dynamic> toJson() => _$ExamSetCreateResourceToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ExamSetCreateResource &&
            (identical(other.title, title) ||
                const DeepCollectionEquality().equals(other.title, title)) &&
            (identical(other.description, description) ||
                const DeepCollectionEquality()
                    .equals(other.description, description)) &&
            (identical(other.status, status) ||
                const DeepCollectionEquality().equals(other.status, status)) &&
            (identical(other.examIds, examIds) ||
                const DeepCollectionEquality()
                    .equals(other.examIds, examIds)) &&
            (identical(other.categoryIds, categoryIds) ||
                const DeepCollectionEquality()
                    .equals(other.categoryIds, categoryIds)) &&
            (identical(other.price, price) ||
                const DeepCollectionEquality().equals(other.price, price)) &&
            (identical(other.discountPrice, discountPrice) ||
                const DeepCollectionEquality()
                    .equals(other.discountPrice, discountPrice)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(title) ^
      const DeepCollectionEquality().hash(description) ^
      const DeepCollectionEquality().hash(status) ^
      const DeepCollectionEquality().hash(examIds) ^
      const DeepCollectionEquality().hash(categoryIds) ^
      const DeepCollectionEquality().hash(price) ^
      const DeepCollectionEquality().hash(discountPrice) ^
      runtimeType.hashCode;
}

extension $ExamSetCreateResourceExtension on ExamSetCreateResource {
  ExamSetCreateResource copyWith(
      {String? title,
      String? description,
      int? status,
      List<int>? examIds,
      List<int>? categoryIds,
      double? price,
      double? discountPrice}) {
    return ExamSetCreateResource(
        title: title ?? this.title,
        description: description ?? this.description,
        status: status ?? this.status,
        examIds: examIds ?? this.examIds,
        categoryIds: categoryIds ?? this.categoryIds,
        price: price ?? this.price,
        discountPrice: discountPrice ?? this.discountPrice);
  }
}

@JsonSerializable(explicitToJson: true)
class ExamSetDataResource {
  ExamSetDataResource({
    this.totalExamSet,
    this.totalExamSetIsFree,
    this.totalExamSetIsFee,
    this.data,
  });

  factory ExamSetDataResource.fromJson(Map<String, dynamic> json) =>
      _$ExamSetDataResourceFromJson(json);

  @JsonKey(name: 'totalExamSet', includeIfNull: true)
  final int? totalExamSet;
  @JsonKey(name: 'totalExamSetIsFree', includeIfNull: true)
  final int? totalExamSetIsFree;
  @JsonKey(name: 'totalExamSetIsFee', includeIfNull: true)
  final int? totalExamSetIsFee;
  @JsonKey(
      name: 'data',
      includeIfNull: true,
      defaultValue: <ExamSetPublicResource>[])
  final List<ExamSetPublicResource>? data;
  static const fromJsonFactory = _$ExamSetDataResourceFromJson;
  static const toJsonFactory = _$ExamSetDataResourceToJson;
  Map<String, dynamic> toJson() => _$ExamSetDataResourceToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ExamSetDataResource &&
            (identical(other.totalExamSet, totalExamSet) ||
                const DeepCollectionEquality()
                    .equals(other.totalExamSet, totalExamSet)) &&
            (identical(other.totalExamSetIsFree, totalExamSetIsFree) ||
                const DeepCollectionEquality()
                    .equals(other.totalExamSetIsFree, totalExamSetIsFree)) &&
            (identical(other.totalExamSetIsFee, totalExamSetIsFee) ||
                const DeepCollectionEquality()
                    .equals(other.totalExamSetIsFee, totalExamSetIsFee)) &&
            (identical(other.data, data) ||
                const DeepCollectionEquality().equals(other.data, data)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(totalExamSet) ^
      const DeepCollectionEquality().hash(totalExamSetIsFree) ^
      const DeepCollectionEquality().hash(totalExamSetIsFee) ^
      const DeepCollectionEquality().hash(data) ^
      runtimeType.hashCode;
}

extension $ExamSetDataResourceExtension on ExamSetDataResource {
  ExamSetDataResource copyWith(
      {int? totalExamSet,
      int? totalExamSetIsFree,
      int? totalExamSetIsFee,
      List<ExamSetPublicResource>? data}) {
    return ExamSetDataResource(
        totalExamSet: totalExamSet ?? this.totalExamSet,
        totalExamSetIsFree: totalExamSetIsFree ?? this.totalExamSetIsFree,
        totalExamSetIsFee: totalExamSetIsFee ?? this.totalExamSetIsFee,
        data: data ?? this.data);
  }
}

@JsonSerializable(explicitToJson: true)
class ExamSetInfoPublicResource {
  ExamSetInfoPublicResource({
    this.id,
    this.price,
    this.discountPrice,
    this.isFree,
    this.userAvatar,
    this.isLike,
  });

  factory ExamSetInfoPublicResource.fromJson(Map<String, dynamic> json) =>
      _$ExamSetInfoPublicResourceFromJson(json);

  @JsonKey(name: 'id', includeIfNull: true)
  final int? id;
  @JsonKey(name: 'price', includeIfNull: true)
  final double? price;
  @JsonKey(name: 'discountPrice', includeIfNull: true)
  final double? discountPrice;
  @JsonKey(name: 'isFree', includeIfNull: true)
  final bool? isFree;
  @JsonKey(name: 'userAvatar', includeIfNull: true, defaultValue: <String>[])
  final List<String>? userAvatar;
  @JsonKey(name: 'isLike', includeIfNull: true)
  final bool? isLike;
  static const fromJsonFactory = _$ExamSetInfoPublicResourceFromJson;
  static const toJsonFactory = _$ExamSetInfoPublicResourceToJson;
  Map<String, dynamic> toJson() => _$ExamSetInfoPublicResourceToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ExamSetInfoPublicResource &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.price, price) ||
                const DeepCollectionEquality().equals(other.price, price)) &&
            (identical(other.discountPrice, discountPrice) ||
                const DeepCollectionEquality()
                    .equals(other.discountPrice, discountPrice)) &&
            (identical(other.isFree, isFree) ||
                const DeepCollectionEquality().equals(other.isFree, isFree)) &&
            (identical(other.userAvatar, userAvatar) ||
                const DeepCollectionEquality()
                    .equals(other.userAvatar, userAvatar)) &&
            (identical(other.isLike, isLike) ||
                const DeepCollectionEquality().equals(other.isLike, isLike)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(price) ^
      const DeepCollectionEquality().hash(discountPrice) ^
      const DeepCollectionEquality().hash(isFree) ^
      const DeepCollectionEquality().hash(userAvatar) ^
      const DeepCollectionEquality().hash(isLike) ^
      runtimeType.hashCode;
}

extension $ExamSetInfoPublicResourceExtension on ExamSetInfoPublicResource {
  ExamSetInfoPublicResource copyWith(
      {int? id,
      double? price,
      double? discountPrice,
      bool? isFree,
      List<String>? userAvatar,
      bool? isLike}) {
    return ExamSetInfoPublicResource(
        id: id ?? this.id,
        price: price ?? this.price,
        discountPrice: discountPrice ?? this.discountPrice,
        isFree: isFree ?? this.isFree,
        userAvatar: userAvatar ?? this.userAvatar,
        isLike: isLike ?? this.isLike);
  }
}

@JsonSerializable(explicitToJson: true)
class ExamSetPublicResource {
  ExamSetPublicResource({
    this.id,
    this.title,
    this.status,
    this.price,
    this.discountPrice,
    this.examNumber,
    this.isFree,
    this.userAvatar,
    this.isLike,
    this.isBuy,
  });

  factory ExamSetPublicResource.fromJson(Map<String, dynamic> json) =>
      _$ExamSetPublicResourceFromJson(json);

  @JsonKey(name: 'id', includeIfNull: true)
  final int? id;
  @JsonKey(name: 'title', includeIfNull: true, defaultValue: '')
  final String? title;
  @JsonKey(name: 'status', includeIfNull: true)
  final int? status;
  @JsonKey(name: 'price', includeIfNull: true)
  final double? price;
  @JsonKey(name: 'discountPrice', includeIfNull: true)
  final double? discountPrice;
  @JsonKey(name: 'examNumber', includeIfNull: true)
  final int? examNumber;
  @JsonKey(name: 'isFree', includeIfNull: true)
  final bool? isFree;
  @JsonKey(name: 'userAvatar', includeIfNull: true, defaultValue: <String>[])
  final List<String>? userAvatar;
  @JsonKey(name: 'isLike', includeIfNull: true)
  final bool? isLike;
  @JsonKey(name: 'isBuy', includeIfNull: true)
  final bool? isBuy;
  static const fromJsonFactory = _$ExamSetPublicResourceFromJson;
  static const toJsonFactory = _$ExamSetPublicResourceToJson;
  Map<String, dynamic> toJson() => _$ExamSetPublicResourceToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ExamSetPublicResource &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.title, title) ||
                const DeepCollectionEquality().equals(other.title, title)) &&
            (identical(other.status, status) ||
                const DeepCollectionEquality().equals(other.status, status)) &&
            (identical(other.price, price) ||
                const DeepCollectionEquality().equals(other.price, price)) &&
            (identical(other.discountPrice, discountPrice) ||
                const DeepCollectionEquality()
                    .equals(other.discountPrice, discountPrice)) &&
            (identical(other.examNumber, examNumber) ||
                const DeepCollectionEquality()
                    .equals(other.examNumber, examNumber)) &&
            (identical(other.isFree, isFree) ||
                const DeepCollectionEquality().equals(other.isFree, isFree)) &&
            (identical(other.userAvatar, userAvatar) ||
                const DeepCollectionEquality()
                    .equals(other.userAvatar, userAvatar)) &&
            (identical(other.isLike, isLike) ||
                const DeepCollectionEquality().equals(other.isLike, isLike)) &&
            (identical(other.isBuy, isBuy) ||
                const DeepCollectionEquality().equals(other.isBuy, isBuy)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(title) ^
      const DeepCollectionEquality().hash(status) ^
      const DeepCollectionEquality().hash(price) ^
      const DeepCollectionEquality().hash(discountPrice) ^
      const DeepCollectionEquality().hash(examNumber) ^
      const DeepCollectionEquality().hash(isFree) ^
      const DeepCollectionEquality().hash(userAvatar) ^
      const DeepCollectionEquality().hash(isLike) ^
      const DeepCollectionEquality().hash(isBuy) ^
      runtimeType.hashCode;
}

extension $ExamSetPublicResourceExtension on ExamSetPublicResource {
  ExamSetPublicResource copyWith(
      {int? id,
      String? title,
      int? status,
      double? price,
      double? discountPrice,
      int? examNumber,
      bool? isFree,
      List<String>? userAvatar,
      bool? isLike,
      bool? isBuy}) {
    return ExamSetPublicResource(
        id: id ?? this.id,
        title: title ?? this.title,
        status: status ?? this.status,
        price: price ?? this.price,
        discountPrice: discountPrice ?? this.discountPrice,
        examNumber: examNumber ?? this.examNumber,
        isFree: isFree ?? this.isFree,
        userAvatar: userAvatar ?? this.userAvatar,
        isLike: isLike ?? this.isLike,
        isBuy: isBuy ?? this.isBuy);
  }
}

@JsonSerializable(explicitToJson: true)
class ExamSetResource {
  ExamSetResource({
    this.id,
    this.description,
    this.title,
    this.status,
    this.examNumber,
    this.examIds,
    this.price,
    this.discountPrice,
  });

  factory ExamSetResource.fromJson(Map<String, dynamic> json) =>
      _$ExamSetResourceFromJson(json);

  @JsonKey(name: 'id', includeIfNull: true)
  final int? id;
  @JsonKey(name: 'description', includeIfNull: true, defaultValue: '')
  final String? description;
  @JsonKey(name: 'title', includeIfNull: true, defaultValue: '')
  final String? title;
  @JsonKey(name: 'status', includeIfNull: true)
  final int? status;
  @JsonKey(name: 'examNumber', includeIfNull: true, defaultValue: '')
  final String? examNumber;
  @JsonKey(name: 'examIds', includeIfNull: true, defaultValue: <int>[])
  final List<int>? examIds;
  @JsonKey(name: 'price', includeIfNull: true)
  final double? price;
  @JsonKey(name: 'discountPrice', includeIfNull: true)
  final double? discountPrice;
  static const fromJsonFactory = _$ExamSetResourceFromJson;
  static const toJsonFactory = _$ExamSetResourceToJson;
  Map<String, dynamic> toJson() => _$ExamSetResourceToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ExamSetResource &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.description, description) ||
                const DeepCollectionEquality()
                    .equals(other.description, description)) &&
            (identical(other.title, title) ||
                const DeepCollectionEquality().equals(other.title, title)) &&
            (identical(other.status, status) ||
                const DeepCollectionEquality().equals(other.status, status)) &&
            (identical(other.examNumber, examNumber) ||
                const DeepCollectionEquality()
                    .equals(other.examNumber, examNumber)) &&
            (identical(other.examIds, examIds) ||
                const DeepCollectionEquality()
                    .equals(other.examIds, examIds)) &&
            (identical(other.price, price) ||
                const DeepCollectionEquality().equals(other.price, price)) &&
            (identical(other.discountPrice, discountPrice) ||
                const DeepCollectionEquality()
                    .equals(other.discountPrice, discountPrice)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(description) ^
      const DeepCollectionEquality().hash(title) ^
      const DeepCollectionEquality().hash(status) ^
      const DeepCollectionEquality().hash(examNumber) ^
      const DeepCollectionEquality().hash(examIds) ^
      const DeepCollectionEquality().hash(price) ^
      const DeepCollectionEquality().hash(discountPrice) ^
      runtimeType.hashCode;
}

extension $ExamSetResourceExtension on ExamSetResource {
  ExamSetResource copyWith(
      {int? id,
      String? description,
      String? title,
      int? status,
      String? examNumber,
      List<int>? examIds,
      double? price,
      double? discountPrice}) {
    return ExamSetResource(
        id: id ?? this.id,
        description: description ?? this.description,
        title: title ?? this.title,
        status: status ?? this.status,
        examNumber: examNumber ?? this.examNumber,
        examIds: examIds ?? this.examIds,
        price: price ?? this.price,
        discountPrice: discountPrice ?? this.discountPrice);
  }
}

@JsonSerializable(explicitToJson: true)
class ExamSetResourceFilterResult {
  ExamSetResourceFilterResult({
    this.totalRows,
    this.data,
  });

  factory ExamSetResourceFilterResult.fromJson(Map<String, dynamic> json) =>
      _$ExamSetResourceFilterResultFromJson(json);

  @JsonKey(name: 'totalRows', includeIfNull: true)
  final int? totalRows;
  @JsonKey(name: 'data', includeIfNull: true, defaultValue: <ExamSetResource>[])
  final List<ExamSetResource>? data;
  static const fromJsonFactory = _$ExamSetResourceFilterResultFromJson;
  static const toJsonFactory = _$ExamSetResourceFilterResultToJson;
  Map<String, dynamic> toJson() => _$ExamSetResourceFilterResultToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ExamSetResourceFilterResult &&
            (identical(other.totalRows, totalRows) ||
                const DeepCollectionEquality()
                    .equals(other.totalRows, totalRows)) &&
            (identical(other.data, data) ||
                const DeepCollectionEquality().equals(other.data, data)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(totalRows) ^
      const DeepCollectionEquality().hash(data) ^
      runtimeType.hashCode;
}

extension $ExamSetResourceFilterResultExtension on ExamSetResourceFilterResult {
  ExamSetResourceFilterResult copyWith(
      {int? totalRows, List<ExamSetResource>? data}) {
    return ExamSetResourceFilterResult(
        totalRows: totalRows ?? this.totalRows, data: data ?? this.data);
  }
}

@JsonSerializable(explicitToJson: true)
class ExamSetUpdateResource {
  ExamSetUpdateResource({
    this.id,
    this.title,
    this.description,
    this.status,
    this.examIds,
    this.categoryIds,
    this.price,
    this.discountPrice,
  });

  factory ExamSetUpdateResource.fromJson(Map<String, dynamic> json) =>
      _$ExamSetUpdateResourceFromJson(json);

  @JsonKey(name: 'id', includeIfNull: true)
  final int? id;
  @JsonKey(name: 'title', includeIfNull: true, defaultValue: '')
  final String? title;
  @JsonKey(name: 'description', includeIfNull: true, defaultValue: '')
  final String? description;
  @JsonKey(name: 'status', includeIfNull: true)
  final int? status;
  @JsonKey(name: 'examIds', includeIfNull: true, defaultValue: <int>[])
  final List<int>? examIds;
  @JsonKey(name: 'categoryIds', includeIfNull: true, defaultValue: <int>[])
  final List<int>? categoryIds;
  @JsonKey(name: 'price', includeIfNull: true)
  final double? price;
  @JsonKey(name: 'discountPrice', includeIfNull: true)
  final double? discountPrice;
  static const fromJsonFactory = _$ExamSetUpdateResourceFromJson;
  static const toJsonFactory = _$ExamSetUpdateResourceToJson;
  Map<String, dynamic> toJson() => _$ExamSetUpdateResourceToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ExamSetUpdateResource &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.title, title) ||
                const DeepCollectionEquality().equals(other.title, title)) &&
            (identical(other.description, description) ||
                const DeepCollectionEquality()
                    .equals(other.description, description)) &&
            (identical(other.status, status) ||
                const DeepCollectionEquality().equals(other.status, status)) &&
            (identical(other.examIds, examIds) ||
                const DeepCollectionEquality()
                    .equals(other.examIds, examIds)) &&
            (identical(other.categoryIds, categoryIds) ||
                const DeepCollectionEquality()
                    .equals(other.categoryIds, categoryIds)) &&
            (identical(other.price, price) ||
                const DeepCollectionEquality().equals(other.price, price)) &&
            (identical(other.discountPrice, discountPrice) ||
                const DeepCollectionEquality()
                    .equals(other.discountPrice, discountPrice)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(title) ^
      const DeepCollectionEquality().hash(description) ^
      const DeepCollectionEquality().hash(status) ^
      const DeepCollectionEquality().hash(examIds) ^
      const DeepCollectionEquality().hash(categoryIds) ^
      const DeepCollectionEquality().hash(price) ^
      const DeepCollectionEquality().hash(discountPrice) ^
      runtimeType.hashCode;
}

extension $ExamSetUpdateResourceExtension on ExamSetUpdateResource {
  ExamSetUpdateResource copyWith(
      {int? id,
      String? title,
      String? description,
      int? status,
      List<int>? examIds,
      List<int>? categoryIds,
      double? price,
      double? discountPrice}) {
    return ExamSetUpdateResource(
        id: id ?? this.id,
        title: title ?? this.title,
        description: description ?? this.description,
        status: status ?? this.status,
        examIds: examIds ?? this.examIds,
        categoryIds: categoryIds ?? this.categoryIds,
        price: price ?? this.price,
        discountPrice: discountPrice ?? this.discountPrice);
  }
}

@JsonSerializable(explicitToJson: true)
class ExamsTagItemResource {
  ExamsTagItemResource({
    this.id,
    this.examId,
    this.tagId,
    this.title,
  });

  factory ExamsTagItemResource.fromJson(Map<String, dynamic> json) =>
      _$ExamsTagItemResourceFromJson(json);

  @JsonKey(name: 'id', includeIfNull: true)
  final int? id;
  @JsonKey(name: 'examId', includeIfNull: true)
  final int? examId;
  @JsonKey(name: 'tagId', includeIfNull: true)
  final int? tagId;
  @JsonKey(name: 'title', includeIfNull: true, defaultValue: '')
  final String? title;
  static const fromJsonFactory = _$ExamsTagItemResourceFromJson;
  static const toJsonFactory = _$ExamsTagItemResourceToJson;
  Map<String, dynamic> toJson() => _$ExamsTagItemResourceToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ExamsTagItemResource &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.examId, examId) ||
                const DeepCollectionEquality().equals(other.examId, examId)) &&
            (identical(other.tagId, tagId) ||
                const DeepCollectionEquality().equals(other.tagId, tagId)) &&
            (identical(other.title, title) ||
                const DeepCollectionEquality().equals(other.title, title)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(examId) ^
      const DeepCollectionEquality().hash(tagId) ^
      const DeepCollectionEquality().hash(title) ^
      runtimeType.hashCode;
}

extension $ExamsTagItemResourceExtension on ExamsTagItemResource {
  ExamsTagItemResource copyWith(
      {int? id, int? examId, int? tagId, String? title}) {
    return ExamsTagItemResource(
        id: id ?? this.id,
        examId: examId ?? this.examId,
        tagId: tagId ?? this.tagId,
        title: title ?? this.title);
  }
}

@JsonSerializable(explicitToJson: true)
class ExamsTagItemResourceFilterResult {
  ExamsTagItemResourceFilterResult({
    this.totalRows,
    this.data,
  });

  factory ExamsTagItemResourceFilterResult.fromJson(
          Map<String, dynamic> json) =>
      _$ExamsTagItemResourceFilterResultFromJson(json);

  @JsonKey(name: 'totalRows', includeIfNull: true)
  final int? totalRows;
  @JsonKey(
      name: 'data', includeIfNull: true, defaultValue: <ExamsTagItemResource>[])
  final List<ExamsTagItemResource>? data;
  static const fromJsonFactory = _$ExamsTagItemResourceFilterResultFromJson;
  static const toJsonFactory = _$ExamsTagItemResourceFilterResultToJson;
  Map<String, dynamic> toJson() =>
      _$ExamsTagItemResourceFilterResultToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ExamsTagItemResourceFilterResult &&
            (identical(other.totalRows, totalRows) ||
                const DeepCollectionEquality()
                    .equals(other.totalRows, totalRows)) &&
            (identical(other.data, data) ||
                const DeepCollectionEquality().equals(other.data, data)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(totalRows) ^
      const DeepCollectionEquality().hash(data) ^
      runtimeType.hashCode;
}

extension $ExamsTagItemResourceFilterResultExtension
    on ExamsTagItemResourceFilterResult {
  ExamsTagItemResourceFilterResult copyWith(
      {int? totalRows, List<ExamsTagItemResource>? data}) {
    return ExamsTagItemResourceFilterResult(
        totalRows: totalRows ?? this.totalRows, data: data ?? this.data);
  }
}

@JsonSerializable(explicitToJson: true)
class ExamStructureColumnResource {
  ExamStructureColumnResource({
    this.id,
    this.title,
    this.baseTitle,
    this.dataIndex,
    this.key,
    this.disabled,
    this.selected,
    this.children,
    this.parentId,
    this.width,
    this.fixed,
    this.scopedSlots,
  });

  factory ExamStructureColumnResource.fromJson(Map<String, dynamic> json) =>
      _$ExamStructureColumnResourceFromJson(json);

  @JsonKey(name: 'id', includeIfNull: true)
  final int? id;
  @JsonKey(name: 'title', includeIfNull: true, defaultValue: '')
  final String? title;
  @JsonKey(name: 'baseTitle', includeIfNull: true, defaultValue: '')
  final String? baseTitle;
  @JsonKey(name: 'dataIndex', includeIfNull: true, defaultValue: '')
  final String? dataIndex;
  @JsonKey(name: 'key', includeIfNull: true, defaultValue: '')
  final String? key;
  @JsonKey(name: 'disabled', includeIfNull: true)
  final bool? disabled;
  @JsonKey(name: 'selected', includeIfNull: true)
  final bool? selected;
  @JsonKey(
      name: 'children',
      includeIfNull: true,
      defaultValue: <ExamStructureColumnResource>[])
  final List<ExamStructureColumnResource>? children;
  @JsonKey(name: 'parentId', includeIfNull: true)
  final int? parentId;
  @JsonKey(name: 'width', includeIfNull: true)
  final int? width;
  @JsonKey(name: 'fixed', includeIfNull: true, defaultValue: '')
  final String? fixed;
  @JsonKey(name: 'scopedSlots', includeIfNull: true)
  final ScopedSlots? scopedSlots;
  static const fromJsonFactory = _$ExamStructureColumnResourceFromJson;
  static const toJsonFactory = _$ExamStructureColumnResourceToJson;
  Map<String, dynamic> toJson() => _$ExamStructureColumnResourceToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ExamStructureColumnResource &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.title, title) ||
                const DeepCollectionEquality().equals(other.title, title)) &&
            (identical(other.baseTitle, baseTitle) ||
                const DeepCollectionEquality()
                    .equals(other.baseTitle, baseTitle)) &&
            (identical(other.dataIndex, dataIndex) ||
                const DeepCollectionEquality()
                    .equals(other.dataIndex, dataIndex)) &&
            (identical(other.key, key) ||
                const DeepCollectionEquality().equals(other.key, key)) &&
            (identical(other.disabled, disabled) ||
                const DeepCollectionEquality()
                    .equals(other.disabled, disabled)) &&
            (identical(other.selected, selected) ||
                const DeepCollectionEquality()
                    .equals(other.selected, selected)) &&
            (identical(other.children, children) ||
                const DeepCollectionEquality()
                    .equals(other.children, children)) &&
            (identical(other.parentId, parentId) ||
                const DeepCollectionEquality()
                    .equals(other.parentId, parentId)) &&
            (identical(other.width, width) ||
                const DeepCollectionEquality().equals(other.width, width)) &&
            (identical(other.fixed, fixed) ||
                const DeepCollectionEquality().equals(other.fixed, fixed)) &&
            (identical(other.scopedSlots, scopedSlots) ||
                const DeepCollectionEquality()
                    .equals(other.scopedSlots, scopedSlots)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(title) ^
      const DeepCollectionEquality().hash(baseTitle) ^
      const DeepCollectionEquality().hash(dataIndex) ^
      const DeepCollectionEquality().hash(key) ^
      const DeepCollectionEquality().hash(disabled) ^
      const DeepCollectionEquality().hash(selected) ^
      const DeepCollectionEquality().hash(children) ^
      const DeepCollectionEquality().hash(parentId) ^
      const DeepCollectionEquality().hash(width) ^
      const DeepCollectionEquality().hash(fixed) ^
      const DeepCollectionEquality().hash(scopedSlots) ^
      runtimeType.hashCode;
}

extension $ExamStructureColumnResourceExtension on ExamStructureColumnResource {
  ExamStructureColumnResource copyWith(
      {int? id,
      String? title,
      String? baseTitle,
      String? dataIndex,
      String? key,
      bool? disabled,
      bool? selected,
      List<ExamStructureColumnResource>? children,
      int? parentId,
      int? width,
      String? fixed,
      ScopedSlots? scopedSlots}) {
    return ExamStructureColumnResource(
        id: id ?? this.id,
        title: title ?? this.title,
        baseTitle: baseTitle ?? this.baseTitle,
        dataIndex: dataIndex ?? this.dataIndex,
        key: key ?? this.key,
        disabled: disabled ?? this.disabled,
        selected: selected ?? this.selected,
        children: children ?? this.children,
        parentId: parentId ?? this.parentId,
        width: width ?? this.width,
        fixed: fixed ?? this.fixed,
        scopedSlots: scopedSlots ?? this.scopedSlots);
  }
}

@JsonSerializable(explicitToJson: true)
class ExamStructureColumnResourceInt64NullableTreeNode {
  ExamStructureColumnResourceInt64NullableTreeNode({
    this.item,
    this.parentId,
    this.children,
  });

  factory ExamStructureColumnResourceInt64NullableTreeNode.fromJson(
          Map<String, dynamic> json) =>
      _$ExamStructureColumnResourceInt64NullableTreeNodeFromJson(json);

  @JsonKey(name: 'item', includeIfNull: true)
  final ExamStructureColumnResource? item;
  @JsonKey(name: 'parentId', includeIfNull: true)
  final int? parentId;
  @JsonKey(
      name: 'children',
      includeIfNull: true,
      defaultValue: <ExamStructureColumnResourceInt64NullableTreeNode>[])
  final List<ExamStructureColumnResourceInt64NullableTreeNode>? children;
  static const fromJsonFactory =
      _$ExamStructureColumnResourceInt64NullableTreeNodeFromJson;
  static const toJsonFactory =
      _$ExamStructureColumnResourceInt64NullableTreeNodeToJson;
  Map<String, dynamic> toJson() =>
      _$ExamStructureColumnResourceInt64NullableTreeNodeToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ExamStructureColumnResourceInt64NullableTreeNode &&
            (identical(other.item, item) ||
                const DeepCollectionEquality().equals(other.item, item)) &&
            (identical(other.parentId, parentId) ||
                const DeepCollectionEquality()
                    .equals(other.parentId, parentId)) &&
            (identical(other.children, children) ||
                const DeepCollectionEquality()
                    .equals(other.children, children)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(item) ^
      const DeepCollectionEquality().hash(parentId) ^
      const DeepCollectionEquality().hash(children) ^
      runtimeType.hashCode;
}

extension $ExamStructureColumnResourceInt64NullableTreeNodeExtension
    on ExamStructureColumnResourceInt64NullableTreeNode {
  ExamStructureColumnResourceInt64NullableTreeNode copyWith(
      {ExamStructureColumnResource? item,
      int? parentId,
      List<ExamStructureColumnResourceInt64NullableTreeNode>? children}) {
    return ExamStructureColumnResourceInt64NullableTreeNode(
        item: item ?? this.item,
        parentId: parentId ?? this.parentId,
        children: children ?? this.children);
  }
}

@JsonSerializable(explicitToJson: true)
class ExamStructureColumnsResource {
  ExamStructureColumnsResource({
    this.propertyData,
    this.data,
    this.columns,
    this.otherColDataIndex,
  });

  factory ExamStructureColumnsResource.fromJson(Map<String, dynamic> json) =>
      _$ExamStructureColumnsResourceFromJson(json);

  @JsonKey(
      name: 'propertyData',
      includeIfNull: true,
      defaultValue: <PropertyDetailEntity>[])
  final List<PropertyDetailEntity>? propertyData;
  @JsonKey(
      name: 'data',
      includeIfNull: true,
      defaultValue: <Int64SelectObjectItem>[])
  final List<Int64SelectObjectItem>? data;
  @JsonKey(
      name: 'columns',
      includeIfNull: true,
      defaultValue: <ExamStructureColumnResourceInt64NullableTreeNode>[])
  final List<ExamStructureColumnResourceInt64NullableTreeNode>? columns;
  @JsonKey(
      name: 'otherColDataIndex',
      includeIfNull: true,
      defaultValue: <SelectColumns>[])
  final List<SelectColumns>? otherColDataIndex;
  static const fromJsonFactory = _$ExamStructureColumnsResourceFromJson;
  static const toJsonFactory = _$ExamStructureColumnsResourceToJson;
  Map<String, dynamic> toJson() => _$ExamStructureColumnsResourceToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ExamStructureColumnsResource &&
            (identical(other.propertyData, propertyData) ||
                const DeepCollectionEquality()
                    .equals(other.propertyData, propertyData)) &&
            (identical(other.data, data) ||
                const DeepCollectionEquality().equals(other.data, data)) &&
            (identical(other.columns, columns) ||
                const DeepCollectionEquality()
                    .equals(other.columns, columns)) &&
            (identical(other.otherColDataIndex, otherColDataIndex) ||
                const DeepCollectionEquality()
                    .equals(other.otherColDataIndex, otherColDataIndex)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(propertyData) ^
      const DeepCollectionEquality().hash(data) ^
      const DeepCollectionEquality().hash(columns) ^
      const DeepCollectionEquality().hash(otherColDataIndex) ^
      runtimeType.hashCode;
}

extension $ExamStructureColumnsResourceExtension
    on ExamStructureColumnsResource {
  ExamStructureColumnsResource copyWith(
      {List<PropertyDetailEntity>? propertyData,
      List<Int64SelectObjectItem>? data,
      List<ExamStructureColumnResourceInt64NullableTreeNode>? columns,
      List<SelectColumns>? otherColDataIndex}) {
    return ExamStructureColumnsResource(
        propertyData: propertyData ?? this.propertyData,
        data: data ?? this.data,
        columns: columns ?? this.columns,
        otherColDataIndex: otherColDataIndex ?? this.otherColDataIndex);
  }
}

@JsonSerializable(explicitToJson: true)
class ExamStructureCreateResource {
  ExamStructureCreateResource({
    this.id,
    this.createdBy,
    this.createdDate,
    this.lastModifiedBy,
    this.lastModifiedDate,
    this.title,
    this.data,
    this.status,
    this.isPublic,
    this.ownerType,
    this.type,
    this.categoryId,
    this.propertyIds,
  });

  factory ExamStructureCreateResource.fromJson(Map<String, dynamic> json) =>
      _$ExamStructureCreateResourceFromJson(json);

  @JsonKey(name: 'id', includeIfNull: true)
  final int? id;
  @JsonKey(name: 'createdBy', includeIfNull: true)
  final int? createdBy;
  @JsonKey(name: 'createdDate', includeIfNull: true)
  final DateTime? createdDate;
  @JsonKey(name: 'lastModifiedBy', includeIfNull: true)
  final int? lastModifiedBy;
  @JsonKey(name: 'lastModifiedDate', includeIfNull: true)
  final DateTime? lastModifiedDate;
  @JsonKey(name: 'title', includeIfNull: true, defaultValue: '')
  final String? title;
  @JsonKey(name: 'data', includeIfNull: true, defaultValue: '')
  final String? data;
  @JsonKey(name: 'status', includeIfNull: true)
  final int? status;
  @JsonKey(name: 'isPublic', includeIfNull: true)
  final int? isPublic;
  @JsonKey(name: 'ownerType', includeIfNull: true)
  final int? ownerType;
  @JsonKey(name: 'type', includeIfNull: true)
  final int? type;
  @JsonKey(name: 'categoryId', includeIfNull: true)
  final int? categoryId;
  @JsonKey(name: 'propertyIds', includeIfNull: true, defaultValue: <int>[])
  final List<int>? propertyIds;
  static const fromJsonFactory = _$ExamStructureCreateResourceFromJson;
  static const toJsonFactory = _$ExamStructureCreateResourceToJson;
  Map<String, dynamic> toJson() => _$ExamStructureCreateResourceToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ExamStructureCreateResource &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.createdBy, createdBy) ||
                const DeepCollectionEquality()
                    .equals(other.createdBy, createdBy)) &&
            (identical(other.createdDate, createdDate) ||
                const DeepCollectionEquality()
                    .equals(other.createdDate, createdDate)) &&
            (identical(other.lastModifiedBy, lastModifiedBy) ||
                const DeepCollectionEquality()
                    .equals(other.lastModifiedBy, lastModifiedBy)) &&
            (identical(other.lastModifiedDate, lastModifiedDate) ||
                const DeepCollectionEquality()
                    .equals(other.lastModifiedDate, lastModifiedDate)) &&
            (identical(other.title, title) ||
                const DeepCollectionEquality().equals(other.title, title)) &&
            (identical(other.data, data) ||
                const DeepCollectionEquality().equals(other.data, data)) &&
            (identical(other.status, status) ||
                const DeepCollectionEquality().equals(other.status, status)) &&
            (identical(other.isPublic, isPublic) ||
                const DeepCollectionEquality()
                    .equals(other.isPublic, isPublic)) &&
            (identical(other.ownerType, ownerType) ||
                const DeepCollectionEquality()
                    .equals(other.ownerType, ownerType)) &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)) &&
            (identical(other.categoryId, categoryId) ||
                const DeepCollectionEquality()
                    .equals(other.categoryId, categoryId)) &&
            (identical(other.propertyIds, propertyIds) ||
                const DeepCollectionEquality()
                    .equals(other.propertyIds, propertyIds)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(createdBy) ^
      const DeepCollectionEquality().hash(createdDate) ^
      const DeepCollectionEquality().hash(lastModifiedBy) ^
      const DeepCollectionEquality().hash(lastModifiedDate) ^
      const DeepCollectionEquality().hash(title) ^
      const DeepCollectionEquality().hash(data) ^
      const DeepCollectionEquality().hash(status) ^
      const DeepCollectionEquality().hash(isPublic) ^
      const DeepCollectionEquality().hash(ownerType) ^
      const DeepCollectionEquality().hash(type) ^
      const DeepCollectionEquality().hash(categoryId) ^
      const DeepCollectionEquality().hash(propertyIds) ^
      runtimeType.hashCode;
}

extension $ExamStructureCreateResourceExtension on ExamStructureCreateResource {
  ExamStructureCreateResource copyWith(
      {int? id,
      int? createdBy,
      DateTime? createdDate,
      int? lastModifiedBy,
      DateTime? lastModifiedDate,
      String? title,
      String? data,
      int? status,
      int? isPublic,
      int? ownerType,
      int? type,
      int? categoryId,
      List<int>? propertyIds}) {
    return ExamStructureCreateResource(
        id: id ?? this.id,
        createdBy: createdBy ?? this.createdBy,
        createdDate: createdDate ?? this.createdDate,
        lastModifiedBy: lastModifiedBy ?? this.lastModifiedBy,
        lastModifiedDate: lastModifiedDate ?? this.lastModifiedDate,
        title: title ?? this.title,
        data: data ?? this.data,
        status: status ?? this.status,
        isPublic: isPublic ?? this.isPublic,
        ownerType: ownerType ?? this.ownerType,
        type: type ?? this.type,
        categoryId: categoryId ?? this.categoryId,
        propertyIds: propertyIds ?? this.propertyIds);
  }
}

@JsonSerializable(explicitToJson: true)
class ExamStructureDetailResource {
  ExamStructureDetailResource({
    this.id,
    this.createdBy,
    this.createdDate,
    this.lastModifiedBy,
    this.lastModifiedDate,
    this.title,
    this.data,
    this.status,
    this.isPublic,
    this.ownerType,
    this.type,
    this.categoryId,
    this.propertyIds,
  });

  factory ExamStructureDetailResource.fromJson(Map<String, dynamic> json) =>
      _$ExamStructureDetailResourceFromJson(json);

  @JsonKey(name: 'id', includeIfNull: true)
  final int? id;
  @JsonKey(name: 'createdBy', includeIfNull: true)
  final int? createdBy;
  @JsonKey(name: 'createdDate', includeIfNull: true)
  final DateTime? createdDate;
  @JsonKey(name: 'lastModifiedBy', includeIfNull: true)
  final int? lastModifiedBy;
  @JsonKey(name: 'lastModifiedDate', includeIfNull: true)
  final DateTime? lastModifiedDate;
  @JsonKey(name: 'title', includeIfNull: true, defaultValue: '')
  final String? title;
  @JsonKey(name: 'data', includeIfNull: true, defaultValue: '')
  final String? data;
  @JsonKey(name: 'status', includeIfNull: true)
  final int? status;
  @JsonKey(name: 'isPublic', includeIfNull: true)
  final int? isPublic;
  @JsonKey(name: 'ownerType', includeIfNull: true)
  final int? ownerType;
  @JsonKey(name: 'type', includeIfNull: true)
  final int? type;
  @JsonKey(name: 'categoryId', includeIfNull: true)
  final int? categoryId;
  @JsonKey(name: 'propertyIds', includeIfNull: true, defaultValue: <int>[])
  final List<int>? propertyIds;
  static const fromJsonFactory = _$ExamStructureDetailResourceFromJson;
  static const toJsonFactory = _$ExamStructureDetailResourceToJson;
  Map<String, dynamic> toJson() => _$ExamStructureDetailResourceToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ExamStructureDetailResource &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.createdBy, createdBy) ||
                const DeepCollectionEquality()
                    .equals(other.createdBy, createdBy)) &&
            (identical(other.createdDate, createdDate) ||
                const DeepCollectionEquality()
                    .equals(other.createdDate, createdDate)) &&
            (identical(other.lastModifiedBy, lastModifiedBy) ||
                const DeepCollectionEquality()
                    .equals(other.lastModifiedBy, lastModifiedBy)) &&
            (identical(other.lastModifiedDate, lastModifiedDate) ||
                const DeepCollectionEquality()
                    .equals(other.lastModifiedDate, lastModifiedDate)) &&
            (identical(other.title, title) ||
                const DeepCollectionEquality().equals(other.title, title)) &&
            (identical(other.data, data) ||
                const DeepCollectionEquality().equals(other.data, data)) &&
            (identical(other.status, status) ||
                const DeepCollectionEquality().equals(other.status, status)) &&
            (identical(other.isPublic, isPublic) ||
                const DeepCollectionEquality()
                    .equals(other.isPublic, isPublic)) &&
            (identical(other.ownerType, ownerType) ||
                const DeepCollectionEquality()
                    .equals(other.ownerType, ownerType)) &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)) &&
            (identical(other.categoryId, categoryId) ||
                const DeepCollectionEquality()
                    .equals(other.categoryId, categoryId)) &&
            (identical(other.propertyIds, propertyIds) ||
                const DeepCollectionEquality()
                    .equals(other.propertyIds, propertyIds)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(createdBy) ^
      const DeepCollectionEquality().hash(createdDate) ^
      const DeepCollectionEquality().hash(lastModifiedBy) ^
      const DeepCollectionEquality().hash(lastModifiedDate) ^
      const DeepCollectionEquality().hash(title) ^
      const DeepCollectionEquality().hash(data) ^
      const DeepCollectionEquality().hash(status) ^
      const DeepCollectionEquality().hash(isPublic) ^
      const DeepCollectionEquality().hash(ownerType) ^
      const DeepCollectionEquality().hash(type) ^
      const DeepCollectionEquality().hash(categoryId) ^
      const DeepCollectionEquality().hash(propertyIds) ^
      runtimeType.hashCode;
}

extension $ExamStructureDetailResourceExtension on ExamStructureDetailResource {
  ExamStructureDetailResource copyWith(
      {int? id,
      int? createdBy,
      DateTime? createdDate,
      int? lastModifiedBy,
      DateTime? lastModifiedDate,
      String? title,
      String? data,
      int? status,
      int? isPublic,
      int? ownerType,
      int? type,
      int? categoryId,
      List<int>? propertyIds}) {
    return ExamStructureDetailResource(
        id: id ?? this.id,
        createdBy: createdBy ?? this.createdBy,
        createdDate: createdDate ?? this.createdDate,
        lastModifiedBy: lastModifiedBy ?? this.lastModifiedBy,
        lastModifiedDate: lastModifiedDate ?? this.lastModifiedDate,
        title: title ?? this.title,
        data: data ?? this.data,
        status: status ?? this.status,
        isPublic: isPublic ?? this.isPublic,
        ownerType: ownerType ?? this.ownerType,
        type: type ?? this.type,
        categoryId: categoryId ?? this.categoryId,
        propertyIds: propertyIds ?? this.propertyIds);
  }
}

@JsonSerializable(explicitToJson: true)
class ExamStructureListResource {
  ExamStructureListResource({
    this.id,
    this.createdBy,
    this.createdDate,
    this.lastModifiedBy,
    this.lastModifiedDate,
    this.title,
    this.data,
    this.status,
    this.isPublic,
    this.ownerType,
    this.categoryId,
    this.type,
    this.ownerTypeName,
    this.isPublicName,
    this.statusName,
  });

  factory ExamStructureListResource.fromJson(Map<String, dynamic> json) =>
      _$ExamStructureListResourceFromJson(json);

  @JsonKey(name: 'id', includeIfNull: true)
  final int? id;
  @JsonKey(name: 'createdBy', includeIfNull: true)
  final int? createdBy;
  @JsonKey(name: 'createdDate', includeIfNull: true)
  final DateTime? createdDate;
  @JsonKey(name: 'lastModifiedBy', includeIfNull: true)
  final int? lastModifiedBy;
  @JsonKey(name: 'lastModifiedDate', includeIfNull: true)
  final DateTime? lastModifiedDate;
  @JsonKey(name: 'title', includeIfNull: true, defaultValue: '')
  final String? title;
  @JsonKey(name: 'data', includeIfNull: true, defaultValue: '')
  final String? data;
  @JsonKey(name: 'status', includeIfNull: true)
  final int? status;
  @JsonKey(name: 'isPublic', includeIfNull: true)
  final int? isPublic;
  @JsonKey(name: 'ownerType', includeIfNull: true)
  final int? ownerType;
  @JsonKey(name: 'categoryId', includeIfNull: true)
  final int? categoryId;
  @JsonKey(name: 'type', includeIfNull: true)
  final int? type;
  @JsonKey(name: 'ownerTypeName', includeIfNull: true, defaultValue: '')
  final String? ownerTypeName;
  @JsonKey(name: 'isPublicName', includeIfNull: true, defaultValue: '')
  final String? isPublicName;
  @JsonKey(name: 'statusName', includeIfNull: true, defaultValue: '')
  final String? statusName;
  static const fromJsonFactory = _$ExamStructureListResourceFromJson;
  static const toJsonFactory = _$ExamStructureListResourceToJson;
  Map<String, dynamic> toJson() => _$ExamStructureListResourceToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ExamStructureListResource &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.createdBy, createdBy) ||
                const DeepCollectionEquality()
                    .equals(other.createdBy, createdBy)) &&
            (identical(other.createdDate, createdDate) ||
                const DeepCollectionEquality()
                    .equals(other.createdDate, createdDate)) &&
            (identical(other.lastModifiedBy, lastModifiedBy) ||
                const DeepCollectionEquality()
                    .equals(other.lastModifiedBy, lastModifiedBy)) &&
            (identical(other.lastModifiedDate, lastModifiedDate) ||
                const DeepCollectionEquality()
                    .equals(other.lastModifiedDate, lastModifiedDate)) &&
            (identical(other.title, title) ||
                const DeepCollectionEquality().equals(other.title, title)) &&
            (identical(other.data, data) ||
                const DeepCollectionEquality().equals(other.data, data)) &&
            (identical(other.status, status) ||
                const DeepCollectionEquality().equals(other.status, status)) &&
            (identical(other.isPublic, isPublic) ||
                const DeepCollectionEquality()
                    .equals(other.isPublic, isPublic)) &&
            (identical(other.ownerType, ownerType) ||
                const DeepCollectionEquality()
                    .equals(other.ownerType, ownerType)) &&
            (identical(other.categoryId, categoryId) ||
                const DeepCollectionEquality()
                    .equals(other.categoryId, categoryId)) &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)) &&
            (identical(other.ownerTypeName, ownerTypeName) ||
                const DeepCollectionEquality()
                    .equals(other.ownerTypeName, ownerTypeName)) &&
            (identical(other.isPublicName, isPublicName) ||
                const DeepCollectionEquality()
                    .equals(other.isPublicName, isPublicName)) &&
            (identical(other.statusName, statusName) ||
                const DeepCollectionEquality()
                    .equals(other.statusName, statusName)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(createdBy) ^
      const DeepCollectionEquality().hash(createdDate) ^
      const DeepCollectionEquality().hash(lastModifiedBy) ^
      const DeepCollectionEquality().hash(lastModifiedDate) ^
      const DeepCollectionEquality().hash(title) ^
      const DeepCollectionEquality().hash(data) ^
      const DeepCollectionEquality().hash(status) ^
      const DeepCollectionEquality().hash(isPublic) ^
      const DeepCollectionEquality().hash(ownerType) ^
      const DeepCollectionEquality().hash(categoryId) ^
      const DeepCollectionEquality().hash(type) ^
      const DeepCollectionEquality().hash(ownerTypeName) ^
      const DeepCollectionEquality().hash(isPublicName) ^
      const DeepCollectionEquality().hash(statusName) ^
      runtimeType.hashCode;
}

extension $ExamStructureListResourceExtension on ExamStructureListResource {
  ExamStructureListResource copyWith(
      {int? id,
      int? createdBy,
      DateTime? createdDate,
      int? lastModifiedBy,
      DateTime? lastModifiedDate,
      String? title,
      String? data,
      int? status,
      int? isPublic,
      int? ownerType,
      int? categoryId,
      int? type,
      String? ownerTypeName,
      String? isPublicName,
      String? statusName}) {
    return ExamStructureListResource(
        id: id ?? this.id,
        createdBy: createdBy ?? this.createdBy,
        createdDate: createdDate ?? this.createdDate,
        lastModifiedBy: lastModifiedBy ?? this.lastModifiedBy,
        lastModifiedDate: lastModifiedDate ?? this.lastModifiedDate,
        title: title ?? this.title,
        data: data ?? this.data,
        status: status ?? this.status,
        isPublic: isPublic ?? this.isPublic,
        ownerType: ownerType ?? this.ownerType,
        categoryId: categoryId ?? this.categoryId,
        type: type ?? this.type,
        ownerTypeName: ownerTypeName ?? this.ownerTypeName,
        isPublicName: isPublicName ?? this.isPublicName,
        statusName: statusName ?? this.statusName);
  }
}

@JsonSerializable(explicitToJson: true)
class ExamStructureQuestion {
  ExamStructureQuestion({
    this.id,
    this.type,
    this.order,
    this.isDetail,
    this.fixed,
    this.componentName,
    this.value,
  });

  factory ExamStructureQuestion.fromJson(Map<String, dynamic> json) =>
      _$ExamStructureQuestionFromJson(json);

  @JsonKey(name: 'id', includeIfNull: true, defaultValue: '')
  final String? id;
  @JsonKey(name: 'type', includeIfNull: true)
  final int? type;
  @JsonKey(name: 'order', includeIfNull: true)
  final int? order;
  @JsonKey(name: 'isDetail', includeIfNull: true)
  final bool? isDetail;
  @JsonKey(name: 'fixed', includeIfNull: true)
  final bool? fixed;
  @JsonKey(name: 'componentName', includeIfNull: true, defaultValue: '')
  final String? componentName;
  @JsonKey(name: 'value', includeIfNull: true)
  final ExamStructureQuestionData? value;
  static const fromJsonFactory = _$ExamStructureQuestionFromJson;
  static const toJsonFactory = _$ExamStructureQuestionToJson;
  Map<String, dynamic> toJson() => _$ExamStructureQuestionToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ExamStructureQuestion &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)) &&
            (identical(other.order, order) ||
                const DeepCollectionEquality().equals(other.order, order)) &&
            (identical(other.isDetail, isDetail) ||
                const DeepCollectionEquality()
                    .equals(other.isDetail, isDetail)) &&
            (identical(other.fixed, fixed) ||
                const DeepCollectionEquality().equals(other.fixed, fixed)) &&
            (identical(other.componentName, componentName) ||
                const DeepCollectionEquality()
                    .equals(other.componentName, componentName)) &&
            (identical(other.value, value) ||
                const DeepCollectionEquality().equals(other.value, value)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(type) ^
      const DeepCollectionEquality().hash(order) ^
      const DeepCollectionEquality().hash(isDetail) ^
      const DeepCollectionEquality().hash(fixed) ^
      const DeepCollectionEquality().hash(componentName) ^
      const DeepCollectionEquality().hash(value) ^
      runtimeType.hashCode;
}

extension $ExamStructureQuestionExtension on ExamStructureQuestion {
  ExamStructureQuestion copyWith(
      {String? id,
      int? type,
      int? order,
      bool? isDetail,
      bool? fixed,
      String? componentName,
      ExamStructureQuestionData? value}) {
    return ExamStructureQuestion(
        id: id ?? this.id,
        type: type ?? this.type,
        order: order ?? this.order,
        isDetail: isDetail ?? this.isDetail,
        fixed: fixed ?? this.fixed,
        componentName: componentName ?? this.componentName,
        value: value ?? this.value);
  }
}

@JsonSerializable(explicitToJson: true)
class ExamStructureQuestionData {
  ExamStructureQuestionData({
    this.examCategoryId,
    this.examCategoryName,
    this.numberOfQuestion,
    this.partId,
    this.totalMark,
    this.questionIds,
    this.startQuestion,
    this.content,
    this.relaxTime,
    this.propertyDetails,
    this.propertyDetailsName,
  });

  factory ExamStructureQuestionData.fromJson(Map<String, dynamic> json) =>
      _$ExamStructureQuestionDataFromJson(json);

  @JsonKey(name: 'examCategoryId', includeIfNull: true)
  final int? examCategoryId;
  @JsonKey(name: 'examCategoryName', includeIfNull: true, defaultValue: '')
  final String? examCategoryName;
  @JsonKey(name: 'numberOfQuestion', includeIfNull: true)
  final int? numberOfQuestion;
  @JsonKey(name: 'partId', includeIfNull: true, defaultValue: '')
  final String? partId;
  @JsonKey(name: 'totalMark', includeIfNull: true)
  final double? totalMark;
  @JsonKey(
      name: 'questionIds',
      includeIfNull: true,
      defaultValue: <ExamQuestionData>[])
  final List<ExamQuestionData>? questionIds;
  @JsonKey(name: 'startQuestion', includeIfNull: true)
  final int? startQuestion;
  @JsonKey(name: 'content', includeIfNull: true, defaultValue: '')
  final String? content;
  @JsonKey(name: 'relaxTime', includeIfNull: true)
  final int? relaxTime;
  @JsonKey(name: 'propertyDetails', includeIfNull: true, defaultValue: <int>[])
  final List<int>? propertyDetails;
  @JsonKey(name: 'propertyDetailsName', includeIfNull: true, defaultValue: '')
  final String? propertyDetailsName;
  static const fromJsonFactory = _$ExamStructureQuestionDataFromJson;
  static const toJsonFactory = _$ExamStructureQuestionDataToJson;
  Map<String, dynamic> toJson() => _$ExamStructureQuestionDataToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ExamStructureQuestionData &&
            (identical(other.examCategoryId, examCategoryId) ||
                const DeepCollectionEquality()
                    .equals(other.examCategoryId, examCategoryId)) &&
            (identical(other.examCategoryName, examCategoryName) ||
                const DeepCollectionEquality()
                    .equals(other.examCategoryName, examCategoryName)) &&
            (identical(other.numberOfQuestion, numberOfQuestion) ||
                const DeepCollectionEquality()
                    .equals(other.numberOfQuestion, numberOfQuestion)) &&
            (identical(other.partId, partId) ||
                const DeepCollectionEquality().equals(other.partId, partId)) &&
            (identical(other.totalMark, totalMark) ||
                const DeepCollectionEquality()
                    .equals(other.totalMark, totalMark)) &&
            (identical(other.questionIds, questionIds) ||
                const DeepCollectionEquality()
                    .equals(other.questionIds, questionIds)) &&
            (identical(other.startQuestion, startQuestion) ||
                const DeepCollectionEquality()
                    .equals(other.startQuestion, startQuestion)) &&
            (identical(other.content, content) ||
                const DeepCollectionEquality()
                    .equals(other.content, content)) &&
            (identical(other.relaxTime, relaxTime) ||
                const DeepCollectionEquality()
                    .equals(other.relaxTime, relaxTime)) &&
            (identical(other.propertyDetails, propertyDetails) ||
                const DeepCollectionEquality()
                    .equals(other.propertyDetails, propertyDetails)) &&
            (identical(other.propertyDetailsName, propertyDetailsName) ||
                const DeepCollectionEquality()
                    .equals(other.propertyDetailsName, propertyDetailsName)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(examCategoryId) ^
      const DeepCollectionEquality().hash(examCategoryName) ^
      const DeepCollectionEquality().hash(numberOfQuestion) ^
      const DeepCollectionEquality().hash(partId) ^
      const DeepCollectionEquality().hash(totalMark) ^
      const DeepCollectionEquality().hash(questionIds) ^
      const DeepCollectionEquality().hash(startQuestion) ^
      const DeepCollectionEquality().hash(content) ^
      const DeepCollectionEquality().hash(relaxTime) ^
      const DeepCollectionEquality().hash(propertyDetails) ^
      const DeepCollectionEquality().hash(propertyDetailsName) ^
      runtimeType.hashCode;
}

extension $ExamStructureQuestionDataExtension on ExamStructureQuestionData {
  ExamStructureQuestionData copyWith(
      {int? examCategoryId,
      String? examCategoryName,
      int? numberOfQuestion,
      String? partId,
      double? totalMark,
      List<ExamQuestionData>? questionIds,
      int? startQuestion,
      String? content,
      int? relaxTime,
      List<int>? propertyDetails,
      String? propertyDetailsName}) {
    return ExamStructureQuestionData(
        examCategoryId: examCategoryId ?? this.examCategoryId,
        examCategoryName: examCategoryName ?? this.examCategoryName,
        numberOfQuestion: numberOfQuestion ?? this.numberOfQuestion,
        partId: partId ?? this.partId,
        totalMark: totalMark ?? this.totalMark,
        questionIds: questionIds ?? this.questionIds,
        startQuestion: startQuestion ?? this.startQuestion,
        content: content ?? this.content,
        relaxTime: relaxTime ?? this.relaxTime,
        propertyDetails: propertyDetails ?? this.propertyDetails,
        propertyDetailsName: propertyDetailsName ?? this.propertyDetailsName);
  }
}

@JsonSerializable(explicitToJson: true)
class ExamStructureUpdateResource {
  ExamStructureUpdateResource({
    this.id,
    this.createdBy,
    this.createdDate,
    this.lastModifiedBy,
    this.lastModifiedDate,
    this.title,
    this.data,
    this.status,
    this.isPublic,
    this.ownerType,
    this.type,
    this.categoryId,
    this.propertyIds,
  });

  factory ExamStructureUpdateResource.fromJson(Map<String, dynamic> json) =>
      _$ExamStructureUpdateResourceFromJson(json);

  @JsonKey(name: 'id', includeIfNull: true)
  final int? id;
  @JsonKey(name: 'createdBy', includeIfNull: true)
  final int? createdBy;
  @JsonKey(name: 'createdDate', includeIfNull: true)
  final DateTime? createdDate;
  @JsonKey(name: 'lastModifiedBy', includeIfNull: true)
  final int? lastModifiedBy;
  @JsonKey(name: 'lastModifiedDate', includeIfNull: true)
  final DateTime? lastModifiedDate;
  @JsonKey(name: 'title', includeIfNull: true, defaultValue: '')
  final String? title;
  @JsonKey(name: 'data', includeIfNull: true, defaultValue: '')
  final String? data;
  @JsonKey(name: 'status', includeIfNull: true)
  final int? status;
  @JsonKey(name: 'isPublic', includeIfNull: true)
  final int? isPublic;
  @JsonKey(name: 'ownerType', includeIfNull: true)
  final int? ownerType;
  @JsonKey(name: 'type', includeIfNull: true)
  final int? type;
  @JsonKey(name: 'categoryId', includeIfNull: true)
  final int? categoryId;
  @JsonKey(name: 'propertyIds', includeIfNull: true, defaultValue: <int>[])
  final List<int>? propertyIds;
  static const fromJsonFactory = _$ExamStructureUpdateResourceFromJson;
  static const toJsonFactory = _$ExamStructureUpdateResourceToJson;
  Map<String, dynamic> toJson() => _$ExamStructureUpdateResourceToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ExamStructureUpdateResource &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.createdBy, createdBy) ||
                const DeepCollectionEquality()
                    .equals(other.createdBy, createdBy)) &&
            (identical(other.createdDate, createdDate) ||
                const DeepCollectionEquality()
                    .equals(other.createdDate, createdDate)) &&
            (identical(other.lastModifiedBy, lastModifiedBy) ||
                const DeepCollectionEquality()
                    .equals(other.lastModifiedBy, lastModifiedBy)) &&
            (identical(other.lastModifiedDate, lastModifiedDate) ||
                const DeepCollectionEquality()
                    .equals(other.lastModifiedDate, lastModifiedDate)) &&
            (identical(other.title, title) ||
                const DeepCollectionEquality().equals(other.title, title)) &&
            (identical(other.data, data) ||
                const DeepCollectionEquality().equals(other.data, data)) &&
            (identical(other.status, status) ||
                const DeepCollectionEquality().equals(other.status, status)) &&
            (identical(other.isPublic, isPublic) ||
                const DeepCollectionEquality()
                    .equals(other.isPublic, isPublic)) &&
            (identical(other.ownerType, ownerType) ||
                const DeepCollectionEquality()
                    .equals(other.ownerType, ownerType)) &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)) &&
            (identical(other.categoryId, categoryId) ||
                const DeepCollectionEquality()
                    .equals(other.categoryId, categoryId)) &&
            (identical(other.propertyIds, propertyIds) ||
                const DeepCollectionEquality()
                    .equals(other.propertyIds, propertyIds)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(createdBy) ^
      const DeepCollectionEquality().hash(createdDate) ^
      const DeepCollectionEquality().hash(lastModifiedBy) ^
      const DeepCollectionEquality().hash(lastModifiedDate) ^
      const DeepCollectionEquality().hash(title) ^
      const DeepCollectionEquality().hash(data) ^
      const DeepCollectionEquality().hash(status) ^
      const DeepCollectionEquality().hash(isPublic) ^
      const DeepCollectionEquality().hash(ownerType) ^
      const DeepCollectionEquality().hash(type) ^
      const DeepCollectionEquality().hash(categoryId) ^
      const DeepCollectionEquality().hash(propertyIds) ^
      runtimeType.hashCode;
}

extension $ExamStructureUpdateResourceExtension on ExamStructureUpdateResource {
  ExamStructureUpdateResource copyWith(
      {int? id,
      int? createdBy,
      DateTime? createdDate,
      int? lastModifiedBy,
      DateTime? lastModifiedDate,
      String? title,
      String? data,
      int? status,
      int? isPublic,
      int? ownerType,
      int? type,
      int? categoryId,
      List<int>? propertyIds}) {
    return ExamStructureUpdateResource(
        id: id ?? this.id,
        createdBy: createdBy ?? this.createdBy,
        createdDate: createdDate ?? this.createdDate,
        lastModifiedBy: lastModifiedBy ?? this.lastModifiedBy,
        lastModifiedDate: lastModifiedDate ?? this.lastModifiedDate,
        title: title ?? this.title,
        data: data ?? this.data,
        status: status ?? this.status,
        isPublic: isPublic ?? this.isPublic,
        ownerType: ownerType ?? this.ownerType,
        type: type ?? this.type,
        categoryId: categoryId ?? this.categoryId,
        propertyIds: propertyIds ?? this.propertyIds);
  }
}

@JsonSerializable(explicitToJson: true)
class ExamUpdateResource {
  ExamUpdateResource({
    this.id,
    this.examStructureId,
    this.examCategoryId,
    this.data,
    this.duration,
    this.title,
    this.examLevel,
    this.description,
    this.examType,
    this.type,
    this.examLimit,
    this.shareMode,
    this.totalMark,
    this.totalQuestion,
    this.examTimeFrom,
    this.examTimeTo,
    this.examLimitNumber,
    this.tags,
    this.status,
    this.isFree,
    this.propertyDetails,
  });

  factory ExamUpdateResource.fromJson(Map<String, dynamic> json) =>
      _$ExamUpdateResourceFromJson(json);

  @JsonKey(name: 'id', includeIfNull: true)
  final int? id;
  @JsonKey(name: 'examStructureId', includeIfNull: true)
  final int? examStructureId;
  @JsonKey(name: 'examCategoryId', includeIfNull: true)
  final int? examCategoryId;
  @JsonKey(name: 'data', includeIfNull: true, defaultValue: '')
  final String? data;
  @JsonKey(name: 'duration', includeIfNull: true)
  final int? duration;
  @JsonKey(name: 'title', includeIfNull: true, defaultValue: '')
  final String? title;
  @JsonKey(name: 'examLevel', includeIfNull: true)
  final int? examLevel;
  @JsonKey(name: 'description', includeIfNull: true, defaultValue: '')
  final String? description;
  @JsonKey(name: 'examType', includeIfNull: true)
  final int? examType;
  @JsonKey(name: 'type', includeIfNull: true)
  final int? type;
  @JsonKey(name: 'examLimit', includeIfNull: true)
  final int? examLimit;
  @JsonKey(name: 'shareMode', includeIfNull: true)
  final int? shareMode;
  @JsonKey(name: 'totalMark', includeIfNull: true)
  final double? totalMark;
  @JsonKey(name: 'totalQuestion', includeIfNull: true)
  final int? totalQuestion;
  @JsonKey(name: 'examTimeFrom', includeIfNull: true)
  final DateTime? examTimeFrom;
  @JsonKey(name: 'examTimeTo', includeIfNull: true)
  final DateTime? examTimeTo;
  @JsonKey(name: 'examLimitNumber', includeIfNull: true)
  final int? examLimitNumber;
  @JsonKey(name: 'tags', includeIfNull: true, defaultValue: <int>[])
  final List<int>? tags;
  @JsonKey(name: 'status', includeIfNull: true)
  final int? status;
  @JsonKey(name: 'isFree', includeIfNull: true)
  final bool? isFree;
  @JsonKey(name: 'propertyDetails', includeIfNull: true, defaultValue: <int>[])
  final List<int>? propertyDetails;
  static const fromJsonFactory = _$ExamUpdateResourceFromJson;
  static const toJsonFactory = _$ExamUpdateResourceToJson;
  Map<String, dynamic> toJson() => _$ExamUpdateResourceToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ExamUpdateResource &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.examStructureId, examStructureId) ||
                const DeepCollectionEquality()
                    .equals(other.examStructureId, examStructureId)) &&
            (identical(other.examCategoryId, examCategoryId) ||
                const DeepCollectionEquality()
                    .equals(other.examCategoryId, examCategoryId)) &&
            (identical(other.data, data) ||
                const DeepCollectionEquality().equals(other.data, data)) &&
            (identical(other.duration, duration) ||
                const DeepCollectionEquality()
                    .equals(other.duration, duration)) &&
            (identical(other.title, title) ||
                const DeepCollectionEquality().equals(other.title, title)) &&
            (identical(other.examLevel, examLevel) ||
                const DeepCollectionEquality()
                    .equals(other.examLevel, examLevel)) &&
            (identical(other.description, description) ||
                const DeepCollectionEquality()
                    .equals(other.description, description)) &&
            (identical(other.examType, examType) ||
                const DeepCollectionEquality()
                    .equals(other.examType, examType)) &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)) &&
            (identical(other.examLimit, examLimit) ||
                const DeepCollectionEquality()
                    .equals(other.examLimit, examLimit)) &&
            (identical(other.shareMode, shareMode) ||
                const DeepCollectionEquality()
                    .equals(other.shareMode, shareMode)) &&
            (identical(other.totalMark, totalMark) ||
                const DeepCollectionEquality()
                    .equals(other.totalMark, totalMark)) &&
            (identical(other.totalQuestion, totalQuestion) ||
                const DeepCollectionEquality()
                    .equals(other.totalQuestion, totalQuestion)) &&
            (identical(other.examTimeFrom, examTimeFrom) ||
                const DeepCollectionEquality()
                    .equals(other.examTimeFrom, examTimeFrom)) &&
            (identical(other.examTimeTo, examTimeTo) ||
                const DeepCollectionEquality()
                    .equals(other.examTimeTo, examTimeTo)) &&
            (identical(other.examLimitNumber, examLimitNumber) ||
                const DeepCollectionEquality()
                    .equals(other.examLimitNumber, examLimitNumber)) &&
            (identical(other.tags, tags) ||
                const DeepCollectionEquality().equals(other.tags, tags)) &&
            (identical(other.status, status) ||
                const DeepCollectionEquality().equals(other.status, status)) &&
            (identical(other.isFree, isFree) ||
                const DeepCollectionEquality().equals(other.isFree, isFree)) &&
            (identical(other.propertyDetails, propertyDetails) ||
                const DeepCollectionEquality()
                    .equals(other.propertyDetails, propertyDetails)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(examStructureId) ^
      const DeepCollectionEquality().hash(examCategoryId) ^
      const DeepCollectionEquality().hash(data) ^
      const DeepCollectionEquality().hash(duration) ^
      const DeepCollectionEquality().hash(title) ^
      const DeepCollectionEquality().hash(examLevel) ^
      const DeepCollectionEquality().hash(description) ^
      const DeepCollectionEquality().hash(examType) ^
      const DeepCollectionEquality().hash(type) ^
      const DeepCollectionEquality().hash(examLimit) ^
      const DeepCollectionEquality().hash(shareMode) ^
      const DeepCollectionEquality().hash(totalMark) ^
      const DeepCollectionEquality().hash(totalQuestion) ^
      const DeepCollectionEquality().hash(examTimeFrom) ^
      const DeepCollectionEquality().hash(examTimeTo) ^
      const DeepCollectionEquality().hash(examLimitNumber) ^
      const DeepCollectionEquality().hash(tags) ^
      const DeepCollectionEquality().hash(status) ^
      const DeepCollectionEquality().hash(isFree) ^
      const DeepCollectionEquality().hash(propertyDetails) ^
      runtimeType.hashCode;
}

extension $ExamUpdateResourceExtension on ExamUpdateResource {
  ExamUpdateResource copyWith(
      {int? id,
      int? examStructureId,
      int? examCategoryId,
      String? data,
      int? duration,
      String? title,
      int? examLevel,
      String? description,
      int? examType,
      int? type,
      int? examLimit,
      int? shareMode,
      double? totalMark,
      int? totalQuestion,
      DateTime? examTimeFrom,
      DateTime? examTimeTo,
      int? examLimitNumber,
      List<int>? tags,
      int? status,
      bool? isFree,
      List<int>? propertyDetails}) {
    return ExamUpdateResource(
        id: id ?? this.id,
        examStructureId: examStructureId ?? this.examStructureId,
        examCategoryId: examCategoryId ?? this.examCategoryId,
        data: data ?? this.data,
        duration: duration ?? this.duration,
        title: title ?? this.title,
        examLevel: examLevel ?? this.examLevel,
        description: description ?? this.description,
        examType: examType ?? this.examType,
        type: type ?? this.type,
        examLimit: examLimit ?? this.examLimit,
        shareMode: shareMode ?? this.shareMode,
        totalMark: totalMark ?? this.totalMark,
        totalQuestion: totalQuestion ?? this.totalQuestion,
        examTimeFrom: examTimeFrom ?? this.examTimeFrom,
        examTimeTo: examTimeTo ?? this.examTimeTo,
        examLimitNumber: examLimitNumber ?? this.examLimitNumber,
        tags: tags ?? this.tags,
        status: status ?? this.status,
        isFree: isFree ?? this.isFree,
        propertyDetails: propertyDetails ?? this.propertyDetails);
  }
}

@JsonSerializable(explicitToJson: true)
class Expression {
  Expression({
    this.type,
    this.nodeType,
    this.canReduce,
  });

  factory Expression.fromJson(Map<String, dynamic> json) =>
      _$ExpressionFromJson(json);

  @JsonKey(name: 'type', includeIfNull: true)
  final Type? type;
  @JsonKey(
      name: 'nodeType',
      includeIfNull: true,
      toJson: expressionTypeToJson,
      fromJson: expressionTypeFromJson)
  final enums.ExpressionType? nodeType;
  @JsonKey(name: 'canReduce', includeIfNull: true)
  final bool? canReduce;
  static const fromJsonFactory = _$ExpressionFromJson;
  static const toJsonFactory = _$ExpressionToJson;
  Map<String, dynamic> toJson() => _$ExpressionToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is Expression &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)) &&
            (identical(other.nodeType, nodeType) ||
                const DeepCollectionEquality()
                    .equals(other.nodeType, nodeType)) &&
            (identical(other.canReduce, canReduce) ||
                const DeepCollectionEquality()
                    .equals(other.canReduce, canReduce)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(type) ^
      const DeepCollectionEquality().hash(nodeType) ^
      const DeepCollectionEquality().hash(canReduce) ^
      runtimeType.hashCode;
}

extension $ExpressionExtension on Expression {
  Expression copyWith(
      {Type? type, enums.ExpressionType? nodeType, bool? canReduce}) {
    return Expression(
        type: type ?? this.type,
        nodeType: nodeType ?? this.nodeType,
        canReduce: canReduce ?? this.canReduce);
  }
}

@JsonSerializable(explicitToJson: true)
class FieldInfo {
  FieldInfo({
    this.name,
    this.declaringType,
    this.reflectedType,
    this.module,
    this.customAttributes,
    this.isCollectible,
    this.metadataToken,
    this.memberType,
    this.attributes,
    this.fieldType,
    this.isInitOnly,
    this.isLiteral,
    this.isNotSerialized,
    this.isPinvokeImpl,
    this.isSpecialName,
    this.isStatic,
    this.isAssembly,
    this.isFamily,
    this.isFamilyAndAssembly,
    this.isFamilyOrAssembly,
    this.isPrivate,
    this.isPublic,
    this.isSecurityCritical,
    this.isSecuritySafeCritical,
    this.isSecurityTransparent,
    this.fieldHandle,
  });

  factory FieldInfo.fromJson(Map<String, dynamic> json) =>
      _$FieldInfoFromJson(json);

  @JsonKey(name: 'name', includeIfNull: true, defaultValue: '')
  final String? name;
  @JsonKey(name: 'declaringType', includeIfNull: true)
  final Type? declaringType;
  @JsonKey(name: 'reflectedType', includeIfNull: true)
  final Type? reflectedType;
  @JsonKey(name: 'module', includeIfNull: true)
  final Module? module;
  @JsonKey(
      name: 'customAttributes',
      includeIfNull: true,
      defaultValue: <CustomAttributeData>[])
  final List<CustomAttributeData>? customAttributes;
  @JsonKey(name: 'isCollectible', includeIfNull: true)
  final bool? isCollectible;
  @JsonKey(name: 'metadataToken', includeIfNull: true)
  final int? metadataToken;
  @JsonKey(
      name: 'memberType',
      includeIfNull: true,
      toJson: memberTypesToJson,
      fromJson: memberTypesFromJson)
  final enums.MemberTypes? memberType;
  @JsonKey(
      name: 'attributes',
      includeIfNull: true,
      toJson: fieldAttributesToJson,
      fromJson: fieldAttributesFromJson)
  final enums.FieldAttributes? attributes;
  @JsonKey(name: 'fieldType', includeIfNull: true)
  final Type? fieldType;
  @JsonKey(name: 'isInitOnly', includeIfNull: true)
  final bool? isInitOnly;
  @JsonKey(name: 'isLiteral', includeIfNull: true)
  final bool? isLiteral;
  @JsonKey(name: 'isNotSerialized', includeIfNull: true)
  final bool? isNotSerialized;
  @JsonKey(name: 'isPinvokeImpl', includeIfNull: true)
  final bool? isPinvokeImpl;
  @JsonKey(name: 'isSpecialName', includeIfNull: true)
  final bool? isSpecialName;
  @JsonKey(name: 'isStatic', includeIfNull: true)
  final bool? isStatic;
  @JsonKey(name: 'isAssembly', includeIfNull: true)
  final bool? isAssembly;
  @JsonKey(name: 'isFamily', includeIfNull: true)
  final bool? isFamily;
  @JsonKey(name: 'isFamilyAndAssembly', includeIfNull: true)
  final bool? isFamilyAndAssembly;
  @JsonKey(name: 'isFamilyOrAssembly', includeIfNull: true)
  final bool? isFamilyOrAssembly;
  @JsonKey(name: 'isPrivate', includeIfNull: true)
  final bool? isPrivate;
  @JsonKey(name: 'isPublic', includeIfNull: true)
  final bool? isPublic;
  @JsonKey(name: 'isSecurityCritical', includeIfNull: true)
  final bool? isSecurityCritical;
  @JsonKey(name: 'isSecuritySafeCritical', includeIfNull: true)
  final bool? isSecuritySafeCritical;
  @JsonKey(name: 'isSecurityTransparent', includeIfNull: true)
  final bool? isSecurityTransparent;
  @JsonKey(name: 'fieldHandle', includeIfNull: true)
  final RuntimeFieldHandle? fieldHandle;
  static const fromJsonFactory = _$FieldInfoFromJson;
  static const toJsonFactory = _$FieldInfoToJson;
  Map<String, dynamic> toJson() => _$FieldInfoToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is FieldInfo &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.declaringType, declaringType) ||
                const DeepCollectionEquality()
                    .equals(other.declaringType, declaringType)) &&
            (identical(other.reflectedType, reflectedType) ||
                const DeepCollectionEquality()
                    .equals(other.reflectedType, reflectedType)) &&
            (identical(other.module, module) ||
                const DeepCollectionEquality().equals(other.module, module)) &&
            (identical(other.customAttributes, customAttributes) ||
                const DeepCollectionEquality()
                    .equals(other.customAttributes, customAttributes)) &&
            (identical(other.isCollectible, isCollectible) ||
                const DeepCollectionEquality()
                    .equals(other.isCollectible, isCollectible)) &&
            (identical(other.metadataToken, metadataToken) ||
                const DeepCollectionEquality()
                    .equals(other.metadataToken, metadataToken)) &&
            (identical(other.memberType, memberType) ||
                const DeepCollectionEquality()
                    .equals(other.memberType, memberType)) &&
            (identical(other.attributes, attributes) ||
                const DeepCollectionEquality()
                    .equals(other.attributes, attributes)) &&
            (identical(other.fieldType, fieldType) ||
                const DeepCollectionEquality()
                    .equals(other.fieldType, fieldType)) &&
            (identical(other.isInitOnly, isInitOnly) ||
                const DeepCollectionEquality()
                    .equals(other.isInitOnly, isInitOnly)) &&
            (identical(other.isLiteral, isLiteral) ||
                const DeepCollectionEquality()
                    .equals(other.isLiteral, isLiteral)) &&
            (identical(other.isNotSerialized, isNotSerialized) ||
                const DeepCollectionEquality()
                    .equals(other.isNotSerialized, isNotSerialized)) &&
            (identical(other.isPinvokeImpl, isPinvokeImpl) ||
                const DeepCollectionEquality()
                    .equals(other.isPinvokeImpl, isPinvokeImpl)) &&
            (identical(other.isSpecialName, isSpecialName) ||
                const DeepCollectionEquality()
                    .equals(other.isSpecialName, isSpecialName)) &&
            (identical(other.isStatic, isStatic) ||
                const DeepCollectionEquality()
                    .equals(other.isStatic, isStatic)) &&
            (identical(other.isAssembly, isAssembly) ||
                const DeepCollectionEquality()
                    .equals(other.isAssembly, isAssembly)) &&
            (identical(other.isFamily, isFamily) ||
                const DeepCollectionEquality()
                    .equals(other.isFamily, isFamily)) &&
            (identical(other.isFamilyAndAssembly, isFamilyAndAssembly) ||
                const DeepCollectionEquality()
                    .equals(other.isFamilyAndAssembly, isFamilyAndAssembly)) &&
            (identical(other.isFamilyOrAssembly, isFamilyOrAssembly) ||
                const DeepCollectionEquality()
                    .equals(other.isFamilyOrAssembly, isFamilyOrAssembly)) &&
            (identical(other.isPrivate, isPrivate) ||
                const DeepCollectionEquality()
                    .equals(other.isPrivate, isPrivate)) &&
            (identical(other.isPublic, isPublic) ||
                const DeepCollectionEquality()
                    .equals(other.isPublic, isPublic)) &&
            (identical(other.isSecurityCritical, isSecurityCritical) ||
                const DeepCollectionEquality().equals(other.isSecurityCritical, isSecurityCritical)) &&
            (identical(other.isSecuritySafeCritical, isSecuritySafeCritical) || const DeepCollectionEquality().equals(other.isSecuritySafeCritical, isSecuritySafeCritical)) &&
            (identical(other.isSecurityTransparent, isSecurityTransparent) || const DeepCollectionEquality().equals(other.isSecurityTransparent, isSecurityTransparent)) &&
            (identical(other.fieldHandle, fieldHandle) || const DeepCollectionEquality().equals(other.fieldHandle, fieldHandle)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(declaringType) ^
      const DeepCollectionEquality().hash(reflectedType) ^
      const DeepCollectionEquality().hash(module) ^
      const DeepCollectionEquality().hash(customAttributes) ^
      const DeepCollectionEquality().hash(isCollectible) ^
      const DeepCollectionEquality().hash(metadataToken) ^
      const DeepCollectionEquality().hash(memberType) ^
      const DeepCollectionEquality().hash(attributes) ^
      const DeepCollectionEquality().hash(fieldType) ^
      const DeepCollectionEquality().hash(isInitOnly) ^
      const DeepCollectionEquality().hash(isLiteral) ^
      const DeepCollectionEquality().hash(isNotSerialized) ^
      const DeepCollectionEquality().hash(isPinvokeImpl) ^
      const DeepCollectionEquality().hash(isSpecialName) ^
      const DeepCollectionEquality().hash(isStatic) ^
      const DeepCollectionEquality().hash(isAssembly) ^
      const DeepCollectionEquality().hash(isFamily) ^
      const DeepCollectionEquality().hash(isFamilyAndAssembly) ^
      const DeepCollectionEquality().hash(isFamilyOrAssembly) ^
      const DeepCollectionEquality().hash(isPrivate) ^
      const DeepCollectionEquality().hash(isPublic) ^
      const DeepCollectionEquality().hash(isSecurityCritical) ^
      const DeepCollectionEquality().hash(isSecuritySafeCritical) ^
      const DeepCollectionEquality().hash(isSecurityTransparent) ^
      const DeepCollectionEquality().hash(fieldHandle) ^
      runtimeType.hashCode;
}

extension $FieldInfoExtension on FieldInfo {
  FieldInfo copyWith(
      {String? name,
      Type? declaringType,
      Type? reflectedType,
      Module? module,
      List<CustomAttributeData>? customAttributes,
      bool? isCollectible,
      int? metadataToken,
      enums.MemberTypes? memberType,
      enums.FieldAttributes? attributes,
      Type? fieldType,
      bool? isInitOnly,
      bool? isLiteral,
      bool? isNotSerialized,
      bool? isPinvokeImpl,
      bool? isSpecialName,
      bool? isStatic,
      bool? isAssembly,
      bool? isFamily,
      bool? isFamilyAndAssembly,
      bool? isFamilyOrAssembly,
      bool? isPrivate,
      bool? isPublic,
      bool? isSecurityCritical,
      bool? isSecuritySafeCritical,
      bool? isSecurityTransparent,
      RuntimeFieldHandle? fieldHandle}) {
    return FieldInfo(
        name: name ?? this.name,
        declaringType: declaringType ?? this.declaringType,
        reflectedType: reflectedType ?? this.reflectedType,
        module: module ?? this.module,
        customAttributes: customAttributes ?? this.customAttributes,
        isCollectible: isCollectible ?? this.isCollectible,
        metadataToken: metadataToken ?? this.metadataToken,
        memberType: memberType ?? this.memberType,
        attributes: attributes ?? this.attributes,
        fieldType: fieldType ?? this.fieldType,
        isInitOnly: isInitOnly ?? this.isInitOnly,
        isLiteral: isLiteral ?? this.isLiteral,
        isNotSerialized: isNotSerialized ?? this.isNotSerialized,
        isPinvokeImpl: isPinvokeImpl ?? this.isPinvokeImpl,
        isSpecialName: isSpecialName ?? this.isSpecialName,
        isStatic: isStatic ?? this.isStatic,
        isAssembly: isAssembly ?? this.isAssembly,
        isFamily: isFamily ?? this.isFamily,
        isFamilyAndAssembly: isFamilyAndAssembly ?? this.isFamilyAndAssembly,
        isFamilyOrAssembly: isFamilyOrAssembly ?? this.isFamilyOrAssembly,
        isPrivate: isPrivate ?? this.isPrivate,
        isPublic: isPublic ?? this.isPublic,
        isSecurityCritical: isSecurityCritical ?? this.isSecurityCritical,
        isSecuritySafeCritical:
            isSecuritySafeCritical ?? this.isSecuritySafeCritical,
        isSecurityTransparent:
            isSecurityTransparent ?? this.isSecurityTransparent,
        fieldHandle: fieldHandle ?? this.fieldHandle);
  }
}

@JsonSerializable(explicitToJson: true)
class GroupDetailEntity {
  GroupDetailEntity({
    this.group,
    this.users,
    this.permission,
    this.role,
  });

  factory GroupDetailEntity.fromJson(Map<String, dynamic> json) =>
      _$GroupDetailEntityFromJson(json);

  @JsonKey(name: 'group', includeIfNull: true)
  final GroupInfoEntity? group;
  @JsonKey(
      name: 'users', includeIfNull: true, defaultValue: <GroupUserEntity>[])
  final List<GroupUserEntity>? users;
  @JsonKey(name: 'permission', includeIfNull: true)
  final int? permission;
  @JsonKey(name: 'role', includeIfNull: true)
  final GroupRoleResource? role;
  static const fromJsonFactory = _$GroupDetailEntityFromJson;
  static const toJsonFactory = _$GroupDetailEntityToJson;
  Map<String, dynamic> toJson() => _$GroupDetailEntityToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is GroupDetailEntity &&
            (identical(other.group, group) ||
                const DeepCollectionEquality().equals(other.group, group)) &&
            (identical(other.users, users) ||
                const DeepCollectionEquality().equals(other.users, users)) &&
            (identical(other.permission, permission) ||
                const DeepCollectionEquality()
                    .equals(other.permission, permission)) &&
            (identical(other.role, role) ||
                const DeepCollectionEquality().equals(other.role, role)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(group) ^
      const DeepCollectionEquality().hash(users) ^
      const DeepCollectionEquality().hash(permission) ^
      const DeepCollectionEquality().hash(role) ^
      runtimeType.hashCode;
}

extension $GroupDetailEntityExtension on GroupDetailEntity {
  GroupDetailEntity copyWith(
      {GroupInfoEntity? group,
      List<GroupUserEntity>? users,
      int? permission,
      GroupRoleResource? role}) {
    return GroupDetailEntity(
        group: group ?? this.group,
        users: users ?? this.users,
        permission: permission ?? this.permission,
        role: role ?? this.role);
  }
}

@JsonSerializable(explicitToJson: true)
class GroupExamEntity {
  GroupExamEntity({
    this.id,
    this.createdBy,
    this.createdDate,
    this.lastModifiedBy,
    this.lastModifiedDate,
    this.groupId,
    this.examId,
    this.status,
    this.allowDeadline,
    this.allowSeeAnswerAfterComplete,
    this.lastDeadline,
  });

  factory GroupExamEntity.fromJson(Map<String, dynamic> json) =>
      _$GroupExamEntityFromJson(json);

  @JsonKey(name: 'id', includeIfNull: true)
  final int? id;
  @JsonKey(name: 'createdBy', includeIfNull: true)
  final int? createdBy;
  @JsonKey(name: 'createdDate', includeIfNull: true)
  final DateTime? createdDate;
  @JsonKey(name: 'lastModifiedBy', includeIfNull: true)
  final int? lastModifiedBy;
  @JsonKey(name: 'lastModifiedDate', includeIfNull: true)
  final DateTime? lastModifiedDate;
  @JsonKey(name: 'groupId', includeIfNull: true)
  final int? groupId;
  @JsonKey(name: 'examId', includeIfNull: true)
  final int? examId;
  @JsonKey(name: 'status', includeIfNull: true)
  final int? status;
  @JsonKey(name: 'allowDeadline', includeIfNull: true)
  final bool? allowDeadline;
  @JsonKey(name: 'allowSeeAnswerAfterComplete', includeIfNull: true)
  final bool? allowSeeAnswerAfterComplete;
  @JsonKey(name: 'lastDeadline', includeIfNull: true)
  final DateTime? lastDeadline;
  static const fromJsonFactory = _$GroupExamEntityFromJson;
  static const toJsonFactory = _$GroupExamEntityToJson;
  Map<String, dynamic> toJson() => _$GroupExamEntityToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is GroupExamEntity &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.createdBy, createdBy) ||
                const DeepCollectionEquality()
                    .equals(other.createdBy, createdBy)) &&
            (identical(other.createdDate, createdDate) ||
                const DeepCollectionEquality()
                    .equals(other.createdDate, createdDate)) &&
            (identical(other.lastModifiedBy, lastModifiedBy) ||
                const DeepCollectionEquality()
                    .equals(other.lastModifiedBy, lastModifiedBy)) &&
            (identical(other.lastModifiedDate, lastModifiedDate) ||
                const DeepCollectionEquality()
                    .equals(other.lastModifiedDate, lastModifiedDate)) &&
            (identical(other.groupId, groupId) ||
                const DeepCollectionEquality()
                    .equals(other.groupId, groupId)) &&
            (identical(other.examId, examId) ||
                const DeepCollectionEquality().equals(other.examId, examId)) &&
            (identical(other.status, status) ||
                const DeepCollectionEquality().equals(other.status, status)) &&
            (identical(other.allowDeadline, allowDeadline) ||
                const DeepCollectionEquality()
                    .equals(other.allowDeadline, allowDeadline)) &&
            (identical(other.allowSeeAnswerAfterComplete,
                    allowSeeAnswerAfterComplete) ||
                const DeepCollectionEquality().equals(
                    other.allowSeeAnswerAfterComplete,
                    allowSeeAnswerAfterComplete)) &&
            (identical(other.lastDeadline, lastDeadline) ||
                const DeepCollectionEquality()
                    .equals(other.lastDeadline, lastDeadline)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(createdBy) ^
      const DeepCollectionEquality().hash(createdDate) ^
      const DeepCollectionEquality().hash(lastModifiedBy) ^
      const DeepCollectionEquality().hash(lastModifiedDate) ^
      const DeepCollectionEquality().hash(groupId) ^
      const DeepCollectionEquality().hash(examId) ^
      const DeepCollectionEquality().hash(status) ^
      const DeepCollectionEquality().hash(allowDeadline) ^
      const DeepCollectionEquality().hash(allowSeeAnswerAfterComplete) ^
      const DeepCollectionEquality().hash(lastDeadline) ^
      runtimeType.hashCode;
}

extension $GroupExamEntityExtension on GroupExamEntity {
  GroupExamEntity copyWith(
      {int? id,
      int? createdBy,
      DateTime? createdDate,
      int? lastModifiedBy,
      DateTime? lastModifiedDate,
      int? groupId,
      int? examId,
      int? status,
      bool? allowDeadline,
      bool? allowSeeAnswerAfterComplete,
      DateTime? lastDeadline}) {
    return GroupExamEntity(
        id: id ?? this.id,
        createdBy: createdBy ?? this.createdBy,
        createdDate: createdDate ?? this.createdDate,
        lastModifiedBy: lastModifiedBy ?? this.lastModifiedBy,
        lastModifiedDate: lastModifiedDate ?? this.lastModifiedDate,
        groupId: groupId ?? this.groupId,
        examId: examId ?? this.examId,
        status: status ?? this.status,
        allowDeadline: allowDeadline ?? this.allowDeadline,
        allowSeeAnswerAfterComplete:
            allowSeeAnswerAfterComplete ?? this.allowSeeAnswerAfterComplete,
        lastDeadline: lastDeadline ?? this.lastDeadline);
  }
}

@JsonSerializable(explicitToJson: true)
class GroupExamResource {
  GroupExamResource({
    this.id,
    this.examId,
    this.examLevel,
    this.examType,
    this.groupId,
    this.startDate,
    this.endDate,
    this.title,
    this.duration,
    this.isExpired,
    this.status,
    this.countUser,
    this.listUserAssigned,
    this.countUserWait,
    this.countUserDidTheHomework,
    this.countUserScored,
    this.listUserScored,
    this.lastDeadline,
    this.timeSubmitExam,
    this.createdBy,
    this.createdByUser,
    this.propertyDetails,
    this.userExamResultId,
    this.userExamResult,
  });

  factory GroupExamResource.fromJson(Map<String, dynamic> json) =>
      _$GroupExamResourceFromJson(json);

  @JsonKey(name: 'id', includeIfNull: true)
  final int? id;
  @JsonKey(name: 'examId', includeIfNull: true)
  final int? examId;
  @JsonKey(name: 'examLevel', includeIfNull: true)
  final int? examLevel;
  @JsonKey(name: 'examType', includeIfNull: true)
  final int? examType;
  @JsonKey(name: 'groupId', includeIfNull: true)
  final int? groupId;
  @JsonKey(name: 'startDate', includeIfNull: true)
  final DateTime? startDate;
  @JsonKey(name: 'endDate', includeIfNull: true)
  final DateTime? endDate;
  @JsonKey(name: 'title', includeIfNull: true, defaultValue: '')
  final String? title;
  @JsonKey(name: 'duration', includeIfNull: true)
  final double? duration;
  @JsonKey(name: 'isExpired', includeIfNull: true)
  final bool? isExpired;
  @JsonKey(name: 'status', includeIfNull: true)
  final int? status;
  @JsonKey(name: 'countUser', includeIfNull: true)
  final int? countUser;
  @JsonKey(
      name: 'listUserAssigned',
      includeIfNull: true,
      defaultValue: <SimpleUserEntity>[])
  final List<SimpleUserEntity>? listUserAssigned;
  @JsonKey(name: 'countUserWait', includeIfNull: true)
  final int? countUserWait;
  @JsonKey(name: 'countUserDidTheHomework', includeIfNull: true)
  final int? countUserDidTheHomework;
  @JsonKey(name: 'countUserScored', includeIfNull: true)
  final int? countUserScored;
  @JsonKey(
      name: 'listUserScored',
      includeIfNull: true,
      defaultValue: <GroupExamUserResource>[])
  final List<GroupExamUserResource>? listUserScored;
  @JsonKey(name: 'lastDeadline', includeIfNull: true)
  final DateTime? lastDeadline;
  @JsonKey(name: 'timeSubmitExam', includeIfNull: true)
  final DateTime? timeSubmitExam;
  @JsonKey(name: 'createdBy', includeIfNull: true)
  final int? createdBy;
  @JsonKey(name: 'createdByUser', includeIfNull: true)
  final SimpleUserEntity? createdByUser;
  @JsonKey(name: 'propertyDetails', includeIfNull: true, defaultValue: <int>[])
  final List<int>? propertyDetails;
  @JsonKey(name: 'userExamResultId', includeIfNull: true)
  final int? userExamResultId;
  @JsonKey(name: 'userExamResult', includeIfNull: true)
  final UserExamResultPublicResource? userExamResult;
  static const fromJsonFactory = _$GroupExamResourceFromJson;
  static const toJsonFactory = _$GroupExamResourceToJson;
  Map<String, dynamic> toJson() => _$GroupExamResourceToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is GroupExamResource &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.examId, examId) ||
                const DeepCollectionEquality().equals(other.examId, examId)) &&
            (identical(other.examLevel, examLevel) ||
                const DeepCollectionEquality()
                    .equals(other.examLevel, examLevel)) &&
            (identical(other.examType, examType) ||
                const DeepCollectionEquality()
                    .equals(other.examType, examType)) &&
            (identical(other.groupId, groupId) ||
                const DeepCollectionEquality()
                    .equals(other.groupId, groupId)) &&
            (identical(other.startDate, startDate) ||
                const DeepCollectionEquality()
                    .equals(other.startDate, startDate)) &&
            (identical(other.endDate, endDate) ||
                const DeepCollectionEquality()
                    .equals(other.endDate, endDate)) &&
            (identical(other.title, title) ||
                const DeepCollectionEquality().equals(other.title, title)) &&
            (identical(other.duration, duration) ||
                const DeepCollectionEquality()
                    .equals(other.duration, duration)) &&
            (identical(other.isExpired, isExpired) ||
                const DeepCollectionEquality()
                    .equals(other.isExpired, isExpired)) &&
            (identical(other.status, status) ||
                const DeepCollectionEquality().equals(other.status, status)) &&
            (identical(other.countUser, countUser) ||
                const DeepCollectionEquality()
                    .equals(other.countUser, countUser)) &&
            (identical(other.listUserAssigned, listUserAssigned) ||
                const DeepCollectionEquality()
                    .equals(other.listUserAssigned, listUserAssigned)) &&
            (identical(other.countUserWait, countUserWait) ||
                const DeepCollectionEquality()
                    .equals(other.countUserWait, countUserWait)) &&
            (identical(other.countUserDidTheHomework, countUserDidTheHomework) ||
                const DeepCollectionEquality().equals(
                    other.countUserDidTheHomework, countUserDidTheHomework)) &&
            (identical(other.countUserScored, countUserScored) ||
                const DeepCollectionEquality()
                    .equals(other.countUserScored, countUserScored)) &&
            (identical(other.listUserScored, listUserScored) ||
                const DeepCollectionEquality()
                    .equals(other.listUserScored, listUserScored)) &&
            (identical(other.lastDeadline, lastDeadline) ||
                const DeepCollectionEquality()
                    .equals(other.lastDeadline, lastDeadline)) &&
            (identical(other.timeSubmitExam, timeSubmitExam) ||
                const DeepCollectionEquality()
                    .equals(other.timeSubmitExam, timeSubmitExam)) &&
            (identical(other.createdBy, createdBy) ||
                const DeepCollectionEquality()
                    .equals(other.createdBy, createdBy)) &&
            (identical(other.createdByUser, createdByUser) ||
                const DeepCollectionEquality()
                    .equals(other.createdByUser, createdByUser)) &&
            (identical(other.propertyDetails, propertyDetails) ||
                const DeepCollectionEquality()
                    .equals(other.propertyDetails, propertyDetails)) &&
            (identical(other.userExamResultId, userExamResultId) || const DeepCollectionEquality().equals(other.userExamResultId, userExamResultId)) &&
            (identical(other.userExamResult, userExamResult) || const DeepCollectionEquality().equals(other.userExamResult, userExamResult)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(examId) ^
      const DeepCollectionEquality().hash(examLevel) ^
      const DeepCollectionEquality().hash(examType) ^
      const DeepCollectionEquality().hash(groupId) ^
      const DeepCollectionEquality().hash(startDate) ^
      const DeepCollectionEquality().hash(endDate) ^
      const DeepCollectionEquality().hash(title) ^
      const DeepCollectionEquality().hash(duration) ^
      const DeepCollectionEquality().hash(isExpired) ^
      const DeepCollectionEquality().hash(status) ^
      const DeepCollectionEquality().hash(countUser) ^
      const DeepCollectionEquality().hash(listUserAssigned) ^
      const DeepCollectionEquality().hash(countUserWait) ^
      const DeepCollectionEquality().hash(countUserDidTheHomework) ^
      const DeepCollectionEquality().hash(countUserScored) ^
      const DeepCollectionEquality().hash(listUserScored) ^
      const DeepCollectionEquality().hash(lastDeadline) ^
      const DeepCollectionEquality().hash(timeSubmitExam) ^
      const DeepCollectionEquality().hash(createdBy) ^
      const DeepCollectionEquality().hash(createdByUser) ^
      const DeepCollectionEquality().hash(propertyDetails) ^
      const DeepCollectionEquality().hash(userExamResultId) ^
      const DeepCollectionEquality().hash(userExamResult) ^
      runtimeType.hashCode;
}

extension $GroupExamResourceExtension on GroupExamResource {
  GroupExamResource copyWith(
      {int? id,
      int? examId,
      int? examLevel,
      int? examType,
      int? groupId,
      DateTime? startDate,
      DateTime? endDate,
      String? title,
      double? duration,
      bool? isExpired,
      int? status,
      int? countUser,
      List<SimpleUserEntity>? listUserAssigned,
      int? countUserWait,
      int? countUserDidTheHomework,
      int? countUserScored,
      List<GroupExamUserResource>? listUserScored,
      DateTime? lastDeadline,
      DateTime? timeSubmitExam,
      int? createdBy,
      SimpleUserEntity? createdByUser,
      List<int>? propertyDetails,
      int? userExamResultId,
      UserExamResultPublicResource? userExamResult}) {
    return GroupExamResource(
        id: id ?? this.id,
        examId: examId ?? this.examId,
        examLevel: examLevel ?? this.examLevel,
        examType: examType ?? this.examType,
        groupId: groupId ?? this.groupId,
        startDate: startDate ?? this.startDate,
        endDate: endDate ?? this.endDate,
        title: title ?? this.title,
        duration: duration ?? this.duration,
        isExpired: isExpired ?? this.isExpired,
        status: status ?? this.status,
        countUser: countUser ?? this.countUser,
        listUserAssigned: listUserAssigned ?? this.listUserAssigned,
        countUserWait: countUserWait ?? this.countUserWait,
        countUserDidTheHomework:
            countUserDidTheHomework ?? this.countUserDidTheHomework,
        countUserScored: countUserScored ?? this.countUserScored,
        listUserScored: listUserScored ?? this.listUserScored,
        lastDeadline: lastDeadline ?? this.lastDeadline,
        timeSubmitExam: timeSubmitExam ?? this.timeSubmitExam,
        createdBy: createdBy ?? this.createdBy,
        createdByUser: createdByUser ?? this.createdByUser,
        propertyDetails: propertyDetails ?? this.propertyDetails,
        userExamResultId: userExamResultId ?? this.userExamResultId,
        userExamResult: userExamResult ?? this.userExamResult);
  }
}

@JsonSerializable(explicitToJson: true)
class GroupExamResourceFilterResult {
  GroupExamResourceFilterResult({
    this.totalRows,
    this.data,
  });

  factory GroupExamResourceFilterResult.fromJson(Map<String, dynamic> json) =>
      _$GroupExamResourceFilterResultFromJson(json);

  @JsonKey(name: 'totalRows', includeIfNull: true)
  final int? totalRows;
  @JsonKey(
      name: 'data', includeIfNull: true, defaultValue: <GroupExamResource>[])
  final List<GroupExamResource>? data;
  static const fromJsonFactory = _$GroupExamResourceFilterResultFromJson;
  static const toJsonFactory = _$GroupExamResourceFilterResultToJson;
  Map<String, dynamic> toJson() => _$GroupExamResourceFilterResultToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is GroupExamResourceFilterResult &&
            (identical(other.totalRows, totalRows) ||
                const DeepCollectionEquality()
                    .equals(other.totalRows, totalRows)) &&
            (identical(other.data, data) ||
                const DeepCollectionEquality().equals(other.data, data)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(totalRows) ^
      const DeepCollectionEquality().hash(data) ^
      runtimeType.hashCode;
}

extension $GroupExamResourceFilterResultExtension
    on GroupExamResourceFilterResult {
  GroupExamResourceFilterResult copyWith(
      {int? totalRows, List<GroupExamResource>? data}) {
    return GroupExamResourceFilterResult(
        totalRows: totalRows ?? this.totalRows, data: data ?? this.data);
  }
}

@JsonSerializable(explicitToJson: true)
class GroupExamUserEntity {
  GroupExamUserEntity({
    this.id,
    this.createdBy,
    this.createdDate,
    this.lastModifiedBy,
    this.lastModifiedDate,
    this.userId,
    this.groupExamId,
    this.status,
    this.userExamResultId,
    this.startDate,
    this.endDate,
    this.timeSubmitExam,
    this.allowDeadline,
    this.allowSeeAnswerAfterComplete,
    this.note,
    this.notedBy,
  });

  factory GroupExamUserEntity.fromJson(Map<String, dynamic> json) =>
      _$GroupExamUserEntityFromJson(json);

  @JsonKey(name: 'id', includeIfNull: true)
  final int? id;
  @JsonKey(name: 'createdBy', includeIfNull: true)
  final int? createdBy;
  @JsonKey(name: 'createdDate', includeIfNull: true)
  final DateTime? createdDate;
  @JsonKey(name: 'lastModifiedBy', includeIfNull: true)
  final int? lastModifiedBy;
  @JsonKey(name: 'lastModifiedDate', includeIfNull: true)
  final DateTime? lastModifiedDate;
  @JsonKey(name: 'userId', includeIfNull: true)
  final int? userId;
  @JsonKey(name: 'groupExamId', includeIfNull: true)
  final int? groupExamId;
  @JsonKey(name: 'status', includeIfNull: true)
  final int? status;
  @JsonKey(name: 'userExamResultId', includeIfNull: true)
  final int? userExamResultId;
  @JsonKey(name: 'startDate', includeIfNull: true)
  final DateTime? startDate;
  @JsonKey(name: 'endDate', includeIfNull: true)
  final DateTime? endDate;
  @JsonKey(name: 'timeSubmitExam', includeIfNull: true)
  final DateTime? timeSubmitExam;
  @JsonKey(name: 'allowDeadline', includeIfNull: true)
  final bool? allowDeadline;
  @JsonKey(name: 'allowSeeAnswerAfterComplete', includeIfNull: true)
  final bool? allowSeeAnswerAfterComplete;
  @JsonKey(name: 'note', includeIfNull: true, defaultValue: '')
  final String? note;
  @JsonKey(name: 'notedBy', includeIfNull: true)
  final int? notedBy;
  static const fromJsonFactory = _$GroupExamUserEntityFromJson;
  static const toJsonFactory = _$GroupExamUserEntityToJson;
  Map<String, dynamic> toJson() => _$GroupExamUserEntityToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is GroupExamUserEntity &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.createdBy, createdBy) ||
                const DeepCollectionEquality()
                    .equals(other.createdBy, createdBy)) &&
            (identical(other.createdDate, createdDate) ||
                const DeepCollectionEquality()
                    .equals(other.createdDate, createdDate)) &&
            (identical(other.lastModifiedBy, lastModifiedBy) ||
                const DeepCollectionEquality()
                    .equals(other.lastModifiedBy, lastModifiedBy)) &&
            (identical(other.lastModifiedDate, lastModifiedDate) ||
                const DeepCollectionEquality()
                    .equals(other.lastModifiedDate, lastModifiedDate)) &&
            (identical(other.userId, userId) ||
                const DeepCollectionEquality().equals(other.userId, userId)) &&
            (identical(other.groupExamId, groupExamId) ||
                const DeepCollectionEquality()
                    .equals(other.groupExamId, groupExamId)) &&
            (identical(other.status, status) ||
                const DeepCollectionEquality().equals(other.status, status)) &&
            (identical(other.userExamResultId, userExamResultId) ||
                const DeepCollectionEquality()
                    .equals(other.userExamResultId, userExamResultId)) &&
            (identical(other.startDate, startDate) ||
                const DeepCollectionEquality()
                    .equals(other.startDate, startDate)) &&
            (identical(other.endDate, endDate) ||
                const DeepCollectionEquality()
                    .equals(other.endDate, endDate)) &&
            (identical(other.timeSubmitExam, timeSubmitExam) ||
                const DeepCollectionEquality()
                    .equals(other.timeSubmitExam, timeSubmitExam)) &&
            (identical(other.allowDeadline, allowDeadline) ||
                const DeepCollectionEquality()
                    .equals(other.allowDeadline, allowDeadline)) &&
            (identical(other.allowSeeAnswerAfterComplete,
                    allowSeeAnswerAfterComplete) ||
                const DeepCollectionEquality().equals(
                    other.allowSeeAnswerAfterComplete,
                    allowSeeAnswerAfterComplete)) &&
            (identical(other.note, note) ||
                const DeepCollectionEquality().equals(other.note, note)) &&
            (identical(other.notedBy, notedBy) ||
                const DeepCollectionEquality().equals(other.notedBy, notedBy)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(createdBy) ^
      const DeepCollectionEquality().hash(createdDate) ^
      const DeepCollectionEquality().hash(lastModifiedBy) ^
      const DeepCollectionEquality().hash(lastModifiedDate) ^
      const DeepCollectionEquality().hash(userId) ^
      const DeepCollectionEquality().hash(groupExamId) ^
      const DeepCollectionEquality().hash(status) ^
      const DeepCollectionEquality().hash(userExamResultId) ^
      const DeepCollectionEquality().hash(startDate) ^
      const DeepCollectionEquality().hash(endDate) ^
      const DeepCollectionEquality().hash(timeSubmitExam) ^
      const DeepCollectionEquality().hash(allowDeadline) ^
      const DeepCollectionEquality().hash(allowSeeAnswerAfterComplete) ^
      const DeepCollectionEquality().hash(note) ^
      const DeepCollectionEquality().hash(notedBy) ^
      runtimeType.hashCode;
}

extension $GroupExamUserEntityExtension on GroupExamUserEntity {
  GroupExamUserEntity copyWith(
      {int? id,
      int? createdBy,
      DateTime? createdDate,
      int? lastModifiedBy,
      DateTime? lastModifiedDate,
      int? userId,
      int? groupExamId,
      int? status,
      int? userExamResultId,
      DateTime? startDate,
      DateTime? endDate,
      DateTime? timeSubmitExam,
      bool? allowDeadline,
      bool? allowSeeAnswerAfterComplete,
      String? note,
      int? notedBy}) {
    return GroupExamUserEntity(
        id: id ?? this.id,
        createdBy: createdBy ?? this.createdBy,
        createdDate: createdDate ?? this.createdDate,
        lastModifiedBy: lastModifiedBy ?? this.lastModifiedBy,
        lastModifiedDate: lastModifiedDate ?? this.lastModifiedDate,
        userId: userId ?? this.userId,
        groupExamId: groupExamId ?? this.groupExamId,
        status: status ?? this.status,
        userExamResultId: userExamResultId ?? this.userExamResultId,
        startDate: startDate ?? this.startDate,
        endDate: endDate ?? this.endDate,
        timeSubmitExam: timeSubmitExam ?? this.timeSubmitExam,
        allowDeadline: allowDeadline ?? this.allowDeadline,
        allowSeeAnswerAfterComplete:
            allowSeeAnswerAfterComplete ?? this.allowSeeAnswerAfterComplete,
        note: note ?? this.note,
        notedBy: notedBy ?? this.notedBy);
  }
}

@JsonSerializable(explicitToJson: true)
class GroupExamUserFilterResource {
  GroupExamUserFilterResource({
    this.sortExpression,
    this.pageSize,
    this.pageIndex,
    this.groupExamId,
    this.filterType,
  });

  factory GroupExamUserFilterResource.fromJson(Map<String, dynamic> json) =>
      _$GroupExamUserFilterResourceFromJson(json);

  @JsonKey(name: 'sortExpression', includeIfNull: true, defaultValue: '')
  final String? sortExpression;
  @JsonKey(name: 'pageSize', includeIfNull: true)
  final int? pageSize;
  @JsonKey(name: 'pageIndex', includeIfNull: true)
  final int? pageIndex;
  @JsonKey(name: 'groupExamId', includeIfNull: true)
  final int? groupExamId;
  @JsonKey(name: 'filterType', includeIfNull: true, defaultValue: <int>[])
  final List<int>? filterType;
  static const fromJsonFactory = _$GroupExamUserFilterResourceFromJson;
  static const toJsonFactory = _$GroupExamUserFilterResourceToJson;
  Map<String, dynamic> toJson() => _$GroupExamUserFilterResourceToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is GroupExamUserFilterResource &&
            (identical(other.sortExpression, sortExpression) ||
                const DeepCollectionEquality()
                    .equals(other.sortExpression, sortExpression)) &&
            (identical(other.pageSize, pageSize) ||
                const DeepCollectionEquality()
                    .equals(other.pageSize, pageSize)) &&
            (identical(other.pageIndex, pageIndex) ||
                const DeepCollectionEquality()
                    .equals(other.pageIndex, pageIndex)) &&
            (identical(other.groupExamId, groupExamId) ||
                const DeepCollectionEquality()
                    .equals(other.groupExamId, groupExamId)) &&
            (identical(other.filterType, filterType) ||
                const DeepCollectionEquality()
                    .equals(other.filterType, filterType)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(sortExpression) ^
      const DeepCollectionEquality().hash(pageSize) ^
      const DeepCollectionEquality().hash(pageIndex) ^
      const DeepCollectionEquality().hash(groupExamId) ^
      const DeepCollectionEquality().hash(filterType) ^
      runtimeType.hashCode;
}

extension $GroupExamUserFilterResourceExtension on GroupExamUserFilterResource {
  GroupExamUserFilterResource copyWith(
      {String? sortExpression,
      int? pageSize,
      int? pageIndex,
      int? groupExamId,
      List<int>? filterType}) {
    return GroupExamUserFilterResource(
        sortExpression: sortExpression ?? this.sortExpression,
        pageSize: pageSize ?? this.pageSize,
        pageIndex: pageIndex ?? this.pageIndex,
        groupExamId: groupExamId ?? this.groupExamId,
        filterType: filterType ?? this.filterType);
  }
}

@JsonSerializable(explicitToJson: true)
class GroupExamUserResource {
  GroupExamUserResource({
    this.id,
    this.userId,
    this.user,
    this.groupExamId,
    this.examId,
    this.examTitle,
    this.status,
    this.userExamResultId,
    this.userExamResult,
    this.startDate,
    this.endDate,
    this.timeSubmitExam,
    this.isSubmitLate,
    this.createdBy,
    this.createDate,
    this.assignedBy,
    this.mark,
    this.note,
    this.notedBy,
    this.notedByUser,
    this.allowDeadline,
    this.allowSeeAnswerAfterComplete,
    this.countUser,
  });

  factory GroupExamUserResource.fromJson(Map<String, dynamic> json) =>
      _$GroupExamUserResourceFromJson(json);

  @JsonKey(name: 'id', includeIfNull: true)
  final int? id;
  @JsonKey(name: 'userId', includeIfNull: true)
  final int? userId;
  @JsonKey(name: 'user', includeIfNull: true)
  final SimpleUserEntity? user;
  @JsonKey(name: 'groupExamId', includeIfNull: true)
  final int? groupExamId;
  @JsonKey(name: 'examId', includeIfNull: true)
  final int? examId;
  @JsonKey(name: 'examTitle', includeIfNull: true, defaultValue: '')
  final String? examTitle;
  @JsonKey(name: 'status', includeIfNull: true)
  final int? status;
  @JsonKey(name: 'userExamResultId', includeIfNull: true)
  final int? userExamResultId;
  @JsonKey(name: 'userExamResult', includeIfNull: true)
  final UserExamResultPublicResource? userExamResult;
  @JsonKey(name: 'startDate', includeIfNull: true)
  final DateTime? startDate;
  @JsonKey(name: 'endDate', includeIfNull: true)
  final DateTime? endDate;
  @JsonKey(name: 'timeSubmitExam', includeIfNull: true)
  final DateTime? timeSubmitExam;
  @JsonKey(name: 'isSubmitLate', includeIfNull: true)
  final bool? isSubmitLate;
  @JsonKey(name: 'createdBy', includeIfNull: true)
  final int? createdBy;
  @JsonKey(name: 'createDate', includeIfNull: true)
  final DateTime? createDate;
  @JsonKey(name: 'assignedBy', includeIfNull: true)
  final SimpleUserEntity? assignedBy;
  @JsonKey(name: 'mark', includeIfNull: true)
  final double? mark;
  @JsonKey(name: 'note', includeIfNull: true, defaultValue: '')
  final String? note;
  @JsonKey(name: 'notedBy', includeIfNull: true)
  final int? notedBy;
  @JsonKey(name: 'notedByUser', includeIfNull: true)
  final SimpleUserEntity? notedByUser;
  @JsonKey(name: 'allowDeadline', includeIfNull: true)
  final bool? allowDeadline;
  @JsonKey(name: 'allowSeeAnswerAfterComplete', includeIfNull: true)
  final bool? allowSeeAnswerAfterComplete;
  @JsonKey(name: 'countUser', includeIfNull: true)
  final int? countUser;
  static const fromJsonFactory = _$GroupExamUserResourceFromJson;
  static const toJsonFactory = _$GroupExamUserResourceToJson;
  Map<String, dynamic> toJson() => _$GroupExamUserResourceToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is GroupExamUserResource &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.userId, userId) ||
                const DeepCollectionEquality().equals(other.userId, userId)) &&
            (identical(other.user, user) ||
                const DeepCollectionEquality().equals(other.user, user)) &&
            (identical(other.groupExamId, groupExamId) ||
                const DeepCollectionEquality()
                    .equals(other.groupExamId, groupExamId)) &&
            (identical(other.examId, examId) ||
                const DeepCollectionEquality().equals(other.examId, examId)) &&
            (identical(other.examTitle, examTitle) ||
                const DeepCollectionEquality()
                    .equals(other.examTitle, examTitle)) &&
            (identical(other.status, status) ||
                const DeepCollectionEquality().equals(other.status, status)) &&
            (identical(other.userExamResultId, userExamResultId) ||
                const DeepCollectionEquality()
                    .equals(other.userExamResultId, userExamResultId)) &&
            (identical(other.userExamResult, userExamResult) ||
                const DeepCollectionEquality()
                    .equals(other.userExamResult, userExamResult)) &&
            (identical(other.startDate, startDate) ||
                const DeepCollectionEquality()
                    .equals(other.startDate, startDate)) &&
            (identical(other.endDate, endDate) ||
                const DeepCollectionEquality()
                    .equals(other.endDate, endDate)) &&
            (identical(other.timeSubmitExam, timeSubmitExam) ||
                const DeepCollectionEquality()
                    .equals(other.timeSubmitExam, timeSubmitExam)) &&
            (identical(other.isSubmitLate, isSubmitLate) ||
                const DeepCollectionEquality()
                    .equals(other.isSubmitLate, isSubmitLate)) &&
            (identical(other.createdBy, createdBy) ||
                const DeepCollectionEquality()
                    .equals(other.createdBy, createdBy)) &&
            (identical(other.createDate, createDate) ||
                const DeepCollectionEquality()
                    .equals(other.createDate, createDate)) &&
            (identical(other.assignedBy, assignedBy) ||
                const DeepCollectionEquality()
                    .equals(other.assignedBy, assignedBy)) &&
            (identical(other.mark, mark) ||
                const DeepCollectionEquality().equals(other.mark, mark)) &&
            (identical(other.note, note) ||
                const DeepCollectionEquality().equals(other.note, note)) &&
            (identical(other.notedBy, notedBy) ||
                const DeepCollectionEquality()
                    .equals(other.notedBy, notedBy)) &&
            (identical(other.notedByUser, notedByUser) ||
                const DeepCollectionEquality()
                    .equals(other.notedByUser, notedByUser)) &&
            (identical(other.allowDeadline, allowDeadline) ||
                const DeepCollectionEquality()
                    .equals(other.allowDeadline, allowDeadline)) &&
            (identical(other.allowSeeAnswerAfterComplete,
                    allowSeeAnswerAfterComplete) ||
                const DeepCollectionEquality().equals(
                    other.allowSeeAnswerAfterComplete,
                    allowSeeAnswerAfterComplete)) &&
            (identical(other.countUser, countUser) ||
                const DeepCollectionEquality()
                    .equals(other.countUser, countUser)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(userId) ^
      const DeepCollectionEquality().hash(user) ^
      const DeepCollectionEquality().hash(groupExamId) ^
      const DeepCollectionEquality().hash(examId) ^
      const DeepCollectionEquality().hash(examTitle) ^
      const DeepCollectionEquality().hash(status) ^
      const DeepCollectionEquality().hash(userExamResultId) ^
      const DeepCollectionEquality().hash(userExamResult) ^
      const DeepCollectionEquality().hash(startDate) ^
      const DeepCollectionEquality().hash(endDate) ^
      const DeepCollectionEquality().hash(timeSubmitExam) ^
      const DeepCollectionEquality().hash(isSubmitLate) ^
      const DeepCollectionEquality().hash(createdBy) ^
      const DeepCollectionEquality().hash(createDate) ^
      const DeepCollectionEquality().hash(assignedBy) ^
      const DeepCollectionEquality().hash(mark) ^
      const DeepCollectionEquality().hash(note) ^
      const DeepCollectionEquality().hash(notedBy) ^
      const DeepCollectionEquality().hash(notedByUser) ^
      const DeepCollectionEquality().hash(allowDeadline) ^
      const DeepCollectionEquality().hash(allowSeeAnswerAfterComplete) ^
      const DeepCollectionEquality().hash(countUser) ^
      runtimeType.hashCode;
}

extension $GroupExamUserResourceExtension on GroupExamUserResource {
  GroupExamUserResource copyWith(
      {int? id,
      int? userId,
      SimpleUserEntity? user,
      int? groupExamId,
      int? examId,
      String? examTitle,
      int? status,
      int? userExamResultId,
      UserExamResultPublicResource? userExamResult,
      DateTime? startDate,
      DateTime? endDate,
      DateTime? timeSubmitExam,
      bool? isSubmitLate,
      int? createdBy,
      DateTime? createDate,
      SimpleUserEntity? assignedBy,
      double? mark,
      String? note,
      int? notedBy,
      SimpleUserEntity? notedByUser,
      bool? allowDeadline,
      bool? allowSeeAnswerAfterComplete,
      int? countUser}) {
    return GroupExamUserResource(
        id: id ?? this.id,
        userId: userId ?? this.userId,
        user: user ?? this.user,
        groupExamId: groupExamId ?? this.groupExamId,
        examId: examId ?? this.examId,
        examTitle: examTitle ?? this.examTitle,
        status: status ?? this.status,
        userExamResultId: userExamResultId ?? this.userExamResultId,
        userExamResult: userExamResult ?? this.userExamResult,
        startDate: startDate ?? this.startDate,
        endDate: endDate ?? this.endDate,
        timeSubmitExam: timeSubmitExam ?? this.timeSubmitExam,
        isSubmitLate: isSubmitLate ?? this.isSubmitLate,
        createdBy: createdBy ?? this.createdBy,
        createDate: createDate ?? this.createDate,
        assignedBy: assignedBy ?? this.assignedBy,
        mark: mark ?? this.mark,
        note: note ?? this.note,
        notedBy: notedBy ?? this.notedBy,
        notedByUser: notedByUser ?? this.notedByUser,
        allowDeadline: allowDeadline ?? this.allowDeadline,
        allowSeeAnswerAfterComplete:
            allowSeeAnswerAfterComplete ?? this.allowSeeAnswerAfterComplete,
        countUser: countUser ?? this.countUser);
  }
}

@JsonSerializable(explicitToJson: true)
class GroupExamUserResourceFilterResult {
  GroupExamUserResourceFilterResult({
    this.totalRows,
    this.data,
  });

  factory GroupExamUserResourceFilterResult.fromJson(
          Map<String, dynamic> json) =>
      _$GroupExamUserResourceFilterResultFromJson(json);

  @JsonKey(name: 'totalRows', includeIfNull: true)
  final int? totalRows;
  @JsonKey(
      name: 'data',
      includeIfNull: true,
      defaultValue: <GroupExamUserResource>[])
  final List<GroupExamUserResource>? data;
  static const fromJsonFactory = _$GroupExamUserResourceFilterResultFromJson;
  static const toJsonFactory = _$GroupExamUserResourceFilterResultToJson;
  Map<String, dynamic> toJson() =>
      _$GroupExamUserResourceFilterResultToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is GroupExamUserResourceFilterResult &&
            (identical(other.totalRows, totalRows) ||
                const DeepCollectionEquality()
                    .equals(other.totalRows, totalRows)) &&
            (identical(other.data, data) ||
                const DeepCollectionEquality().equals(other.data, data)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(totalRows) ^
      const DeepCollectionEquality().hash(data) ^
      runtimeType.hashCode;
}

extension $GroupExamUserResourceFilterResultExtension
    on GroupExamUserResourceFilterResult {
  GroupExamUserResourceFilterResult copyWith(
      {int? totalRows, List<GroupExamUserResource>? data}) {
    return GroupExamUserResourceFilterResult(
        totalRows: totalRows ?? this.totalRows, data: data ?? this.data);
  }
}

@JsonSerializable(explicitToJson: true)
class GroupInfoEntity {
  GroupInfoEntity({
    this.id,
    this.createdBy,
    this.isManager,
    this.createdDate,
    this.name,
    this.description,
    this.avatar,
    this.coverImage,
    this.parentId,
    this.status,
    this.type,
    this.organizationId,
    this.blockIds,
    this.categoryId,
  });

  factory GroupInfoEntity.fromJson(Map<String, dynamic> json) =>
      _$GroupInfoEntityFromJson(json);

  @JsonKey(name: 'id', includeIfNull: true)
  final int? id;
  @JsonKey(name: 'createdBy', includeIfNull: true)
  final int? createdBy;
  @JsonKey(name: 'isManager', includeIfNull: true)
  final bool? isManager;
  @JsonKey(name: 'createdDate', includeIfNull: true)
  final DateTime? createdDate;
  @JsonKey(name: 'name', includeIfNull: true, defaultValue: '')
  final String? name;
  @JsonKey(name: 'description', includeIfNull: true, defaultValue: '')
  final String? description;
  @JsonKey(name: 'avatar', includeIfNull: true, defaultValue: '')
  final String? avatar;
  @JsonKey(name: 'coverImage', includeIfNull: true, defaultValue: '')
  final String? coverImage;
  @JsonKey(name: 'parentId', includeIfNull: true)
  final int? parentId;
  @JsonKey(name: 'status', includeIfNull: true)
  final int? status;
  @JsonKey(name: 'type', includeIfNull: true)
  final int? type;
  @JsonKey(name: 'organizationId', includeIfNull: true)
  final int? organizationId;
  @JsonKey(name: 'blockIds', includeIfNull: true, defaultValue: <int>[])
  final List<int>? blockIds;
  @JsonKey(name: 'categoryId', includeIfNull: true)
  final int? categoryId;
  static const fromJsonFactory = _$GroupInfoEntityFromJson;
  static const toJsonFactory = _$GroupInfoEntityToJson;
  Map<String, dynamic> toJson() => _$GroupInfoEntityToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is GroupInfoEntity &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.createdBy, createdBy) ||
                const DeepCollectionEquality()
                    .equals(other.createdBy, createdBy)) &&
            (identical(other.isManager, isManager) ||
                const DeepCollectionEquality()
                    .equals(other.isManager, isManager)) &&
            (identical(other.createdDate, createdDate) ||
                const DeepCollectionEquality()
                    .equals(other.createdDate, createdDate)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.description, description) ||
                const DeepCollectionEquality()
                    .equals(other.description, description)) &&
            (identical(other.avatar, avatar) ||
                const DeepCollectionEquality().equals(other.avatar, avatar)) &&
            (identical(other.coverImage, coverImage) ||
                const DeepCollectionEquality()
                    .equals(other.coverImage, coverImage)) &&
            (identical(other.parentId, parentId) ||
                const DeepCollectionEquality()
                    .equals(other.parentId, parentId)) &&
            (identical(other.status, status) ||
                const DeepCollectionEquality().equals(other.status, status)) &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)) &&
            (identical(other.organizationId, organizationId) ||
                const DeepCollectionEquality()
                    .equals(other.organizationId, organizationId)) &&
            (identical(other.blockIds, blockIds) ||
                const DeepCollectionEquality()
                    .equals(other.blockIds, blockIds)) &&
            (identical(other.categoryId, categoryId) ||
                const DeepCollectionEquality()
                    .equals(other.categoryId, categoryId)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(createdBy) ^
      const DeepCollectionEquality().hash(isManager) ^
      const DeepCollectionEquality().hash(createdDate) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(description) ^
      const DeepCollectionEquality().hash(avatar) ^
      const DeepCollectionEquality().hash(coverImage) ^
      const DeepCollectionEquality().hash(parentId) ^
      const DeepCollectionEquality().hash(status) ^
      const DeepCollectionEquality().hash(type) ^
      const DeepCollectionEquality().hash(organizationId) ^
      const DeepCollectionEquality().hash(blockIds) ^
      const DeepCollectionEquality().hash(categoryId) ^
      runtimeType.hashCode;
}

extension $GroupInfoEntityExtension on GroupInfoEntity {
  GroupInfoEntity copyWith(
      {int? id,
      int? createdBy,
      bool? isManager,
      DateTime? createdDate,
      String? name,
      String? description,
      String? avatar,
      String? coverImage,
      int? parentId,
      int? status,
      int? type,
      int? organizationId,
      List<int>? blockIds,
      int? categoryId}) {
    return GroupInfoEntity(
        id: id ?? this.id,
        createdBy: createdBy ?? this.createdBy,
        isManager: isManager ?? this.isManager,
        createdDate: createdDate ?? this.createdDate,
        name: name ?? this.name,
        description: description ?? this.description,
        avatar: avatar ?? this.avatar,
        coverImage: coverImage ?? this.coverImage,
        parentId: parentId ?? this.parentId,
        status: status ?? this.status,
        type: type ?? this.type,
        organizationId: organizationId ?? this.organizationId,
        blockIds: blockIds ?? this.blockIds,
        categoryId: categoryId ?? this.categoryId);
  }
}

@JsonSerializable(explicitToJson: true)
class GroupRoleResource {
  GroupRoleResource({
    this.id,
    this.code,
    this.name,
  });

  factory GroupRoleResource.fromJson(Map<String, dynamic> json) =>
      _$GroupRoleResourceFromJson(json);

  @JsonKey(name: 'id', includeIfNull: true)
  final int? id;
  @JsonKey(name: 'code', includeIfNull: true, defaultValue: '')
  final String? code;
  @JsonKey(name: 'name', includeIfNull: true, defaultValue: '')
  final String? name;
  static const fromJsonFactory = _$GroupRoleResourceFromJson;
  static const toJsonFactory = _$GroupRoleResourceToJson;
  Map<String, dynamic> toJson() => _$GroupRoleResourceToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is GroupRoleResource &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.code, code) ||
                const DeepCollectionEquality().equals(other.code, code)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(code) ^
      const DeepCollectionEquality().hash(name) ^
      runtimeType.hashCode;
}

extension $GroupRoleResourceExtension on GroupRoleResource {
  GroupRoleResource copyWith({int? id, String? code, String? name}) {
    return GroupRoleResource(
        id: id ?? this.id, code: code ?? this.code, name: name ?? this.name);
  }
}

@JsonSerializable(explicitToJson: true)
class GroupUserEntity {
  GroupUserEntity({
    this.id,
    this.username,
    this.firstName,
    this.lastName,
    this.fullName,
    this.avatar,
    this.isManager,
    this.joinDate,
    this.isVertify,
  });

  factory GroupUserEntity.fromJson(Map<String, dynamic> json) =>
      _$GroupUserEntityFromJson(json);

  @JsonKey(name: 'id', includeIfNull: true)
  final int? id;
  @JsonKey(name: 'username', includeIfNull: true, defaultValue: '')
  final String? username;
  @JsonKey(name: 'firstName', includeIfNull: true, defaultValue: '')
  final String? firstName;
  @JsonKey(name: 'lastName', includeIfNull: true, defaultValue: '')
  final String? lastName;
  @JsonKey(name: 'fullName', includeIfNull: true, defaultValue: '')
  final String? fullName;
  @JsonKey(name: 'avatar', includeIfNull: true, defaultValue: '')
  final String? avatar;
  @JsonKey(name: 'isManager', includeIfNull: true)
  final bool? isManager;
  @JsonKey(name: 'joinDate', includeIfNull: true)
  final DateTime? joinDate;
  @JsonKey(name: 'isVertify', includeIfNull: true)
  final bool? isVertify;
  static const fromJsonFactory = _$GroupUserEntityFromJson;
  static const toJsonFactory = _$GroupUserEntityToJson;
  Map<String, dynamic> toJson() => _$GroupUserEntityToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is GroupUserEntity &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.username, username) ||
                const DeepCollectionEquality()
                    .equals(other.username, username)) &&
            (identical(other.firstName, firstName) ||
                const DeepCollectionEquality()
                    .equals(other.firstName, firstName)) &&
            (identical(other.lastName, lastName) ||
                const DeepCollectionEquality()
                    .equals(other.lastName, lastName)) &&
            (identical(other.fullName, fullName) ||
                const DeepCollectionEquality()
                    .equals(other.fullName, fullName)) &&
            (identical(other.avatar, avatar) ||
                const DeepCollectionEquality().equals(other.avatar, avatar)) &&
            (identical(other.isManager, isManager) ||
                const DeepCollectionEquality()
                    .equals(other.isManager, isManager)) &&
            (identical(other.joinDate, joinDate) ||
                const DeepCollectionEquality()
                    .equals(other.joinDate, joinDate)) &&
            (identical(other.isVertify, isVertify) ||
                const DeepCollectionEquality()
                    .equals(other.isVertify, isVertify)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(username) ^
      const DeepCollectionEquality().hash(firstName) ^
      const DeepCollectionEquality().hash(lastName) ^
      const DeepCollectionEquality().hash(fullName) ^
      const DeepCollectionEquality().hash(avatar) ^
      const DeepCollectionEquality().hash(isManager) ^
      const DeepCollectionEquality().hash(joinDate) ^
      const DeepCollectionEquality().hash(isVertify) ^
      runtimeType.hashCode;
}

extension $GroupUserEntityExtension on GroupUserEntity {
  GroupUserEntity copyWith(
      {int? id,
      String? username,
      String? firstName,
      String? lastName,
      String? fullName,
      String? avatar,
      bool? isManager,
      DateTime? joinDate,
      bool? isVertify}) {
    return GroupUserEntity(
        id: id ?? this.id,
        username: username ?? this.username,
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        fullName: fullName ?? this.fullName,
        avatar: avatar ?? this.avatar,
        isManager: isManager ?? this.isManager,
        joinDate: joinDate ?? this.joinDate,
        isVertify: isVertify ?? this.isVertify);
  }
}

@JsonSerializable(explicitToJson: true)
class IActionResult {
  IActionResult();

  factory IActionResult.fromJson(Map<String, dynamic> json) =>
      _$IActionResultFromJson(json);

  static const fromJsonFactory = _$IActionResultFromJson;
  static const toJsonFactory = _$IActionResultToJson;
  Map<String, dynamic> toJson() => _$IActionResultToJson(this);

  @override
  int get hashCode => runtimeType.hashCode;
}

@JsonSerializable(explicitToJson: true)
class ICustomAttributeProvider {
  ICustomAttributeProvider();

  factory ICustomAttributeProvider.fromJson(Map<String, dynamic> json) =>
      _$ICustomAttributeProviderFromJson(json);

  static const fromJsonFactory = _$ICustomAttributeProviderFromJson;
  static const toJsonFactory = _$ICustomAttributeProviderToJson;
  Map<String, dynamic> toJson() => _$ICustomAttributeProviderToJson(this);

  @override
  int get hashCode => runtimeType.hashCode;
}

@JsonSerializable(explicitToJson: true)
class IndexCreate {
  IndexCreate({
    this.index,
    this.replica,
    this.shard,
    this.isReindex,
  });

  factory IndexCreate.fromJson(Map<String, dynamic> json) =>
      _$IndexCreateFromJson(json);

  @JsonKey(name: 'index', includeIfNull: true, defaultValue: '')
  final String? index;
  @JsonKey(name: 'replica', includeIfNull: true)
  final int? replica;
  @JsonKey(name: 'shard', includeIfNull: true)
  final int? shard;
  @JsonKey(name: 'isReindex', includeIfNull: true)
  final bool? isReindex;
  static const fromJsonFactory = _$IndexCreateFromJson;
  static const toJsonFactory = _$IndexCreateToJson;
  Map<String, dynamic> toJson() => _$IndexCreateToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is IndexCreate &&
            (identical(other.index, index) ||
                const DeepCollectionEquality().equals(other.index, index)) &&
            (identical(other.replica, replica) ||
                const DeepCollectionEquality()
                    .equals(other.replica, replica)) &&
            (identical(other.shard, shard) ||
                const DeepCollectionEquality().equals(other.shard, shard)) &&
            (identical(other.isReindex, isReindex) ||
                const DeepCollectionEquality()
                    .equals(other.isReindex, isReindex)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(index) ^
      const DeepCollectionEquality().hash(replica) ^
      const DeepCollectionEquality().hash(shard) ^
      const DeepCollectionEquality().hash(isReindex) ^
      runtimeType.hashCode;
}

extension $IndexCreateExtension on IndexCreate {
  IndexCreate copyWith(
      {String? index, int? replica, int? shard, bool? isReindex}) {
    return IndexCreate(
        index: index ?? this.index,
        replica: replica ?? this.replica,
        shard: shard ?? this.shard,
        isReindex: isReindex ?? this.isReindex);
  }
}

@JsonSerializable(explicitToJson: true)
class InfoExam {
  InfoExam({
    this.questions,
    this.displayType,
    this.totalMark,
    this.numberOfQuestion,
    this.path,
    this.type,
  });

  factory InfoExam.fromJson(Map<String, dynamic> json) =>
      _$InfoExamFromJson(json);

  @JsonKey(name: 'questions', includeIfNull: true, defaultValue: <Question>[])
  final List<Question>? questions;
  @JsonKey(name: 'displayType', includeIfNull: true)
  final int? displayType;
  @JsonKey(name: 'totalMark', includeIfNull: true)
  final double? totalMark;
  @JsonKey(name: 'numberOfQuestion', includeIfNull: true, defaultValue: '')
  final String? numberOfQuestion;
  @JsonKey(name: 'path', includeIfNull: true, defaultValue: '')
  final String? path;
  @JsonKey(name: 'type', includeIfNull: true)
  final int? type;
  static const fromJsonFactory = _$InfoExamFromJson;
  static const toJsonFactory = _$InfoExamToJson;
  Map<String, dynamic> toJson() => _$InfoExamToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is InfoExam &&
            (identical(other.questions, questions) ||
                const DeepCollectionEquality()
                    .equals(other.questions, questions)) &&
            (identical(other.displayType, displayType) ||
                const DeepCollectionEquality()
                    .equals(other.displayType, displayType)) &&
            (identical(other.totalMark, totalMark) ||
                const DeepCollectionEquality()
                    .equals(other.totalMark, totalMark)) &&
            (identical(other.numberOfQuestion, numberOfQuestion) ||
                const DeepCollectionEquality()
                    .equals(other.numberOfQuestion, numberOfQuestion)) &&
            (identical(other.path, path) ||
                const DeepCollectionEquality().equals(other.path, path)) &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(questions) ^
      const DeepCollectionEquality().hash(displayType) ^
      const DeepCollectionEquality().hash(totalMark) ^
      const DeepCollectionEquality().hash(numberOfQuestion) ^
      const DeepCollectionEquality().hash(path) ^
      const DeepCollectionEquality().hash(type) ^
      runtimeType.hashCode;
}

extension $InfoExamExtension on InfoExam {
  InfoExam copyWith(
      {List<Question>? questions,
      int? displayType,
      double? totalMark,
      String? numberOfQuestion,
      String? path,
      int? type}) {
    return InfoExam(
        questions: questions ?? this.questions,
        displayType: displayType ?? this.displayType,
        totalMark: totalMark ?? this.totalMark,
        numberOfQuestion: numberOfQuestion ?? this.numberOfQuestion,
        path: path ?? this.path,
        type: type ?? this.type);
  }
}

@JsonSerializable(explicitToJson: true)
class Int64SelectItem {
  Int64SelectItem({
    this.id,
    this.text,
    this.status,
  });

  factory Int64SelectItem.fromJson(Map<String, dynamic> json) =>
      _$Int64SelectItemFromJson(json);

  @JsonKey(name: 'id', includeIfNull: true)
  final int? id;
  @JsonKey(name: 'text', includeIfNull: true, defaultValue: '')
  final String? text;
  @JsonKey(name: 'status', includeIfNull: true)
  final int? status;
  static const fromJsonFactory = _$Int64SelectItemFromJson;
  static const toJsonFactory = _$Int64SelectItemToJson;
  Map<String, dynamic> toJson() => _$Int64SelectItemToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is Int64SelectItem &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.text, text) ||
                const DeepCollectionEquality().equals(other.text, text)) &&
            (identical(other.status, status) ||
                const DeepCollectionEquality().equals(other.status, status)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(text) ^
      const DeepCollectionEquality().hash(status) ^
      runtimeType.hashCode;
}

extension $Int64SelectItemExtension on Int64SelectItem {
  Int64SelectItem copyWith({int? id, String? text, int? status}) {
    return Int64SelectItem(
        id: id ?? this.id,
        text: text ?? this.text,
        status: status ?? this.status);
  }
}

@JsonSerializable(explicitToJson: true)
class Int64SelectObjectItem {
  Int64SelectObjectItem({
    this.id,
    this.text,
    this.key,
  });

  factory Int64SelectObjectItem.fromJson(Map<String, dynamic> json) =>
      _$Int64SelectObjectItemFromJson(json);

  @JsonKey(name: 'id', includeIfNull: true)
  final int? id;
  @JsonKey(name: 'text', includeIfNull: true, defaultValue: '')
  final String? text;
  @JsonKey(name: 'key', includeIfNull: true, defaultValue: '')
  final String? key;
  static const fromJsonFactory = _$Int64SelectObjectItemFromJson;
  static const toJsonFactory = _$Int64SelectObjectItemToJson;
  Map<String, dynamic> toJson() => _$Int64SelectObjectItemToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is Int64SelectObjectItem &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.text, text) ||
                const DeepCollectionEquality().equals(other.text, text)) &&
            (identical(other.key, key) ||
                const DeepCollectionEquality().equals(other.key, key)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(text) ^
      const DeepCollectionEquality().hash(key) ^
      runtimeType.hashCode;
}

extension $Int64SelectObjectItemExtension on Int64SelectObjectItem {
  Int64SelectObjectItem copyWith({int? id, String? text, String? key}) {
    return Int64SelectObjectItem(
        id: id ?? this.id, text: text ?? this.text, key: key ?? this.key);
  }
}

@JsonSerializable(explicitToJson: true)
class IntPtr {
  IntPtr();

  factory IntPtr.fromJson(Map<String, dynamic> json) => _$IntPtrFromJson(json);

  static const fromJsonFactory = _$IntPtrFromJson;
  static const toJsonFactory = _$IntPtrToJson;
  Map<String, dynamic> toJson() => _$IntPtrToJson(this);

  @override
  int get hashCode => runtimeType.hashCode;
}

@JsonSerializable(explicitToJson: true)
class MemberInExamPackageFilterResource {
  MemberInExamPackageFilterResource({
    this.sortExpression,
    this.pageSize,
    this.pageIndex,
    this.memberId,
    this.examPackageId,
    this.examPackageIds,
    this.startDate,
    this.endDate,
  });

  factory MemberInExamPackageFilterResource.fromJson(
          Map<String, dynamic> json) =>
      _$MemberInExamPackageFilterResourceFromJson(json);

  @JsonKey(name: 'sortExpression', includeIfNull: true, defaultValue: '')
  final String? sortExpression;
  @JsonKey(name: 'pageSize', includeIfNull: true)
  final int? pageSize;
  @JsonKey(name: 'pageIndex', includeIfNull: true)
  final int? pageIndex;
  @JsonKey(name: 'memberId', includeIfNull: true)
  final int? memberId;
  @JsonKey(name: 'examPackageId', includeIfNull: true)
  final int? examPackageId;
  @JsonKey(name: 'examPackageIds', includeIfNull: true, defaultValue: <int>[])
  final List<int>? examPackageIds;
  @JsonKey(name: 'startDate', includeIfNull: true)
  final DateTime? startDate;
  @JsonKey(name: 'endDate', includeIfNull: true)
  final DateTime? endDate;
  static const fromJsonFactory = _$MemberInExamPackageFilterResourceFromJson;
  static const toJsonFactory = _$MemberInExamPackageFilterResourceToJson;
  Map<String, dynamic> toJson() =>
      _$MemberInExamPackageFilterResourceToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is MemberInExamPackageFilterResource &&
            (identical(other.sortExpression, sortExpression) ||
                const DeepCollectionEquality()
                    .equals(other.sortExpression, sortExpression)) &&
            (identical(other.pageSize, pageSize) ||
                const DeepCollectionEquality()
                    .equals(other.pageSize, pageSize)) &&
            (identical(other.pageIndex, pageIndex) ||
                const DeepCollectionEquality()
                    .equals(other.pageIndex, pageIndex)) &&
            (identical(other.memberId, memberId) ||
                const DeepCollectionEquality()
                    .equals(other.memberId, memberId)) &&
            (identical(other.examPackageId, examPackageId) ||
                const DeepCollectionEquality()
                    .equals(other.examPackageId, examPackageId)) &&
            (identical(other.examPackageIds, examPackageIds) ||
                const DeepCollectionEquality()
                    .equals(other.examPackageIds, examPackageIds)) &&
            (identical(other.startDate, startDate) ||
                const DeepCollectionEquality()
                    .equals(other.startDate, startDate)) &&
            (identical(other.endDate, endDate) ||
                const DeepCollectionEquality().equals(other.endDate, endDate)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(sortExpression) ^
      const DeepCollectionEquality().hash(pageSize) ^
      const DeepCollectionEquality().hash(pageIndex) ^
      const DeepCollectionEquality().hash(memberId) ^
      const DeepCollectionEquality().hash(examPackageId) ^
      const DeepCollectionEquality().hash(examPackageIds) ^
      const DeepCollectionEquality().hash(startDate) ^
      const DeepCollectionEquality().hash(endDate) ^
      runtimeType.hashCode;
}

extension $MemberInExamPackageFilterResourceExtension
    on MemberInExamPackageFilterResource {
  MemberInExamPackageFilterResource copyWith(
      {String? sortExpression,
      int? pageSize,
      int? pageIndex,
      int? memberId,
      int? examPackageId,
      List<int>? examPackageIds,
      DateTime? startDate,
      DateTime? endDate}) {
    return MemberInExamPackageFilterResource(
        sortExpression: sortExpression ?? this.sortExpression,
        pageSize: pageSize ?? this.pageSize,
        pageIndex: pageIndex ?? this.pageIndex,
        memberId: memberId ?? this.memberId,
        examPackageId: examPackageId ?? this.examPackageId,
        examPackageIds: examPackageIds ?? this.examPackageIds,
        startDate: startDate ?? this.startDate,
        endDate: endDate ?? this.endDate);
  }
}

@JsonSerializable(explicitToJson: true)
class MemberInExamSetEntity {
  MemberInExamSetEntity({
    this.id,
    this.createdBy,
    this.createdDate,
    this.lastModifiedBy,
    this.lastModifiedDate,
    this.examSetId,
    this.memberId,
    this.joinDate,
    this.expiredDate,
    this.status,
  });

  factory MemberInExamSetEntity.fromJson(Map<String, dynamic> json) =>
      _$MemberInExamSetEntityFromJson(json);

  @JsonKey(name: 'id', includeIfNull: true)
  final int? id;
  @JsonKey(name: 'createdBy', includeIfNull: true)
  final int? createdBy;
  @JsonKey(name: 'createdDate', includeIfNull: true)
  final DateTime? createdDate;
  @JsonKey(name: 'lastModifiedBy', includeIfNull: true)
  final int? lastModifiedBy;
  @JsonKey(name: 'lastModifiedDate', includeIfNull: true)
  final DateTime? lastModifiedDate;
  @JsonKey(name: 'examSetId', includeIfNull: true)
  final int? examSetId;
  @JsonKey(name: 'memberId', includeIfNull: true)
  final int? memberId;
  @JsonKey(name: 'joinDate', includeIfNull: true)
  final DateTime? joinDate;
  @JsonKey(name: 'expiredDate', includeIfNull: true)
  final DateTime? expiredDate;
  @JsonKey(name: 'status', includeIfNull: true)
  final int? status;
  static const fromJsonFactory = _$MemberInExamSetEntityFromJson;
  static const toJsonFactory = _$MemberInExamSetEntityToJson;
  Map<String, dynamic> toJson() => _$MemberInExamSetEntityToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is MemberInExamSetEntity &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.createdBy, createdBy) ||
                const DeepCollectionEquality()
                    .equals(other.createdBy, createdBy)) &&
            (identical(other.createdDate, createdDate) ||
                const DeepCollectionEquality()
                    .equals(other.createdDate, createdDate)) &&
            (identical(other.lastModifiedBy, lastModifiedBy) ||
                const DeepCollectionEquality()
                    .equals(other.lastModifiedBy, lastModifiedBy)) &&
            (identical(other.lastModifiedDate, lastModifiedDate) ||
                const DeepCollectionEquality()
                    .equals(other.lastModifiedDate, lastModifiedDate)) &&
            (identical(other.examSetId, examSetId) ||
                const DeepCollectionEquality()
                    .equals(other.examSetId, examSetId)) &&
            (identical(other.memberId, memberId) ||
                const DeepCollectionEquality()
                    .equals(other.memberId, memberId)) &&
            (identical(other.joinDate, joinDate) ||
                const DeepCollectionEquality()
                    .equals(other.joinDate, joinDate)) &&
            (identical(other.expiredDate, expiredDate) ||
                const DeepCollectionEquality()
                    .equals(other.expiredDate, expiredDate)) &&
            (identical(other.status, status) ||
                const DeepCollectionEquality().equals(other.status, status)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(createdBy) ^
      const DeepCollectionEquality().hash(createdDate) ^
      const DeepCollectionEquality().hash(lastModifiedBy) ^
      const DeepCollectionEquality().hash(lastModifiedDate) ^
      const DeepCollectionEquality().hash(examSetId) ^
      const DeepCollectionEquality().hash(memberId) ^
      const DeepCollectionEquality().hash(joinDate) ^
      const DeepCollectionEquality().hash(expiredDate) ^
      const DeepCollectionEquality().hash(status) ^
      runtimeType.hashCode;
}

extension $MemberInExamSetEntityExtension on MemberInExamSetEntity {
  MemberInExamSetEntity copyWith(
      {int? id,
      int? createdBy,
      DateTime? createdDate,
      int? lastModifiedBy,
      DateTime? lastModifiedDate,
      int? examSetId,
      int? memberId,
      DateTime? joinDate,
      DateTime? expiredDate,
      int? status}) {
    return MemberInExamSetEntity(
        id: id ?? this.id,
        createdBy: createdBy ?? this.createdBy,
        createdDate: createdDate ?? this.createdDate,
        lastModifiedBy: lastModifiedBy ?? this.lastModifiedBy,
        lastModifiedDate: lastModifiedDate ?? this.lastModifiedDate,
        examSetId: examSetId ?? this.examSetId,
        memberId: memberId ?? this.memberId,
        joinDate: joinDate ?? this.joinDate,
        expiredDate: expiredDate ?? this.expiredDate,
        status: status ?? this.status);
  }
}

@JsonSerializable(explicitToJson: true)
class MemberInfo {
  MemberInfo({
    this.memberType,
    this.declaringType,
    this.reflectedType,
    this.name,
    this.module,
    this.customAttributes,
    this.isCollectible,
    this.metadataToken,
  });

  factory MemberInfo.fromJson(Map<String, dynamic> json) =>
      _$MemberInfoFromJson(json);

  @JsonKey(
      name: 'memberType',
      includeIfNull: true,
      toJson: memberTypesToJson,
      fromJson: memberTypesFromJson)
  final enums.MemberTypes? memberType;
  @JsonKey(name: 'declaringType', includeIfNull: true)
  final Type? declaringType;
  @JsonKey(name: 'reflectedType', includeIfNull: true)
  final Type? reflectedType;
  @JsonKey(name: 'name', includeIfNull: true, defaultValue: '')
  final String? name;
  @JsonKey(name: 'module', includeIfNull: true)
  final Module? module;
  @JsonKey(
      name: 'customAttributes',
      includeIfNull: true,
      defaultValue: <CustomAttributeData>[])
  final List<CustomAttributeData>? customAttributes;
  @JsonKey(name: 'isCollectible', includeIfNull: true)
  final bool? isCollectible;
  @JsonKey(name: 'metadataToken', includeIfNull: true)
  final int? metadataToken;
  static const fromJsonFactory = _$MemberInfoFromJson;
  static const toJsonFactory = _$MemberInfoToJson;
  Map<String, dynamic> toJson() => _$MemberInfoToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is MemberInfo &&
            (identical(other.memberType, memberType) ||
                const DeepCollectionEquality()
                    .equals(other.memberType, memberType)) &&
            (identical(other.declaringType, declaringType) ||
                const DeepCollectionEquality()
                    .equals(other.declaringType, declaringType)) &&
            (identical(other.reflectedType, reflectedType) ||
                const DeepCollectionEquality()
                    .equals(other.reflectedType, reflectedType)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.module, module) ||
                const DeepCollectionEquality().equals(other.module, module)) &&
            (identical(other.customAttributes, customAttributes) ||
                const DeepCollectionEquality()
                    .equals(other.customAttributes, customAttributes)) &&
            (identical(other.isCollectible, isCollectible) ||
                const DeepCollectionEquality()
                    .equals(other.isCollectible, isCollectible)) &&
            (identical(other.metadataToken, metadataToken) ||
                const DeepCollectionEquality()
                    .equals(other.metadataToken, metadataToken)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(memberType) ^
      const DeepCollectionEquality().hash(declaringType) ^
      const DeepCollectionEquality().hash(reflectedType) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(module) ^
      const DeepCollectionEquality().hash(customAttributes) ^
      const DeepCollectionEquality().hash(isCollectible) ^
      const DeepCollectionEquality().hash(metadataToken) ^
      runtimeType.hashCode;
}

extension $MemberInfoExtension on MemberInfo {
  MemberInfo copyWith(
      {enums.MemberTypes? memberType,
      Type? declaringType,
      Type? reflectedType,
      String? name,
      Module? module,
      List<CustomAttributeData>? customAttributes,
      bool? isCollectible,
      int? metadataToken}) {
    return MemberInfo(
        memberType: memberType ?? this.memberType,
        declaringType: declaringType ?? this.declaringType,
        reflectedType: reflectedType ?? this.reflectedType,
        name: name ?? this.name,
        module: module ?? this.module,
        customAttributes: customAttributes ?? this.customAttributes,
        isCollectible: isCollectible ?? this.isCollectible,
        metadataToken: metadataToken ?? this.metadataToken);
  }
}

@JsonSerializable(explicitToJson: true)
class MethodBase {
  MethodBase({
    this.memberType,
    this.name,
    this.declaringType,
    this.reflectedType,
    this.module,
    this.customAttributes,
    this.isCollectible,
    this.metadataToken,
    this.attributes,
    this.methodImplementationFlags,
    this.callingConvention,
    this.isAbstract,
    this.isConstructor,
    this.isFinal,
    this.isHideBySig,
    this.isSpecialName,
    this.isStatic,
    this.isVirtual,
    this.isAssembly,
    this.isFamily,
    this.isFamilyAndAssembly,
    this.isFamilyOrAssembly,
    this.isPrivate,
    this.isPublic,
    this.isConstructedGenericMethod,
    this.isGenericMethod,
    this.isGenericMethodDefinition,
    this.containsGenericParameters,
    this.methodHandle,
    this.isSecurityCritical,
    this.isSecuritySafeCritical,
    this.isSecurityTransparent,
  });

  factory MethodBase.fromJson(Map<String, dynamic> json) =>
      _$MethodBaseFromJson(json);

  @JsonKey(
      name: 'memberType',
      includeIfNull: true,
      toJson: memberTypesToJson,
      fromJson: memberTypesFromJson)
  final enums.MemberTypes? memberType;
  @JsonKey(name: 'name', includeIfNull: true, defaultValue: '')
  final String? name;
  @JsonKey(name: 'declaringType', includeIfNull: true)
  final Type? declaringType;
  @JsonKey(name: 'reflectedType', includeIfNull: true)
  final Type? reflectedType;
  @JsonKey(name: 'module', includeIfNull: true)
  final Module? module;
  @JsonKey(
      name: 'customAttributes',
      includeIfNull: true,
      defaultValue: <CustomAttributeData>[])
  final List<CustomAttributeData>? customAttributes;
  @JsonKey(name: 'isCollectible', includeIfNull: true)
  final bool? isCollectible;
  @JsonKey(name: 'metadataToken', includeIfNull: true)
  final int? metadataToken;
  @JsonKey(
      name: 'attributes',
      includeIfNull: true,
      toJson: methodAttributesToJson,
      fromJson: methodAttributesFromJson)
  final enums.MethodAttributes? attributes;
  @JsonKey(
      name: 'methodImplementationFlags',
      includeIfNull: true,
      toJson: methodImplAttributesToJson,
      fromJson: methodImplAttributesFromJson)
  final enums.MethodImplAttributes? methodImplementationFlags;
  @JsonKey(
      name: 'callingConvention',
      includeIfNull: true,
      toJson: callingConventionsToJson,
      fromJson: callingConventionsFromJson)
  final enums.CallingConventions? callingConvention;
  @JsonKey(name: 'isAbstract', includeIfNull: true)
  final bool? isAbstract;
  @JsonKey(name: 'isConstructor', includeIfNull: true)
  final bool? isConstructor;
  @JsonKey(name: 'isFinal', includeIfNull: true)
  final bool? isFinal;
  @JsonKey(name: 'isHideBySig', includeIfNull: true)
  final bool? isHideBySig;
  @JsonKey(name: 'isSpecialName', includeIfNull: true)
  final bool? isSpecialName;
  @JsonKey(name: 'isStatic', includeIfNull: true)
  final bool? isStatic;
  @JsonKey(name: 'isVirtual', includeIfNull: true)
  final bool? isVirtual;
  @JsonKey(name: 'isAssembly', includeIfNull: true)
  final bool? isAssembly;
  @JsonKey(name: 'isFamily', includeIfNull: true)
  final bool? isFamily;
  @JsonKey(name: 'isFamilyAndAssembly', includeIfNull: true)
  final bool? isFamilyAndAssembly;
  @JsonKey(name: 'isFamilyOrAssembly', includeIfNull: true)
  final bool? isFamilyOrAssembly;
  @JsonKey(name: 'isPrivate', includeIfNull: true)
  final bool? isPrivate;
  @JsonKey(name: 'isPublic', includeIfNull: true)
  final bool? isPublic;
  @JsonKey(name: 'isConstructedGenericMethod', includeIfNull: true)
  final bool? isConstructedGenericMethod;
  @JsonKey(name: 'isGenericMethod', includeIfNull: true)
  final bool? isGenericMethod;
  @JsonKey(name: 'isGenericMethodDefinition', includeIfNull: true)
  final bool? isGenericMethodDefinition;
  @JsonKey(name: 'containsGenericParameters', includeIfNull: true)
  final bool? containsGenericParameters;
  @JsonKey(name: 'methodHandle', includeIfNull: true)
  final RuntimeMethodHandle? methodHandle;
  @JsonKey(name: 'isSecurityCritical', includeIfNull: true)
  final bool? isSecurityCritical;
  @JsonKey(name: 'isSecuritySafeCritical', includeIfNull: true)
  final bool? isSecuritySafeCritical;
  @JsonKey(name: 'isSecurityTransparent', includeIfNull: true)
  final bool? isSecurityTransparent;
  static const fromJsonFactory = _$MethodBaseFromJson;
  static const toJsonFactory = _$MethodBaseToJson;
  Map<String, dynamic> toJson() => _$MethodBaseToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is MethodBase &&
            (identical(other.memberType, memberType) ||
                const DeepCollectionEquality()
                    .equals(other.memberType, memberType)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.declaringType, declaringType) ||
                const DeepCollectionEquality()
                    .equals(other.declaringType, declaringType)) &&
            (identical(other.reflectedType, reflectedType) ||
                const DeepCollectionEquality()
                    .equals(other.reflectedType, reflectedType)) &&
            (identical(other.module, module) ||
                const DeepCollectionEquality().equals(other.module, module)) &&
            (identical(other.customAttributes, customAttributes) ||
                const DeepCollectionEquality()
                    .equals(other.customAttributes, customAttributes)) &&
            (identical(other.isCollectible, isCollectible) ||
                const DeepCollectionEquality()
                    .equals(other.isCollectible, isCollectible)) &&
            (identical(other.metadataToken, metadataToken) ||
                const DeepCollectionEquality()
                    .equals(other.metadataToken, metadataToken)) &&
            (identical(other.attributes, attributes) ||
                const DeepCollectionEquality()
                    .equals(other.attributes, attributes)) &&
            (identical(other.methodImplementationFlags, methodImplementationFlags) ||
                const DeepCollectionEquality().equals(
                    other.methodImplementationFlags,
                    methodImplementationFlags)) &&
            (identical(other.callingConvention, callingConvention) ||
                const DeepCollectionEquality()
                    .equals(other.callingConvention, callingConvention)) &&
            (identical(other.isAbstract, isAbstract) ||
                const DeepCollectionEquality()
                    .equals(other.isAbstract, isAbstract)) &&
            (identical(other.isConstructor, isConstructor) ||
                const DeepCollectionEquality()
                    .equals(other.isConstructor, isConstructor)) &&
            (identical(other.isFinal, isFinal) ||
                const DeepCollectionEquality()
                    .equals(other.isFinal, isFinal)) &&
            (identical(other.isHideBySig, isHideBySig) ||
                const DeepCollectionEquality()
                    .equals(other.isHideBySig, isHideBySig)) &&
            (identical(other.isSpecialName, isSpecialName) ||
                const DeepCollectionEquality()
                    .equals(other.isSpecialName, isSpecialName)) &&
            (identical(other.isStatic, isStatic) ||
                const DeepCollectionEquality()
                    .equals(other.isStatic, isStatic)) &&
            (identical(other.isVirtual, isVirtual) ||
                const DeepCollectionEquality()
                    .equals(other.isVirtual, isVirtual)) &&
            (identical(other.isAssembly, isAssembly) ||
                const DeepCollectionEquality()
                    .equals(other.isAssembly, isAssembly)) &&
            (identical(other.isFamily, isFamily) ||
                const DeepCollectionEquality().equals(other.isFamily, isFamily)) &&
            (identical(other.isFamilyAndAssembly, isFamilyAndAssembly) || const DeepCollectionEquality().equals(other.isFamilyAndAssembly, isFamilyAndAssembly)) &&
            (identical(other.isFamilyOrAssembly, isFamilyOrAssembly) || const DeepCollectionEquality().equals(other.isFamilyOrAssembly, isFamilyOrAssembly)) &&
            (identical(other.isPrivate, isPrivate) || const DeepCollectionEquality().equals(other.isPrivate, isPrivate)) &&
            (identical(other.isPublic, isPublic) || const DeepCollectionEquality().equals(other.isPublic, isPublic)) &&
            (identical(other.isConstructedGenericMethod, isConstructedGenericMethod) || const DeepCollectionEquality().equals(other.isConstructedGenericMethod, isConstructedGenericMethod)) &&
            (identical(other.isGenericMethod, isGenericMethod) || const DeepCollectionEquality().equals(other.isGenericMethod, isGenericMethod)) &&
            (identical(other.isGenericMethodDefinition, isGenericMethodDefinition) || const DeepCollectionEquality().equals(other.isGenericMethodDefinition, isGenericMethodDefinition)) &&
            (identical(other.containsGenericParameters, containsGenericParameters) || const DeepCollectionEquality().equals(other.containsGenericParameters, containsGenericParameters)) &&
            (identical(other.methodHandle, methodHandle) || const DeepCollectionEquality().equals(other.methodHandle, methodHandle)) &&
            (identical(other.isSecurityCritical, isSecurityCritical) || const DeepCollectionEquality().equals(other.isSecurityCritical, isSecurityCritical)) &&
            (identical(other.isSecuritySafeCritical, isSecuritySafeCritical) || const DeepCollectionEquality().equals(other.isSecuritySafeCritical, isSecuritySafeCritical)) &&
            (identical(other.isSecurityTransparent, isSecurityTransparent) || const DeepCollectionEquality().equals(other.isSecurityTransparent, isSecurityTransparent)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(memberType) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(declaringType) ^
      const DeepCollectionEquality().hash(reflectedType) ^
      const DeepCollectionEquality().hash(module) ^
      const DeepCollectionEquality().hash(customAttributes) ^
      const DeepCollectionEquality().hash(isCollectible) ^
      const DeepCollectionEquality().hash(metadataToken) ^
      const DeepCollectionEquality().hash(attributes) ^
      const DeepCollectionEquality().hash(methodImplementationFlags) ^
      const DeepCollectionEquality().hash(callingConvention) ^
      const DeepCollectionEquality().hash(isAbstract) ^
      const DeepCollectionEquality().hash(isConstructor) ^
      const DeepCollectionEquality().hash(isFinal) ^
      const DeepCollectionEquality().hash(isHideBySig) ^
      const DeepCollectionEquality().hash(isSpecialName) ^
      const DeepCollectionEquality().hash(isStatic) ^
      const DeepCollectionEquality().hash(isVirtual) ^
      const DeepCollectionEquality().hash(isAssembly) ^
      const DeepCollectionEquality().hash(isFamily) ^
      const DeepCollectionEquality().hash(isFamilyAndAssembly) ^
      const DeepCollectionEquality().hash(isFamilyOrAssembly) ^
      const DeepCollectionEquality().hash(isPrivate) ^
      const DeepCollectionEquality().hash(isPublic) ^
      const DeepCollectionEquality().hash(isConstructedGenericMethod) ^
      const DeepCollectionEquality().hash(isGenericMethod) ^
      const DeepCollectionEquality().hash(isGenericMethodDefinition) ^
      const DeepCollectionEquality().hash(containsGenericParameters) ^
      const DeepCollectionEquality().hash(methodHandle) ^
      const DeepCollectionEquality().hash(isSecurityCritical) ^
      const DeepCollectionEquality().hash(isSecuritySafeCritical) ^
      const DeepCollectionEquality().hash(isSecurityTransparent) ^
      runtimeType.hashCode;
}

extension $MethodBaseExtension on MethodBase {
  MethodBase copyWith(
      {enums.MemberTypes? memberType,
      String? name,
      Type? declaringType,
      Type? reflectedType,
      Module? module,
      List<CustomAttributeData>? customAttributes,
      bool? isCollectible,
      int? metadataToken,
      enums.MethodAttributes? attributes,
      enums.MethodImplAttributes? methodImplementationFlags,
      enums.CallingConventions? callingConvention,
      bool? isAbstract,
      bool? isConstructor,
      bool? isFinal,
      bool? isHideBySig,
      bool? isSpecialName,
      bool? isStatic,
      bool? isVirtual,
      bool? isAssembly,
      bool? isFamily,
      bool? isFamilyAndAssembly,
      bool? isFamilyOrAssembly,
      bool? isPrivate,
      bool? isPublic,
      bool? isConstructedGenericMethod,
      bool? isGenericMethod,
      bool? isGenericMethodDefinition,
      bool? containsGenericParameters,
      RuntimeMethodHandle? methodHandle,
      bool? isSecurityCritical,
      bool? isSecuritySafeCritical,
      bool? isSecurityTransparent}) {
    return MethodBase(
        memberType: memberType ?? this.memberType,
        name: name ?? this.name,
        declaringType: declaringType ?? this.declaringType,
        reflectedType: reflectedType ?? this.reflectedType,
        module: module ?? this.module,
        customAttributes: customAttributes ?? this.customAttributes,
        isCollectible: isCollectible ?? this.isCollectible,
        metadataToken: metadataToken ?? this.metadataToken,
        attributes: attributes ?? this.attributes,
        methodImplementationFlags:
            methodImplementationFlags ?? this.methodImplementationFlags,
        callingConvention: callingConvention ?? this.callingConvention,
        isAbstract: isAbstract ?? this.isAbstract,
        isConstructor: isConstructor ?? this.isConstructor,
        isFinal: isFinal ?? this.isFinal,
        isHideBySig: isHideBySig ?? this.isHideBySig,
        isSpecialName: isSpecialName ?? this.isSpecialName,
        isStatic: isStatic ?? this.isStatic,
        isVirtual: isVirtual ?? this.isVirtual,
        isAssembly: isAssembly ?? this.isAssembly,
        isFamily: isFamily ?? this.isFamily,
        isFamilyAndAssembly: isFamilyAndAssembly ?? this.isFamilyAndAssembly,
        isFamilyOrAssembly: isFamilyOrAssembly ?? this.isFamilyOrAssembly,
        isPrivate: isPrivate ?? this.isPrivate,
        isPublic: isPublic ?? this.isPublic,
        isConstructedGenericMethod:
            isConstructedGenericMethod ?? this.isConstructedGenericMethod,
        isGenericMethod: isGenericMethod ?? this.isGenericMethod,
        isGenericMethodDefinition:
            isGenericMethodDefinition ?? this.isGenericMethodDefinition,
        containsGenericParameters:
            containsGenericParameters ?? this.containsGenericParameters,
        methodHandle: methodHandle ?? this.methodHandle,
        isSecurityCritical: isSecurityCritical ?? this.isSecurityCritical,
        isSecuritySafeCritical:
            isSecuritySafeCritical ?? this.isSecuritySafeCritical,
        isSecurityTransparent:
            isSecurityTransparent ?? this.isSecurityTransparent);
  }
}

@JsonSerializable(explicitToJson: true)
class MethodInfo {
  MethodInfo({
    this.name,
    this.declaringType,
    this.reflectedType,
    this.module,
    this.customAttributes,
    this.isCollectible,
    this.metadataToken,
    this.attributes,
    this.methodImplementationFlags,
    this.callingConvention,
    this.isAbstract,
    this.isConstructor,
    this.isFinal,
    this.isHideBySig,
    this.isSpecialName,
    this.isStatic,
    this.isVirtual,
    this.isAssembly,
    this.isFamily,
    this.isFamilyAndAssembly,
    this.isFamilyOrAssembly,
    this.isPrivate,
    this.isPublic,
    this.isConstructedGenericMethod,
    this.isGenericMethod,
    this.isGenericMethodDefinition,
    this.containsGenericParameters,
    this.methodHandle,
    this.isSecurityCritical,
    this.isSecuritySafeCritical,
    this.isSecurityTransparent,
    this.memberType,
    this.returnParameter,
    this.returnType,
    this.returnTypeCustomAttributes,
  });

  factory MethodInfo.fromJson(Map<String, dynamic> json) =>
      _$MethodInfoFromJson(json);

  @JsonKey(name: 'name', includeIfNull: true, defaultValue: '')
  final String? name;
  @JsonKey(name: 'declaringType', includeIfNull: true)
  final Type? declaringType;
  @JsonKey(name: 'reflectedType', includeIfNull: true)
  final Type? reflectedType;
  @JsonKey(name: 'module', includeIfNull: true)
  final Module? module;
  @JsonKey(
      name: 'customAttributes',
      includeIfNull: true,
      defaultValue: <CustomAttributeData>[])
  final List<CustomAttributeData>? customAttributes;
  @JsonKey(name: 'isCollectible', includeIfNull: true)
  final bool? isCollectible;
  @JsonKey(name: 'metadataToken', includeIfNull: true)
  final int? metadataToken;
  @JsonKey(
      name: 'attributes',
      includeIfNull: true,
      toJson: methodAttributesToJson,
      fromJson: methodAttributesFromJson)
  final enums.MethodAttributes? attributes;
  @JsonKey(
      name: 'methodImplementationFlags',
      includeIfNull: true,
      toJson: methodImplAttributesToJson,
      fromJson: methodImplAttributesFromJson)
  final enums.MethodImplAttributes? methodImplementationFlags;
  @JsonKey(
      name: 'callingConvention',
      includeIfNull: true,
      toJson: callingConventionsToJson,
      fromJson: callingConventionsFromJson)
  final enums.CallingConventions? callingConvention;
  @JsonKey(name: 'isAbstract', includeIfNull: true)
  final bool? isAbstract;
  @JsonKey(name: 'isConstructor', includeIfNull: true)
  final bool? isConstructor;
  @JsonKey(name: 'isFinal', includeIfNull: true)
  final bool? isFinal;
  @JsonKey(name: 'isHideBySig', includeIfNull: true)
  final bool? isHideBySig;
  @JsonKey(name: 'isSpecialName', includeIfNull: true)
  final bool? isSpecialName;
  @JsonKey(name: 'isStatic', includeIfNull: true)
  final bool? isStatic;
  @JsonKey(name: 'isVirtual', includeIfNull: true)
  final bool? isVirtual;
  @JsonKey(name: 'isAssembly', includeIfNull: true)
  final bool? isAssembly;
  @JsonKey(name: 'isFamily', includeIfNull: true)
  final bool? isFamily;
  @JsonKey(name: 'isFamilyAndAssembly', includeIfNull: true)
  final bool? isFamilyAndAssembly;
  @JsonKey(name: 'isFamilyOrAssembly', includeIfNull: true)
  final bool? isFamilyOrAssembly;
  @JsonKey(name: 'isPrivate', includeIfNull: true)
  final bool? isPrivate;
  @JsonKey(name: 'isPublic', includeIfNull: true)
  final bool? isPublic;
  @JsonKey(name: 'isConstructedGenericMethod', includeIfNull: true)
  final bool? isConstructedGenericMethod;
  @JsonKey(name: 'isGenericMethod', includeIfNull: true)
  final bool? isGenericMethod;
  @JsonKey(name: 'isGenericMethodDefinition', includeIfNull: true)
  final bool? isGenericMethodDefinition;
  @JsonKey(name: 'containsGenericParameters', includeIfNull: true)
  final bool? containsGenericParameters;
  @JsonKey(name: 'methodHandle', includeIfNull: true)
  final RuntimeMethodHandle? methodHandle;
  @JsonKey(name: 'isSecurityCritical', includeIfNull: true)
  final bool? isSecurityCritical;
  @JsonKey(name: 'isSecuritySafeCritical', includeIfNull: true)
  final bool? isSecuritySafeCritical;
  @JsonKey(name: 'isSecurityTransparent', includeIfNull: true)
  final bool? isSecurityTransparent;
  @JsonKey(
      name: 'memberType',
      includeIfNull: true,
      toJson: memberTypesToJson,
      fromJson: memberTypesFromJson)
  final enums.MemberTypes? memberType;
  @JsonKey(name: 'returnParameter', includeIfNull: true)
  final ParameterInfo? returnParameter;
  @JsonKey(name: 'returnType', includeIfNull: true)
  final Type? returnType;
  @JsonKey(name: 'returnTypeCustomAttributes', includeIfNull: true)
  final ICustomAttributeProvider? returnTypeCustomAttributes;
  static const fromJsonFactory = _$MethodInfoFromJson;
  static const toJsonFactory = _$MethodInfoToJson;
  Map<String, dynamic> toJson() => _$MethodInfoToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is MethodInfo &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.declaringType, declaringType) ||
                const DeepCollectionEquality()
                    .equals(other.declaringType, declaringType)) &&
            (identical(other.reflectedType, reflectedType) ||
                const DeepCollectionEquality()
                    .equals(other.reflectedType, reflectedType)) &&
            (identical(other.module, module) ||
                const DeepCollectionEquality().equals(other.module, module)) &&
            (identical(other.customAttributes, customAttributes) ||
                const DeepCollectionEquality()
                    .equals(other.customAttributes, customAttributes)) &&
            (identical(other.isCollectible, isCollectible) ||
                const DeepCollectionEquality()
                    .equals(other.isCollectible, isCollectible)) &&
            (identical(other.metadataToken, metadataToken) ||
                const DeepCollectionEquality()
                    .equals(other.metadataToken, metadataToken)) &&
            (identical(other.attributes, attributes) ||
                const DeepCollectionEquality()
                    .equals(other.attributes, attributes)) &&
            (identical(other.methodImplementationFlags, methodImplementationFlags) ||
                const DeepCollectionEquality().equals(
                    other.methodImplementationFlags,
                    methodImplementationFlags)) &&
            (identical(other.callingConvention, callingConvention) ||
                const DeepCollectionEquality()
                    .equals(other.callingConvention, callingConvention)) &&
            (identical(other.isAbstract, isAbstract) ||
                const DeepCollectionEquality()
                    .equals(other.isAbstract, isAbstract)) &&
            (identical(other.isConstructor, isConstructor) ||
                const DeepCollectionEquality()
                    .equals(other.isConstructor, isConstructor)) &&
            (identical(other.isFinal, isFinal) ||
                const DeepCollectionEquality()
                    .equals(other.isFinal, isFinal)) &&
            (identical(other.isHideBySig, isHideBySig) ||
                const DeepCollectionEquality()
                    .equals(other.isHideBySig, isHideBySig)) &&
            (identical(other.isSpecialName, isSpecialName) ||
                const DeepCollectionEquality()
                    .equals(other.isSpecialName, isSpecialName)) &&
            (identical(other.isStatic, isStatic) ||
                const DeepCollectionEquality()
                    .equals(other.isStatic, isStatic)) &&
            (identical(other.isVirtual, isVirtual) ||
                const DeepCollectionEquality()
                    .equals(other.isVirtual, isVirtual)) &&
            (identical(other.isAssembly, isAssembly) ||
                const DeepCollectionEquality()
                    .equals(other.isAssembly, isAssembly)) &&
            (identical(other.isFamily, isFamily) ||
                const DeepCollectionEquality()
                    .equals(other.isFamily, isFamily)) &&
            (identical(other.isFamilyAndAssembly, isFamilyAndAssembly) || const DeepCollectionEquality().equals(other.isFamilyAndAssembly, isFamilyAndAssembly)) &&
            (identical(other.isFamilyOrAssembly, isFamilyOrAssembly) || const DeepCollectionEquality().equals(other.isFamilyOrAssembly, isFamilyOrAssembly)) &&
            (identical(other.isPrivate, isPrivate) || const DeepCollectionEquality().equals(other.isPrivate, isPrivate)) &&
            (identical(other.isPublic, isPublic) || const DeepCollectionEquality().equals(other.isPublic, isPublic)) &&
            (identical(other.isConstructedGenericMethod, isConstructedGenericMethod) || const DeepCollectionEquality().equals(other.isConstructedGenericMethod, isConstructedGenericMethod)) &&
            (identical(other.isGenericMethod, isGenericMethod) || const DeepCollectionEquality().equals(other.isGenericMethod, isGenericMethod)) &&
            (identical(other.isGenericMethodDefinition, isGenericMethodDefinition) || const DeepCollectionEquality().equals(other.isGenericMethodDefinition, isGenericMethodDefinition)) &&
            (identical(other.containsGenericParameters, containsGenericParameters) || const DeepCollectionEquality().equals(other.containsGenericParameters, containsGenericParameters)) &&
            (identical(other.methodHandle, methodHandle) || const DeepCollectionEquality().equals(other.methodHandle, methodHandle)) &&
            (identical(other.isSecurityCritical, isSecurityCritical) || const DeepCollectionEquality().equals(other.isSecurityCritical, isSecurityCritical)) &&
            (identical(other.isSecuritySafeCritical, isSecuritySafeCritical) || const DeepCollectionEquality().equals(other.isSecuritySafeCritical, isSecuritySafeCritical)) &&
            (identical(other.isSecurityTransparent, isSecurityTransparent) || const DeepCollectionEquality().equals(other.isSecurityTransparent, isSecurityTransparent)) &&
            (identical(other.memberType, memberType) || const DeepCollectionEquality().equals(other.memberType, memberType)) &&
            (identical(other.returnParameter, returnParameter) || const DeepCollectionEquality().equals(other.returnParameter, returnParameter)) &&
            (identical(other.returnType, returnType) || const DeepCollectionEquality().equals(other.returnType, returnType)) &&
            (identical(other.returnTypeCustomAttributes, returnTypeCustomAttributes) || const DeepCollectionEquality().equals(other.returnTypeCustomAttributes, returnTypeCustomAttributes)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(declaringType) ^
      const DeepCollectionEquality().hash(reflectedType) ^
      const DeepCollectionEquality().hash(module) ^
      const DeepCollectionEquality().hash(customAttributes) ^
      const DeepCollectionEquality().hash(isCollectible) ^
      const DeepCollectionEquality().hash(metadataToken) ^
      const DeepCollectionEquality().hash(attributes) ^
      const DeepCollectionEquality().hash(methodImplementationFlags) ^
      const DeepCollectionEquality().hash(callingConvention) ^
      const DeepCollectionEquality().hash(isAbstract) ^
      const DeepCollectionEquality().hash(isConstructor) ^
      const DeepCollectionEquality().hash(isFinal) ^
      const DeepCollectionEquality().hash(isHideBySig) ^
      const DeepCollectionEquality().hash(isSpecialName) ^
      const DeepCollectionEquality().hash(isStatic) ^
      const DeepCollectionEquality().hash(isVirtual) ^
      const DeepCollectionEquality().hash(isAssembly) ^
      const DeepCollectionEquality().hash(isFamily) ^
      const DeepCollectionEquality().hash(isFamilyAndAssembly) ^
      const DeepCollectionEquality().hash(isFamilyOrAssembly) ^
      const DeepCollectionEquality().hash(isPrivate) ^
      const DeepCollectionEquality().hash(isPublic) ^
      const DeepCollectionEquality().hash(isConstructedGenericMethod) ^
      const DeepCollectionEquality().hash(isGenericMethod) ^
      const DeepCollectionEquality().hash(isGenericMethodDefinition) ^
      const DeepCollectionEquality().hash(containsGenericParameters) ^
      const DeepCollectionEquality().hash(methodHandle) ^
      const DeepCollectionEquality().hash(isSecurityCritical) ^
      const DeepCollectionEquality().hash(isSecuritySafeCritical) ^
      const DeepCollectionEquality().hash(isSecurityTransparent) ^
      const DeepCollectionEquality().hash(memberType) ^
      const DeepCollectionEquality().hash(returnParameter) ^
      const DeepCollectionEquality().hash(returnType) ^
      const DeepCollectionEquality().hash(returnTypeCustomAttributes) ^
      runtimeType.hashCode;
}

extension $MethodInfoExtension on MethodInfo {
  MethodInfo copyWith(
      {String? name,
      Type? declaringType,
      Type? reflectedType,
      Module? module,
      List<CustomAttributeData>? customAttributes,
      bool? isCollectible,
      int? metadataToken,
      enums.MethodAttributes? attributes,
      enums.MethodImplAttributes? methodImplementationFlags,
      enums.CallingConventions? callingConvention,
      bool? isAbstract,
      bool? isConstructor,
      bool? isFinal,
      bool? isHideBySig,
      bool? isSpecialName,
      bool? isStatic,
      bool? isVirtual,
      bool? isAssembly,
      bool? isFamily,
      bool? isFamilyAndAssembly,
      bool? isFamilyOrAssembly,
      bool? isPrivate,
      bool? isPublic,
      bool? isConstructedGenericMethod,
      bool? isGenericMethod,
      bool? isGenericMethodDefinition,
      bool? containsGenericParameters,
      RuntimeMethodHandle? methodHandle,
      bool? isSecurityCritical,
      bool? isSecuritySafeCritical,
      bool? isSecurityTransparent,
      enums.MemberTypes? memberType,
      ParameterInfo? returnParameter,
      Type? returnType,
      ICustomAttributeProvider? returnTypeCustomAttributes}) {
    return MethodInfo(
        name: name ?? this.name,
        declaringType: declaringType ?? this.declaringType,
        reflectedType: reflectedType ?? this.reflectedType,
        module: module ?? this.module,
        customAttributes: customAttributes ?? this.customAttributes,
        isCollectible: isCollectible ?? this.isCollectible,
        metadataToken: metadataToken ?? this.metadataToken,
        attributes: attributes ?? this.attributes,
        methodImplementationFlags:
            methodImplementationFlags ?? this.methodImplementationFlags,
        callingConvention: callingConvention ?? this.callingConvention,
        isAbstract: isAbstract ?? this.isAbstract,
        isConstructor: isConstructor ?? this.isConstructor,
        isFinal: isFinal ?? this.isFinal,
        isHideBySig: isHideBySig ?? this.isHideBySig,
        isSpecialName: isSpecialName ?? this.isSpecialName,
        isStatic: isStatic ?? this.isStatic,
        isVirtual: isVirtual ?? this.isVirtual,
        isAssembly: isAssembly ?? this.isAssembly,
        isFamily: isFamily ?? this.isFamily,
        isFamilyAndAssembly: isFamilyAndAssembly ?? this.isFamilyAndAssembly,
        isFamilyOrAssembly: isFamilyOrAssembly ?? this.isFamilyOrAssembly,
        isPrivate: isPrivate ?? this.isPrivate,
        isPublic: isPublic ?? this.isPublic,
        isConstructedGenericMethod:
            isConstructedGenericMethod ?? this.isConstructedGenericMethod,
        isGenericMethod: isGenericMethod ?? this.isGenericMethod,
        isGenericMethodDefinition:
            isGenericMethodDefinition ?? this.isGenericMethodDefinition,
        containsGenericParameters:
            containsGenericParameters ?? this.containsGenericParameters,
        methodHandle: methodHandle ?? this.methodHandle,
        isSecurityCritical: isSecurityCritical ?? this.isSecurityCritical,
        isSecuritySafeCritical:
            isSecuritySafeCritical ?? this.isSecuritySafeCritical,
        isSecurityTransparent:
            isSecurityTransparent ?? this.isSecurityTransparent,
        memberType: memberType ?? this.memberType,
        returnParameter: returnParameter ?? this.returnParameter,
        returnType: returnType ?? this.returnType,
        returnTypeCustomAttributes:
            returnTypeCustomAttributes ?? this.returnTypeCustomAttributes);
  }
}

@JsonSerializable(explicitToJson: true)
class Module {
  Module({
    this.assembly,
    this.fullyQualifiedName,
    this.name,
    this.mdStreamVersion,
    this.moduleVersionId,
    this.scopeName,
    this.moduleHandle,
    this.customAttributes,
    this.metadataToken,
  });

  factory Module.fromJson(Map<String, dynamic> json) => _$ModuleFromJson(json);

  @JsonKey(name: 'assembly', includeIfNull: true)
  final Assembly? assembly;
  @JsonKey(name: 'fullyQualifiedName', includeIfNull: true, defaultValue: '')
  final String? fullyQualifiedName;
  @JsonKey(name: 'name', includeIfNull: true, defaultValue: '')
  final String? name;
  @JsonKey(name: 'mdStreamVersion', includeIfNull: true)
  final int? mdStreamVersion;
  @JsonKey(name: 'moduleVersionId', includeIfNull: true, defaultValue: '')
  final String? moduleVersionId;
  @JsonKey(name: 'scopeName', includeIfNull: true, defaultValue: '')
  final String? scopeName;
  @JsonKey(name: 'moduleHandle', includeIfNull: true)
  final ModuleHandle? moduleHandle;
  @JsonKey(
      name: 'customAttributes',
      includeIfNull: true,
      defaultValue: <CustomAttributeData>[])
  final List<CustomAttributeData>? customAttributes;
  @JsonKey(name: 'metadataToken', includeIfNull: true)
  final int? metadataToken;
  static const fromJsonFactory = _$ModuleFromJson;
  static const toJsonFactory = _$ModuleToJson;
  Map<String, dynamic> toJson() => _$ModuleToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is Module &&
            (identical(other.assembly, assembly) ||
                const DeepCollectionEquality()
                    .equals(other.assembly, assembly)) &&
            (identical(other.fullyQualifiedName, fullyQualifiedName) ||
                const DeepCollectionEquality()
                    .equals(other.fullyQualifiedName, fullyQualifiedName)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.mdStreamVersion, mdStreamVersion) ||
                const DeepCollectionEquality()
                    .equals(other.mdStreamVersion, mdStreamVersion)) &&
            (identical(other.moduleVersionId, moduleVersionId) ||
                const DeepCollectionEquality()
                    .equals(other.moduleVersionId, moduleVersionId)) &&
            (identical(other.scopeName, scopeName) ||
                const DeepCollectionEquality()
                    .equals(other.scopeName, scopeName)) &&
            (identical(other.moduleHandle, moduleHandle) ||
                const DeepCollectionEquality()
                    .equals(other.moduleHandle, moduleHandle)) &&
            (identical(other.customAttributes, customAttributes) ||
                const DeepCollectionEquality()
                    .equals(other.customAttributes, customAttributes)) &&
            (identical(other.metadataToken, metadataToken) ||
                const DeepCollectionEquality()
                    .equals(other.metadataToken, metadataToken)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(assembly) ^
      const DeepCollectionEquality().hash(fullyQualifiedName) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(mdStreamVersion) ^
      const DeepCollectionEquality().hash(moduleVersionId) ^
      const DeepCollectionEquality().hash(scopeName) ^
      const DeepCollectionEquality().hash(moduleHandle) ^
      const DeepCollectionEquality().hash(customAttributes) ^
      const DeepCollectionEquality().hash(metadataToken) ^
      runtimeType.hashCode;
}

extension $ModuleExtension on Module {
  Module copyWith(
      {Assembly? assembly,
      String? fullyQualifiedName,
      String? name,
      int? mdStreamVersion,
      String? moduleVersionId,
      String? scopeName,
      ModuleHandle? moduleHandle,
      List<CustomAttributeData>? customAttributes,
      int? metadataToken}) {
    return Module(
        assembly: assembly ?? this.assembly,
        fullyQualifiedName: fullyQualifiedName ?? this.fullyQualifiedName,
        name: name ?? this.name,
        mdStreamVersion: mdStreamVersion ?? this.mdStreamVersion,
        moduleVersionId: moduleVersionId ?? this.moduleVersionId,
        scopeName: scopeName ?? this.scopeName,
        moduleHandle: moduleHandle ?? this.moduleHandle,
        customAttributes: customAttributes ?? this.customAttributes,
        metadataToken: metadataToken ?? this.metadataToken);
  }
}

@JsonSerializable(explicitToJson: true)
class ModuleHandle {
  ModuleHandle({
    this.mdStreamVersion,
  });

  factory ModuleHandle.fromJson(Map<String, dynamic> json) =>
      _$ModuleHandleFromJson(json);

  @JsonKey(name: 'mdStreamVersion', includeIfNull: true)
  final int? mdStreamVersion;
  static const fromJsonFactory = _$ModuleHandleFromJson;
  static const toJsonFactory = _$ModuleHandleToJson;
  Map<String, dynamic> toJson() => _$ModuleHandleToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ModuleHandle &&
            (identical(other.mdStreamVersion, mdStreamVersion) ||
                const DeepCollectionEquality()
                    .equals(other.mdStreamVersion, mdStreamVersion)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(mdStreamVersion) ^
      runtimeType.hashCode;
}

extension $ModuleHandleExtension on ModuleHandle {
  ModuleHandle copyWith({int? mdStreamVersion}) {
    return ModuleHandle(
        mdStreamVersion: mdStreamVersion ?? this.mdStreamVersion);
  }
}

@JsonSerializable(explicitToJson: true)
class MyExamFilterResource {
  MyExamFilterResource({
    this.sortExpression,
    this.pageSize,
    this.pageIndex,
    this.status,
  });

  factory MyExamFilterResource.fromJson(Map<String, dynamic> json) =>
      _$MyExamFilterResourceFromJson(json);

  @JsonKey(name: 'sortExpression', includeIfNull: true, defaultValue: '')
  final String? sortExpression;
  @JsonKey(name: 'pageSize', includeIfNull: true)
  final int? pageSize;
  @JsonKey(name: 'pageIndex', includeIfNull: true)
  final int? pageIndex;
  @JsonKey(name: 'status', includeIfNull: true)
  final int? status;
  static const fromJsonFactory = _$MyExamFilterResourceFromJson;
  static const toJsonFactory = _$MyExamFilterResourceToJson;
  Map<String, dynamic> toJson() => _$MyExamFilterResourceToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is MyExamFilterResource &&
            (identical(other.sortExpression, sortExpression) ||
                const DeepCollectionEquality()
                    .equals(other.sortExpression, sortExpression)) &&
            (identical(other.pageSize, pageSize) ||
                const DeepCollectionEquality()
                    .equals(other.pageSize, pageSize)) &&
            (identical(other.pageIndex, pageIndex) ||
                const DeepCollectionEquality()
                    .equals(other.pageIndex, pageIndex)) &&
            (identical(other.status, status) ||
                const DeepCollectionEquality().equals(other.status, status)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(sortExpression) ^
      const DeepCollectionEquality().hash(pageSize) ^
      const DeepCollectionEquality().hash(pageIndex) ^
      const DeepCollectionEquality().hash(status) ^
      runtimeType.hashCode;
}

extension $MyExamFilterResourceExtension on MyExamFilterResource {
  MyExamFilterResource copyWith(
      {String? sortExpression, int? pageSize, int? pageIndex, int? status}) {
    return MyExamFilterResource(
        sortExpression: sortExpression ?? this.sortExpression,
        pageSize: pageSize ?? this.pageSize,
        pageIndex: pageIndex ?? this.pageIndex,
        status: status ?? this.status);
  }
}

@JsonSerializable(explicitToJson: true)
class MyGroupPagingResource {
  MyGroupPagingResource({
    this.totalGroup,
    this.totalGroupManager,
    this.data,
  });

  factory MyGroupPagingResource.fromJson(Map<String, dynamic> json) =>
      _$MyGroupPagingResourceFromJson(json);

  @JsonKey(name: 'totalGroup', includeIfNull: true)
  final int? totalGroup;
  @JsonKey(name: 'totalGroupManager', includeIfNull: true)
  final int? totalGroupManager;
  @JsonKey(name: 'data', includeIfNull: true, defaultValue: <MyGroupResource>[])
  final List<MyGroupResource>? data;
  static const fromJsonFactory = _$MyGroupPagingResourceFromJson;
  static const toJsonFactory = _$MyGroupPagingResourceToJson;
  Map<String, dynamic> toJson() => _$MyGroupPagingResourceToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is MyGroupPagingResource &&
            (identical(other.totalGroup, totalGroup) ||
                const DeepCollectionEquality()
                    .equals(other.totalGroup, totalGroup)) &&
            (identical(other.totalGroupManager, totalGroupManager) ||
                const DeepCollectionEquality()
                    .equals(other.totalGroupManager, totalGroupManager)) &&
            (identical(other.data, data) ||
                const DeepCollectionEquality().equals(other.data, data)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(totalGroup) ^
      const DeepCollectionEquality().hash(totalGroupManager) ^
      const DeepCollectionEquality().hash(data) ^
      runtimeType.hashCode;
}

extension $MyGroupPagingResourceExtension on MyGroupPagingResource {
  MyGroupPagingResource copyWith(
      {int? totalGroup, int? totalGroupManager, List<MyGroupResource>? data}) {
    return MyGroupPagingResource(
        totalGroup: totalGroup ?? this.totalGroup,
        totalGroupManager: totalGroupManager ?? this.totalGroupManager,
        data: data ?? this.data);
  }
}

@JsonSerializable(explicitToJson: true)
class MyGroupResource {
  MyGroupResource({
    this.id,
    this.createdBy,
    this.isManager,
    this.createdDate,
    this.name,
    this.description,
    this.avatar,
    this.coverImage,
    this.parentId,
    this.status,
    this.type,
    this.organizationId,
    this.blockIds,
    this.categoryId,
    this.examNeedMark,
    this.examNeedWork,
    this.examComplete,
    this.totalGroupExamAssigned,
  });

  factory MyGroupResource.fromJson(Map<String, dynamic> json) =>
      _$MyGroupResourceFromJson(json);

  @JsonKey(name: 'id', includeIfNull: true)
  final int? id;
  @JsonKey(name: 'createdBy', includeIfNull: true)
  final int? createdBy;
  @JsonKey(name: 'isManager', includeIfNull: true)
  final bool? isManager;
  @JsonKey(name: 'createdDate', includeIfNull: true)
  final DateTime? createdDate;
  @JsonKey(name: 'name', includeIfNull: true, defaultValue: '')
  final String? name;
  @JsonKey(name: 'description', includeIfNull: true, defaultValue: '')
  final String? description;
  @JsonKey(name: 'avatar', includeIfNull: true, defaultValue: '')
  final String? avatar;
  @JsonKey(name: 'coverImage', includeIfNull: true, defaultValue: '')
  final String? coverImage;
  @JsonKey(name: 'parentId', includeIfNull: true)
  final int? parentId;
  @JsonKey(name: 'status', includeIfNull: true)
  final int? status;
  @JsonKey(name: 'type', includeIfNull: true)
  final int? type;
  @JsonKey(name: 'organizationId', includeIfNull: true)
  final int? organizationId;
  @JsonKey(name: 'blockIds', includeIfNull: true, defaultValue: <int>[])
  final List<int>? blockIds;
  @JsonKey(name: 'categoryId', includeIfNull: true)
  final int? categoryId;
  @JsonKey(name: 'examNeedMark', includeIfNull: true)
  final int? examNeedMark;
  @JsonKey(name: 'examNeedWork', includeIfNull: true)
  final int? examNeedWork;
  @JsonKey(name: 'examComplete', includeIfNull: true)
  final int? examComplete;
  @JsonKey(name: 'totalGroupExamAssigned', includeIfNull: true)
  final int? totalGroupExamAssigned;
  static const fromJsonFactory = _$MyGroupResourceFromJson;
  static const toJsonFactory = _$MyGroupResourceToJson;
  Map<String, dynamic> toJson() => _$MyGroupResourceToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is MyGroupResource &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.createdBy, createdBy) ||
                const DeepCollectionEquality()
                    .equals(other.createdBy, createdBy)) &&
            (identical(other.isManager, isManager) ||
                const DeepCollectionEquality()
                    .equals(other.isManager, isManager)) &&
            (identical(other.createdDate, createdDate) ||
                const DeepCollectionEquality()
                    .equals(other.createdDate, createdDate)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.description, description) ||
                const DeepCollectionEquality()
                    .equals(other.description, description)) &&
            (identical(other.avatar, avatar) ||
                const DeepCollectionEquality().equals(other.avatar, avatar)) &&
            (identical(other.coverImage, coverImage) ||
                const DeepCollectionEquality()
                    .equals(other.coverImage, coverImage)) &&
            (identical(other.parentId, parentId) ||
                const DeepCollectionEquality()
                    .equals(other.parentId, parentId)) &&
            (identical(other.status, status) ||
                const DeepCollectionEquality().equals(other.status, status)) &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)) &&
            (identical(other.organizationId, organizationId) ||
                const DeepCollectionEquality()
                    .equals(other.organizationId, organizationId)) &&
            (identical(other.blockIds, blockIds) ||
                const DeepCollectionEquality()
                    .equals(other.blockIds, blockIds)) &&
            (identical(other.categoryId, categoryId) ||
                const DeepCollectionEquality()
                    .equals(other.categoryId, categoryId)) &&
            (identical(other.examNeedMark, examNeedMark) ||
                const DeepCollectionEquality()
                    .equals(other.examNeedMark, examNeedMark)) &&
            (identical(other.examNeedWork, examNeedWork) ||
                const DeepCollectionEquality()
                    .equals(other.examNeedWork, examNeedWork)) &&
            (identical(other.examComplete, examComplete) ||
                const DeepCollectionEquality()
                    .equals(other.examComplete, examComplete)) &&
            (identical(other.totalGroupExamAssigned, totalGroupExamAssigned) ||
                const DeepCollectionEquality().equals(
                    other.totalGroupExamAssigned, totalGroupExamAssigned)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(createdBy) ^
      const DeepCollectionEquality().hash(isManager) ^
      const DeepCollectionEquality().hash(createdDate) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(description) ^
      const DeepCollectionEquality().hash(avatar) ^
      const DeepCollectionEquality().hash(coverImage) ^
      const DeepCollectionEquality().hash(parentId) ^
      const DeepCollectionEquality().hash(status) ^
      const DeepCollectionEquality().hash(type) ^
      const DeepCollectionEquality().hash(organizationId) ^
      const DeepCollectionEquality().hash(blockIds) ^
      const DeepCollectionEquality().hash(categoryId) ^
      const DeepCollectionEquality().hash(examNeedMark) ^
      const DeepCollectionEquality().hash(examNeedWork) ^
      const DeepCollectionEquality().hash(examComplete) ^
      const DeepCollectionEquality().hash(totalGroupExamAssigned) ^
      runtimeType.hashCode;
}

extension $MyGroupResourceExtension on MyGroupResource {
  MyGroupResource copyWith(
      {int? id,
      int? createdBy,
      bool? isManager,
      DateTime? createdDate,
      String? name,
      String? description,
      String? avatar,
      String? coverImage,
      int? parentId,
      int? status,
      int? type,
      int? organizationId,
      List<int>? blockIds,
      int? categoryId,
      int? examNeedMark,
      int? examNeedWork,
      int? examComplete,
      int? totalGroupExamAssigned}) {
    return MyGroupResource(
        id: id ?? this.id,
        createdBy: createdBy ?? this.createdBy,
        isManager: isManager ?? this.isManager,
        createdDate: createdDate ?? this.createdDate,
        name: name ?? this.name,
        description: description ?? this.description,
        avatar: avatar ?? this.avatar,
        coverImage: coverImage ?? this.coverImage,
        parentId: parentId ?? this.parentId,
        status: status ?? this.status,
        type: type ?? this.type,
        organizationId: organizationId ?? this.organizationId,
        blockIds: blockIds ?? this.blockIds,
        categoryId: categoryId ?? this.categoryId,
        examNeedMark: examNeedMark ?? this.examNeedMark,
        examNeedWork: examNeedWork ?? this.examNeedWork,
        examComplete: examComplete ?? this.examComplete,
        totalGroupExamAssigned:
            totalGroupExamAssigned ?? this.totalGroupExamAssigned);
  }
}

@JsonSerializable(explicitToJson: true)
class ParameterExpression {
  ParameterExpression({
    this.canReduce,
    this.type,
    this.nodeType,
    this.name,
    this.isByRef,
  });

  factory ParameterExpression.fromJson(Map<String, dynamic> json) =>
      _$ParameterExpressionFromJson(json);

  @JsonKey(name: 'canReduce', includeIfNull: true)
  final bool? canReduce;
  @JsonKey(name: 'type', includeIfNull: true)
  final Type? type;
  @JsonKey(
      name: 'nodeType',
      includeIfNull: true,
      toJson: expressionTypeToJson,
      fromJson: expressionTypeFromJson)
  final enums.ExpressionType? nodeType;
  @JsonKey(name: 'name', includeIfNull: true, defaultValue: '')
  final String? name;
  @JsonKey(name: 'isByRef', includeIfNull: true)
  final bool? isByRef;
  static const fromJsonFactory = _$ParameterExpressionFromJson;
  static const toJsonFactory = _$ParameterExpressionToJson;
  Map<String, dynamic> toJson() => _$ParameterExpressionToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ParameterExpression &&
            (identical(other.canReduce, canReduce) ||
                const DeepCollectionEquality()
                    .equals(other.canReduce, canReduce)) &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)) &&
            (identical(other.nodeType, nodeType) ||
                const DeepCollectionEquality()
                    .equals(other.nodeType, nodeType)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.isByRef, isByRef) ||
                const DeepCollectionEquality().equals(other.isByRef, isByRef)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(canReduce) ^
      const DeepCollectionEquality().hash(type) ^
      const DeepCollectionEquality().hash(nodeType) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(isByRef) ^
      runtimeType.hashCode;
}

extension $ParameterExpressionExtension on ParameterExpression {
  ParameterExpression copyWith(
      {bool? canReduce,
      Type? type,
      enums.ExpressionType? nodeType,
      String? name,
      bool? isByRef}) {
    return ParameterExpression(
        canReduce: canReduce ?? this.canReduce,
        type: type ?? this.type,
        nodeType: nodeType ?? this.nodeType,
        name: name ?? this.name,
        isByRef: isByRef ?? this.isByRef);
  }
}

@JsonSerializable(explicitToJson: true)
class ParameterInfo {
  ParameterInfo({
    this.attributes,
    this.member,
    this.name,
    this.parameterType,
    this.position,
    this.isIn,
    this.isLcid,
    this.isOptional,
    this.isOut,
    this.isRetval,
    this.defaultValue,
    this.rawDefaultValue,
    this.hasDefaultValue,
    this.customAttributes,
    this.metadataToken,
  });

  factory ParameterInfo.fromJson(Map<String, dynamic> json) =>
      _$ParameterInfoFromJson(json);

  @JsonKey(
      name: 'attributes',
      includeIfNull: true,
      toJson: parameterAttributesToJson,
      fromJson: parameterAttributesFromJson)
  final enums.ParameterAttributes? attributes;
  @JsonKey(name: 'member', includeIfNull: true)
  final MemberInfo? member;
  @JsonKey(name: 'name', includeIfNull: true, defaultValue: '')
  final String? name;
  @JsonKey(name: 'parameterType', includeIfNull: true)
  final Type? parameterType;
  @JsonKey(name: 'position', includeIfNull: true)
  final int? position;
  @JsonKey(name: 'isIn', includeIfNull: true)
  final bool? isIn;
  @JsonKey(name: 'isLcid', includeIfNull: true)
  final bool? isLcid;
  @JsonKey(name: 'isOptional', includeIfNull: true)
  final bool? isOptional;
  @JsonKey(name: 'isOut', includeIfNull: true)
  final bool? isOut;
  @JsonKey(name: 'isRetval', includeIfNull: true)
  final bool? isRetval;
  @JsonKey(name: 'defaultValue', includeIfNull: true)
  final dynamic defaultValue;
  @JsonKey(name: 'rawDefaultValue', includeIfNull: true)
  final dynamic rawDefaultValue;
  @JsonKey(name: 'hasDefaultValue', includeIfNull: true)
  final bool? hasDefaultValue;
  @JsonKey(
      name: 'customAttributes',
      includeIfNull: true,
      defaultValue: <CustomAttributeData>[])
  final List<CustomAttributeData>? customAttributes;
  @JsonKey(name: 'metadataToken', includeIfNull: true)
  final int? metadataToken;
  static const fromJsonFactory = _$ParameterInfoFromJson;
  static const toJsonFactory = _$ParameterInfoToJson;
  Map<String, dynamic> toJson() => _$ParameterInfoToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ParameterInfo &&
            (identical(other.attributes, attributes) ||
                const DeepCollectionEquality()
                    .equals(other.attributes, attributes)) &&
            (identical(other.member, member) ||
                const DeepCollectionEquality().equals(other.member, member)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.parameterType, parameterType) ||
                const DeepCollectionEquality()
                    .equals(other.parameterType, parameterType)) &&
            (identical(other.position, position) ||
                const DeepCollectionEquality()
                    .equals(other.position, position)) &&
            (identical(other.isIn, isIn) ||
                const DeepCollectionEquality().equals(other.isIn, isIn)) &&
            (identical(other.isLcid, isLcid) ||
                const DeepCollectionEquality().equals(other.isLcid, isLcid)) &&
            (identical(other.isOptional, isOptional) ||
                const DeepCollectionEquality()
                    .equals(other.isOptional, isOptional)) &&
            (identical(other.isOut, isOut) ||
                const DeepCollectionEquality().equals(other.isOut, isOut)) &&
            (identical(other.isRetval, isRetval) ||
                const DeepCollectionEquality()
                    .equals(other.isRetval, isRetval)) &&
            (identical(other.defaultValue, defaultValue) ||
                const DeepCollectionEquality()
                    .equals(other.defaultValue, defaultValue)) &&
            (identical(other.rawDefaultValue, rawDefaultValue) ||
                const DeepCollectionEquality()
                    .equals(other.rawDefaultValue, rawDefaultValue)) &&
            (identical(other.hasDefaultValue, hasDefaultValue) ||
                const DeepCollectionEquality()
                    .equals(other.hasDefaultValue, hasDefaultValue)) &&
            (identical(other.customAttributes, customAttributes) ||
                const DeepCollectionEquality()
                    .equals(other.customAttributes, customAttributes)) &&
            (identical(other.metadataToken, metadataToken) ||
                const DeepCollectionEquality()
                    .equals(other.metadataToken, metadataToken)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(attributes) ^
      const DeepCollectionEquality().hash(member) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(parameterType) ^
      const DeepCollectionEquality().hash(position) ^
      const DeepCollectionEquality().hash(isIn) ^
      const DeepCollectionEquality().hash(isLcid) ^
      const DeepCollectionEquality().hash(isOptional) ^
      const DeepCollectionEquality().hash(isOut) ^
      const DeepCollectionEquality().hash(isRetval) ^
      const DeepCollectionEquality().hash(defaultValue) ^
      const DeepCollectionEquality().hash(rawDefaultValue) ^
      const DeepCollectionEquality().hash(hasDefaultValue) ^
      const DeepCollectionEquality().hash(customAttributes) ^
      const DeepCollectionEquality().hash(metadataToken) ^
      runtimeType.hashCode;
}

extension $ParameterInfoExtension on ParameterInfo {
  ParameterInfo copyWith(
      {enums.ParameterAttributes? attributes,
      MemberInfo? member,
      String? name,
      Type? parameterType,
      int? position,
      bool? isIn,
      bool? isLcid,
      bool? isOptional,
      bool? isOut,
      bool? isRetval,
      dynamic? defaultValue,
      dynamic? rawDefaultValue,
      bool? hasDefaultValue,
      List<CustomAttributeData>? customAttributes,
      int? metadataToken}) {
    return ParameterInfo(
        attributes: attributes ?? this.attributes,
        member: member ?? this.member,
        name: name ?? this.name,
        parameterType: parameterType ?? this.parameterType,
        position: position ?? this.position,
        isIn: isIn ?? this.isIn,
        isLcid: isLcid ?? this.isLcid,
        isOptional: isOptional ?? this.isOptional,
        isOut: isOut ?? this.isOut,
        isRetval: isRetval ?? this.isRetval,
        defaultValue: defaultValue ?? this.defaultValue,
        rawDefaultValue: rawDefaultValue ?? this.rawDefaultValue,
        hasDefaultValue: hasDefaultValue ?? this.hasDefaultValue,
        customAttributes: customAttributes ?? this.customAttributes,
        metadataToken: metadataToken ?? this.metadataToken);
  }
}

@JsonSerializable(explicitToJson: true)
class ProductRequest {
  ProductRequest({
    this.objectId,
    this.objectType,
    this.blockId,
  });

  factory ProductRequest.fromJson(Map<String, dynamic> json) =>
      _$ProductRequestFromJson(json);

  @JsonKey(name: 'objectId', includeIfNull: true)
  final int? objectId;
  @JsonKey(name: 'objectType', includeIfNull: true)
  final int? objectType;
  @JsonKey(name: 'blockId', includeIfNull: true)
  final int? blockId;
  static const fromJsonFactory = _$ProductRequestFromJson;
  static const toJsonFactory = _$ProductRequestToJson;
  Map<String, dynamic> toJson() => _$ProductRequestToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ProductRequest &&
            (identical(other.objectId, objectId) ||
                const DeepCollectionEquality()
                    .equals(other.objectId, objectId)) &&
            (identical(other.objectType, objectType) ||
                const DeepCollectionEquality()
                    .equals(other.objectType, objectType)) &&
            (identical(other.blockId, blockId) ||
                const DeepCollectionEquality().equals(other.blockId, blockId)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(objectId) ^
      const DeepCollectionEquality().hash(objectType) ^
      const DeepCollectionEquality().hash(blockId) ^
      runtimeType.hashCode;
}

extension $ProductRequestExtension on ProductRequest {
  ProductRequest copyWith({int? objectId, int? objectType, int? blockId}) {
    return ProductRequest(
        objectId: objectId ?? this.objectId,
        objectType: objectType ?? this.objectType,
        blockId: blockId ?? this.blockId);
  }
}

@JsonSerializable(explicitToJson: true)
class ProductResource {
  ProductResource({
    this.id,
    this.title,
    this.price,
    this.discountPrice,
    this.status,
    this.blockName,
    this.objectTypeName,
  });

  factory ProductResource.fromJson(Map<String, dynamic> json) =>
      _$ProductResourceFromJson(json);

  @JsonKey(name: 'id', includeIfNull: true)
  final int? id;
  @JsonKey(name: 'title', includeIfNull: true, defaultValue: '')
  final String? title;
  @JsonKey(name: 'price', includeIfNull: true)
  final double? price;
  @JsonKey(name: 'discountPrice', includeIfNull: true)
  final double? discountPrice;
  @JsonKey(name: 'status', includeIfNull: true)
  final int? status;
  @JsonKey(name: 'blockName', includeIfNull: true, defaultValue: '')
  final String? blockName;
  @JsonKey(name: 'objectTypeName', includeIfNull: true, defaultValue: '')
  final String? objectTypeName;
  static const fromJsonFactory = _$ProductResourceFromJson;
  static const toJsonFactory = _$ProductResourceToJson;
  Map<String, dynamic> toJson() => _$ProductResourceToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ProductResource &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.title, title) ||
                const DeepCollectionEquality().equals(other.title, title)) &&
            (identical(other.price, price) ||
                const DeepCollectionEquality().equals(other.price, price)) &&
            (identical(other.discountPrice, discountPrice) ||
                const DeepCollectionEquality()
                    .equals(other.discountPrice, discountPrice)) &&
            (identical(other.status, status) ||
                const DeepCollectionEquality().equals(other.status, status)) &&
            (identical(other.blockName, blockName) ||
                const DeepCollectionEquality()
                    .equals(other.blockName, blockName)) &&
            (identical(other.objectTypeName, objectTypeName) ||
                const DeepCollectionEquality()
                    .equals(other.objectTypeName, objectTypeName)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(title) ^
      const DeepCollectionEquality().hash(price) ^
      const DeepCollectionEquality().hash(discountPrice) ^
      const DeepCollectionEquality().hash(status) ^
      const DeepCollectionEquality().hash(blockName) ^
      const DeepCollectionEquality().hash(objectTypeName) ^
      runtimeType.hashCode;
}

extension $ProductResourceExtension on ProductResource {
  ProductResource copyWith(
      {int? id,
      String? title,
      double? price,
      double? discountPrice,
      int? status,
      String? blockName,
      String? objectTypeName}) {
    return ProductResource(
        id: id ?? this.id,
        title: title ?? this.title,
        price: price ?? this.price,
        discountPrice: discountPrice ?? this.discountPrice,
        status: status ?? this.status,
        blockName: blockName ?? this.blockName,
        objectTypeName: objectTypeName ?? this.objectTypeName);
  }
}

@JsonSerializable(explicitToJson: true)
class PropertyByCategoryTree {
  PropertyByCategoryTree({
    this.criterion,
    this.rowData,
  });

  factory PropertyByCategoryTree.fromJson(Map<String, dynamic> json) =>
      _$PropertyByCategoryTreeFromJson(json);

  @JsonKey(
      name: 'criterion',
      includeIfNull: true,
      defaultValue: <SelectTreeInt64NullableTreeNode>[])
  final List<SelectTreeInt64NullableTreeNode>? criterion;
  @JsonKey(
      name: 'rowData',
      includeIfNull: true,
      defaultValue: <SelectTreeInt64NullableTreeNode>[])
  final List<SelectTreeInt64NullableTreeNode>? rowData;
  static const fromJsonFactory = _$PropertyByCategoryTreeFromJson;
  static const toJsonFactory = _$PropertyByCategoryTreeToJson;
  Map<String, dynamic> toJson() => _$PropertyByCategoryTreeToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is PropertyByCategoryTree &&
            (identical(other.criterion, criterion) ||
                const DeepCollectionEquality()
                    .equals(other.criterion, criterion)) &&
            (identical(other.rowData, rowData) ||
                const DeepCollectionEquality().equals(other.rowData, rowData)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(criterion) ^
      const DeepCollectionEquality().hash(rowData) ^
      runtimeType.hashCode;
}

extension $PropertyByCategoryTreeExtension on PropertyByCategoryTree {
  PropertyByCategoryTree copyWith(
      {List<SelectTreeInt64NullableTreeNode>? criterion,
      List<SelectTreeInt64NullableTreeNode>? rowData}) {
    return PropertyByCategoryTree(
        criterion: criterion ?? this.criterion,
        rowData: rowData ?? this.rowData);
  }
}

@JsonSerializable(explicitToJson: true)
class PropertyByCategoryUpdateResource {
  PropertyByCategoryUpdateResource({
    this.createdBy,
    this.createdDate,
    this.lastModifiedBy,
    this.lastModifiedDate,
    this.categoryIds,
    this.propertyId,
  });

  factory PropertyByCategoryUpdateResource.fromJson(
          Map<String, dynamic> json) =>
      _$PropertyByCategoryUpdateResourceFromJson(json);

  @JsonKey(name: 'createdBy', includeIfNull: true)
  final int? createdBy;
  @JsonKey(name: 'createdDate', includeIfNull: true)
  final DateTime? createdDate;
  @JsonKey(name: 'lastModifiedBy', includeIfNull: true)
  final int? lastModifiedBy;
  @JsonKey(name: 'lastModifiedDate', includeIfNull: true)
  final DateTime? lastModifiedDate;
  @JsonKey(name: 'categoryIds', includeIfNull: true, defaultValue: <int>[])
  final List<int>? categoryIds;
  @JsonKey(name: 'propertyId', includeIfNull: true)
  final int? propertyId;
  static const fromJsonFactory = _$PropertyByCategoryUpdateResourceFromJson;
  static const toJsonFactory = _$PropertyByCategoryUpdateResourceToJson;
  Map<String, dynamic> toJson() =>
      _$PropertyByCategoryUpdateResourceToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is PropertyByCategoryUpdateResource &&
            (identical(other.createdBy, createdBy) ||
                const DeepCollectionEquality()
                    .equals(other.createdBy, createdBy)) &&
            (identical(other.createdDate, createdDate) ||
                const DeepCollectionEquality()
                    .equals(other.createdDate, createdDate)) &&
            (identical(other.lastModifiedBy, lastModifiedBy) ||
                const DeepCollectionEquality()
                    .equals(other.lastModifiedBy, lastModifiedBy)) &&
            (identical(other.lastModifiedDate, lastModifiedDate) ||
                const DeepCollectionEquality()
                    .equals(other.lastModifiedDate, lastModifiedDate)) &&
            (identical(other.categoryIds, categoryIds) ||
                const DeepCollectionEquality()
                    .equals(other.categoryIds, categoryIds)) &&
            (identical(other.propertyId, propertyId) ||
                const DeepCollectionEquality()
                    .equals(other.propertyId, propertyId)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(createdBy) ^
      const DeepCollectionEquality().hash(createdDate) ^
      const DeepCollectionEquality().hash(lastModifiedBy) ^
      const DeepCollectionEquality().hash(lastModifiedDate) ^
      const DeepCollectionEquality().hash(categoryIds) ^
      const DeepCollectionEquality().hash(propertyId) ^
      runtimeType.hashCode;
}

extension $PropertyByCategoryUpdateResourceExtension
    on PropertyByCategoryUpdateResource {
  PropertyByCategoryUpdateResource copyWith(
      {int? createdBy,
      DateTime? createdDate,
      int? lastModifiedBy,
      DateTime? lastModifiedDate,
      List<int>? categoryIds,
      int? propertyId}) {
    return PropertyByCategoryUpdateResource(
        createdBy: createdBy ?? this.createdBy,
        createdDate: createdDate ?? this.createdDate,
        lastModifiedBy: lastModifiedBy ?? this.lastModifiedBy,
        lastModifiedDate: lastModifiedDate ?? this.lastModifiedDate,
        categoryIds: categoryIds ?? this.categoryIds,
        propertyId: propertyId ?? this.propertyId);
  }
}

@JsonSerializable(explicitToJson: true)
class PropertyColumns {
  PropertyColumns({
    this.categoryIds,
    this.dataPropertyIds,
    this.criterionPropertyIds,
  });

  factory PropertyColumns.fromJson(Map<String, dynamic> json) =>
      _$PropertyColumnsFromJson(json);

  @JsonKey(name: 'categoryIds', includeIfNull: true, defaultValue: <int>[])
  final List<int>? categoryIds;
  @JsonKey(name: 'dataPropertyIds', includeIfNull: true, defaultValue: <int>[])
  final List<int>? dataPropertyIds;
  @JsonKey(
      name: 'criterionPropertyIds', includeIfNull: true, defaultValue: <int>[])
  final List<int>? criterionPropertyIds;
  static const fromJsonFactory = _$PropertyColumnsFromJson;
  static const toJsonFactory = _$PropertyColumnsToJson;
  Map<String, dynamic> toJson() => _$PropertyColumnsToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is PropertyColumns &&
            (identical(other.categoryIds, categoryIds) ||
                const DeepCollectionEquality()
                    .equals(other.categoryIds, categoryIds)) &&
            (identical(other.dataPropertyIds, dataPropertyIds) ||
                const DeepCollectionEquality()
                    .equals(other.dataPropertyIds, dataPropertyIds)) &&
            (identical(other.criterionPropertyIds, criterionPropertyIds) ||
                const DeepCollectionEquality()
                    .equals(other.criterionPropertyIds, criterionPropertyIds)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(categoryIds) ^
      const DeepCollectionEquality().hash(dataPropertyIds) ^
      const DeepCollectionEquality().hash(criterionPropertyIds) ^
      runtimeType.hashCode;
}

extension $PropertyColumnsExtension on PropertyColumns {
  PropertyColumns copyWith(
      {List<int>? categoryIds,
      List<int>? dataPropertyIds,
      List<int>? criterionPropertyIds}) {
    return PropertyColumns(
        categoryIds: categoryIds ?? this.categoryIds,
        dataPropertyIds: dataPropertyIds ?? this.dataPropertyIds,
        criterionPropertyIds:
            criterionPropertyIds ?? this.criterionPropertyIds);
  }
}

@JsonSerializable(explicitToJson: true)
class PropertyCreateResource {
  PropertyCreateResource({
    this.id,
    this.createdBy,
    this.createdDate,
    this.lastModifiedBy,
    this.lastModifiedDate,
    this.name,
    this.code,
    this.note,
    this.status,
    this.parentId,
    this.type,
    this.isCriterion,
    this.isCombine,
    this.propertyDetail,
  });

  factory PropertyCreateResource.fromJson(Map<String, dynamic> json) =>
      _$PropertyCreateResourceFromJson(json);

  @JsonKey(name: 'id', includeIfNull: true)
  final int? id;
  @JsonKey(name: 'createdBy', includeIfNull: true)
  final int? createdBy;
  @JsonKey(name: 'createdDate', includeIfNull: true)
  final DateTime? createdDate;
  @JsonKey(name: 'lastModifiedBy', includeIfNull: true)
  final int? lastModifiedBy;
  @JsonKey(name: 'lastModifiedDate', includeIfNull: true)
  final DateTime? lastModifiedDate;
  @JsonKey(name: 'name', includeIfNull: true, defaultValue: '')
  final String? name;
  @JsonKey(name: 'code', includeIfNull: true, defaultValue: '')
  final String? code;
  @JsonKey(name: 'note', includeIfNull: true, defaultValue: '')
  final String? note;
  @JsonKey(name: 'status', includeIfNull: true)
  final int? status;
  @JsonKey(name: 'parentId', includeIfNull: true)
  final int? parentId;
  @JsonKey(name: 'type', includeIfNull: true)
  final int? type;
  @JsonKey(name: 'isCriterion', includeIfNull: true)
  final bool? isCriterion;
  @JsonKey(name: 'isCombine', includeIfNull: true)
  final bool? isCombine;
  @JsonKey(
      name: 'propertyDetail',
      includeIfNull: true,
      defaultValue: <PropertyDetailResource>[])
  final List<PropertyDetailResource>? propertyDetail;
  static const fromJsonFactory = _$PropertyCreateResourceFromJson;
  static const toJsonFactory = _$PropertyCreateResourceToJson;
  Map<String, dynamic> toJson() => _$PropertyCreateResourceToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is PropertyCreateResource &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.createdBy, createdBy) ||
                const DeepCollectionEquality()
                    .equals(other.createdBy, createdBy)) &&
            (identical(other.createdDate, createdDate) ||
                const DeepCollectionEquality()
                    .equals(other.createdDate, createdDate)) &&
            (identical(other.lastModifiedBy, lastModifiedBy) ||
                const DeepCollectionEquality()
                    .equals(other.lastModifiedBy, lastModifiedBy)) &&
            (identical(other.lastModifiedDate, lastModifiedDate) ||
                const DeepCollectionEquality()
                    .equals(other.lastModifiedDate, lastModifiedDate)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.code, code) ||
                const DeepCollectionEquality().equals(other.code, code)) &&
            (identical(other.note, note) ||
                const DeepCollectionEquality().equals(other.note, note)) &&
            (identical(other.status, status) ||
                const DeepCollectionEquality().equals(other.status, status)) &&
            (identical(other.parentId, parentId) ||
                const DeepCollectionEquality()
                    .equals(other.parentId, parentId)) &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)) &&
            (identical(other.isCriterion, isCriterion) ||
                const DeepCollectionEquality()
                    .equals(other.isCriterion, isCriterion)) &&
            (identical(other.isCombine, isCombine) ||
                const DeepCollectionEquality()
                    .equals(other.isCombine, isCombine)) &&
            (identical(other.propertyDetail, propertyDetail) ||
                const DeepCollectionEquality()
                    .equals(other.propertyDetail, propertyDetail)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(createdBy) ^
      const DeepCollectionEquality().hash(createdDate) ^
      const DeepCollectionEquality().hash(lastModifiedBy) ^
      const DeepCollectionEquality().hash(lastModifiedDate) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(code) ^
      const DeepCollectionEquality().hash(note) ^
      const DeepCollectionEquality().hash(status) ^
      const DeepCollectionEquality().hash(parentId) ^
      const DeepCollectionEquality().hash(type) ^
      const DeepCollectionEquality().hash(isCriterion) ^
      const DeepCollectionEquality().hash(isCombine) ^
      const DeepCollectionEquality().hash(propertyDetail) ^
      runtimeType.hashCode;
}

extension $PropertyCreateResourceExtension on PropertyCreateResource {
  PropertyCreateResource copyWith(
      {int? id,
      int? createdBy,
      DateTime? createdDate,
      int? lastModifiedBy,
      DateTime? lastModifiedDate,
      String? name,
      String? code,
      String? note,
      int? status,
      int? parentId,
      int? type,
      bool? isCriterion,
      bool? isCombine,
      List<PropertyDetailResource>? propertyDetail}) {
    return PropertyCreateResource(
        id: id ?? this.id,
        createdBy: createdBy ?? this.createdBy,
        createdDate: createdDate ?? this.createdDate,
        lastModifiedBy: lastModifiedBy ?? this.lastModifiedBy,
        lastModifiedDate: lastModifiedDate ?? this.lastModifiedDate,
        name: name ?? this.name,
        code: code ?? this.code,
        note: note ?? this.note,
        status: status ?? this.status,
        parentId: parentId ?? this.parentId,
        type: type ?? this.type,
        isCriterion: isCriterion ?? this.isCriterion,
        isCombine: isCombine ?? this.isCombine,
        propertyDetail: propertyDetail ?? this.propertyDetail);
  }
}

@JsonSerializable(explicitToJson: true)
class PropertyDetailEntity {
  PropertyDetailEntity({
    this.id,
    this.createdBy,
    this.createdDate,
    this.lastModifiedBy,
    this.lastModifiedDate,
    this.propertyId,
    this.value,
    this.order,
    this.status,
    this.parentId,
    this.path,
  });

  factory PropertyDetailEntity.fromJson(Map<String, dynamic> json) =>
      _$PropertyDetailEntityFromJson(json);

  @JsonKey(name: 'id', includeIfNull: true)
  final int? id;
  @JsonKey(name: 'createdBy', includeIfNull: true)
  final int? createdBy;
  @JsonKey(name: 'createdDate', includeIfNull: true)
  final DateTime? createdDate;
  @JsonKey(name: 'lastModifiedBy', includeIfNull: true)
  final int? lastModifiedBy;
  @JsonKey(name: 'lastModifiedDate', includeIfNull: true)
  final DateTime? lastModifiedDate;
  @JsonKey(name: 'propertyId', includeIfNull: true)
  final int? propertyId;
  @JsonKey(name: 'value', includeIfNull: true, defaultValue: '')
  final String? value;
  @JsonKey(name: 'order', includeIfNull: true)
  final int? order;
  @JsonKey(name: 'status', includeIfNull: true)
  final int? status;
  @JsonKey(name: 'parentId', includeIfNull: true)
  final int? parentId;
  @JsonKey(name: 'path', includeIfNull: true, defaultValue: '')
  final String? path;
  static const fromJsonFactory = _$PropertyDetailEntityFromJson;
  static const toJsonFactory = _$PropertyDetailEntityToJson;
  Map<String, dynamic> toJson() => _$PropertyDetailEntityToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is PropertyDetailEntity &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.createdBy, createdBy) ||
                const DeepCollectionEquality()
                    .equals(other.createdBy, createdBy)) &&
            (identical(other.createdDate, createdDate) ||
                const DeepCollectionEquality()
                    .equals(other.createdDate, createdDate)) &&
            (identical(other.lastModifiedBy, lastModifiedBy) ||
                const DeepCollectionEquality()
                    .equals(other.lastModifiedBy, lastModifiedBy)) &&
            (identical(other.lastModifiedDate, lastModifiedDate) ||
                const DeepCollectionEquality()
                    .equals(other.lastModifiedDate, lastModifiedDate)) &&
            (identical(other.propertyId, propertyId) ||
                const DeepCollectionEquality()
                    .equals(other.propertyId, propertyId)) &&
            (identical(other.value, value) ||
                const DeepCollectionEquality().equals(other.value, value)) &&
            (identical(other.order, order) ||
                const DeepCollectionEquality().equals(other.order, order)) &&
            (identical(other.status, status) ||
                const DeepCollectionEquality().equals(other.status, status)) &&
            (identical(other.parentId, parentId) ||
                const DeepCollectionEquality()
                    .equals(other.parentId, parentId)) &&
            (identical(other.path, path) ||
                const DeepCollectionEquality().equals(other.path, path)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(createdBy) ^
      const DeepCollectionEquality().hash(createdDate) ^
      const DeepCollectionEquality().hash(lastModifiedBy) ^
      const DeepCollectionEquality().hash(lastModifiedDate) ^
      const DeepCollectionEquality().hash(propertyId) ^
      const DeepCollectionEquality().hash(value) ^
      const DeepCollectionEquality().hash(order) ^
      const DeepCollectionEquality().hash(status) ^
      const DeepCollectionEquality().hash(parentId) ^
      const DeepCollectionEquality().hash(path) ^
      runtimeType.hashCode;
}

extension $PropertyDetailEntityExtension on PropertyDetailEntity {
  PropertyDetailEntity copyWith(
      {int? id,
      int? createdBy,
      DateTime? createdDate,
      int? lastModifiedBy,
      DateTime? lastModifiedDate,
      int? propertyId,
      String? value,
      int? order,
      int? status,
      int? parentId,
      String? path}) {
    return PropertyDetailEntity(
        id: id ?? this.id,
        createdBy: createdBy ?? this.createdBy,
        createdDate: createdDate ?? this.createdDate,
        lastModifiedBy: lastModifiedBy ?? this.lastModifiedBy,
        lastModifiedDate: lastModifiedDate ?? this.lastModifiedDate,
        propertyId: propertyId ?? this.propertyId,
        value: value ?? this.value,
        order: order ?? this.order,
        status: status ?? this.status,
        parentId: parentId ?? this.parentId,
        path: path ?? this.path);
  }
}

@JsonSerializable(explicitToJson: true)
class PropertyDetailResource {
  PropertyDetailResource({
    this.id,
    this.propertyId,
    this.value,
    this.order,
    this.status,
    this.canDelete,
    this.parentId,
    this.type,
    this.isCriterion,
    this.isCombine,
    this.key,
  });

  factory PropertyDetailResource.fromJson(Map<String, dynamic> json) =>
      _$PropertyDetailResourceFromJson(json);

  @JsonKey(name: 'id', includeIfNull: true)
  final int? id;
  @JsonKey(name: 'propertyId', includeIfNull: true)
  final int? propertyId;
  @JsonKey(name: 'value', includeIfNull: true, defaultValue: '')
  final String? value;
  @JsonKey(name: 'order', includeIfNull: true)
  final int? order;
  @JsonKey(name: 'status', includeIfNull: true)
  final int? status;
  @JsonKey(name: 'canDelete', includeIfNull: true)
  final bool? canDelete;
  @JsonKey(name: 'parentId', includeIfNull: true)
  final int? parentId;
  @JsonKey(name: 'type', includeIfNull: true)
  final int? type;
  @JsonKey(name: 'isCriterion', includeIfNull: true)
  final bool? isCriterion;
  @JsonKey(name: 'isCombine', includeIfNull: true)
  final bool? isCombine;
  @JsonKey(name: 'key', includeIfNull: true, defaultValue: '')
  final String? key;
  static const fromJsonFactory = _$PropertyDetailResourceFromJson;
  static const toJsonFactory = _$PropertyDetailResourceToJson;
  Map<String, dynamic> toJson() => _$PropertyDetailResourceToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is PropertyDetailResource &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.propertyId, propertyId) ||
                const DeepCollectionEquality()
                    .equals(other.propertyId, propertyId)) &&
            (identical(other.value, value) ||
                const DeepCollectionEquality().equals(other.value, value)) &&
            (identical(other.order, order) ||
                const DeepCollectionEquality().equals(other.order, order)) &&
            (identical(other.status, status) ||
                const DeepCollectionEquality().equals(other.status, status)) &&
            (identical(other.canDelete, canDelete) ||
                const DeepCollectionEquality()
                    .equals(other.canDelete, canDelete)) &&
            (identical(other.parentId, parentId) ||
                const DeepCollectionEquality()
                    .equals(other.parentId, parentId)) &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)) &&
            (identical(other.isCriterion, isCriterion) ||
                const DeepCollectionEquality()
                    .equals(other.isCriterion, isCriterion)) &&
            (identical(other.isCombine, isCombine) ||
                const DeepCollectionEquality()
                    .equals(other.isCombine, isCombine)) &&
            (identical(other.key, key) ||
                const DeepCollectionEquality().equals(other.key, key)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(propertyId) ^
      const DeepCollectionEquality().hash(value) ^
      const DeepCollectionEquality().hash(order) ^
      const DeepCollectionEquality().hash(status) ^
      const DeepCollectionEquality().hash(canDelete) ^
      const DeepCollectionEquality().hash(parentId) ^
      const DeepCollectionEquality().hash(type) ^
      const DeepCollectionEquality().hash(isCriterion) ^
      const DeepCollectionEquality().hash(isCombine) ^
      const DeepCollectionEquality().hash(key) ^
      runtimeType.hashCode;
}

extension $PropertyDetailResourceExtension on PropertyDetailResource {
  PropertyDetailResource copyWith(
      {int? id,
      int? propertyId,
      String? value,
      int? order,
      int? status,
      bool? canDelete,
      int? parentId,
      int? type,
      bool? isCriterion,
      bool? isCombine,
      String? key}) {
    return PropertyDetailResource(
        id: id ?? this.id,
        propertyId: propertyId ?? this.propertyId,
        value: value ?? this.value,
        order: order ?? this.order,
        status: status ?? this.status,
        canDelete: canDelete ?? this.canDelete,
        parentId: parentId ?? this.parentId,
        type: type ?? this.type,
        isCriterion: isCriterion ?? this.isCriterion,
        isCombine: isCombine ?? this.isCombine,
        key: key ?? this.key);
  }
}

@JsonSerializable(explicitToJson: true)
class PropertyDetailTreeExt {
  PropertyDetailTreeExt({
    this.id,
    this.tittle,
    this.data,
  });

  factory PropertyDetailTreeExt.fromJson(Map<String, dynamic> json) =>
      _$PropertyDetailTreeExtFromJson(json);

  @JsonKey(name: 'id', includeIfNull: true)
  final int? id;
  @JsonKey(name: 'tittle', includeIfNull: true, defaultValue: '')
  final String? tittle;
  @JsonKey(
      name: 'data',
      includeIfNull: true,
      defaultValue: <PropertyDetailTreeNodeExtInt64NullableTreeNode>[])
  final List<PropertyDetailTreeNodeExtInt64NullableTreeNode>? data;
  static const fromJsonFactory = _$PropertyDetailTreeExtFromJson;
  static const toJsonFactory = _$PropertyDetailTreeExtToJson;
  Map<String, dynamic> toJson() => _$PropertyDetailTreeExtToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is PropertyDetailTreeExt &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.tittle, tittle) ||
                const DeepCollectionEquality().equals(other.tittle, tittle)) &&
            (identical(other.data, data) ||
                const DeepCollectionEquality().equals(other.data, data)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(tittle) ^
      const DeepCollectionEquality().hash(data) ^
      runtimeType.hashCode;
}

extension $PropertyDetailTreeExtExtension on PropertyDetailTreeExt {
  PropertyDetailTreeExt copyWith(
      {int? id,
      String? tittle,
      List<PropertyDetailTreeNodeExtInt64NullableTreeNode>? data}) {
    return PropertyDetailTreeExt(
        id: id ?? this.id,
        tittle: tittle ?? this.tittle,
        data: data ?? this.data);
  }
}

@JsonSerializable(explicitToJson: true)
class PropertyDetailTreeNodeExt {
  PropertyDetailTreeNodeExt({
    this.propertyDetailId,
    this.properyId,
    this.propertyName,
    this.propertyDetailName,
    this.propertyDetailParentId,
    this.propertyDetailOrder,
    this.propertyDetailCount,
    this.propertyDetailPath,
    this.duration,
  });

  factory PropertyDetailTreeNodeExt.fromJson(Map<String, dynamic> json) =>
      _$PropertyDetailTreeNodeExtFromJson(json);

  @JsonKey(name: 'propertyDetailId', includeIfNull: true)
  final int? propertyDetailId;
  @JsonKey(name: 'properyId', includeIfNull: true)
  final int? properyId;
  @JsonKey(name: 'propertyName', includeIfNull: true, defaultValue: '')
  final String? propertyName;
  @JsonKey(name: 'propertyDetailName', includeIfNull: true, defaultValue: '')
  final String? propertyDetailName;
  @JsonKey(name: 'propertyDetailParentId', includeIfNull: true)
  final int? propertyDetailParentId;
  @JsonKey(name: 'propertyDetailOrder', includeIfNull: true)
  final int? propertyDetailOrder;
  @JsonKey(name: 'propertyDetailCount', includeIfNull: true)
  final int? propertyDetailCount;
  @JsonKey(name: 'propertyDetailPath', includeIfNull: true, defaultValue: '')
  final String? propertyDetailPath;
  @JsonKey(name: 'duration', includeIfNull: true)
  final double? duration;
  static const fromJsonFactory = _$PropertyDetailTreeNodeExtFromJson;
  static const toJsonFactory = _$PropertyDetailTreeNodeExtToJson;
  Map<String, dynamic> toJson() => _$PropertyDetailTreeNodeExtToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is PropertyDetailTreeNodeExt &&
            (identical(other.propertyDetailId, propertyDetailId) ||
                const DeepCollectionEquality()
                    .equals(other.propertyDetailId, propertyDetailId)) &&
            (identical(other.properyId, properyId) ||
                const DeepCollectionEquality()
                    .equals(other.properyId, properyId)) &&
            (identical(other.propertyName, propertyName) ||
                const DeepCollectionEquality()
                    .equals(other.propertyName, propertyName)) &&
            (identical(other.propertyDetailName, propertyDetailName) ||
                const DeepCollectionEquality()
                    .equals(other.propertyDetailName, propertyDetailName)) &&
            (identical(other.propertyDetailParentId, propertyDetailParentId) ||
                const DeepCollectionEquality().equals(
                    other.propertyDetailParentId, propertyDetailParentId)) &&
            (identical(other.propertyDetailOrder, propertyDetailOrder) ||
                const DeepCollectionEquality()
                    .equals(other.propertyDetailOrder, propertyDetailOrder)) &&
            (identical(other.propertyDetailCount, propertyDetailCount) ||
                const DeepCollectionEquality()
                    .equals(other.propertyDetailCount, propertyDetailCount)) &&
            (identical(other.propertyDetailPath, propertyDetailPath) ||
                const DeepCollectionEquality()
                    .equals(other.propertyDetailPath, propertyDetailPath)) &&
            (identical(other.duration, duration) ||
                const DeepCollectionEquality()
                    .equals(other.duration, duration)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(propertyDetailId) ^
      const DeepCollectionEquality().hash(properyId) ^
      const DeepCollectionEquality().hash(propertyName) ^
      const DeepCollectionEquality().hash(propertyDetailName) ^
      const DeepCollectionEquality().hash(propertyDetailParentId) ^
      const DeepCollectionEquality().hash(propertyDetailOrder) ^
      const DeepCollectionEquality().hash(propertyDetailCount) ^
      const DeepCollectionEquality().hash(propertyDetailPath) ^
      const DeepCollectionEquality().hash(duration) ^
      runtimeType.hashCode;
}

extension $PropertyDetailTreeNodeExtExtension on PropertyDetailTreeNodeExt {
  PropertyDetailTreeNodeExt copyWith(
      {int? propertyDetailId,
      int? properyId,
      String? propertyName,
      String? propertyDetailName,
      int? propertyDetailParentId,
      int? propertyDetailOrder,
      int? propertyDetailCount,
      String? propertyDetailPath,
      double? duration}) {
    return PropertyDetailTreeNodeExt(
        propertyDetailId: propertyDetailId ?? this.propertyDetailId,
        properyId: properyId ?? this.properyId,
        propertyName: propertyName ?? this.propertyName,
        propertyDetailName: propertyDetailName ?? this.propertyDetailName,
        propertyDetailParentId:
            propertyDetailParentId ?? this.propertyDetailParentId,
        propertyDetailOrder: propertyDetailOrder ?? this.propertyDetailOrder,
        propertyDetailCount: propertyDetailCount ?? this.propertyDetailCount,
        propertyDetailPath: propertyDetailPath ?? this.propertyDetailPath,
        duration: duration ?? this.duration);
  }
}

@JsonSerializable(explicitToJson: true)
class PropertyDetailTreeNodeExtInt64NullableTreeNode {
  PropertyDetailTreeNodeExtInt64NullableTreeNode({
    this.item,
    this.parentId,
    this.children,
  });

  factory PropertyDetailTreeNodeExtInt64NullableTreeNode.fromJson(
          Map<String, dynamic> json) =>
      _$PropertyDetailTreeNodeExtInt64NullableTreeNodeFromJson(json);

  @JsonKey(name: 'item', includeIfNull: true)
  final PropertyDetailTreeNodeExt? item;
  @JsonKey(name: 'parentId', includeIfNull: true)
  final int? parentId;
  @JsonKey(
      name: 'children',
      includeIfNull: true,
      defaultValue: <PropertyDetailTreeNodeExtInt64NullableTreeNode>[])
  final List<PropertyDetailTreeNodeExtInt64NullableTreeNode>? children;
  static const fromJsonFactory =
      _$PropertyDetailTreeNodeExtInt64NullableTreeNodeFromJson;
  static const toJsonFactory =
      _$PropertyDetailTreeNodeExtInt64NullableTreeNodeToJson;
  Map<String, dynamic> toJson() =>
      _$PropertyDetailTreeNodeExtInt64NullableTreeNodeToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is PropertyDetailTreeNodeExtInt64NullableTreeNode &&
            (identical(other.item, item) ||
                const DeepCollectionEquality().equals(other.item, item)) &&
            (identical(other.parentId, parentId) ||
                const DeepCollectionEquality()
                    .equals(other.parentId, parentId)) &&
            (identical(other.children, children) ||
                const DeepCollectionEquality()
                    .equals(other.children, children)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(item) ^
      const DeepCollectionEquality().hash(parentId) ^
      const DeepCollectionEquality().hash(children) ^
      runtimeType.hashCode;
}

extension $PropertyDetailTreeNodeExtInt64NullableTreeNodeExtension
    on PropertyDetailTreeNodeExtInt64NullableTreeNode {
  PropertyDetailTreeNodeExtInt64NullableTreeNode copyWith(
      {PropertyDetailTreeNodeExt? item,
      int? parentId,
      List<PropertyDetailTreeNodeExtInt64NullableTreeNode>? children}) {
    return PropertyDetailTreeNodeExtInt64NullableTreeNode(
        item: item ?? this.item,
        parentId: parentId ?? this.parentId,
        children: children ?? this.children);
  }
}

@JsonSerializable(explicitToJson: true)
class PropertyFilterResouce {
  PropertyFilterResouce({
    this.name,
    this.code,
    this.note,
    this.type,
    this.parentId,
  });

  factory PropertyFilterResouce.fromJson(Map<String, dynamic> json) =>
      _$PropertyFilterResouceFromJson(json);

  @JsonKey(name: 'name', includeIfNull: true, defaultValue: '')
  final String? name;
  @JsonKey(name: 'code', includeIfNull: true, defaultValue: '')
  final String? code;
  @JsonKey(name: 'note', includeIfNull: true, defaultValue: '')
  final String? note;
  @JsonKey(name: 'type', includeIfNull: true)
  final int? type;
  @JsonKey(name: 'parentId', includeIfNull: true)
  final int? parentId;
  static const fromJsonFactory = _$PropertyFilterResouceFromJson;
  static const toJsonFactory = _$PropertyFilterResouceToJson;
  Map<String, dynamic> toJson() => _$PropertyFilterResouceToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is PropertyFilterResouce &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.code, code) ||
                const DeepCollectionEquality().equals(other.code, code)) &&
            (identical(other.note, note) ||
                const DeepCollectionEquality().equals(other.note, note)) &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)) &&
            (identical(other.parentId, parentId) ||
                const DeepCollectionEquality()
                    .equals(other.parentId, parentId)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(code) ^
      const DeepCollectionEquality().hash(note) ^
      const DeepCollectionEquality().hash(type) ^
      const DeepCollectionEquality().hash(parentId) ^
      runtimeType.hashCode;
}

extension $PropertyFilterResouceExtension on PropertyFilterResouce {
  PropertyFilterResouce copyWith(
      {String? name, String? code, String? note, int? type, int? parentId}) {
    return PropertyFilterResouce(
        name: name ?? this.name,
        code: code ?? this.code,
        note: note ?? this.note,
        type: type ?? this.type,
        parentId: parentId ?? this.parentId);
  }
}

@JsonSerializable(explicitToJson: true)
class PropertyInfo {
  PropertyInfo({
    this.name,
    this.declaringType,
    this.reflectedType,
    this.module,
    this.customAttributes,
    this.isCollectible,
    this.metadataToken,
    this.memberType,
    this.propertyType,
    this.attributes,
    this.isSpecialName,
    this.canRead,
    this.canWrite,
    this.getMethod,
    this.setMethod,
  });

  factory PropertyInfo.fromJson(Map<String, dynamic> json) =>
      _$PropertyInfoFromJson(json);

  @JsonKey(name: 'name', includeIfNull: true, defaultValue: '')
  final String? name;
  @JsonKey(name: 'declaringType', includeIfNull: true)
  final Type? declaringType;
  @JsonKey(name: 'reflectedType', includeIfNull: true)
  final Type? reflectedType;
  @JsonKey(name: 'module', includeIfNull: true)
  final Module? module;
  @JsonKey(
      name: 'customAttributes',
      includeIfNull: true,
      defaultValue: <CustomAttributeData>[])
  final List<CustomAttributeData>? customAttributes;
  @JsonKey(name: 'isCollectible', includeIfNull: true)
  final bool? isCollectible;
  @JsonKey(name: 'metadataToken', includeIfNull: true)
  final int? metadataToken;
  @JsonKey(
      name: 'memberType',
      includeIfNull: true,
      toJson: memberTypesToJson,
      fromJson: memberTypesFromJson)
  final enums.MemberTypes? memberType;
  @JsonKey(name: 'propertyType', includeIfNull: true)
  final Type? propertyType;
  @JsonKey(
      name: 'attributes',
      includeIfNull: true,
      toJson: propertyAttributesToJson,
      fromJson: propertyAttributesFromJson)
  final enums.PropertyAttributes? attributes;
  @JsonKey(name: 'isSpecialName', includeIfNull: true)
  final bool? isSpecialName;
  @JsonKey(name: 'canRead', includeIfNull: true)
  final bool? canRead;
  @JsonKey(name: 'canWrite', includeIfNull: true)
  final bool? canWrite;
  @JsonKey(name: 'getMethod', includeIfNull: true)
  final MethodInfo? getMethod;
  @JsonKey(name: 'setMethod', includeIfNull: true)
  final MethodInfo? setMethod;
  static const fromJsonFactory = _$PropertyInfoFromJson;
  static const toJsonFactory = _$PropertyInfoToJson;
  Map<String, dynamic> toJson() => _$PropertyInfoToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is PropertyInfo &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.declaringType, declaringType) ||
                const DeepCollectionEquality()
                    .equals(other.declaringType, declaringType)) &&
            (identical(other.reflectedType, reflectedType) ||
                const DeepCollectionEquality()
                    .equals(other.reflectedType, reflectedType)) &&
            (identical(other.module, module) ||
                const DeepCollectionEquality().equals(other.module, module)) &&
            (identical(other.customAttributes, customAttributes) ||
                const DeepCollectionEquality()
                    .equals(other.customAttributes, customAttributes)) &&
            (identical(other.isCollectible, isCollectible) ||
                const DeepCollectionEquality()
                    .equals(other.isCollectible, isCollectible)) &&
            (identical(other.metadataToken, metadataToken) ||
                const DeepCollectionEquality()
                    .equals(other.metadataToken, metadataToken)) &&
            (identical(other.memberType, memberType) ||
                const DeepCollectionEquality()
                    .equals(other.memberType, memberType)) &&
            (identical(other.propertyType, propertyType) ||
                const DeepCollectionEquality()
                    .equals(other.propertyType, propertyType)) &&
            (identical(other.attributes, attributes) ||
                const DeepCollectionEquality()
                    .equals(other.attributes, attributes)) &&
            (identical(other.isSpecialName, isSpecialName) ||
                const DeepCollectionEquality()
                    .equals(other.isSpecialName, isSpecialName)) &&
            (identical(other.canRead, canRead) ||
                const DeepCollectionEquality()
                    .equals(other.canRead, canRead)) &&
            (identical(other.canWrite, canWrite) ||
                const DeepCollectionEquality()
                    .equals(other.canWrite, canWrite)) &&
            (identical(other.getMethod, getMethod) ||
                const DeepCollectionEquality()
                    .equals(other.getMethod, getMethod)) &&
            (identical(other.setMethod, setMethod) ||
                const DeepCollectionEquality()
                    .equals(other.setMethod, setMethod)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(declaringType) ^
      const DeepCollectionEquality().hash(reflectedType) ^
      const DeepCollectionEquality().hash(module) ^
      const DeepCollectionEquality().hash(customAttributes) ^
      const DeepCollectionEquality().hash(isCollectible) ^
      const DeepCollectionEquality().hash(metadataToken) ^
      const DeepCollectionEquality().hash(memberType) ^
      const DeepCollectionEquality().hash(propertyType) ^
      const DeepCollectionEquality().hash(attributes) ^
      const DeepCollectionEquality().hash(isSpecialName) ^
      const DeepCollectionEquality().hash(canRead) ^
      const DeepCollectionEquality().hash(canWrite) ^
      const DeepCollectionEquality().hash(getMethod) ^
      const DeepCollectionEquality().hash(setMethod) ^
      runtimeType.hashCode;
}

extension $PropertyInfoExtension on PropertyInfo {
  PropertyInfo copyWith(
      {String? name,
      Type? declaringType,
      Type? reflectedType,
      Module? module,
      List<CustomAttributeData>? customAttributes,
      bool? isCollectible,
      int? metadataToken,
      enums.MemberTypes? memberType,
      Type? propertyType,
      enums.PropertyAttributes? attributes,
      bool? isSpecialName,
      bool? canRead,
      bool? canWrite,
      MethodInfo? getMethod,
      MethodInfo? setMethod}) {
    return PropertyInfo(
        name: name ?? this.name,
        declaringType: declaringType ?? this.declaringType,
        reflectedType: reflectedType ?? this.reflectedType,
        module: module ?? this.module,
        customAttributes: customAttributes ?? this.customAttributes,
        isCollectible: isCollectible ?? this.isCollectible,
        metadataToken: metadataToken ?? this.metadataToken,
        memberType: memberType ?? this.memberType,
        propertyType: propertyType ?? this.propertyType,
        attributes: attributes ?? this.attributes,
        isSpecialName: isSpecialName ?? this.isSpecialName,
        canRead: canRead ?? this.canRead,
        canWrite: canWrite ?? this.canWrite,
        getMethod: getMethod ?? this.getMethod,
        setMethod: setMethod ?? this.setMethod);
  }
}

@JsonSerializable(explicitToJson: true)
class PropertyListResource {
  PropertyListResource({
    this.id,
    this.key,
    this.createdBy,
    this.createdDate,
    this.lastModifiedBy,
    this.lastModifiedDate,
    this.name,
    this.status,
    this.code,
    this.selectedDetail,
    this.canDelete,
    this.note,
    this.parentId,
    this.path,
    this.level,
    this.hasChildren,
    this.propertyDetail,
    this.propertyByCategory,
    this.childrens,
    this.childCount,
    this.type,
    this.isCriterion,
    this.isCombine,
  });

  factory PropertyListResource.fromJson(Map<String, dynamic> json) =>
      _$PropertyListResourceFromJson(json);

  @JsonKey(name: 'id', includeIfNull: true)
  final int? id;
  @JsonKey(name: 'key', includeIfNull: true)
  final int? key;
  @JsonKey(name: 'createdBy', includeIfNull: true)
  final int? createdBy;
  @JsonKey(name: 'createdDate', includeIfNull: true)
  final DateTime? createdDate;
  @JsonKey(name: 'lastModifiedBy', includeIfNull: true)
  final int? lastModifiedBy;
  @JsonKey(name: 'lastModifiedDate', includeIfNull: true)
  final DateTime? lastModifiedDate;
  @JsonKey(name: 'name', includeIfNull: true, defaultValue: '')
  final String? name;
  @JsonKey(name: 'status', includeIfNull: true)
  final int? status;
  @JsonKey(name: 'code', includeIfNull: true, defaultValue: '')
  final String? code;
  @JsonKey(name: 'selectedDetail', includeIfNull: true)
  final int? selectedDetail;
  @JsonKey(name: 'canDelete', includeIfNull: true)
  final bool? canDelete;
  @JsonKey(name: 'note', includeIfNull: true, defaultValue: '')
  final String? note;
  @JsonKey(name: 'parentId', includeIfNull: true)
  final int? parentId;
  @JsonKey(name: 'path', includeIfNull: true, defaultValue: '')
  final String? path;
  @JsonKey(name: 'level', includeIfNull: true)
  final int? level;
  @JsonKey(name: 'hasChildren', includeIfNull: true)
  final bool? hasChildren;
  @JsonKey(
      name: 'propertyDetail',
      includeIfNull: true,
      defaultValue: <PropertyDetailResource>[])
  final List<PropertyDetailResource>? propertyDetail;
  @JsonKey(
      name: 'propertyByCategory', includeIfNull: true, defaultValue: <int>[])
  final List<int>? propertyByCategory;
  @JsonKey(
      name: 'childrens',
      includeIfNull: true,
      defaultValue: <PropertyListResource>[])
  final List<PropertyListResource>? childrens;
  @JsonKey(name: 'childCount', includeIfNull: true)
  final int? childCount;
  @JsonKey(name: 'type', includeIfNull: true)
  final int? type;
  @JsonKey(name: 'isCriterion', includeIfNull: true)
  final bool? isCriterion;
  @JsonKey(name: 'isCombine', includeIfNull: true)
  final bool? isCombine;
  static const fromJsonFactory = _$PropertyListResourceFromJson;
  static const toJsonFactory = _$PropertyListResourceToJson;
  Map<String, dynamic> toJson() => _$PropertyListResourceToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is PropertyListResource &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.key, key) ||
                const DeepCollectionEquality().equals(other.key, key)) &&
            (identical(other.createdBy, createdBy) ||
                const DeepCollectionEquality()
                    .equals(other.createdBy, createdBy)) &&
            (identical(other.createdDate, createdDate) ||
                const DeepCollectionEquality()
                    .equals(other.createdDate, createdDate)) &&
            (identical(other.lastModifiedBy, lastModifiedBy) ||
                const DeepCollectionEquality()
                    .equals(other.lastModifiedBy, lastModifiedBy)) &&
            (identical(other.lastModifiedDate, lastModifiedDate) ||
                const DeepCollectionEquality()
                    .equals(other.lastModifiedDate, lastModifiedDate)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.status, status) ||
                const DeepCollectionEquality().equals(other.status, status)) &&
            (identical(other.code, code) ||
                const DeepCollectionEquality().equals(other.code, code)) &&
            (identical(other.selectedDetail, selectedDetail) ||
                const DeepCollectionEquality()
                    .equals(other.selectedDetail, selectedDetail)) &&
            (identical(other.canDelete, canDelete) ||
                const DeepCollectionEquality()
                    .equals(other.canDelete, canDelete)) &&
            (identical(other.note, note) ||
                const DeepCollectionEquality().equals(other.note, note)) &&
            (identical(other.parentId, parentId) ||
                const DeepCollectionEquality()
                    .equals(other.parentId, parentId)) &&
            (identical(other.path, path) ||
                const DeepCollectionEquality().equals(other.path, path)) &&
            (identical(other.level, level) ||
                const DeepCollectionEquality().equals(other.level, level)) &&
            (identical(other.hasChildren, hasChildren) ||
                const DeepCollectionEquality()
                    .equals(other.hasChildren, hasChildren)) &&
            (identical(other.propertyDetail, propertyDetail) ||
                const DeepCollectionEquality()
                    .equals(other.propertyDetail, propertyDetail)) &&
            (identical(other.propertyByCategory, propertyByCategory) ||
                const DeepCollectionEquality()
                    .equals(other.propertyByCategory, propertyByCategory)) &&
            (identical(other.childrens, childrens) ||
                const DeepCollectionEquality()
                    .equals(other.childrens, childrens)) &&
            (identical(other.childCount, childCount) ||
                const DeepCollectionEquality()
                    .equals(other.childCount, childCount)) &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)) &&
            (identical(other.isCriterion, isCriterion) ||
                const DeepCollectionEquality()
                    .equals(other.isCriterion, isCriterion)) &&
            (identical(other.isCombine, isCombine) ||
                const DeepCollectionEquality()
                    .equals(other.isCombine, isCombine)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(key) ^
      const DeepCollectionEquality().hash(createdBy) ^
      const DeepCollectionEquality().hash(createdDate) ^
      const DeepCollectionEquality().hash(lastModifiedBy) ^
      const DeepCollectionEquality().hash(lastModifiedDate) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(status) ^
      const DeepCollectionEquality().hash(code) ^
      const DeepCollectionEquality().hash(selectedDetail) ^
      const DeepCollectionEquality().hash(canDelete) ^
      const DeepCollectionEquality().hash(note) ^
      const DeepCollectionEquality().hash(parentId) ^
      const DeepCollectionEquality().hash(path) ^
      const DeepCollectionEquality().hash(level) ^
      const DeepCollectionEquality().hash(hasChildren) ^
      const DeepCollectionEquality().hash(propertyDetail) ^
      const DeepCollectionEquality().hash(propertyByCategory) ^
      const DeepCollectionEquality().hash(childrens) ^
      const DeepCollectionEquality().hash(childCount) ^
      const DeepCollectionEquality().hash(type) ^
      const DeepCollectionEquality().hash(isCriterion) ^
      const DeepCollectionEquality().hash(isCombine) ^
      runtimeType.hashCode;
}

extension $PropertyListResourceExtension on PropertyListResource {
  PropertyListResource copyWith(
      {int? id,
      int? key,
      int? createdBy,
      DateTime? createdDate,
      int? lastModifiedBy,
      DateTime? lastModifiedDate,
      String? name,
      int? status,
      String? code,
      int? selectedDetail,
      bool? canDelete,
      String? note,
      int? parentId,
      String? path,
      int? level,
      bool? hasChildren,
      List<PropertyDetailResource>? propertyDetail,
      List<int>? propertyByCategory,
      List<PropertyListResource>? childrens,
      int? childCount,
      int? type,
      bool? isCriterion,
      bool? isCombine}) {
    return PropertyListResource(
        id: id ?? this.id,
        key: key ?? this.key,
        createdBy: createdBy ?? this.createdBy,
        createdDate: createdDate ?? this.createdDate,
        lastModifiedBy: lastModifiedBy ?? this.lastModifiedBy,
        lastModifiedDate: lastModifiedDate ?? this.lastModifiedDate,
        name: name ?? this.name,
        status: status ?? this.status,
        code: code ?? this.code,
        selectedDetail: selectedDetail ?? this.selectedDetail,
        canDelete: canDelete ?? this.canDelete,
        note: note ?? this.note,
        parentId: parentId ?? this.parentId,
        path: path ?? this.path,
        level: level ?? this.level,
        hasChildren: hasChildren ?? this.hasChildren,
        propertyDetail: propertyDetail ?? this.propertyDetail,
        propertyByCategory: propertyByCategory ?? this.propertyByCategory,
        childrens: childrens ?? this.childrens,
        childCount: childCount ?? this.childCount,
        type: type ?? this.type,
        isCriterion: isCriterion ?? this.isCriterion,
        isCombine: isCombine ?? this.isCombine);
  }
}

@JsonSerializable(explicitToJson: true)
class PropertyPublicResource {
  PropertyPublicResource({
    this.id,
    this.name,
    this.code,
    this.note,
    this.status,
    this.parentId,
    this.propertyDetail,
  });

  factory PropertyPublicResource.fromJson(Map<String, dynamic> json) =>
      _$PropertyPublicResourceFromJson(json);

  @JsonKey(name: 'id', includeIfNull: true)
  final int? id;
  @JsonKey(name: 'name', includeIfNull: true, defaultValue: '')
  final String? name;
  @JsonKey(name: 'code', includeIfNull: true, defaultValue: '')
  final String? code;
  @JsonKey(name: 'note', includeIfNull: true, defaultValue: '')
  final String? note;
  @JsonKey(name: 'status', includeIfNull: true)
  final int? status;
  @JsonKey(name: 'parentId', includeIfNull: true)
  final int? parentId;
  @JsonKey(
      name: 'propertyDetail',
      includeIfNull: true,
      defaultValue: <PropertyDetailResource>[])
  final List<PropertyDetailResource>? propertyDetail;
  static const fromJsonFactory = _$PropertyPublicResourceFromJson;
  static const toJsonFactory = _$PropertyPublicResourceToJson;
  Map<String, dynamic> toJson() => _$PropertyPublicResourceToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is PropertyPublicResource &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.code, code) ||
                const DeepCollectionEquality().equals(other.code, code)) &&
            (identical(other.note, note) ||
                const DeepCollectionEquality().equals(other.note, note)) &&
            (identical(other.status, status) ||
                const DeepCollectionEquality().equals(other.status, status)) &&
            (identical(other.parentId, parentId) ||
                const DeepCollectionEquality()
                    .equals(other.parentId, parentId)) &&
            (identical(other.propertyDetail, propertyDetail) ||
                const DeepCollectionEquality()
                    .equals(other.propertyDetail, propertyDetail)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(code) ^
      const DeepCollectionEquality().hash(note) ^
      const DeepCollectionEquality().hash(status) ^
      const DeepCollectionEquality().hash(parentId) ^
      const DeepCollectionEquality().hash(propertyDetail) ^
      runtimeType.hashCode;
}

extension $PropertyPublicResourceExtension on PropertyPublicResource {
  PropertyPublicResource copyWith(
      {int? id,
      String? name,
      String? code,
      String? note,
      int? status,
      int? parentId,
      List<PropertyDetailResource>? propertyDetail}) {
    return PropertyPublicResource(
        id: id ?? this.id,
        name: name ?? this.name,
        code: code ?? this.code,
        note: note ?? this.note,
        status: status ?? this.status,
        parentId: parentId ?? this.parentId,
        propertyDetail: propertyDetail ?? this.propertyDetail);
  }
}

@JsonSerializable(explicitToJson: true)
class PropertyUpdateResource {
  PropertyUpdateResource({
    this.id,
    this.lastModifiedBy,
    this.lastModifiedDate,
    this.name,
    this.code,
    this.note,
    this.type,
    this.isCriterion,
    this.isCombine,
    this.parentId,
    this.propertyDetail,
  });

  factory PropertyUpdateResource.fromJson(Map<String, dynamic> json) =>
      _$PropertyUpdateResourceFromJson(json);

  @JsonKey(name: 'id', includeIfNull: true)
  final int? id;
  @JsonKey(name: 'lastModifiedBy', includeIfNull: true)
  final int? lastModifiedBy;
  @JsonKey(name: 'lastModifiedDate', includeIfNull: true)
  final DateTime? lastModifiedDate;
  @JsonKey(name: 'name', includeIfNull: true, defaultValue: '')
  final String? name;
  @JsonKey(name: 'code', includeIfNull: true, defaultValue: '')
  final String? code;
  @JsonKey(name: 'note', includeIfNull: true, defaultValue: '')
  final String? note;
  @JsonKey(name: 'type', includeIfNull: true)
  final int? type;
  @JsonKey(name: 'isCriterion', includeIfNull: true)
  final bool? isCriterion;
  @JsonKey(name: 'isCombine', includeIfNull: true)
  final bool? isCombine;
  @JsonKey(name: 'parentId', includeIfNull: true)
  final int? parentId;
  @JsonKey(
      name: 'propertyDetail',
      includeIfNull: true,
      defaultValue: <PropertyDetailResource>[])
  final List<PropertyDetailResource>? propertyDetail;
  static const fromJsonFactory = _$PropertyUpdateResourceFromJson;
  static const toJsonFactory = _$PropertyUpdateResourceToJson;
  Map<String, dynamic> toJson() => _$PropertyUpdateResourceToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is PropertyUpdateResource &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.lastModifiedBy, lastModifiedBy) ||
                const DeepCollectionEquality()
                    .equals(other.lastModifiedBy, lastModifiedBy)) &&
            (identical(other.lastModifiedDate, lastModifiedDate) ||
                const DeepCollectionEquality()
                    .equals(other.lastModifiedDate, lastModifiedDate)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.code, code) ||
                const DeepCollectionEquality().equals(other.code, code)) &&
            (identical(other.note, note) ||
                const DeepCollectionEquality().equals(other.note, note)) &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)) &&
            (identical(other.isCriterion, isCriterion) ||
                const DeepCollectionEquality()
                    .equals(other.isCriterion, isCriterion)) &&
            (identical(other.isCombine, isCombine) ||
                const DeepCollectionEquality()
                    .equals(other.isCombine, isCombine)) &&
            (identical(other.parentId, parentId) ||
                const DeepCollectionEquality()
                    .equals(other.parentId, parentId)) &&
            (identical(other.propertyDetail, propertyDetail) ||
                const DeepCollectionEquality()
                    .equals(other.propertyDetail, propertyDetail)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(lastModifiedBy) ^
      const DeepCollectionEquality().hash(lastModifiedDate) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(code) ^
      const DeepCollectionEquality().hash(note) ^
      const DeepCollectionEquality().hash(type) ^
      const DeepCollectionEquality().hash(isCriterion) ^
      const DeepCollectionEquality().hash(isCombine) ^
      const DeepCollectionEquality().hash(parentId) ^
      const DeepCollectionEquality().hash(propertyDetail) ^
      runtimeType.hashCode;
}

extension $PropertyUpdateResourceExtension on PropertyUpdateResource {
  PropertyUpdateResource copyWith(
      {int? id,
      int? lastModifiedBy,
      DateTime? lastModifiedDate,
      String? name,
      String? code,
      String? note,
      int? type,
      bool? isCriterion,
      bool? isCombine,
      int? parentId,
      List<PropertyDetailResource>? propertyDetail}) {
    return PropertyUpdateResource(
        id: id ?? this.id,
        lastModifiedBy: lastModifiedBy ?? this.lastModifiedBy,
        lastModifiedDate: lastModifiedDate ?? this.lastModifiedDate,
        name: name ?? this.name,
        code: code ?? this.code,
        note: note ?? this.note,
        type: type ?? this.type,
        isCriterion: isCriterion ?? this.isCriterion,
        isCombine: isCombine ?? this.isCombine,
        parentId: parentId ?? this.parentId,
        propertyDetail: propertyDetail ?? this.propertyDetail);
  }
}

@JsonSerializable(explicitToJson: true)
class Question {
  Question({
    this.id,
    this.title,
    this.content,
    this.type,
    this.mark,
    this.imageUrl,
    this.videoUrl,
    this.soundUrl,
    this.answers,
    this.childs,
  });

  factory Question.fromJson(Map<String, dynamic> json) =>
      _$QuestionFromJson(json);

  @JsonKey(name: 'id', includeIfNull: true)
  final int? id;
  @JsonKey(name: 'title', includeIfNull: true, defaultValue: '')
  final String? title;
  @JsonKey(name: 'content', includeIfNull: true, defaultValue: '')
  final String? content;
  @JsonKey(name: 'type', includeIfNull: true, defaultValue: '')
  final String? type;
  @JsonKey(name: 'mark', includeIfNull: true)
  final double? mark;
  @JsonKey(name: 'imageUrl', includeIfNull: true, defaultValue: '')
  final String? imageUrl;
  @JsonKey(name: 'videoUrl', includeIfNull: true, defaultValue: '')
  final String? videoUrl;
  @JsonKey(name: 'soundUrl', includeIfNull: true, defaultValue: '')
  final String? soundUrl;
  @JsonKey(name: 'answers', includeIfNull: true, defaultValue: <Answer>[])
  final List<Answer>? answers;
  @JsonKey(name: 'childs', includeIfNull: true, defaultValue: <QuestionChild>[])
  final List<QuestionChild>? childs;
  static const fromJsonFactory = _$QuestionFromJson;
  static const toJsonFactory = _$QuestionToJson;
  Map<String, dynamic> toJson() => _$QuestionToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is Question &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.title, title) ||
                const DeepCollectionEquality().equals(other.title, title)) &&
            (identical(other.content, content) ||
                const DeepCollectionEquality()
                    .equals(other.content, content)) &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)) &&
            (identical(other.mark, mark) ||
                const DeepCollectionEquality().equals(other.mark, mark)) &&
            (identical(other.imageUrl, imageUrl) ||
                const DeepCollectionEquality()
                    .equals(other.imageUrl, imageUrl)) &&
            (identical(other.videoUrl, videoUrl) ||
                const DeepCollectionEquality()
                    .equals(other.videoUrl, videoUrl)) &&
            (identical(other.soundUrl, soundUrl) ||
                const DeepCollectionEquality()
                    .equals(other.soundUrl, soundUrl)) &&
            (identical(other.answers, answers) ||
                const DeepCollectionEquality()
                    .equals(other.answers, answers)) &&
            (identical(other.childs, childs) ||
                const DeepCollectionEquality().equals(other.childs, childs)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(title) ^
      const DeepCollectionEquality().hash(content) ^
      const DeepCollectionEquality().hash(type) ^
      const DeepCollectionEquality().hash(mark) ^
      const DeepCollectionEquality().hash(imageUrl) ^
      const DeepCollectionEquality().hash(videoUrl) ^
      const DeepCollectionEquality().hash(soundUrl) ^
      const DeepCollectionEquality().hash(answers) ^
      const DeepCollectionEquality().hash(childs) ^
      runtimeType.hashCode;
}

extension $QuestionExtension on Question {
  Question copyWith(
      {int? id,
      String? title,
      String? content,
      String? type,
      double? mark,
      String? imageUrl,
      String? videoUrl,
      String? soundUrl,
      List<Answer>? answers,
      List<QuestionChild>? childs}) {
    return Question(
        id: id ?? this.id,
        title: title ?? this.title,
        content: content ?? this.content,
        type: type ?? this.type,
        mark: mark ?? this.mark,
        imageUrl: imageUrl ?? this.imageUrl,
        videoUrl: videoUrl ?? this.videoUrl,
        soundUrl: soundUrl ?? this.soundUrl,
        answers: answers ?? this.answers,
        childs: childs ?? this.childs);
  }
}

@JsonSerializable(explicitToJson: true)
class QuestionCheckResourceBooleanFuncExpression {
  QuestionCheckResourceBooleanFuncExpression({
    this.canReduce,
    this.type,
    this.nodeType,
    this.parameters,
    this.name,
    this.body,
    this.returnType,
    this.tailCall,
  });

  factory QuestionCheckResourceBooleanFuncExpression.fromJson(
          Map<String, dynamic> json) =>
      _$QuestionCheckResourceBooleanFuncExpressionFromJson(json);

  @JsonKey(name: 'canReduce', includeIfNull: true)
  final bool? canReduce;
  @JsonKey(name: 'type', includeIfNull: true)
  final Type? type;
  @JsonKey(
      name: 'nodeType',
      includeIfNull: true,
      toJson: expressionTypeToJson,
      fromJson: expressionTypeFromJson)
  final enums.ExpressionType? nodeType;
  @JsonKey(
      name: 'parameters',
      includeIfNull: true,
      defaultValue: <ParameterExpression>[])
  final List<ParameterExpression>? parameters;
  @JsonKey(name: 'name', includeIfNull: true, defaultValue: '')
  final String? name;
  @JsonKey(name: 'body', includeIfNull: true)
  final Expression? body;
  @JsonKey(name: 'returnType', includeIfNull: true)
  final Type? returnType;
  @JsonKey(name: 'tailCall', includeIfNull: true)
  final bool? tailCall;
  static const fromJsonFactory =
      _$QuestionCheckResourceBooleanFuncExpressionFromJson;
  static const toJsonFactory =
      _$QuestionCheckResourceBooleanFuncExpressionToJson;
  Map<String, dynamic> toJson() =>
      _$QuestionCheckResourceBooleanFuncExpressionToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is QuestionCheckResourceBooleanFuncExpression &&
            (identical(other.canReduce, canReduce) ||
                const DeepCollectionEquality()
                    .equals(other.canReduce, canReduce)) &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)) &&
            (identical(other.nodeType, nodeType) ||
                const DeepCollectionEquality()
                    .equals(other.nodeType, nodeType)) &&
            (identical(other.parameters, parameters) ||
                const DeepCollectionEquality()
                    .equals(other.parameters, parameters)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.body, body) ||
                const DeepCollectionEquality().equals(other.body, body)) &&
            (identical(other.returnType, returnType) ||
                const DeepCollectionEquality()
                    .equals(other.returnType, returnType)) &&
            (identical(other.tailCall, tailCall) ||
                const DeepCollectionEquality()
                    .equals(other.tailCall, tailCall)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(canReduce) ^
      const DeepCollectionEquality().hash(type) ^
      const DeepCollectionEquality().hash(nodeType) ^
      const DeepCollectionEquality().hash(parameters) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(body) ^
      const DeepCollectionEquality().hash(returnType) ^
      const DeepCollectionEquality().hash(tailCall) ^
      runtimeType.hashCode;
}

extension $QuestionCheckResourceBooleanFuncExpressionExtension
    on QuestionCheckResourceBooleanFuncExpression {
  QuestionCheckResourceBooleanFuncExpression copyWith(
      {bool? canReduce,
      Type? type,
      enums.ExpressionType? nodeType,
      List<ParameterExpression>? parameters,
      String? name,
      Expression? body,
      Type? returnType,
      bool? tailCall}) {
    return QuestionCheckResourceBooleanFuncExpression(
        canReduce: canReduce ?? this.canReduce,
        type: type ?? this.type,
        nodeType: nodeType ?? this.nodeType,
        parameters: parameters ?? this.parameters,
        name: name ?? this.name,
        body: body ?? this.body,
        returnType: returnType ?? this.returnType,
        tailCall: tailCall ?? this.tailCall);
  }
}

@JsonSerializable(explicitToJson: true)
class QuestionChild {
  QuestionChild({
    this.id,
    this.title,
    this.content,
    this.type,
    this.mark,
    this.imageUrl,
    this.videoUrl,
    this.soundUrl,
    this.answers,
    this.listAnswers,
    this.childs,
  });

  factory QuestionChild.fromJson(Map<String, dynamic> json) =>
      _$QuestionChildFromJson(json);

  @JsonKey(name: 'id', includeIfNull: true)
  final int? id;
  @JsonKey(name: 'title', includeIfNull: true, defaultValue: '')
  final String? title;
  @JsonKey(name: 'content', includeIfNull: true, defaultValue: '')
  final String? content;
  @JsonKey(name: 'type', includeIfNull: true, defaultValue: '')
  final String? type;
  @JsonKey(name: 'mark', includeIfNull: true)
  final double? mark;
  @JsonKey(name: 'imageUrl', includeIfNull: true, defaultValue: '')
  final String? imageUrl;
  @JsonKey(name: 'videoUrl', includeIfNull: true, defaultValue: '')
  final String? videoUrl;
  @JsonKey(name: 'soundUrl', includeIfNull: true, defaultValue: '')
  final String? soundUrl;
  @JsonKey(name: 'answers', includeIfNull: true, defaultValue: '')
  final String? answers;
  @JsonKey(name: 'listAnswers', includeIfNull: true, defaultValue: <Answer>[])
  final List<Answer>? listAnswers;
  @JsonKey(name: 'childs', includeIfNull: true, defaultValue: <QuestionChild>[])
  final List<QuestionChild>? childs;
  static const fromJsonFactory = _$QuestionChildFromJson;
  static const toJsonFactory = _$QuestionChildToJson;
  Map<String, dynamic> toJson() => _$QuestionChildToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is QuestionChild &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.title, title) ||
                const DeepCollectionEquality().equals(other.title, title)) &&
            (identical(other.content, content) ||
                const DeepCollectionEquality()
                    .equals(other.content, content)) &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)) &&
            (identical(other.mark, mark) ||
                const DeepCollectionEquality().equals(other.mark, mark)) &&
            (identical(other.imageUrl, imageUrl) ||
                const DeepCollectionEquality()
                    .equals(other.imageUrl, imageUrl)) &&
            (identical(other.videoUrl, videoUrl) ||
                const DeepCollectionEquality()
                    .equals(other.videoUrl, videoUrl)) &&
            (identical(other.soundUrl, soundUrl) ||
                const DeepCollectionEquality()
                    .equals(other.soundUrl, soundUrl)) &&
            (identical(other.answers, answers) ||
                const DeepCollectionEquality()
                    .equals(other.answers, answers)) &&
            (identical(other.listAnswers, listAnswers) ||
                const DeepCollectionEquality()
                    .equals(other.listAnswers, listAnswers)) &&
            (identical(other.childs, childs) ||
                const DeepCollectionEquality().equals(other.childs, childs)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(title) ^
      const DeepCollectionEquality().hash(content) ^
      const DeepCollectionEquality().hash(type) ^
      const DeepCollectionEquality().hash(mark) ^
      const DeepCollectionEquality().hash(imageUrl) ^
      const DeepCollectionEquality().hash(videoUrl) ^
      const DeepCollectionEquality().hash(soundUrl) ^
      const DeepCollectionEquality().hash(answers) ^
      const DeepCollectionEquality().hash(listAnswers) ^
      const DeepCollectionEquality().hash(childs) ^
      runtimeType.hashCode;
}

extension $QuestionChildExtension on QuestionChild {
  QuestionChild copyWith(
      {int? id,
      String? title,
      String? content,
      String? type,
      double? mark,
      String? imageUrl,
      String? videoUrl,
      String? soundUrl,
      String? answers,
      List<Answer>? listAnswers,
      List<QuestionChild>? childs}) {
    return QuestionChild(
        id: id ?? this.id,
        title: title ?? this.title,
        content: content ?? this.content,
        type: type ?? this.type,
        mark: mark ?? this.mark,
        imageUrl: imageUrl ?? this.imageUrl,
        videoUrl: videoUrl ?? this.videoUrl,
        soundUrl: soundUrl ?? this.soundUrl,
        answers: answers ?? this.answers,
        listAnswers: listAnswers ?? this.listAnswers,
        childs: childs ?? this.childs);
  }
}

@JsonSerializable(explicitToJson: true)
class QuestionExplainEntity {
  QuestionExplainEntity({
    this.id,
    this.createdBy,
    this.createdDate,
    this.lastModifiedBy,
    this.lastModifiedDate,
    this.questionId,
    this.status,
    this.content,
    this.ownerType,
  });

  factory QuestionExplainEntity.fromJson(Map<String, dynamic> json) =>
      _$QuestionExplainEntityFromJson(json);

  @JsonKey(name: 'id', includeIfNull: true)
  final int? id;
  @JsonKey(name: 'createdBy', includeIfNull: true)
  final int? createdBy;
  @JsonKey(name: 'createdDate', includeIfNull: true)
  final DateTime? createdDate;
  @JsonKey(name: 'lastModifiedBy', includeIfNull: true)
  final int? lastModifiedBy;
  @JsonKey(name: 'lastModifiedDate', includeIfNull: true)
  final DateTime? lastModifiedDate;
  @JsonKey(name: 'questionId', includeIfNull: true)
  final int? questionId;
  @JsonKey(name: 'status', includeIfNull: true)
  final int? status;
  @JsonKey(name: 'content', includeIfNull: true, defaultValue: '')
  final String? content;
  @JsonKey(name: 'ownerType', includeIfNull: true)
  final int? ownerType;
  static const fromJsonFactory = _$QuestionExplainEntityFromJson;
  static const toJsonFactory = _$QuestionExplainEntityToJson;
  Map<String, dynamic> toJson() => _$QuestionExplainEntityToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is QuestionExplainEntity &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.createdBy, createdBy) ||
                const DeepCollectionEquality()
                    .equals(other.createdBy, createdBy)) &&
            (identical(other.createdDate, createdDate) ||
                const DeepCollectionEquality()
                    .equals(other.createdDate, createdDate)) &&
            (identical(other.lastModifiedBy, lastModifiedBy) ||
                const DeepCollectionEquality()
                    .equals(other.lastModifiedBy, lastModifiedBy)) &&
            (identical(other.lastModifiedDate, lastModifiedDate) ||
                const DeepCollectionEquality()
                    .equals(other.lastModifiedDate, lastModifiedDate)) &&
            (identical(other.questionId, questionId) ||
                const DeepCollectionEquality()
                    .equals(other.questionId, questionId)) &&
            (identical(other.status, status) ||
                const DeepCollectionEquality().equals(other.status, status)) &&
            (identical(other.content, content) ||
                const DeepCollectionEquality()
                    .equals(other.content, content)) &&
            (identical(other.ownerType, ownerType) ||
                const DeepCollectionEquality()
                    .equals(other.ownerType, ownerType)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(createdBy) ^
      const DeepCollectionEquality().hash(createdDate) ^
      const DeepCollectionEquality().hash(lastModifiedBy) ^
      const DeepCollectionEquality().hash(lastModifiedDate) ^
      const DeepCollectionEquality().hash(questionId) ^
      const DeepCollectionEquality().hash(status) ^
      const DeepCollectionEquality().hash(content) ^
      const DeepCollectionEquality().hash(ownerType) ^
      runtimeType.hashCode;
}

extension $QuestionExplainEntityExtension on QuestionExplainEntity {
  QuestionExplainEntity copyWith(
      {int? id,
      int? createdBy,
      DateTime? createdDate,
      int? lastModifiedBy,
      DateTime? lastModifiedDate,
      int? questionId,
      int? status,
      String? content,
      int? ownerType}) {
    return QuestionExplainEntity(
        id: id ?? this.id,
        createdBy: createdBy ?? this.createdBy,
        createdDate: createdDate ?? this.createdDate,
        lastModifiedBy: lastModifiedBy ?? this.lastModifiedBy,
        lastModifiedDate: lastModifiedDate ?? this.lastModifiedDate,
        questionId: questionId ?? this.questionId,
        status: status ?? this.status,
        content: content ?? this.content,
        ownerType: ownerType ?? this.ownerType);
  }
}

@JsonSerializable(explicitToJson: true)
class QuestionExplainFilterResource {
  QuestionExplainFilterResource({
    this.sortExpression,
    this.pageSize,
    this.pageIndex,
    this.questionId,
    this.keyWord,
    this.status,
    this.ownerType,
  });

  factory QuestionExplainFilterResource.fromJson(Map<String, dynamic> json) =>
      _$QuestionExplainFilterResourceFromJson(json);

  @JsonKey(name: 'sortExpression', includeIfNull: true, defaultValue: '')
  final String? sortExpression;
  @JsonKey(name: 'pageSize', includeIfNull: true)
  final int? pageSize;
  @JsonKey(name: 'pageIndex', includeIfNull: true)
  final int? pageIndex;
  @JsonKey(name: 'questionId', includeIfNull: true)
  final int? questionId;
  @JsonKey(name: 'keyWord', includeIfNull: true, defaultValue: '')
  final String? keyWord;
  @JsonKey(name: 'status', includeIfNull: true)
  final int? status;
  @JsonKey(name: 'ownerType', includeIfNull: true)
  final int? ownerType;
  static const fromJsonFactory = _$QuestionExplainFilterResourceFromJson;
  static const toJsonFactory = _$QuestionExplainFilterResourceToJson;
  Map<String, dynamic> toJson() => _$QuestionExplainFilterResourceToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is QuestionExplainFilterResource &&
            (identical(other.sortExpression, sortExpression) ||
                const DeepCollectionEquality()
                    .equals(other.sortExpression, sortExpression)) &&
            (identical(other.pageSize, pageSize) ||
                const DeepCollectionEquality()
                    .equals(other.pageSize, pageSize)) &&
            (identical(other.pageIndex, pageIndex) ||
                const DeepCollectionEquality()
                    .equals(other.pageIndex, pageIndex)) &&
            (identical(other.questionId, questionId) ||
                const DeepCollectionEquality()
                    .equals(other.questionId, questionId)) &&
            (identical(other.keyWord, keyWord) ||
                const DeepCollectionEquality()
                    .equals(other.keyWord, keyWord)) &&
            (identical(other.status, status) ||
                const DeepCollectionEquality().equals(other.status, status)) &&
            (identical(other.ownerType, ownerType) ||
                const DeepCollectionEquality()
                    .equals(other.ownerType, ownerType)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(sortExpression) ^
      const DeepCollectionEquality().hash(pageSize) ^
      const DeepCollectionEquality().hash(pageIndex) ^
      const DeepCollectionEquality().hash(questionId) ^
      const DeepCollectionEquality().hash(keyWord) ^
      const DeepCollectionEquality().hash(status) ^
      const DeepCollectionEquality().hash(ownerType) ^
      runtimeType.hashCode;
}

extension $QuestionExplainFilterResourceExtension
    on QuestionExplainFilterResource {
  QuestionExplainFilterResource copyWith(
      {String? sortExpression,
      int? pageSize,
      int? pageIndex,
      int? questionId,
      String? keyWord,
      int? status,
      int? ownerType}) {
    return QuestionExplainFilterResource(
        sortExpression: sortExpression ?? this.sortExpression,
        pageSize: pageSize ?? this.pageSize,
        pageIndex: pageIndex ?? this.pageIndex,
        questionId: questionId ?? this.questionId,
        keyWord: keyWord ?? this.keyWord,
        status: status ?? this.status,
        ownerType: ownerType ?? this.ownerType);
  }
}

@JsonSerializable(explicitToJson: true)
class QuestionExplainPublicResource {
  QuestionExplainPublicResource({
    this.id,
    this.questionId,
    this.content,
    this.status,
    this.createdBy,
    this.createdDate,
    this.ownerType,
    this.user,
    this.likeNumber,
    this.dislikeNumber,
    this.isLike,
    this.isExplainOfMe,
  });

  factory QuestionExplainPublicResource.fromJson(Map<String, dynamic> json) =>
      _$QuestionExplainPublicResourceFromJson(json);

  @JsonKey(name: 'id', includeIfNull: true)
  final int? id;
  @JsonKey(name: 'questionId', includeIfNull: true)
  final int? questionId;
  @JsonKey(name: 'content', includeIfNull: true, defaultValue: '')
  final String? content;
  @JsonKey(name: 'status', includeIfNull: true)
  final int? status;
  @JsonKey(name: 'createdBy', includeIfNull: true)
  final int? createdBy;
  @JsonKey(name: 'createdDate', includeIfNull: true)
  final DateTime? createdDate;
  @JsonKey(name: 'ownerType', includeIfNull: true)
  final int? ownerType;
  @JsonKey(name: 'user', includeIfNull: true)
  final SimpleUserEntity? user;
  @JsonKey(name: 'likeNumber', includeIfNull: true)
  final int? likeNumber;
  @JsonKey(name: 'dislikeNumber', includeIfNull: true)
  final int? dislikeNumber;
  @JsonKey(name: 'isLike', includeIfNull: true)
  final bool? isLike;
  @JsonKey(name: 'isExplainOfMe', includeIfNull: true)
  final bool? isExplainOfMe;
  static const fromJsonFactory = _$QuestionExplainPublicResourceFromJson;
  static const toJsonFactory = _$QuestionExplainPublicResourceToJson;
  Map<String, dynamic> toJson() => _$QuestionExplainPublicResourceToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is QuestionExplainPublicResource &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.questionId, questionId) ||
                const DeepCollectionEquality()
                    .equals(other.questionId, questionId)) &&
            (identical(other.content, content) ||
                const DeepCollectionEquality()
                    .equals(other.content, content)) &&
            (identical(other.status, status) ||
                const DeepCollectionEquality().equals(other.status, status)) &&
            (identical(other.createdBy, createdBy) ||
                const DeepCollectionEquality()
                    .equals(other.createdBy, createdBy)) &&
            (identical(other.createdDate, createdDate) ||
                const DeepCollectionEquality()
                    .equals(other.createdDate, createdDate)) &&
            (identical(other.ownerType, ownerType) ||
                const DeepCollectionEquality()
                    .equals(other.ownerType, ownerType)) &&
            (identical(other.user, user) ||
                const DeepCollectionEquality().equals(other.user, user)) &&
            (identical(other.likeNumber, likeNumber) ||
                const DeepCollectionEquality()
                    .equals(other.likeNumber, likeNumber)) &&
            (identical(other.dislikeNumber, dislikeNumber) ||
                const DeepCollectionEquality()
                    .equals(other.dislikeNumber, dislikeNumber)) &&
            (identical(other.isLike, isLike) ||
                const DeepCollectionEquality().equals(other.isLike, isLike)) &&
            (identical(other.isExplainOfMe, isExplainOfMe) ||
                const DeepCollectionEquality()
                    .equals(other.isExplainOfMe, isExplainOfMe)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(questionId) ^
      const DeepCollectionEquality().hash(content) ^
      const DeepCollectionEquality().hash(status) ^
      const DeepCollectionEquality().hash(createdBy) ^
      const DeepCollectionEquality().hash(createdDate) ^
      const DeepCollectionEquality().hash(ownerType) ^
      const DeepCollectionEquality().hash(user) ^
      const DeepCollectionEquality().hash(likeNumber) ^
      const DeepCollectionEquality().hash(dislikeNumber) ^
      const DeepCollectionEquality().hash(isLike) ^
      const DeepCollectionEquality().hash(isExplainOfMe) ^
      runtimeType.hashCode;
}

extension $QuestionExplainPublicResourceExtension
    on QuestionExplainPublicResource {
  QuestionExplainPublicResource copyWith(
      {int? id,
      int? questionId,
      String? content,
      int? status,
      int? createdBy,
      DateTime? createdDate,
      int? ownerType,
      SimpleUserEntity? user,
      int? likeNumber,
      int? dislikeNumber,
      bool? isLike,
      bool? isExplainOfMe}) {
    return QuestionExplainPublicResource(
        id: id ?? this.id,
        questionId: questionId ?? this.questionId,
        content: content ?? this.content,
        status: status ?? this.status,
        createdBy: createdBy ?? this.createdBy,
        createdDate: createdDate ?? this.createdDate,
        ownerType: ownerType ?? this.ownerType,
        user: user ?? this.user,
        likeNumber: likeNumber ?? this.likeNumber,
        dislikeNumber: dislikeNumber ?? this.dislikeNumber,
        isLike: isLike ?? this.isLike,
        isExplainOfMe: isExplainOfMe ?? this.isExplainOfMe);
  }
}

@JsonSerializable(explicitToJson: true)
class QuestionExplainPublicResourceFilterResult {
  QuestionExplainPublicResourceFilterResult({
    this.totalRows,
    this.data,
  });

  factory QuestionExplainPublicResourceFilterResult.fromJson(
          Map<String, dynamic> json) =>
      _$QuestionExplainPublicResourceFilterResultFromJson(json);

  @JsonKey(name: 'totalRows', includeIfNull: true)
  final int? totalRows;
  @JsonKey(
      name: 'data',
      includeIfNull: true,
      defaultValue: <QuestionExplainPublicResource>[])
  final List<QuestionExplainPublicResource>? data;
  static const fromJsonFactory =
      _$QuestionExplainPublicResourceFilterResultFromJson;
  static const toJsonFactory =
      _$QuestionExplainPublicResourceFilterResultToJson;
  Map<String, dynamic> toJson() =>
      _$QuestionExplainPublicResourceFilterResultToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is QuestionExplainPublicResourceFilterResult &&
            (identical(other.totalRows, totalRows) ||
                const DeepCollectionEquality()
                    .equals(other.totalRows, totalRows)) &&
            (identical(other.data, data) ||
                const DeepCollectionEquality().equals(other.data, data)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(totalRows) ^
      const DeepCollectionEquality().hash(data) ^
      runtimeType.hashCode;
}

extension $QuestionExplainPublicResourceFilterResultExtension
    on QuestionExplainPublicResourceFilterResult {
  QuestionExplainPublicResourceFilterResult copyWith(
      {int? totalRows, List<QuestionExplainPublicResource>? data}) {
    return QuestionExplainPublicResourceFilterResult(
        totalRows: totalRows ?? this.totalRows, data: data ?? this.data);
  }
}

@JsonSerializable(explicitToJson: true)
class QuestionExplainResource {
  QuestionExplainResource({
    this.id,
    this.questionId,
    this.content,
    this.status,
    this.mark,
    this.createdBy,
    this.createdDate,
  });

  factory QuestionExplainResource.fromJson(Map<String, dynamic> json) =>
      _$QuestionExplainResourceFromJson(json);

  @JsonKey(name: 'id', includeIfNull: true)
  final int? id;
  @JsonKey(name: 'questionId', includeIfNull: true)
  final int? questionId;
  @JsonKey(name: 'content', includeIfNull: true, defaultValue: '')
  final String? content;
  @JsonKey(name: 'status', includeIfNull: true)
  final int? status;
  @JsonKey(name: 'mark', includeIfNull: true)
  final int? mark;
  @JsonKey(name: 'createdBy', includeIfNull: true)
  final int? createdBy;
  @JsonKey(name: 'createdDate', includeIfNull: true)
  final DateTime? createdDate;
  static const fromJsonFactory = _$QuestionExplainResourceFromJson;
  static const toJsonFactory = _$QuestionExplainResourceToJson;
  Map<String, dynamic> toJson() => _$QuestionExplainResourceToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is QuestionExplainResource &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.questionId, questionId) ||
                const DeepCollectionEquality()
                    .equals(other.questionId, questionId)) &&
            (identical(other.content, content) ||
                const DeepCollectionEquality()
                    .equals(other.content, content)) &&
            (identical(other.status, status) ||
                const DeepCollectionEquality().equals(other.status, status)) &&
            (identical(other.mark, mark) ||
                const DeepCollectionEquality().equals(other.mark, mark)) &&
            (identical(other.createdBy, createdBy) ||
                const DeepCollectionEquality()
                    .equals(other.createdBy, createdBy)) &&
            (identical(other.createdDate, createdDate) ||
                const DeepCollectionEquality()
                    .equals(other.createdDate, createdDate)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(questionId) ^
      const DeepCollectionEquality().hash(content) ^
      const DeepCollectionEquality().hash(status) ^
      const DeepCollectionEquality().hash(mark) ^
      const DeepCollectionEquality().hash(createdBy) ^
      const DeepCollectionEquality().hash(createdDate) ^
      runtimeType.hashCode;
}

extension $QuestionExplainResourceExtension on QuestionExplainResource {
  QuestionExplainResource copyWith(
      {int? id,
      int? questionId,
      String? content,
      int? status,
      int? mark,
      int? createdBy,
      DateTime? createdDate}) {
    return QuestionExplainResource(
        id: id ?? this.id,
        questionId: questionId ?? this.questionId,
        content: content ?? this.content,
        status: status ?? this.status,
        mark: mark ?? this.mark,
        createdBy: createdBy ?? this.createdBy,
        createdDate: createdDate ?? this.createdDate);
  }
}

@JsonSerializable(explicitToJson: true)
class QuestionHistoryResource {
  QuestionHistoryResource({
    this.id,
    this.isHistory,
    this.modifiedDay,
    this.createdBy,
    this.moderationStatus,
    this.moderationNote,
  });

  factory QuestionHistoryResource.fromJson(Map<String, dynamic> json) =>
      _$QuestionHistoryResourceFromJson(json);

  @JsonKey(name: 'id', includeIfNull: true)
  final int? id;
  @JsonKey(name: 'isHistory', includeIfNull: true)
  final bool? isHistory;
  @JsonKey(name: 'modifiedDay', includeIfNull: true)
  final DateTime? modifiedDay;
  @JsonKey(name: 'createdBy', includeIfNull: true)
  final int? createdBy;
  @JsonKey(name: 'moderationStatus', includeIfNull: true)
  final int? moderationStatus;
  @JsonKey(name: 'moderationNote', includeIfNull: true, defaultValue: '')
  final String? moderationNote;
  static const fromJsonFactory = _$QuestionHistoryResourceFromJson;
  static const toJsonFactory = _$QuestionHistoryResourceToJson;
  Map<String, dynamic> toJson() => _$QuestionHistoryResourceToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is QuestionHistoryResource &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.isHistory, isHistory) ||
                const DeepCollectionEquality()
                    .equals(other.isHistory, isHistory)) &&
            (identical(other.modifiedDay, modifiedDay) ||
                const DeepCollectionEquality()
                    .equals(other.modifiedDay, modifiedDay)) &&
            (identical(other.createdBy, createdBy) ||
                const DeepCollectionEquality()
                    .equals(other.createdBy, createdBy)) &&
            (identical(other.moderationStatus, moderationStatus) ||
                const DeepCollectionEquality()
                    .equals(other.moderationStatus, moderationStatus)) &&
            (identical(other.moderationNote, moderationNote) ||
                const DeepCollectionEquality()
                    .equals(other.moderationNote, moderationNote)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(isHistory) ^
      const DeepCollectionEquality().hash(modifiedDay) ^
      const DeepCollectionEquality().hash(createdBy) ^
      const DeepCollectionEquality().hash(moderationStatus) ^
      const DeepCollectionEquality().hash(moderationNote) ^
      runtimeType.hashCode;
}

extension $QuestionHistoryResourceExtension on QuestionHistoryResource {
  QuestionHistoryResource copyWith(
      {int? id,
      bool? isHistory,
      DateTime? modifiedDay,
      int? createdBy,
      int? moderationStatus,
      String? moderationNote}) {
    return QuestionHistoryResource(
        id: id ?? this.id,
        isHistory: isHistory ?? this.isHistory,
        modifiedDay: modifiedDay ?? this.modifiedDay,
        createdBy: createdBy ?? this.createdBy,
        moderationStatus: moderationStatus ?? this.moderationStatus,
        moderationNote: moderationNote ?? this.moderationNote);
  }
}

@JsonSerializable(explicitToJson: true)
class QuestionInExam {
  QuestionInExam({
    this.id,
    this.title,
    this.content,
    this.answers,
  });

  factory QuestionInExam.fromJson(Map<String, dynamic> json) =>
      _$QuestionInExamFromJson(json);

  @JsonKey(name: 'id', includeIfNull: true)
  final int? id;
  @JsonKey(name: 'title', includeIfNull: true, defaultValue: '')
  final String? title;
  @JsonKey(name: 'content', includeIfNull: true, defaultValue: '')
  final String? content;
  @JsonKey(name: 'answers', includeIfNull: true, defaultValue: <AnswerInExam>[])
  final List<AnswerInExam>? answers;
  static const fromJsonFactory = _$QuestionInExamFromJson;
  static const toJsonFactory = _$QuestionInExamToJson;
  Map<String, dynamic> toJson() => _$QuestionInExamToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is QuestionInExam &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.title, title) ||
                const DeepCollectionEquality().equals(other.title, title)) &&
            (identical(other.content, content) ||
                const DeepCollectionEquality()
                    .equals(other.content, content)) &&
            (identical(other.answers, answers) ||
                const DeepCollectionEquality().equals(other.answers, answers)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(title) ^
      const DeepCollectionEquality().hash(content) ^
      const DeepCollectionEquality().hash(answers) ^
      runtimeType.hashCode;
}

extension $QuestionInExamExtension on QuestionInExam {
  QuestionInExam copyWith(
      {int? id, String? title, String? content, List<AnswerInExam>? answers}) {
    return QuestionInExam(
        id: id ?? this.id,
        title: title ?? this.title,
        content: content ?? this.content,
        answers: answers ?? this.answers);
  }
}

@JsonSerializable(explicitToJson: true)
class QuestionJoinQuestionExplain {
  QuestionJoinQuestionExplain({
    this.id,
    this.questionId,
    this.questionTitle,
    this.content,
    this.status,
    this.mark,
    this.ownerType,
    this.createdBy,
    this.createdDate,
  });

  factory QuestionJoinQuestionExplain.fromJson(Map<String, dynamic> json) =>
      _$QuestionJoinQuestionExplainFromJson(json);

  @JsonKey(name: 'id', includeIfNull: true)
  final int? id;
  @JsonKey(name: 'questionId', includeIfNull: true)
  final int? questionId;
  @JsonKey(name: 'questionTitle', includeIfNull: true, defaultValue: '')
  final String? questionTitle;
  @JsonKey(name: 'content', includeIfNull: true, defaultValue: '')
  final String? content;
  @JsonKey(name: 'status', includeIfNull: true)
  final int? status;
  @JsonKey(name: 'mark', includeIfNull: true)
  final int? mark;
  @JsonKey(name: 'ownerType', includeIfNull: true)
  final int? ownerType;
  @JsonKey(name: 'createdBy', includeIfNull: true)
  final int? createdBy;
  @JsonKey(name: 'createdDate', includeIfNull: true)
  final DateTime? createdDate;
  static const fromJsonFactory = _$QuestionJoinQuestionExplainFromJson;
  static const toJsonFactory = _$QuestionJoinQuestionExplainToJson;
  Map<String, dynamic> toJson() => _$QuestionJoinQuestionExplainToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is QuestionJoinQuestionExplain &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.questionId, questionId) ||
                const DeepCollectionEquality()
                    .equals(other.questionId, questionId)) &&
            (identical(other.questionTitle, questionTitle) ||
                const DeepCollectionEquality()
                    .equals(other.questionTitle, questionTitle)) &&
            (identical(other.content, content) ||
                const DeepCollectionEquality()
                    .equals(other.content, content)) &&
            (identical(other.status, status) ||
                const DeepCollectionEquality().equals(other.status, status)) &&
            (identical(other.mark, mark) ||
                const DeepCollectionEquality().equals(other.mark, mark)) &&
            (identical(other.ownerType, ownerType) ||
                const DeepCollectionEquality()
                    .equals(other.ownerType, ownerType)) &&
            (identical(other.createdBy, createdBy) ||
                const DeepCollectionEquality()
                    .equals(other.createdBy, createdBy)) &&
            (identical(other.createdDate, createdDate) ||
                const DeepCollectionEquality()
                    .equals(other.createdDate, createdDate)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(questionId) ^
      const DeepCollectionEquality().hash(questionTitle) ^
      const DeepCollectionEquality().hash(content) ^
      const DeepCollectionEquality().hash(status) ^
      const DeepCollectionEquality().hash(mark) ^
      const DeepCollectionEquality().hash(ownerType) ^
      const DeepCollectionEquality().hash(createdBy) ^
      const DeepCollectionEquality().hash(createdDate) ^
      runtimeType.hashCode;
}

extension $QuestionJoinQuestionExplainExtension on QuestionJoinQuestionExplain {
  QuestionJoinQuestionExplain copyWith(
      {int? id,
      int? questionId,
      String? questionTitle,
      String? content,
      int? status,
      int? mark,
      int? ownerType,
      int? createdBy,
      DateTime? createdDate}) {
    return QuestionJoinQuestionExplain(
        id: id ?? this.id,
        questionId: questionId ?? this.questionId,
        questionTitle: questionTitle ?? this.questionTitle,
        content: content ?? this.content,
        status: status ?? this.status,
        mark: mark ?? this.mark,
        ownerType: ownerType ?? this.ownerType,
        createdBy: createdBy ?? this.createdBy,
        createdDate: createdDate ?? this.createdDate);
  }
}

@JsonSerializable(explicitToJson: true)
class QuestionModerationModelResource {
  QuestionModerationModelResource({
    this.content,
    this.status,
  });

  factory QuestionModerationModelResource.fromJson(Map<String, dynamic> json) =>
      _$QuestionModerationModelResourceFromJson(json);

  @JsonKey(name: 'content', includeIfNull: true, defaultValue: '')
  final String? content;
  @JsonKey(name: 'status', includeIfNull: true)
  final int? status;
  static const fromJsonFactory = _$QuestionModerationModelResourceFromJson;
  static const toJsonFactory = _$QuestionModerationModelResourceToJson;
  Map<String, dynamic> toJson() =>
      _$QuestionModerationModelResourceToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is QuestionModerationModelResource &&
            (identical(other.content, content) ||
                const DeepCollectionEquality()
                    .equals(other.content, content)) &&
            (identical(other.status, status) ||
                const DeepCollectionEquality().equals(other.status, status)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(content) ^
      const DeepCollectionEquality().hash(status) ^
      runtimeType.hashCode;
}

extension $QuestionModerationModelResourceExtension
    on QuestionModerationModelResource {
  QuestionModerationModelResource copyWith({String? content, int? status}) {
    return QuestionModerationModelResource(
        content: content ?? this.content, status: status ?? this.status);
  }
}

@JsonSerializable(explicitToJson: true)
class QuestionResource {
  QuestionResource({
    this.id,
    this.parentId,
    this.title,
    this.content,
    this.categoryIds,
    this.propertyDetails,
    this.categoryName,
    this.propertyName,
    this.level,
    this.status,
    this.moderationStatus,
    this.ownerType,
    this.lastModifiedDate,
    this.type,
    this.versionId,
    this.createdBy,
    this.createdDate,
    this.editedBy,
    this.publishedBy,
    this.isFree,
    this.hasImage,
    this.hasVideo,
    this.hasAudio,
    this.store,
    this.questionExplains,
    this.levelName,
  });

  factory QuestionResource.fromJson(Map<String, dynamic> json) =>
      _$QuestionResourceFromJson(json);

  @JsonKey(name: 'id', includeIfNull: true)
  final int? id;
  @JsonKey(name: 'parentId', includeIfNull: true)
  final int? parentId;
  @JsonKey(name: 'title', includeIfNull: true, defaultValue: '')
  final String? title;
  @JsonKey(name: 'content', includeIfNull: true, defaultValue: '')
  final String? content;
  @JsonKey(name: 'categoryIds', includeIfNull: true, defaultValue: <int>[])
  final List<int>? categoryIds;
  @JsonKey(name: 'propertyDetails', includeIfNull: true, defaultValue: <int>[])
  final List<int>? propertyDetails;
  @JsonKey(name: 'categoryName', includeIfNull: true, defaultValue: '')
  final String? categoryName;
  @JsonKey(name: 'propertyName', includeIfNull: true, defaultValue: '')
  final String? propertyName;
  @JsonKey(name: 'level', includeIfNull: true)
  final int? level;
  @JsonKey(name: 'status', includeIfNull: true)
  final int? status;
  @JsonKey(name: 'moderationStatus', includeIfNull: true)
  final int? moderationStatus;
  @JsonKey(name: 'ownerType', includeIfNull: true)
  final int? ownerType;
  @JsonKey(name: 'lastModifiedDate', includeIfNull: true)
  final DateTime? lastModifiedDate;
  @JsonKey(name: 'type', includeIfNull: true, defaultValue: '')
  final String? type;
  @JsonKey(name: 'versionId', includeIfNull: true)
  final int? versionId;
  @JsonKey(name: 'createdBy', includeIfNull: true)
  final int? createdBy;
  @JsonKey(name: 'createdDate', includeIfNull: true)
  final DateTime? createdDate;
  @JsonKey(name: 'editedBy', includeIfNull: true)
  final int? editedBy;
  @JsonKey(name: 'publishedBy', includeIfNull: true)
  final int? publishedBy;
  @JsonKey(name: 'isFree', includeIfNull: true)
  final bool? isFree;
  @JsonKey(name: 'hasImage', includeIfNull: true)
  final bool? hasImage;
  @JsonKey(name: 'hasVideo', includeIfNull: true)
  final bool? hasVideo;
  @JsonKey(name: 'hasAudio', includeIfNull: true)
  final bool? hasAudio;
  @JsonKey(name: 'store', includeIfNull: true)
  final int? store;
  @JsonKey(
      name: 'questionExplains',
      includeIfNull: true,
      defaultValue: <SaveQuestionExplainResouce>[])
  final List<SaveQuestionExplainResouce>? questionExplains;
  @JsonKey(name: 'levelName', includeIfNull: true, defaultValue: '')
  final String? levelName;
  static const fromJsonFactory = _$QuestionResourceFromJson;
  static const toJsonFactory = _$QuestionResourceToJson;
  Map<String, dynamic> toJson() => _$QuestionResourceToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is QuestionResource &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.parentId, parentId) ||
                const DeepCollectionEquality()
                    .equals(other.parentId, parentId)) &&
            (identical(other.title, title) ||
                const DeepCollectionEquality().equals(other.title, title)) &&
            (identical(other.content, content) ||
                const DeepCollectionEquality()
                    .equals(other.content, content)) &&
            (identical(other.categoryIds, categoryIds) ||
                const DeepCollectionEquality()
                    .equals(other.categoryIds, categoryIds)) &&
            (identical(other.propertyDetails, propertyDetails) ||
                const DeepCollectionEquality()
                    .equals(other.propertyDetails, propertyDetails)) &&
            (identical(other.categoryName, categoryName) ||
                const DeepCollectionEquality()
                    .equals(other.categoryName, categoryName)) &&
            (identical(other.propertyName, propertyName) ||
                const DeepCollectionEquality()
                    .equals(other.propertyName, propertyName)) &&
            (identical(other.level, level) ||
                const DeepCollectionEquality().equals(other.level, level)) &&
            (identical(other.status, status) ||
                const DeepCollectionEquality().equals(other.status, status)) &&
            (identical(other.moderationStatus, moderationStatus) ||
                const DeepCollectionEquality()
                    .equals(other.moderationStatus, moderationStatus)) &&
            (identical(other.ownerType, ownerType) ||
                const DeepCollectionEquality()
                    .equals(other.ownerType, ownerType)) &&
            (identical(other.lastModifiedDate, lastModifiedDate) ||
                const DeepCollectionEquality()
                    .equals(other.lastModifiedDate, lastModifiedDate)) &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)) &&
            (identical(other.versionId, versionId) ||
                const DeepCollectionEquality()
                    .equals(other.versionId, versionId)) &&
            (identical(other.createdBy, createdBy) ||
                const DeepCollectionEquality()
                    .equals(other.createdBy, createdBy)) &&
            (identical(other.createdDate, createdDate) ||
                const DeepCollectionEquality()
                    .equals(other.createdDate, createdDate)) &&
            (identical(other.editedBy, editedBy) ||
                const DeepCollectionEquality()
                    .equals(other.editedBy, editedBy)) &&
            (identical(other.publishedBy, publishedBy) ||
                const DeepCollectionEquality()
                    .equals(other.publishedBy, publishedBy)) &&
            (identical(other.isFree, isFree) ||
                const DeepCollectionEquality().equals(other.isFree, isFree)) &&
            (identical(other.hasImage, hasImage) ||
                const DeepCollectionEquality()
                    .equals(other.hasImage, hasImage)) &&
            (identical(other.hasVideo, hasVideo) ||
                const DeepCollectionEquality()
                    .equals(other.hasVideo, hasVideo)) &&
            (identical(other.hasAudio, hasAudio) ||
                const DeepCollectionEquality()
                    .equals(other.hasAudio, hasAudio)) &&
            (identical(other.store, store) ||
                const DeepCollectionEquality().equals(other.store, store)) &&
            (identical(other.questionExplains, questionExplains) ||
                const DeepCollectionEquality()
                    .equals(other.questionExplains, questionExplains)) &&
            (identical(other.levelName, levelName) || const DeepCollectionEquality().equals(other.levelName, levelName)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(parentId) ^
      const DeepCollectionEquality().hash(title) ^
      const DeepCollectionEquality().hash(content) ^
      const DeepCollectionEquality().hash(categoryIds) ^
      const DeepCollectionEquality().hash(propertyDetails) ^
      const DeepCollectionEquality().hash(categoryName) ^
      const DeepCollectionEquality().hash(propertyName) ^
      const DeepCollectionEquality().hash(level) ^
      const DeepCollectionEquality().hash(status) ^
      const DeepCollectionEquality().hash(moderationStatus) ^
      const DeepCollectionEquality().hash(ownerType) ^
      const DeepCollectionEquality().hash(lastModifiedDate) ^
      const DeepCollectionEquality().hash(type) ^
      const DeepCollectionEquality().hash(versionId) ^
      const DeepCollectionEquality().hash(createdBy) ^
      const DeepCollectionEquality().hash(createdDate) ^
      const DeepCollectionEquality().hash(editedBy) ^
      const DeepCollectionEquality().hash(publishedBy) ^
      const DeepCollectionEquality().hash(isFree) ^
      const DeepCollectionEquality().hash(hasImage) ^
      const DeepCollectionEquality().hash(hasVideo) ^
      const DeepCollectionEquality().hash(hasAudio) ^
      const DeepCollectionEquality().hash(store) ^
      const DeepCollectionEquality().hash(questionExplains) ^
      const DeepCollectionEquality().hash(levelName) ^
      runtimeType.hashCode;
}

extension $QuestionResourceExtension on QuestionResource {
  QuestionResource copyWith(
      {int? id,
      int? parentId,
      String? title,
      String? content,
      List<int>? categoryIds,
      List<int>? propertyDetails,
      String? categoryName,
      String? propertyName,
      int? level,
      int? status,
      int? moderationStatus,
      int? ownerType,
      DateTime? lastModifiedDate,
      String? type,
      int? versionId,
      int? createdBy,
      DateTime? createdDate,
      int? editedBy,
      int? publishedBy,
      bool? isFree,
      bool? hasImage,
      bool? hasVideo,
      bool? hasAudio,
      int? store,
      List<SaveQuestionExplainResouce>? questionExplains,
      String? levelName}) {
    return QuestionResource(
        id: id ?? this.id,
        parentId: parentId ?? this.parentId,
        title: title ?? this.title,
        content: content ?? this.content,
        categoryIds: categoryIds ?? this.categoryIds,
        propertyDetails: propertyDetails ?? this.propertyDetails,
        categoryName: categoryName ?? this.categoryName,
        propertyName: propertyName ?? this.propertyName,
        level: level ?? this.level,
        status: status ?? this.status,
        moderationStatus: moderationStatus ?? this.moderationStatus,
        ownerType: ownerType ?? this.ownerType,
        lastModifiedDate: lastModifiedDate ?? this.lastModifiedDate,
        type: type ?? this.type,
        versionId: versionId ?? this.versionId,
        createdBy: createdBy ?? this.createdBy,
        createdDate: createdDate ?? this.createdDate,
        editedBy: editedBy ?? this.editedBy,
        publishedBy: publishedBy ?? this.publishedBy,
        isFree: isFree ?? this.isFree,
        hasImage: hasImage ?? this.hasImage,
        hasVideo: hasVideo ?? this.hasVideo,
        hasAudio: hasAudio ?? this.hasAudio,
        store: store ?? this.store,
        questionExplains: questionExplains ?? this.questionExplains,
        levelName: levelName ?? this.levelName);
  }
}

@JsonSerializable(explicitToJson: true)
class QuestionResourceBooleanFuncExpression {
  QuestionResourceBooleanFuncExpression({
    this.canReduce,
    this.type,
    this.nodeType,
    this.parameters,
    this.name,
    this.body,
    this.returnType,
    this.tailCall,
  });

  factory QuestionResourceBooleanFuncExpression.fromJson(
          Map<String, dynamic> json) =>
      _$QuestionResourceBooleanFuncExpressionFromJson(json);

  @JsonKey(name: 'canReduce', includeIfNull: true)
  final bool? canReduce;
  @JsonKey(name: 'type', includeIfNull: true)
  final Type? type;
  @JsonKey(
      name: 'nodeType',
      includeIfNull: true,
      toJson: expressionTypeToJson,
      fromJson: expressionTypeFromJson)
  final enums.ExpressionType? nodeType;
  @JsonKey(
      name: 'parameters',
      includeIfNull: true,
      defaultValue: <ParameterExpression>[])
  final List<ParameterExpression>? parameters;
  @JsonKey(name: 'name', includeIfNull: true, defaultValue: '')
  final String? name;
  @JsonKey(name: 'body', includeIfNull: true)
  final Expression? body;
  @JsonKey(name: 'returnType', includeIfNull: true)
  final Type? returnType;
  @JsonKey(name: 'tailCall', includeIfNull: true)
  final bool? tailCall;
  static const fromJsonFactory =
      _$QuestionResourceBooleanFuncExpressionFromJson;
  static const toJsonFactory = _$QuestionResourceBooleanFuncExpressionToJson;
  Map<String, dynamic> toJson() =>
      _$QuestionResourceBooleanFuncExpressionToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is QuestionResourceBooleanFuncExpression &&
            (identical(other.canReduce, canReduce) ||
                const DeepCollectionEquality()
                    .equals(other.canReduce, canReduce)) &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)) &&
            (identical(other.nodeType, nodeType) ||
                const DeepCollectionEquality()
                    .equals(other.nodeType, nodeType)) &&
            (identical(other.parameters, parameters) ||
                const DeepCollectionEquality()
                    .equals(other.parameters, parameters)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.body, body) ||
                const DeepCollectionEquality().equals(other.body, body)) &&
            (identical(other.returnType, returnType) ||
                const DeepCollectionEquality()
                    .equals(other.returnType, returnType)) &&
            (identical(other.tailCall, tailCall) ||
                const DeepCollectionEquality()
                    .equals(other.tailCall, tailCall)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(canReduce) ^
      const DeepCollectionEquality().hash(type) ^
      const DeepCollectionEquality().hash(nodeType) ^
      const DeepCollectionEquality().hash(parameters) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(body) ^
      const DeepCollectionEquality().hash(returnType) ^
      const DeepCollectionEquality().hash(tailCall) ^
      runtimeType.hashCode;
}

extension $QuestionResourceBooleanFuncExpressionExtension
    on QuestionResourceBooleanFuncExpression {
  QuestionResourceBooleanFuncExpression copyWith(
      {bool? canReduce,
      Type? type,
      enums.ExpressionType? nodeType,
      List<ParameterExpression>? parameters,
      String? name,
      Expression? body,
      Type? returnType,
      bool? tailCall}) {
    return QuestionResourceBooleanFuncExpression(
        canReduce: canReduce ?? this.canReduce,
        type: type ?? this.type,
        nodeType: nodeType ?? this.nodeType,
        parameters: parameters ?? this.parameters,
        name: name ?? this.name,
        body: body ?? this.body,
        returnType: returnType ?? this.returnType,
        tailCall: tailCall ?? this.tailCall);
  }
}

@JsonSerializable(explicitToJson: true)
class QuestionResourceFilterResult {
  QuestionResourceFilterResult({
    this.totalRows,
    this.data,
  });

  factory QuestionResourceFilterResult.fromJson(Map<String, dynamic> json) =>
      _$QuestionResourceFilterResultFromJson(json);

  @JsonKey(name: 'totalRows', includeIfNull: true)
  final int? totalRows;
  @JsonKey(
      name: 'data', includeIfNull: true, defaultValue: <QuestionResource>[])
  final List<QuestionResource>? data;
  static const fromJsonFactory = _$QuestionResourceFilterResultFromJson;
  static const toJsonFactory = _$QuestionResourceFilterResultToJson;
  Map<String, dynamic> toJson() => _$QuestionResourceFilterResultToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is QuestionResourceFilterResult &&
            (identical(other.totalRows, totalRows) ||
                const DeepCollectionEquality()
                    .equals(other.totalRows, totalRows)) &&
            (identical(other.data, data) ||
                const DeepCollectionEquality().equals(other.data, data)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(totalRows) ^
      const DeepCollectionEquality().hash(data) ^
      runtimeType.hashCode;
}

extension $QuestionResourceFilterResultExtension
    on QuestionResourceFilterResult {
  QuestionResourceFilterResult copyWith(
      {int? totalRows, List<QuestionResource>? data}) {
    return QuestionResourceFilterResult(
        totalRows: totalRows ?? this.totalRows, data: data ?? this.data);
  }
}

@JsonSerializable(explicitToJson: true)
class QuestionStatisticalResource {
  QuestionStatisticalResource({
    this.value,
    this.title,
    this.type,
    this.statusList,
  });

  factory QuestionStatisticalResource.fromJson(Map<String, dynamic> json) =>
      _$QuestionStatisticalResourceFromJson(json);

  @JsonKey(name: 'value', includeIfNull: true)
  final int? value;
  @JsonKey(name: 'title', includeIfNull: true, defaultValue: '')
  final String? title;
  @JsonKey(name: 'type', includeIfNull: true, defaultValue: '')
  final String? type;
  @JsonKey(name: 'statusList', includeIfNull: true, defaultValue: <int>[])
  final List<int>? statusList;
  static const fromJsonFactory = _$QuestionStatisticalResourceFromJson;
  static const toJsonFactory = _$QuestionStatisticalResourceToJson;
  Map<String, dynamic> toJson() => _$QuestionStatisticalResourceToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is QuestionStatisticalResource &&
            (identical(other.value, value) ||
                const DeepCollectionEquality().equals(other.value, value)) &&
            (identical(other.title, title) ||
                const DeepCollectionEquality().equals(other.title, title)) &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)) &&
            (identical(other.statusList, statusList) ||
                const DeepCollectionEquality()
                    .equals(other.statusList, statusList)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(value) ^
      const DeepCollectionEquality().hash(title) ^
      const DeepCollectionEquality().hash(type) ^
      const DeepCollectionEquality().hash(statusList) ^
      runtimeType.hashCode;
}

extension $QuestionStatisticalResourceExtension on QuestionStatisticalResource {
  QuestionStatisticalResource copyWith(
      {int? value, String? title, String? type, List<int>? statusList}) {
    return QuestionStatisticalResource(
        value: value ?? this.value,
        title: title ?? this.title,
        type: type ?? this.type,
        statusList: statusList ?? this.statusList);
  }
}

@JsonSerializable(explicitToJson: true)
class QuestionStatisticalUserResource {
  QuestionStatisticalUserResource({
    this.total,
    this.totalCreate,
    this.totalEdit,
    this.totalPublish,
    this.title,
    this.moderationStatus,
    this.moderationStatusName,
    this.createdBy,
    this.editedBy,
    this.publishedBy,
    this.userId,
    this.approveBy,
    this.draft,
    this.sendToEdit,
    this.receiveToEdit,
    this.returnInput,
    this.sendToPublic,
    this.receiveToPublish,
    this.returnEdit,
    this.publish,
    this.unPublish,
  });

  factory QuestionStatisticalUserResource.fromJson(Map<String, dynamic> json) =>
      _$QuestionStatisticalUserResourceFromJson(json);

  @JsonKey(name: 'total', includeIfNull: true)
  final int? total;
  @JsonKey(name: 'totalCreate', includeIfNull: true)
  final int? totalCreate;
  @JsonKey(name: 'totalEdit', includeIfNull: true)
  final int? totalEdit;
  @JsonKey(name: 'totalPublish', includeIfNull: true)
  final int? totalPublish;
  @JsonKey(name: 'title', includeIfNull: true, defaultValue: '')
  final String? title;
  @JsonKey(name: 'moderationStatus', includeIfNull: true)
  final int? moderationStatus;
  @JsonKey(name: 'moderationStatusName', includeIfNull: true, defaultValue: '')
  final String? moderationStatusName;
  @JsonKey(name: 'createdBy', includeIfNull: true)
  final int? createdBy;
  @JsonKey(name: 'editedBy', includeIfNull: true)
  final int? editedBy;
  @JsonKey(name: 'publishedBy', includeIfNull: true)
  final int? publishedBy;
  @JsonKey(name: 'userId', includeIfNull: true)
  final int? userId;
  @JsonKey(name: 'approveBy', includeIfNull: true)
  final int? approveBy;
  @JsonKey(name: 'draft', includeIfNull: true)
  final int? draft;
  @JsonKey(name: 'sendToEdit', includeIfNull: true)
  final int? sendToEdit;
  @JsonKey(name: 'receiveToEdit', includeIfNull: true)
  final int? receiveToEdit;
  @JsonKey(name: 'returnInput', includeIfNull: true)
  final int? returnInput;
  @JsonKey(name: 'sendToPublic', includeIfNull: true)
  final int? sendToPublic;
  @JsonKey(name: 'receiveToPublish', includeIfNull: true)
  final int? receiveToPublish;
  @JsonKey(name: 'returnEdit', includeIfNull: true)
  final int? returnEdit;
  @JsonKey(name: 'publish', includeIfNull: true)
  final int? publish;
  @JsonKey(name: 'unPublish', includeIfNull: true)
  final int? unPublish;
  static const fromJsonFactory = _$QuestionStatisticalUserResourceFromJson;
  static const toJsonFactory = _$QuestionStatisticalUserResourceToJson;
  Map<String, dynamic> toJson() =>
      _$QuestionStatisticalUserResourceToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is QuestionStatisticalUserResource &&
            (identical(other.total, total) ||
                const DeepCollectionEquality().equals(other.total, total)) &&
            (identical(other.totalCreate, totalCreate) ||
                const DeepCollectionEquality()
                    .equals(other.totalCreate, totalCreate)) &&
            (identical(other.totalEdit, totalEdit) ||
                const DeepCollectionEquality()
                    .equals(other.totalEdit, totalEdit)) &&
            (identical(other.totalPublish, totalPublish) ||
                const DeepCollectionEquality()
                    .equals(other.totalPublish, totalPublish)) &&
            (identical(other.title, title) ||
                const DeepCollectionEquality().equals(other.title, title)) &&
            (identical(other.moderationStatus, moderationStatus) ||
                const DeepCollectionEquality()
                    .equals(other.moderationStatus, moderationStatus)) &&
            (identical(other.moderationStatusName, moderationStatusName) ||
                const DeepCollectionEquality().equals(
                    other.moderationStatusName, moderationStatusName)) &&
            (identical(other.createdBy, createdBy) ||
                const DeepCollectionEquality()
                    .equals(other.createdBy, createdBy)) &&
            (identical(other.editedBy, editedBy) ||
                const DeepCollectionEquality()
                    .equals(other.editedBy, editedBy)) &&
            (identical(other.publishedBy, publishedBy) ||
                const DeepCollectionEquality()
                    .equals(other.publishedBy, publishedBy)) &&
            (identical(other.userId, userId) ||
                const DeepCollectionEquality().equals(other.userId, userId)) &&
            (identical(other.approveBy, approveBy) ||
                const DeepCollectionEquality()
                    .equals(other.approveBy, approveBy)) &&
            (identical(other.draft, draft) ||
                const DeepCollectionEquality().equals(other.draft, draft)) &&
            (identical(other.sendToEdit, sendToEdit) ||
                const DeepCollectionEquality()
                    .equals(other.sendToEdit, sendToEdit)) &&
            (identical(other.receiveToEdit, receiveToEdit) ||
                const DeepCollectionEquality()
                    .equals(other.receiveToEdit, receiveToEdit)) &&
            (identical(other.returnInput, returnInput) ||
                const DeepCollectionEquality()
                    .equals(other.returnInput, returnInput)) &&
            (identical(other.sendToPublic, sendToPublic) ||
                const DeepCollectionEquality()
                    .equals(other.sendToPublic, sendToPublic)) &&
            (identical(other.receiveToPublish, receiveToPublish) ||
                const DeepCollectionEquality()
                    .equals(other.receiveToPublish, receiveToPublish)) &&
            (identical(other.returnEdit, returnEdit) ||
                const DeepCollectionEquality()
                    .equals(other.returnEdit, returnEdit)) &&
            (identical(other.publish, publish) ||
                const DeepCollectionEquality()
                    .equals(other.publish, publish)) &&
            (identical(other.unPublish, unPublish) ||
                const DeepCollectionEquality()
                    .equals(other.unPublish, unPublish)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(total) ^
      const DeepCollectionEquality().hash(totalCreate) ^
      const DeepCollectionEquality().hash(totalEdit) ^
      const DeepCollectionEquality().hash(totalPublish) ^
      const DeepCollectionEquality().hash(title) ^
      const DeepCollectionEquality().hash(moderationStatus) ^
      const DeepCollectionEquality().hash(moderationStatusName) ^
      const DeepCollectionEquality().hash(createdBy) ^
      const DeepCollectionEquality().hash(editedBy) ^
      const DeepCollectionEquality().hash(publishedBy) ^
      const DeepCollectionEquality().hash(userId) ^
      const DeepCollectionEquality().hash(approveBy) ^
      const DeepCollectionEquality().hash(draft) ^
      const DeepCollectionEquality().hash(sendToEdit) ^
      const DeepCollectionEquality().hash(receiveToEdit) ^
      const DeepCollectionEquality().hash(returnInput) ^
      const DeepCollectionEquality().hash(sendToPublic) ^
      const DeepCollectionEquality().hash(receiveToPublish) ^
      const DeepCollectionEquality().hash(returnEdit) ^
      const DeepCollectionEquality().hash(publish) ^
      const DeepCollectionEquality().hash(unPublish) ^
      runtimeType.hashCode;
}

extension $QuestionStatisticalUserResourceExtension
    on QuestionStatisticalUserResource {
  QuestionStatisticalUserResource copyWith(
      {int? total,
      int? totalCreate,
      int? totalEdit,
      int? totalPublish,
      String? title,
      int? moderationStatus,
      String? moderationStatusName,
      int? createdBy,
      int? editedBy,
      int? publishedBy,
      int? userId,
      int? approveBy,
      int? draft,
      int? sendToEdit,
      int? receiveToEdit,
      int? returnInput,
      int? sendToPublic,
      int? receiveToPublish,
      int? returnEdit,
      int? publish,
      int? unPublish}) {
    return QuestionStatisticalUserResource(
        total: total ?? this.total,
        totalCreate: totalCreate ?? this.totalCreate,
        totalEdit: totalEdit ?? this.totalEdit,
        totalPublish: totalPublish ?? this.totalPublish,
        title: title ?? this.title,
        moderationStatus: moderationStatus ?? this.moderationStatus,
        moderationStatusName: moderationStatusName ?? this.moderationStatusName,
        createdBy: createdBy ?? this.createdBy,
        editedBy: editedBy ?? this.editedBy,
        publishedBy: publishedBy ?? this.publishedBy,
        userId: userId ?? this.userId,
        approveBy: approveBy ?? this.approveBy,
        draft: draft ?? this.draft,
        sendToEdit: sendToEdit ?? this.sendToEdit,
        receiveToEdit: receiveToEdit ?? this.receiveToEdit,
        returnInput: returnInput ?? this.returnInput,
        sendToPublic: sendToPublic ?? this.sendToPublic,
        receiveToPublish: receiveToPublish ?? this.receiveToPublish,
        returnEdit: returnEdit ?? this.returnEdit,
        publish: publish ?? this.publish,
        unPublish: unPublish ?? this.unPublish);
  }
}

@JsonSerializable(explicitToJson: true)
class QuestionTemplateResource {
  QuestionTemplateResource({
    this.id,
    this.title,
    this.userId,
    this.data,
  });

  factory QuestionTemplateResource.fromJson(Map<String, dynamic> json) =>
      _$QuestionTemplateResourceFromJson(json);

  @JsonKey(name: 'id', includeIfNull: true)
  final int? id;
  @JsonKey(name: 'title', includeIfNull: true, defaultValue: '')
  final String? title;
  @JsonKey(name: 'userId', includeIfNull: true)
  final int? userId;
  @JsonKey(name: 'data', includeIfNull: true)
  final dynamic data;
  static const fromJsonFactory = _$QuestionTemplateResourceFromJson;
  static const toJsonFactory = _$QuestionTemplateResourceToJson;
  Map<String, dynamic> toJson() => _$QuestionTemplateResourceToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is QuestionTemplateResource &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.title, title) ||
                const DeepCollectionEquality().equals(other.title, title)) &&
            (identical(other.userId, userId) ||
                const DeepCollectionEquality().equals(other.userId, userId)) &&
            (identical(other.data, data) ||
                const DeepCollectionEquality().equals(other.data, data)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(title) ^
      const DeepCollectionEquality().hash(userId) ^
      const DeepCollectionEquality().hash(data) ^
      runtimeType.hashCode;
}

extension $QuestionTemplateResourceExtension on QuestionTemplateResource {
  QuestionTemplateResource copyWith(
      {int? id, String? title, int? userId, dynamic? data}) {
    return QuestionTemplateResource(
        id: id ?? this.id,
        title: title ?? this.title,
        userId: userId ?? this.userId,
        data: data ?? this.data);
  }
}

@JsonSerializable(explicitToJson: true)
class QuestionTemplateResourceFilterResult {
  QuestionTemplateResourceFilterResult({
    this.totalRows,
    this.data,
  });

  factory QuestionTemplateResourceFilterResult.fromJson(
          Map<String, dynamic> json) =>
      _$QuestionTemplateResourceFilterResultFromJson(json);

  @JsonKey(name: 'totalRows', includeIfNull: true)
  final int? totalRows;
  @JsonKey(
      name: 'data',
      includeIfNull: true,
      defaultValue: <QuestionTemplateResource>[])
  final List<QuestionTemplateResource>? data;
  static const fromJsonFactory = _$QuestionTemplateResourceFilterResultFromJson;
  static const toJsonFactory = _$QuestionTemplateResourceFilterResultToJson;
  Map<String, dynamic> toJson() =>
      _$QuestionTemplateResourceFilterResultToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is QuestionTemplateResourceFilterResult &&
            (identical(other.totalRows, totalRows) ||
                const DeepCollectionEquality()
                    .equals(other.totalRows, totalRows)) &&
            (identical(other.data, data) ||
                const DeepCollectionEquality().equals(other.data, data)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(totalRows) ^
      const DeepCollectionEquality().hash(data) ^
      runtimeType.hashCode;
}

extension $QuestionTemplateResourceFilterResultExtension
    on QuestionTemplateResourceFilterResult {
  QuestionTemplateResourceFilterResult copyWith(
      {int? totalRows, List<QuestionTemplateResource>? data}) {
    return QuestionTemplateResourceFilterResult(
        totalRows: totalRows ?? this.totalRows, data: data ?? this.data);
  }
}

@JsonSerializable(explicitToJson: true)
class QuestionVersionPublicResource {
  QuestionVersionPublicResource({
    this.versionId,
    this.data,
    this.questionId,
    this.createdDate,
    this.createdBy,
    this.user,
  });

  factory QuestionVersionPublicResource.fromJson(Map<String, dynamic> json) =>
      _$QuestionVersionPublicResourceFromJson(json);

  @JsonKey(name: 'versionId', includeIfNull: true)
  final int? versionId;
  @JsonKey(name: 'data', includeIfNull: true)
  final Question? data;
  @JsonKey(name: 'questionId', includeIfNull: true)
  final int? questionId;
  @JsonKey(name: 'createdDate', includeIfNull: true)
  final DateTime? createdDate;
  @JsonKey(name: 'createdBy', includeIfNull: true)
  final int? createdBy;
  @JsonKey(name: 'user', includeIfNull: true)
  final SimpleUserEntity? user;
  static const fromJsonFactory = _$QuestionVersionPublicResourceFromJson;
  static const toJsonFactory = _$QuestionVersionPublicResourceToJson;
  Map<String, dynamic> toJson() => _$QuestionVersionPublicResourceToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is QuestionVersionPublicResource &&
            (identical(other.versionId, versionId) ||
                const DeepCollectionEquality()
                    .equals(other.versionId, versionId)) &&
            (identical(other.data, data) ||
                const DeepCollectionEquality().equals(other.data, data)) &&
            (identical(other.questionId, questionId) ||
                const DeepCollectionEquality()
                    .equals(other.questionId, questionId)) &&
            (identical(other.createdDate, createdDate) ||
                const DeepCollectionEquality()
                    .equals(other.createdDate, createdDate)) &&
            (identical(other.createdBy, createdBy) ||
                const DeepCollectionEquality()
                    .equals(other.createdBy, createdBy)) &&
            (identical(other.user, user) ||
                const DeepCollectionEquality().equals(other.user, user)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(versionId) ^
      const DeepCollectionEquality().hash(data) ^
      const DeepCollectionEquality().hash(questionId) ^
      const DeepCollectionEquality().hash(createdDate) ^
      const DeepCollectionEquality().hash(createdBy) ^
      const DeepCollectionEquality().hash(user) ^
      runtimeType.hashCode;
}

extension $QuestionVersionPublicResourceExtension
    on QuestionVersionPublicResource {
  QuestionVersionPublicResource copyWith(
      {int? versionId,
      Question? data,
      int? questionId,
      DateTime? createdDate,
      int? createdBy,
      SimpleUserEntity? user}) {
    return QuestionVersionPublicResource(
        versionId: versionId ?? this.versionId,
        data: data ?? this.data,
        questionId: questionId ?? this.questionId,
        createdDate: createdDate ?? this.createdDate,
        createdBy: createdBy ?? this.createdBy,
        user: user ?? this.user);
  }
}

@JsonSerializable(explicitToJson: true)
class QuestionWithQuestionExplainResource {
  QuestionWithQuestionExplainResource({
    this.id,
    this.questionId,
    this.title,
    this.listQuestionExplain,
  });

  factory QuestionWithQuestionExplainResource.fromJson(
          Map<String, dynamic> json) =>
      _$QuestionWithQuestionExplainResourceFromJson(json);

  @JsonKey(name: 'id', includeIfNull: true)
  final int? id;
  @JsonKey(name: 'questionId', includeIfNull: true)
  final int? questionId;
  @JsonKey(name: 'title', includeIfNull: true, defaultValue: '')
  final String? title;
  @JsonKey(
      name: 'listQuestionExplain',
      includeIfNull: true,
      defaultValue: <QuestionJoinQuestionExplain>[])
  final List<QuestionJoinQuestionExplain>? listQuestionExplain;
  static const fromJsonFactory = _$QuestionWithQuestionExplainResourceFromJson;
  static const toJsonFactory = _$QuestionWithQuestionExplainResourceToJson;
  Map<String, dynamic> toJson() =>
      _$QuestionWithQuestionExplainResourceToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is QuestionWithQuestionExplainResource &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.questionId, questionId) ||
                const DeepCollectionEquality()
                    .equals(other.questionId, questionId)) &&
            (identical(other.title, title) ||
                const DeepCollectionEquality().equals(other.title, title)) &&
            (identical(other.listQuestionExplain, listQuestionExplain) ||
                const DeepCollectionEquality()
                    .equals(other.listQuestionExplain, listQuestionExplain)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(questionId) ^
      const DeepCollectionEquality().hash(title) ^
      const DeepCollectionEquality().hash(listQuestionExplain) ^
      runtimeType.hashCode;
}

extension $QuestionWithQuestionExplainResourceExtension
    on QuestionWithQuestionExplainResource {
  QuestionWithQuestionExplainResource copyWith(
      {int? id,
      int? questionId,
      String? title,
      List<QuestionJoinQuestionExplain>? listQuestionExplain}) {
    return QuestionWithQuestionExplainResource(
        id: id ?? this.id,
        questionId: questionId ?? this.questionId,
        title: title ?? this.title,
        listQuestionExplain: listQuestionExplain ?? this.listQuestionExplain);
  }
}

@JsonSerializable(explicitToJson: true)
class RateEntity {
  RateEntity({
    this.id,
    this.createdBy,
    this.createdDate,
    this.lastModifiedBy,
    this.lastModifiedDate,
    this.objectId,
    this.objectType,
    this.extObjectId,
    this.content,
    this.type,
    this.status,
    this.isIncognito,
    this.mark,
  });

  factory RateEntity.fromJson(Map<String, dynamic> json) =>
      _$RateEntityFromJson(json);

  @JsonKey(name: 'id', includeIfNull: true, defaultValue: '')
  final String? id;
  @JsonKey(name: 'createdBy', includeIfNull: true)
  final int? createdBy;
  @JsonKey(name: 'createdDate', includeIfNull: true)
  final DateTime? createdDate;
  @JsonKey(name: 'lastModifiedBy', includeIfNull: true)
  final int? lastModifiedBy;
  @JsonKey(name: 'lastModifiedDate', includeIfNull: true)
  final DateTime? lastModifiedDate;
  @JsonKey(name: 'objectId', includeIfNull: true, defaultValue: '')
  final String? objectId;
  @JsonKey(name: 'objectType', includeIfNull: true)
  final int? objectType;
  @JsonKey(name: 'extObjectId', includeIfNull: true, defaultValue: '')
  final String? extObjectId;
  @JsonKey(name: 'content', includeIfNull: true, defaultValue: '')
  final String? content;
  @JsonKey(name: 'type', includeIfNull: true)
  final int? type;
  @JsonKey(name: 'status', includeIfNull: true)
  final int? status;
  @JsonKey(name: 'isIncognito', includeIfNull: true)
  final bool? isIncognito;
  @JsonKey(name: 'mark', includeIfNull: true)
  final double? mark;
  static const fromJsonFactory = _$RateEntityFromJson;
  static const toJsonFactory = _$RateEntityToJson;
  Map<String, dynamic> toJson() => _$RateEntityToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is RateEntity &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.createdBy, createdBy) ||
                const DeepCollectionEquality()
                    .equals(other.createdBy, createdBy)) &&
            (identical(other.createdDate, createdDate) ||
                const DeepCollectionEquality()
                    .equals(other.createdDate, createdDate)) &&
            (identical(other.lastModifiedBy, lastModifiedBy) ||
                const DeepCollectionEquality()
                    .equals(other.lastModifiedBy, lastModifiedBy)) &&
            (identical(other.lastModifiedDate, lastModifiedDate) ||
                const DeepCollectionEquality()
                    .equals(other.lastModifiedDate, lastModifiedDate)) &&
            (identical(other.objectId, objectId) ||
                const DeepCollectionEquality()
                    .equals(other.objectId, objectId)) &&
            (identical(other.objectType, objectType) ||
                const DeepCollectionEquality()
                    .equals(other.objectType, objectType)) &&
            (identical(other.extObjectId, extObjectId) ||
                const DeepCollectionEquality()
                    .equals(other.extObjectId, extObjectId)) &&
            (identical(other.content, content) ||
                const DeepCollectionEquality()
                    .equals(other.content, content)) &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)) &&
            (identical(other.status, status) ||
                const DeepCollectionEquality().equals(other.status, status)) &&
            (identical(other.isIncognito, isIncognito) ||
                const DeepCollectionEquality()
                    .equals(other.isIncognito, isIncognito)) &&
            (identical(other.mark, mark) ||
                const DeepCollectionEquality().equals(other.mark, mark)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(createdBy) ^
      const DeepCollectionEquality().hash(createdDate) ^
      const DeepCollectionEquality().hash(lastModifiedBy) ^
      const DeepCollectionEquality().hash(lastModifiedDate) ^
      const DeepCollectionEquality().hash(objectId) ^
      const DeepCollectionEquality().hash(objectType) ^
      const DeepCollectionEquality().hash(extObjectId) ^
      const DeepCollectionEquality().hash(content) ^
      const DeepCollectionEquality().hash(type) ^
      const DeepCollectionEquality().hash(status) ^
      const DeepCollectionEquality().hash(isIncognito) ^
      const DeepCollectionEquality().hash(mark) ^
      runtimeType.hashCode;
}

extension $RateEntityExtension on RateEntity {
  RateEntity copyWith(
      {String? id,
      int? createdBy,
      DateTime? createdDate,
      int? lastModifiedBy,
      DateTime? lastModifiedDate,
      String? objectId,
      int? objectType,
      String? extObjectId,
      String? content,
      int? type,
      int? status,
      bool? isIncognito,
      double? mark}) {
    return RateEntity(
        id: id ?? this.id,
        createdBy: createdBy ?? this.createdBy,
        createdDate: createdDate ?? this.createdDate,
        lastModifiedBy: lastModifiedBy ?? this.lastModifiedBy,
        lastModifiedDate: lastModifiedDate ?? this.lastModifiedDate,
        objectId: objectId ?? this.objectId,
        objectType: objectType ?? this.objectType,
        extObjectId: extObjectId ?? this.extObjectId,
        content: content ?? this.content,
        type: type ?? this.type,
        status: status ?? this.status,
        isIncognito: isIncognito ?? this.isIncognito,
        mark: mark ?? this.mark);
  }
}

@JsonSerializable(explicitToJson: true)
class RateInCategoryEntity {
  RateInCategoryEntity({
    this.id,
    this.createdBy,
    this.createdDate,
    this.lastModifiedBy,
    this.lastModifiedDate,
    this.objectId,
    this.objectType,
    this.extObjectId,
    this.rateId,
    this.categoryId,
    this.categoryName,
    this.mark,
    this.content,
  });

  factory RateInCategoryEntity.fromJson(Map<String, dynamic> json) =>
      _$RateInCategoryEntityFromJson(json);

  @JsonKey(name: 'id', includeIfNull: true, defaultValue: '')
  final String? id;
  @JsonKey(name: 'createdBy', includeIfNull: true)
  final int? createdBy;
  @JsonKey(name: 'createdDate', includeIfNull: true)
  final DateTime? createdDate;
  @JsonKey(name: 'lastModifiedBy', includeIfNull: true)
  final int? lastModifiedBy;
  @JsonKey(name: 'lastModifiedDate', includeIfNull: true)
  final DateTime? lastModifiedDate;
  @JsonKey(name: 'objectId', includeIfNull: true, defaultValue: '')
  final String? objectId;
  @JsonKey(name: 'objectType', includeIfNull: true)
  final int? objectType;
  @JsonKey(name: 'extObjectId', includeIfNull: true, defaultValue: '')
  final String? extObjectId;
  @JsonKey(name: 'rateId', includeIfNull: true, defaultValue: '')
  final String? rateId;
  @JsonKey(name: 'categoryId', includeIfNull: true, defaultValue: '')
  final String? categoryId;
  @JsonKey(name: 'categoryName', includeIfNull: true, defaultValue: '')
  final String? categoryName;
  @JsonKey(name: 'mark', includeIfNull: true)
  final double? mark;
  @JsonKey(name: 'content', includeIfNull: true, defaultValue: '')
  final String? content;
  static const fromJsonFactory = _$RateInCategoryEntityFromJson;
  static const toJsonFactory = _$RateInCategoryEntityToJson;
  Map<String, dynamic> toJson() => _$RateInCategoryEntityToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is RateInCategoryEntity &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.createdBy, createdBy) ||
                const DeepCollectionEquality()
                    .equals(other.createdBy, createdBy)) &&
            (identical(other.createdDate, createdDate) ||
                const DeepCollectionEquality()
                    .equals(other.createdDate, createdDate)) &&
            (identical(other.lastModifiedBy, lastModifiedBy) ||
                const DeepCollectionEquality()
                    .equals(other.lastModifiedBy, lastModifiedBy)) &&
            (identical(other.lastModifiedDate, lastModifiedDate) ||
                const DeepCollectionEquality()
                    .equals(other.lastModifiedDate, lastModifiedDate)) &&
            (identical(other.objectId, objectId) ||
                const DeepCollectionEquality()
                    .equals(other.objectId, objectId)) &&
            (identical(other.objectType, objectType) ||
                const DeepCollectionEquality()
                    .equals(other.objectType, objectType)) &&
            (identical(other.extObjectId, extObjectId) ||
                const DeepCollectionEquality()
                    .equals(other.extObjectId, extObjectId)) &&
            (identical(other.rateId, rateId) ||
                const DeepCollectionEquality().equals(other.rateId, rateId)) &&
            (identical(other.categoryId, categoryId) ||
                const DeepCollectionEquality()
                    .equals(other.categoryId, categoryId)) &&
            (identical(other.categoryName, categoryName) ||
                const DeepCollectionEquality()
                    .equals(other.categoryName, categoryName)) &&
            (identical(other.mark, mark) ||
                const DeepCollectionEquality().equals(other.mark, mark)) &&
            (identical(other.content, content) ||
                const DeepCollectionEquality().equals(other.content, content)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(createdBy) ^
      const DeepCollectionEquality().hash(createdDate) ^
      const DeepCollectionEquality().hash(lastModifiedBy) ^
      const DeepCollectionEquality().hash(lastModifiedDate) ^
      const DeepCollectionEquality().hash(objectId) ^
      const DeepCollectionEquality().hash(objectType) ^
      const DeepCollectionEquality().hash(extObjectId) ^
      const DeepCollectionEquality().hash(rateId) ^
      const DeepCollectionEquality().hash(categoryId) ^
      const DeepCollectionEquality().hash(categoryName) ^
      const DeepCollectionEquality().hash(mark) ^
      const DeepCollectionEquality().hash(content) ^
      runtimeType.hashCode;
}

extension $RateInCategoryEntityExtension on RateInCategoryEntity {
  RateInCategoryEntity copyWith(
      {String? id,
      int? createdBy,
      DateTime? createdDate,
      int? lastModifiedBy,
      DateTime? lastModifiedDate,
      String? objectId,
      int? objectType,
      String? extObjectId,
      String? rateId,
      String? categoryId,
      String? categoryName,
      double? mark,
      String? content}) {
    return RateInCategoryEntity(
        id: id ?? this.id,
        createdBy: createdBy ?? this.createdBy,
        createdDate: createdDate ?? this.createdDate,
        lastModifiedBy: lastModifiedBy ?? this.lastModifiedBy,
        lastModifiedDate: lastModifiedDate ?? this.lastModifiedDate,
        objectId: objectId ?? this.objectId,
        objectType: objectType ?? this.objectType,
        extObjectId: extObjectId ?? this.extObjectId,
        rateId: rateId ?? this.rateId,
        categoryId: categoryId ?? this.categoryId,
        categoryName: categoryName ?? this.categoryName,
        mark: mark ?? this.mark,
        content: content ?? this.content);
  }
}

@JsonSerializable(explicitToJson: true)
class RateSaveResouce {
  RateSaveResouce({
    this.id,
    this.objectId,
    this.objectType,
    this.extObjectId,
    this.mark,
    this.type,
    this.isIncognito,
    this.content,
    this.rateInCategory,
  });

  factory RateSaveResouce.fromJson(Map<String, dynamic> json) =>
      _$RateSaveResouceFromJson(json);

  @JsonKey(name: 'id', includeIfNull: true, defaultValue: '')
  final String? id;
  @JsonKey(name: 'objectId', includeIfNull: true, defaultValue: '')
  final String? objectId;
  @JsonKey(name: 'objectType', includeIfNull: true)
  final int? objectType;
  @JsonKey(name: 'extObjectId', includeIfNull: true, defaultValue: '')
  final String? extObjectId;
  @JsonKey(name: 'mark', includeIfNull: true)
  final double? mark;
  @JsonKey(name: 'type', includeIfNull: true)
  final int? type;
  @JsonKey(name: 'isIncognito', includeIfNull: true)
  final bool? isIncognito;
  @JsonKey(name: 'content', includeIfNull: true, defaultValue: '')
  final String? content;
  @JsonKey(
      name: 'rateInCategory',
      includeIfNull: true,
      defaultValue: <RateInCategoryEntity>[])
  final List<RateInCategoryEntity>? rateInCategory;
  static const fromJsonFactory = _$RateSaveResouceFromJson;
  static const toJsonFactory = _$RateSaveResouceToJson;
  Map<String, dynamic> toJson() => _$RateSaveResouceToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is RateSaveResouce &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.objectId, objectId) ||
                const DeepCollectionEquality()
                    .equals(other.objectId, objectId)) &&
            (identical(other.objectType, objectType) ||
                const DeepCollectionEquality()
                    .equals(other.objectType, objectType)) &&
            (identical(other.extObjectId, extObjectId) ||
                const DeepCollectionEquality()
                    .equals(other.extObjectId, extObjectId)) &&
            (identical(other.mark, mark) ||
                const DeepCollectionEquality().equals(other.mark, mark)) &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)) &&
            (identical(other.isIncognito, isIncognito) ||
                const DeepCollectionEquality()
                    .equals(other.isIncognito, isIncognito)) &&
            (identical(other.content, content) ||
                const DeepCollectionEquality()
                    .equals(other.content, content)) &&
            (identical(other.rateInCategory, rateInCategory) ||
                const DeepCollectionEquality()
                    .equals(other.rateInCategory, rateInCategory)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(objectId) ^
      const DeepCollectionEquality().hash(objectType) ^
      const DeepCollectionEquality().hash(extObjectId) ^
      const DeepCollectionEquality().hash(mark) ^
      const DeepCollectionEquality().hash(type) ^
      const DeepCollectionEquality().hash(isIncognito) ^
      const DeepCollectionEquality().hash(content) ^
      const DeepCollectionEquality().hash(rateInCategory) ^
      runtimeType.hashCode;
}

extension $RateSaveResouceExtension on RateSaveResouce {
  RateSaveResouce copyWith(
      {String? id,
      String? objectId,
      int? objectType,
      String? extObjectId,
      double? mark,
      int? type,
      bool? isIncognito,
      String? content,
      List<RateInCategoryEntity>? rateInCategory}) {
    return RateSaveResouce(
        id: id ?? this.id,
        objectId: objectId ?? this.objectId,
        objectType: objectType ?? this.objectType,
        extObjectId: extObjectId ?? this.extObjectId,
        mark: mark ?? this.mark,
        type: type ?? this.type,
        isIncognito: isIncognito ?? this.isIncognito,
        content: content ?? this.content,
        rateInCategory: rateInCategory ?? this.rateInCategory);
  }
}

@JsonSerializable(explicitToJson: true)
class RuntimeFieldHandle {
  RuntimeFieldHandle({
    this.value,
  });

  factory RuntimeFieldHandle.fromJson(Map<String, dynamic> json) =>
      _$RuntimeFieldHandleFromJson(json);

  @JsonKey(name: 'value', includeIfNull: true)
  final IntPtr? value;
  static const fromJsonFactory = _$RuntimeFieldHandleFromJson;
  static const toJsonFactory = _$RuntimeFieldHandleToJson;
  Map<String, dynamic> toJson() => _$RuntimeFieldHandleToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is RuntimeFieldHandle &&
            (identical(other.value, value) ||
                const DeepCollectionEquality().equals(other.value, value)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(value) ^ runtimeType.hashCode;
}

extension $RuntimeFieldHandleExtension on RuntimeFieldHandle {
  RuntimeFieldHandle copyWith({IntPtr? value}) {
    return RuntimeFieldHandle(value: value ?? this.value);
  }
}

@JsonSerializable(explicitToJson: true)
class RuntimeMethodHandle {
  RuntimeMethodHandle({
    this.value,
  });

  factory RuntimeMethodHandle.fromJson(Map<String, dynamic> json) =>
      _$RuntimeMethodHandleFromJson(json);

  @JsonKey(name: 'value', includeIfNull: true)
  final IntPtr? value;
  static const fromJsonFactory = _$RuntimeMethodHandleFromJson;
  static const toJsonFactory = _$RuntimeMethodHandleToJson;
  Map<String, dynamic> toJson() => _$RuntimeMethodHandleToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is RuntimeMethodHandle &&
            (identical(other.value, value) ||
                const DeepCollectionEquality().equals(other.value, value)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(value) ^ runtimeType.hashCode;
}

extension $RuntimeMethodHandleExtension on RuntimeMethodHandle {
  RuntimeMethodHandle copyWith({IntPtr? value}) {
    return RuntimeMethodHandle(value: value ?? this.value);
  }
}

@JsonSerializable(explicitToJson: true)
class RuntimeTypeHandle {
  RuntimeTypeHandle({
    this.value,
  });

  factory RuntimeTypeHandle.fromJson(Map<String, dynamic> json) =>
      _$RuntimeTypeHandleFromJson(json);

  @JsonKey(name: 'value', includeIfNull: true)
  final IntPtr? value;
  static const fromJsonFactory = _$RuntimeTypeHandleFromJson;
  static const toJsonFactory = _$RuntimeTypeHandleToJson;
  Map<String, dynamic> toJson() => _$RuntimeTypeHandleToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is RuntimeTypeHandle &&
            (identical(other.value, value) ||
                const DeepCollectionEquality().equals(other.value, value)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(value) ^ runtimeType.hashCode;
}

extension $RuntimeTypeHandleExtension on RuntimeTypeHandle {
  RuntimeTypeHandle copyWith({IntPtr? value}) {
    return RuntimeTypeHandle(value: value ?? this.value);
  }
}

@JsonSerializable(explicitToJson: true)
class SaveCommentExamResource {
  SaveCommentExamResource({
    this.groupExamUserId,
    this.note,
  });

  factory SaveCommentExamResource.fromJson(Map<String, dynamic> json) =>
      _$SaveCommentExamResourceFromJson(json);

  @JsonKey(name: 'groupExamUserId', includeIfNull: true)
  final int? groupExamUserId;
  @JsonKey(name: 'note', includeIfNull: true, defaultValue: '')
  final String? note;
  static const fromJsonFactory = _$SaveCommentExamResourceFromJson;
  static const toJsonFactory = _$SaveCommentExamResourceToJson;
  Map<String, dynamic> toJson() => _$SaveCommentExamResourceToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is SaveCommentExamResource &&
            (identical(other.groupExamUserId, groupExamUserId) ||
                const DeepCollectionEquality()
                    .equals(other.groupExamUserId, groupExamUserId)) &&
            (identical(other.note, note) ||
                const DeepCollectionEquality().equals(other.note, note)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(groupExamUserId) ^
      const DeepCollectionEquality().hash(note) ^
      runtimeType.hashCode;
}

extension $SaveCommentExamResourceExtension on SaveCommentExamResource {
  SaveCommentExamResource copyWith({int? groupExamUserId, String? note}) {
    return SaveCommentExamResource(
        groupExamUserId: groupExamUserId ?? this.groupExamUserId,
        note: note ?? this.note);
  }
}

@JsonSerializable(explicitToJson: true)
class SaveMemberInExamSetResource {
  SaveMemberInExamSetResource({
    this.id,
    this.examSetId,
    this.memberIds,
    this.joinDate,
    this.expiredDate,
  });

  factory SaveMemberInExamSetResource.fromJson(Map<String, dynamic> json) =>
      _$SaveMemberInExamSetResourceFromJson(json);

  @JsonKey(name: 'id', includeIfNull: true)
  final int? id;
  @JsonKey(name: 'examSetId', includeIfNull: true)
  final int? examSetId;
  @JsonKey(name: 'memberIds', includeIfNull: true, defaultValue: <int>[])
  final List<int>? memberIds;
  @JsonKey(name: 'joinDate', includeIfNull: true)
  final DateTime? joinDate;
  @JsonKey(name: 'expiredDate', includeIfNull: true)
  final DateTime? expiredDate;
  static const fromJsonFactory = _$SaveMemberInExamSetResourceFromJson;
  static const toJsonFactory = _$SaveMemberInExamSetResourceToJson;
  Map<String, dynamic> toJson() => _$SaveMemberInExamSetResourceToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is SaveMemberInExamSetResource &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.examSetId, examSetId) ||
                const DeepCollectionEquality()
                    .equals(other.examSetId, examSetId)) &&
            (identical(other.memberIds, memberIds) ||
                const DeepCollectionEquality()
                    .equals(other.memberIds, memberIds)) &&
            (identical(other.joinDate, joinDate) ||
                const DeepCollectionEquality()
                    .equals(other.joinDate, joinDate)) &&
            (identical(other.expiredDate, expiredDate) ||
                const DeepCollectionEquality()
                    .equals(other.expiredDate, expiredDate)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(examSetId) ^
      const DeepCollectionEquality().hash(memberIds) ^
      const DeepCollectionEquality().hash(joinDate) ^
      const DeepCollectionEquality().hash(expiredDate) ^
      runtimeType.hashCode;
}

extension $SaveMemberInExamSetResourceExtension on SaveMemberInExamSetResource {
  SaveMemberInExamSetResource copyWith(
      {int? id,
      int? examSetId,
      List<int>? memberIds,
      DateTime? joinDate,
      DateTime? expiredDate}) {
    return SaveMemberInExamSetResource(
        id: id ?? this.id,
        examSetId: examSetId ?? this.examSetId,
        memberIds: memberIds ?? this.memberIds,
        joinDate: joinDate ?? this.joinDate,
        expiredDate: expiredDate ?? this.expiredDate);
  }
}

@JsonSerializable(explicitToJson: true)
class SaveQuestionExplainResouce {
  SaveQuestionExplainResouce({
    this.id,
    this.questionId,
    this.content,
    this.status,
    this.ownerType,
    this.createdBy,
    this.createdDate,
  });

  factory SaveQuestionExplainResouce.fromJson(Map<String, dynamic> json) =>
      _$SaveQuestionExplainResouceFromJson(json);

  @JsonKey(name: 'id', includeIfNull: true)
  final int? id;
  @JsonKey(name: 'questionId', includeIfNull: true)
  final int? questionId;
  @JsonKey(name: 'content', includeIfNull: true, defaultValue: '')
  final String? content;
  @JsonKey(name: 'status', includeIfNull: true)
  final int? status;
  @JsonKey(name: 'ownerType', includeIfNull: true)
  final int? ownerType;
  @JsonKey(name: 'createdBy', includeIfNull: true)
  final int? createdBy;
  @JsonKey(name: 'createdDate', includeIfNull: true)
  final DateTime? createdDate;
  static const fromJsonFactory = _$SaveQuestionExplainResouceFromJson;
  static const toJsonFactory = _$SaveQuestionExplainResouceToJson;
  Map<String, dynamic> toJson() => _$SaveQuestionExplainResouceToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is SaveQuestionExplainResouce &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.questionId, questionId) ||
                const DeepCollectionEquality()
                    .equals(other.questionId, questionId)) &&
            (identical(other.content, content) ||
                const DeepCollectionEquality()
                    .equals(other.content, content)) &&
            (identical(other.status, status) ||
                const DeepCollectionEquality().equals(other.status, status)) &&
            (identical(other.ownerType, ownerType) ||
                const DeepCollectionEquality()
                    .equals(other.ownerType, ownerType)) &&
            (identical(other.createdBy, createdBy) ||
                const DeepCollectionEquality()
                    .equals(other.createdBy, createdBy)) &&
            (identical(other.createdDate, createdDate) ||
                const DeepCollectionEquality()
                    .equals(other.createdDate, createdDate)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(questionId) ^
      const DeepCollectionEquality().hash(content) ^
      const DeepCollectionEquality().hash(status) ^
      const DeepCollectionEquality().hash(ownerType) ^
      const DeepCollectionEquality().hash(createdBy) ^
      const DeepCollectionEquality().hash(createdDate) ^
      runtimeType.hashCode;
}

extension $SaveQuestionExplainResouceExtension on SaveQuestionExplainResouce {
  SaveQuestionExplainResouce copyWith(
      {int? id,
      int? questionId,
      String? content,
      int? status,
      int? ownerType,
      int? createdBy,
      DateTime? createdDate}) {
    return SaveQuestionExplainResouce(
        id: id ?? this.id,
        questionId: questionId ?? this.questionId,
        content: content ?? this.content,
        status: status ?? this.status,
        ownerType: ownerType ?? this.ownerType,
        createdBy: createdBy ?? this.createdBy,
        createdDate: createdDate ?? this.createdDate);
  }
}

@JsonSerializable(explicitToJson: true)
class SaveQuestionResource {
  SaveQuestionResource({
    this.id,
    this.title,
    this.content,
    this.level,
    this.status,
    this.parentId,
    this.soundUrl,
    this.imageUrl,
    this.videoUrl,
    this.ownerType,
    this.transcript,
    this.help,
    this.authorId,
    this.authorName,
    this.createdBy,
    this.editedBy,
    this.publishedBy,
    this.type,
    this.answers,
    this.version,
    this.versionId,
    this.lastVersionId,
    this.isFree,
    this.isDead,
    this.isTemplate,
    this.moderationStatus,
    this.moderationNote,
    this.templateTitle,
    this.store,
    this.questionExplains,
    this.childrens,
    this.categoryIds,
    this.tags,
    this.propertyDetails,
    this.listVersion,
    this.propertyCombineId,
    this.propertyCombineName,
    this.isFistCombine,
    this.isCheck,
    this.typeCheck,
  });

  factory SaveQuestionResource.fromJson(Map<String, dynamic> json) =>
      _$SaveQuestionResourceFromJson(json);

  @JsonKey(name: 'id', includeIfNull: true)
  final int? id;
  @JsonKey(name: 'title', includeIfNull: true, defaultValue: '')
  final String? title;
  @JsonKey(name: 'content', includeIfNull: true, defaultValue: '')
  final String? content;
  @JsonKey(name: 'level', includeIfNull: true)
  final int? level;
  @JsonKey(name: 'status', includeIfNull: true)
  final int? status;
  @JsonKey(name: 'parentId', includeIfNull: true)
  final int? parentId;
  @JsonKey(name: 'soundUrl', includeIfNull: true, defaultValue: '')
  final String? soundUrl;
  @JsonKey(name: 'imageUrl', includeIfNull: true, defaultValue: '')
  final String? imageUrl;
  @JsonKey(name: 'videoUrl', includeIfNull: true, defaultValue: '')
  final String? videoUrl;
  @JsonKey(name: 'ownerType', includeIfNull: true)
  final int? ownerType;
  @JsonKey(name: 'transcript', includeIfNull: true, defaultValue: '')
  final String? transcript;
  @JsonKey(name: 'help', includeIfNull: true, defaultValue: '')
  final String? help;
  @JsonKey(name: 'authorId', includeIfNull: true)
  final int? authorId;
  @JsonKey(name: 'authorName', includeIfNull: true, defaultValue: '')
  final String? authorName;
  @JsonKey(name: 'createdBy', includeIfNull: true)
  final int? createdBy;
  @JsonKey(name: 'editedBy', includeIfNull: true)
  final int? editedBy;
  @JsonKey(name: 'publishedBy', includeIfNull: true)
  final int? publishedBy;
  @JsonKey(name: 'type', includeIfNull: true, defaultValue: '')
  final String? type;
  @JsonKey(name: 'answers', includeIfNull: true, defaultValue: '')
  final String? answers;
  @JsonKey(name: 'version', includeIfNull: true, defaultValue: '')
  final String? version;
  @JsonKey(name: 'versionId', includeIfNull: true)
  final int? versionId;
  @JsonKey(name: 'lastVersionId', includeIfNull: true)
  final int? lastVersionId;
  @JsonKey(name: 'isFree', includeIfNull: true)
  final bool? isFree;
  @JsonKey(name: 'isDead', includeIfNull: true)
  final bool? isDead;
  @JsonKey(name: 'isTemplate', includeIfNull: true)
  final bool? isTemplate;
  @JsonKey(name: 'moderationStatus', includeIfNull: true)
  final int? moderationStatus;
  @JsonKey(name: 'moderationNote', includeIfNull: true, defaultValue: '')
  final String? moderationNote;
  @JsonKey(name: 'templateTitle', includeIfNull: true, defaultValue: '')
  final String? templateTitle;
  @JsonKey(name: 'store', includeIfNull: true)
  final int? store;
  @JsonKey(
      name: 'questionExplains',
      includeIfNull: true,
      defaultValue: <SaveQuestionExplainResouce>[])
  final List<SaveQuestionExplainResouce>? questionExplains;
  @JsonKey(
      name: 'childrens',
      includeIfNull: true,
      defaultValue: <SaveQuestionResource>[])
  final List<SaveQuestionResource>? childrens;
  @JsonKey(name: 'categoryIds', includeIfNull: true, defaultValue: <int>[])
  final List<int>? categoryIds;
  @JsonKey(name: 'tags', includeIfNull: true, defaultValue: <int>[])
  final List<int>? tags;
  @JsonKey(name: 'propertyDetails', includeIfNull: true, defaultValue: <int>[])
  final List<int>? propertyDetails;
  @JsonKey(
      name: 'listVersion',
      includeIfNull: true,
      defaultValue: <Int64SelectItem>[])
  final List<Int64SelectItem>? listVersion;
  @JsonKey(name: 'propertyCombineId', includeIfNull: true)
  final int? propertyCombineId;
  @JsonKey(name: 'propertyCombineName', includeIfNull: true, defaultValue: '')
  final String? propertyCombineName;
  @JsonKey(name: 'isFistCombine', includeIfNull: true)
  final bool? isFistCombine;
  @JsonKey(name: 'isCheck', includeIfNull: true)
  final bool? isCheck;
  @JsonKey(name: 'typeCheck', includeIfNull: true)
  final int? typeCheck;
  static const fromJsonFactory = _$SaveQuestionResourceFromJson;
  static const toJsonFactory = _$SaveQuestionResourceToJson;
  Map<String, dynamic> toJson() => _$SaveQuestionResourceToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is SaveQuestionResource &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.title, title) ||
                const DeepCollectionEquality().equals(other.title, title)) &&
            (identical(other.content, content) ||
                const DeepCollectionEquality()
                    .equals(other.content, content)) &&
            (identical(other.level, level) ||
                const DeepCollectionEquality().equals(other.level, level)) &&
            (identical(other.status, status) ||
                const DeepCollectionEquality().equals(other.status, status)) &&
            (identical(other.parentId, parentId) ||
                const DeepCollectionEquality()
                    .equals(other.parentId, parentId)) &&
            (identical(other.soundUrl, soundUrl) ||
                const DeepCollectionEquality()
                    .equals(other.soundUrl, soundUrl)) &&
            (identical(other.imageUrl, imageUrl) ||
                const DeepCollectionEquality()
                    .equals(other.imageUrl, imageUrl)) &&
            (identical(other.videoUrl, videoUrl) ||
                const DeepCollectionEquality()
                    .equals(other.videoUrl, videoUrl)) &&
            (identical(other.ownerType, ownerType) ||
                const DeepCollectionEquality()
                    .equals(other.ownerType, ownerType)) &&
            (identical(other.transcript, transcript) ||
                const DeepCollectionEquality()
                    .equals(other.transcript, transcript)) &&
            (identical(other.help, help) ||
                const DeepCollectionEquality().equals(other.help, help)) &&
            (identical(other.authorId, authorId) ||
                const DeepCollectionEquality()
                    .equals(other.authorId, authorId)) &&
            (identical(other.authorName, authorName) ||
                const DeepCollectionEquality()
                    .equals(other.authorName, authorName)) &&
            (identical(other.createdBy, createdBy) ||
                const DeepCollectionEquality()
                    .equals(other.createdBy, createdBy)) &&
            (identical(other.editedBy, editedBy) ||
                const DeepCollectionEquality()
                    .equals(other.editedBy, editedBy)) &&
            (identical(other.publishedBy, publishedBy) ||
                const DeepCollectionEquality()
                    .equals(other.publishedBy, publishedBy)) &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)) &&
            (identical(other.answers, answers) ||
                const DeepCollectionEquality()
                    .equals(other.answers, answers)) &&
            (identical(other.version, version) ||
                const DeepCollectionEquality()
                    .equals(other.version, version)) &&
            (identical(other.versionId, versionId) ||
                const DeepCollectionEquality()
                    .equals(other.versionId, versionId)) &&
            (identical(other.lastVersionId, lastVersionId) ||
                const DeepCollectionEquality()
                    .equals(other.lastVersionId, lastVersionId)) &&
            (identical(other.isFree, isFree) ||
                const DeepCollectionEquality().equals(other.isFree, isFree)) &&
            (identical(other.isDead, isDead) ||
                const DeepCollectionEquality().equals(other.isDead, isDead)) &&
            (identical(other.isTemplate, isTemplate) ||
                const DeepCollectionEquality()
                    .equals(other.isTemplate, isTemplate)) &&
            (identical(other.moderationStatus, moderationStatus) ||
                const DeepCollectionEquality().equals(other.moderationStatus, moderationStatus)) &&
            (identical(other.moderationNote, moderationNote) || const DeepCollectionEquality().equals(other.moderationNote, moderationNote)) &&
            (identical(other.templateTitle, templateTitle) || const DeepCollectionEquality().equals(other.templateTitle, templateTitle)) &&
            (identical(other.store, store) || const DeepCollectionEquality().equals(other.store, store)) &&
            (identical(other.questionExplains, questionExplains) || const DeepCollectionEquality().equals(other.questionExplains, questionExplains)) &&
            (identical(other.childrens, childrens) || const DeepCollectionEquality().equals(other.childrens, childrens)) &&
            (identical(other.categoryIds, categoryIds) || const DeepCollectionEquality().equals(other.categoryIds, categoryIds)) &&
            (identical(other.tags, tags) || const DeepCollectionEquality().equals(other.tags, tags)) &&
            (identical(other.propertyDetails, propertyDetails) || const DeepCollectionEquality().equals(other.propertyDetails, propertyDetails)) &&
            (identical(other.listVersion, listVersion) || const DeepCollectionEquality().equals(other.listVersion, listVersion)) &&
            (identical(other.propertyCombineId, propertyCombineId) || const DeepCollectionEquality().equals(other.propertyCombineId, propertyCombineId)) &&
            (identical(other.propertyCombineName, propertyCombineName) || const DeepCollectionEquality().equals(other.propertyCombineName, propertyCombineName)) &&
            (identical(other.isFistCombine, isFistCombine) || const DeepCollectionEquality().equals(other.isFistCombine, isFistCombine)) &&
            (identical(other.isCheck, isCheck) || const DeepCollectionEquality().equals(other.isCheck, isCheck)) &&
            (identical(other.typeCheck, typeCheck) || const DeepCollectionEquality().equals(other.typeCheck, typeCheck)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(title) ^
      const DeepCollectionEquality().hash(content) ^
      const DeepCollectionEquality().hash(level) ^
      const DeepCollectionEquality().hash(status) ^
      const DeepCollectionEquality().hash(parentId) ^
      const DeepCollectionEquality().hash(soundUrl) ^
      const DeepCollectionEquality().hash(imageUrl) ^
      const DeepCollectionEquality().hash(videoUrl) ^
      const DeepCollectionEquality().hash(ownerType) ^
      const DeepCollectionEquality().hash(transcript) ^
      const DeepCollectionEquality().hash(help) ^
      const DeepCollectionEquality().hash(authorId) ^
      const DeepCollectionEquality().hash(authorName) ^
      const DeepCollectionEquality().hash(createdBy) ^
      const DeepCollectionEquality().hash(editedBy) ^
      const DeepCollectionEquality().hash(publishedBy) ^
      const DeepCollectionEquality().hash(type) ^
      const DeepCollectionEquality().hash(answers) ^
      const DeepCollectionEquality().hash(version) ^
      const DeepCollectionEquality().hash(versionId) ^
      const DeepCollectionEquality().hash(lastVersionId) ^
      const DeepCollectionEquality().hash(isFree) ^
      const DeepCollectionEquality().hash(isDead) ^
      const DeepCollectionEquality().hash(isTemplate) ^
      const DeepCollectionEquality().hash(moderationStatus) ^
      const DeepCollectionEquality().hash(moderationNote) ^
      const DeepCollectionEquality().hash(templateTitle) ^
      const DeepCollectionEquality().hash(store) ^
      const DeepCollectionEquality().hash(questionExplains) ^
      const DeepCollectionEquality().hash(childrens) ^
      const DeepCollectionEquality().hash(categoryIds) ^
      const DeepCollectionEquality().hash(tags) ^
      const DeepCollectionEquality().hash(propertyDetails) ^
      const DeepCollectionEquality().hash(listVersion) ^
      const DeepCollectionEquality().hash(propertyCombineId) ^
      const DeepCollectionEquality().hash(propertyCombineName) ^
      const DeepCollectionEquality().hash(isFistCombine) ^
      const DeepCollectionEquality().hash(isCheck) ^
      const DeepCollectionEquality().hash(typeCheck) ^
      runtimeType.hashCode;
}

extension $SaveQuestionResourceExtension on SaveQuestionResource {
  SaveQuestionResource copyWith(
      {int? id,
      String? title,
      String? content,
      int? level,
      int? status,
      int? parentId,
      String? soundUrl,
      String? imageUrl,
      String? videoUrl,
      int? ownerType,
      String? transcript,
      String? help,
      int? authorId,
      String? authorName,
      int? createdBy,
      int? editedBy,
      int? publishedBy,
      String? type,
      String? answers,
      String? version,
      int? versionId,
      int? lastVersionId,
      bool? isFree,
      bool? isDead,
      bool? isTemplate,
      int? moderationStatus,
      String? moderationNote,
      String? templateTitle,
      int? store,
      List<SaveQuestionExplainResouce>? questionExplains,
      List<SaveQuestionResource>? childrens,
      List<int>? categoryIds,
      List<int>? tags,
      List<int>? propertyDetails,
      List<Int64SelectItem>? listVersion,
      int? propertyCombineId,
      String? propertyCombineName,
      bool? isFistCombine,
      bool? isCheck,
      int? typeCheck}) {
    return SaveQuestionResource(
        id: id ?? this.id,
        title: title ?? this.title,
        content: content ?? this.content,
        level: level ?? this.level,
        status: status ?? this.status,
        parentId: parentId ?? this.parentId,
        soundUrl: soundUrl ?? this.soundUrl,
        imageUrl: imageUrl ?? this.imageUrl,
        videoUrl: videoUrl ?? this.videoUrl,
        ownerType: ownerType ?? this.ownerType,
        transcript: transcript ?? this.transcript,
        help: help ?? this.help,
        authorId: authorId ?? this.authorId,
        authorName: authorName ?? this.authorName,
        createdBy: createdBy ?? this.createdBy,
        editedBy: editedBy ?? this.editedBy,
        publishedBy: publishedBy ?? this.publishedBy,
        type: type ?? this.type,
        answers: answers ?? this.answers,
        version: version ?? this.version,
        versionId: versionId ?? this.versionId,
        lastVersionId: lastVersionId ?? this.lastVersionId,
        isFree: isFree ?? this.isFree,
        isDead: isDead ?? this.isDead,
        isTemplate: isTemplate ?? this.isTemplate,
        moderationStatus: moderationStatus ?? this.moderationStatus,
        moderationNote: moderationNote ?? this.moderationNote,
        templateTitle: templateTitle ?? this.templateTitle,
        store: store ?? this.store,
        questionExplains: questionExplains ?? this.questionExplains,
        childrens: childrens ?? this.childrens,
        categoryIds: categoryIds ?? this.categoryIds,
        tags: tags ?? this.tags,
        propertyDetails: propertyDetails ?? this.propertyDetails,
        listVersion: listVersion ?? this.listVersion,
        propertyCombineId: propertyCombineId ?? this.propertyCombineId,
        propertyCombineName: propertyCombineName ?? this.propertyCombineName,
        isFistCombine: isFistCombine ?? this.isFistCombine,
        isCheck: isCheck ?? this.isCheck,
        typeCheck: typeCheck ?? this.typeCheck);
  }
}

@JsonSerializable(explicitToJson: true)
class SaveTagResource {
  SaveTagResource({
    this.title,
    this.descriptionTag,
  });

  factory SaveTagResource.fromJson(Map<String, dynamic> json) =>
      _$SaveTagResourceFromJson(json);

  @JsonKey(name: 'title', includeIfNull: true, defaultValue: '')
  final String? title;
  @JsonKey(name: 'descriptionTag', includeIfNull: true, defaultValue: '')
  final String? descriptionTag;
  static const fromJsonFactory = _$SaveTagResourceFromJson;
  static const toJsonFactory = _$SaveTagResourceToJson;
  Map<String, dynamic> toJson() => _$SaveTagResourceToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is SaveTagResource &&
            (identical(other.title, title) ||
                const DeepCollectionEquality().equals(other.title, title)) &&
            (identical(other.descriptionTag, descriptionTag) ||
                const DeepCollectionEquality()
                    .equals(other.descriptionTag, descriptionTag)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(title) ^
      const DeepCollectionEquality().hash(descriptionTag) ^
      runtimeType.hashCode;
}

extension $SaveTagResourceExtension on SaveTagResource {
  SaveTagResource copyWith({String? title, String? descriptionTag}) {
    return SaveTagResource(
        title: title ?? this.title,
        descriptionTag: descriptionTag ?? this.descriptionTag);
  }
}

@JsonSerializable(explicitToJson: true)
class ScopedSlots {
  ScopedSlots({
    this.customRender,
  });

  factory ScopedSlots.fromJson(Map<String, dynamic> json) =>
      _$ScopedSlotsFromJson(json);

  @JsonKey(name: 'customRender', includeIfNull: true, defaultValue: '')
  final String? customRender;
  static const fromJsonFactory = _$ScopedSlotsFromJson;
  static const toJsonFactory = _$ScopedSlotsToJson;
  Map<String, dynamic> toJson() => _$ScopedSlotsToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ScopedSlots &&
            (identical(other.customRender, customRender) ||
                const DeepCollectionEquality()
                    .equals(other.customRender, customRender)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(customRender) ^ runtimeType.hashCode;
}

extension $ScopedSlotsExtension on ScopedSlots {
  ScopedSlots copyWith({String? customRender}) {
    return ScopedSlots(customRender: customRender ?? this.customRender);
  }
}

@JsonSerializable(explicitToJson: true)
class SelectColumns {
  SelectColumns({
    this.id,
    this.text,
    this.parentId,
  });

  factory SelectColumns.fromJson(Map<String, dynamic> json) =>
      _$SelectColumnsFromJson(json);

  @JsonKey(name: 'id', includeIfNull: true)
  final int? id;
  @JsonKey(name: 'text', includeIfNull: true, defaultValue: '')
  final String? text;
  @JsonKey(name: 'parentId', includeIfNull: true)
  final int? parentId;
  static const fromJsonFactory = _$SelectColumnsFromJson;
  static const toJsonFactory = _$SelectColumnsToJson;
  Map<String, dynamic> toJson() => _$SelectColumnsToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is SelectColumns &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.text, text) ||
                const DeepCollectionEquality().equals(other.text, text)) &&
            (identical(other.parentId, parentId) ||
                const DeepCollectionEquality()
                    .equals(other.parentId, parentId)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(text) ^
      const DeepCollectionEquality().hash(parentId) ^
      runtimeType.hashCode;
}

extension $SelectColumnsExtension on SelectColumns {
  SelectColumns copyWith({int? id, String? text, int? parentId}) {
    return SelectColumns(
        id: id ?? this.id,
        text: text ?? this.text,
        parentId: parentId ?? this.parentId);
  }
}

@JsonSerializable(explicitToJson: true)
class SelectExamStructItem {
  SelectExamStructItem({
    this.id,
    this.text,
    this.status,
  });

  factory SelectExamStructItem.fromJson(Map<String, dynamic> json) =>
      _$SelectExamStructItemFromJson(json);

  @JsonKey(name: 'id', includeIfNull: true)
  final int? id;
  @JsonKey(name: 'text', includeIfNull: true, defaultValue: '')
  final String? text;
  @JsonKey(name: 'status', includeIfNull: true)
  final int? status;
  static const fromJsonFactory = _$SelectExamStructItemFromJson;
  static const toJsonFactory = _$SelectExamStructItemToJson;
  Map<String, dynamic> toJson() => _$SelectExamStructItemToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is SelectExamStructItem &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.text, text) ||
                const DeepCollectionEquality().equals(other.text, text)) &&
            (identical(other.status, status) ||
                const DeepCollectionEquality().equals(other.status, status)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(text) ^
      const DeepCollectionEquality().hash(status) ^
      runtimeType.hashCode;
}

extension $SelectExamStructItemExtension on SelectExamStructItem {
  SelectExamStructItem copyWith({int? id, String? text, int? status}) {
    return SelectExamStructItem(
        id: id ?? this.id,
        text: text ?? this.text,
        status: status ?? this.status);
  }
}

@JsonSerializable(explicitToJson: true)
class SelectTree {
  SelectTree({
    this.id,
    this.value,
    this.key,
    this.title,
    this.parentId,
  });

  factory SelectTree.fromJson(Map<String, dynamic> json) =>
      _$SelectTreeFromJson(json);

  @JsonKey(name: 'id', includeIfNull: true)
  final int? id;
  @JsonKey(name: 'value', includeIfNull: true)
  final int? value;
  @JsonKey(name: 'key', includeIfNull: true)
  final int? key;
  @JsonKey(name: 'title', includeIfNull: true, defaultValue: '')
  final String? title;
  @JsonKey(name: 'parentId', includeIfNull: true)
  final int? parentId;
  static const fromJsonFactory = _$SelectTreeFromJson;
  static const toJsonFactory = _$SelectTreeToJson;
  Map<String, dynamic> toJson() => _$SelectTreeToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is SelectTree &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.value, value) ||
                const DeepCollectionEquality().equals(other.value, value)) &&
            (identical(other.key, key) ||
                const DeepCollectionEquality().equals(other.key, key)) &&
            (identical(other.title, title) ||
                const DeepCollectionEquality().equals(other.title, title)) &&
            (identical(other.parentId, parentId) ||
                const DeepCollectionEquality()
                    .equals(other.parentId, parentId)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(value) ^
      const DeepCollectionEquality().hash(key) ^
      const DeepCollectionEquality().hash(title) ^
      const DeepCollectionEquality().hash(parentId) ^
      runtimeType.hashCode;
}

extension $SelectTreeExtension on SelectTree {
  SelectTree copyWith(
      {int? id, int? value, int? key, String? title, int? parentId}) {
    return SelectTree(
        id: id ?? this.id,
        value: value ?? this.value,
        key: key ?? this.key,
        title: title ?? this.title,
        parentId: parentId ?? this.parentId);
  }
}

@JsonSerializable(explicitToJson: true)
class SelectTreeInt64NullableTreeNode {
  SelectTreeInt64NullableTreeNode({
    this.item,
    this.parentId,
    this.children,
  });

  factory SelectTreeInt64NullableTreeNode.fromJson(Map<String, dynamic> json) =>
      _$SelectTreeInt64NullableTreeNodeFromJson(json);

  @JsonKey(name: 'item', includeIfNull: true)
  final SelectTree? item;
  @JsonKey(name: 'parentId', includeIfNull: true)
  final int? parentId;
  @JsonKey(
      name: 'children',
      includeIfNull: true,
      defaultValue: <SelectTreeInt64NullableTreeNode>[])
  final List<SelectTreeInt64NullableTreeNode>? children;
  static const fromJsonFactory = _$SelectTreeInt64NullableTreeNodeFromJson;
  static const toJsonFactory = _$SelectTreeInt64NullableTreeNodeToJson;
  Map<String, dynamic> toJson() =>
      _$SelectTreeInt64NullableTreeNodeToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is SelectTreeInt64NullableTreeNode &&
            (identical(other.item, item) ||
                const DeepCollectionEquality().equals(other.item, item)) &&
            (identical(other.parentId, parentId) ||
                const DeepCollectionEquality()
                    .equals(other.parentId, parentId)) &&
            (identical(other.children, children) ||
                const DeepCollectionEquality()
                    .equals(other.children, children)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(item) ^
      const DeepCollectionEquality().hash(parentId) ^
      const DeepCollectionEquality().hash(children) ^
      runtimeType.hashCode;
}

extension $SelectTreeInt64NullableTreeNodeExtension
    on SelectTreeInt64NullableTreeNode {
  SelectTreeInt64NullableTreeNode copyWith(
      {SelectTree? item,
      int? parentId,
      List<SelectTreeInt64NullableTreeNode>? children}) {
    return SelectTreeInt64NullableTreeNode(
        item: item ?? this.item,
        parentId: parentId ?? this.parentId,
        children: children ?? this.children);
  }
}

@JsonSerializable(explicitToJson: true)
class SimpleUserEntity {
  SimpleUserEntity({
    this.id,
    this.username,
    this.firstName,
    this.lastName,
    this.fullName,
    this.avatar,
    this.isManager,
    this.joinDate,
    this.isVertify,
  });

  factory SimpleUserEntity.fromJson(Map<String, dynamic> json) =>
      _$SimpleUserEntityFromJson(json);

  @JsonKey(name: 'id', includeIfNull: true)
  final int? id;
  @JsonKey(name: 'username', includeIfNull: true, defaultValue: '')
  final String? username;
  @JsonKey(name: 'firstName', includeIfNull: true, defaultValue: '')
  final String? firstName;
  @JsonKey(name: 'lastName', includeIfNull: true, defaultValue: '')
  final String? lastName;
  @JsonKey(name: 'fullName', includeIfNull: true, defaultValue: '')
  final String? fullName;
  @JsonKey(name: 'avatar', includeIfNull: true, defaultValue: '')
  final String? avatar;
  @JsonKey(name: 'isManager', includeIfNull: true)
  final bool? isManager;
  @JsonKey(name: 'joinDate', includeIfNull: true)
  final DateTime? joinDate;
  @JsonKey(name: 'isVertify', includeIfNull: true)
  final bool? isVertify;
  static const fromJsonFactory = _$SimpleUserEntityFromJson;
  static const toJsonFactory = _$SimpleUserEntityToJson;
  Map<String, dynamic> toJson() => _$SimpleUserEntityToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is SimpleUserEntity &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.username, username) ||
                const DeepCollectionEquality()
                    .equals(other.username, username)) &&
            (identical(other.firstName, firstName) ||
                const DeepCollectionEquality()
                    .equals(other.firstName, firstName)) &&
            (identical(other.lastName, lastName) ||
                const DeepCollectionEquality()
                    .equals(other.lastName, lastName)) &&
            (identical(other.fullName, fullName) ||
                const DeepCollectionEquality()
                    .equals(other.fullName, fullName)) &&
            (identical(other.avatar, avatar) ||
                const DeepCollectionEquality().equals(other.avatar, avatar)) &&
            (identical(other.isManager, isManager) ||
                const DeepCollectionEquality()
                    .equals(other.isManager, isManager)) &&
            (identical(other.joinDate, joinDate) ||
                const DeepCollectionEquality()
                    .equals(other.joinDate, joinDate)) &&
            (identical(other.isVertify, isVertify) ||
                const DeepCollectionEquality()
                    .equals(other.isVertify, isVertify)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(username) ^
      const DeepCollectionEquality().hash(firstName) ^
      const DeepCollectionEquality().hash(lastName) ^
      const DeepCollectionEquality().hash(fullName) ^
      const DeepCollectionEquality().hash(avatar) ^
      const DeepCollectionEquality().hash(isManager) ^
      const DeepCollectionEquality().hash(joinDate) ^
      const DeepCollectionEquality().hash(isVertify) ^
      runtimeType.hashCode;
}

extension $SimpleUserEntityExtension on SimpleUserEntity {
  SimpleUserEntity copyWith(
      {int? id,
      String? username,
      String? firstName,
      String? lastName,
      String? fullName,
      String? avatar,
      bool? isManager,
      DateTime? joinDate,
      bool? isVertify}) {
    return SimpleUserEntity(
        id: id ?? this.id,
        username: username ?? this.username,
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        fullName: fullName ?? this.fullName,
        avatar: avatar ?? this.avatar,
        isManager: isManager ?? this.isManager,
        joinDate: joinDate ?? this.joinDate,
        isVertify: isVertify ?? this.isVertify);
  }
}

@JsonSerializable(explicitToJson: true)
class SimpleUserEntityFilterResult {
  SimpleUserEntityFilterResult({
    this.totalRows,
    this.data,
  });

  factory SimpleUserEntityFilterResult.fromJson(Map<String, dynamic> json) =>
      _$SimpleUserEntityFilterResultFromJson(json);

  @JsonKey(name: 'totalRows', includeIfNull: true)
  final int? totalRows;
  @JsonKey(
      name: 'data', includeIfNull: true, defaultValue: <SimpleUserEntity>[])
  final List<SimpleUserEntity>? data;
  static const fromJsonFactory = _$SimpleUserEntityFilterResultFromJson;
  static const toJsonFactory = _$SimpleUserEntityFilterResultToJson;
  Map<String, dynamic> toJson() => _$SimpleUserEntityFilterResultToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is SimpleUserEntityFilterResult &&
            (identical(other.totalRows, totalRows) ||
                const DeepCollectionEquality()
                    .equals(other.totalRows, totalRows)) &&
            (identical(other.data, data) ||
                const DeepCollectionEquality().equals(other.data, data)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(totalRows) ^
      const DeepCollectionEquality().hash(data) ^
      runtimeType.hashCode;
}

extension $SimpleUserEntityFilterResultExtension
    on SimpleUserEntityFilterResult {
  SimpleUserEntityFilterResult copyWith(
      {int? totalRows, List<SimpleUserEntity>? data}) {
    return SimpleUserEntityFilterResult(
        totalRows: totalRows ?? this.totalRows, data: data ?? this.data);
  }
}

@JsonSerializable(explicitToJson: true)
class StructLayoutAttribute {
  StructLayoutAttribute({
    this.typeId,
    this.value,
  });

  factory StructLayoutAttribute.fromJson(Map<String, dynamic> json) =>
      _$StructLayoutAttributeFromJson(json);

  @JsonKey(name: 'typeId', includeIfNull: true)
  final dynamic typeId;
  @JsonKey(
      name: 'value',
      includeIfNull: true,
      toJson: layoutKindToJson,
      fromJson: layoutKindFromJson)
  final enums.LayoutKind? value;
  static const fromJsonFactory = _$StructLayoutAttributeFromJson;
  static const toJsonFactory = _$StructLayoutAttributeToJson;
  Map<String, dynamic> toJson() => _$StructLayoutAttributeToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is StructLayoutAttribute &&
            (identical(other.typeId, typeId) ||
                const DeepCollectionEquality().equals(other.typeId, typeId)) &&
            (identical(other.value, value) ||
                const DeepCollectionEquality().equals(other.value, value)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(typeId) ^
      const DeepCollectionEquality().hash(value) ^
      runtimeType.hashCode;
}

extension $StructLayoutAttributeExtension on StructLayoutAttribute {
  StructLayoutAttribute copyWith({dynamic? typeId, enums.LayoutKind? value}) {
    return StructLayoutAttribute(
        typeId: typeId ?? this.typeId, value: value ?? this.value);
  }
}

@JsonSerializable(explicitToJson: true)
class TagItemResource {
  TagItemResource({
    this.title,
    this.id,
    this.url,
    this.descriptionTag,
    this.countExam,
    this.editable,
  });

  factory TagItemResource.fromJson(Map<String, dynamic> json) =>
      _$TagItemResourceFromJson(json);

  @JsonKey(name: 'title', includeIfNull: true, defaultValue: '')
  final String? title;
  @JsonKey(name: 'id', includeIfNull: true)
  final int? id;
  @JsonKey(name: 'url', includeIfNull: true, defaultValue: '')
  final String? url;
  @JsonKey(name: 'descriptionTag', includeIfNull: true, defaultValue: '')
  final String? descriptionTag;
  @JsonKey(name: 'countExam', includeIfNull: true)
  final int? countExam;
  @JsonKey(name: 'editable', includeIfNull: true)
  final bool? editable;
  static const fromJsonFactory = _$TagItemResourceFromJson;
  static const toJsonFactory = _$TagItemResourceToJson;
  Map<String, dynamic> toJson() => _$TagItemResourceToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is TagItemResource &&
            (identical(other.title, title) ||
                const DeepCollectionEquality().equals(other.title, title)) &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.url, url) ||
                const DeepCollectionEquality().equals(other.url, url)) &&
            (identical(other.descriptionTag, descriptionTag) ||
                const DeepCollectionEquality()
                    .equals(other.descriptionTag, descriptionTag)) &&
            (identical(other.countExam, countExam) ||
                const DeepCollectionEquality()
                    .equals(other.countExam, countExam)) &&
            (identical(other.editable, editable) ||
                const DeepCollectionEquality()
                    .equals(other.editable, editable)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(title) ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(url) ^
      const DeepCollectionEquality().hash(descriptionTag) ^
      const DeepCollectionEquality().hash(countExam) ^
      const DeepCollectionEquality().hash(editable) ^
      runtimeType.hashCode;
}

extension $TagItemResourceExtension on TagItemResource {
  TagItemResource copyWith(
      {String? title,
      int? id,
      String? url,
      String? descriptionTag,
      int? countExam,
      bool? editable}) {
    return TagItemResource(
        title: title ?? this.title,
        id: id ?? this.id,
        url: url ?? this.url,
        descriptionTag: descriptionTag ?? this.descriptionTag,
        countExam: countExam ?? this.countExam,
        editable: editable ?? this.editable);
  }
}

@JsonSerializable(explicitToJson: true)
class TagItemResourceFilterResult {
  TagItemResourceFilterResult({
    this.totalRows,
    this.data,
  });

  factory TagItemResourceFilterResult.fromJson(Map<String, dynamic> json) =>
      _$TagItemResourceFilterResultFromJson(json);

  @JsonKey(name: 'totalRows', includeIfNull: true)
  final int? totalRows;
  @JsonKey(name: 'data', includeIfNull: true, defaultValue: <TagItemResource>[])
  final List<TagItemResource>? data;
  static const fromJsonFactory = _$TagItemResourceFilterResultFromJson;
  static const toJsonFactory = _$TagItemResourceFilterResultToJson;
  Map<String, dynamic> toJson() => _$TagItemResourceFilterResultToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is TagItemResourceFilterResult &&
            (identical(other.totalRows, totalRows) ||
                const DeepCollectionEquality()
                    .equals(other.totalRows, totalRows)) &&
            (identical(other.data, data) ||
                const DeepCollectionEquality().equals(other.data, data)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(totalRows) ^
      const DeepCollectionEquality().hash(data) ^
      runtimeType.hashCode;
}

extension $TagItemResourceFilterResultExtension on TagItemResourceFilterResult {
  TagItemResourceFilterResult copyWith(
      {int? totalRows, List<TagItemResource>? data}) {
    return TagItemResourceFilterResult(
        totalRows: totalRows ?? this.totalRows, data: data ?? this.data);
  }
}

@JsonSerializable(explicitToJson: true)
class TreePropertyDetailResource {
  TreePropertyDetailResource({
    this.id,
    this.propertyId,
    this.value,
    this.parentId,
  });

  factory TreePropertyDetailResource.fromJson(Map<String, dynamic> json) =>
      _$TreePropertyDetailResourceFromJson(json);

  @JsonKey(name: 'id', includeIfNull: true)
  final int? id;
  @JsonKey(name: 'propertyId', includeIfNull: true)
  final int? propertyId;
  @JsonKey(name: 'value', includeIfNull: true, defaultValue: '')
  final String? value;
  @JsonKey(name: 'parentId', includeIfNull: true)
  final int? parentId;
  static const fromJsonFactory = _$TreePropertyDetailResourceFromJson;
  static const toJsonFactory = _$TreePropertyDetailResourceToJson;
  Map<String, dynamic> toJson() => _$TreePropertyDetailResourceToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is TreePropertyDetailResource &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.propertyId, propertyId) ||
                const DeepCollectionEquality()
                    .equals(other.propertyId, propertyId)) &&
            (identical(other.value, value) ||
                const DeepCollectionEquality().equals(other.value, value)) &&
            (identical(other.parentId, parentId) ||
                const DeepCollectionEquality()
                    .equals(other.parentId, parentId)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(propertyId) ^
      const DeepCollectionEquality().hash(value) ^
      const DeepCollectionEquality().hash(parentId) ^
      runtimeType.hashCode;
}

extension $TreePropertyDetailResourceExtension on TreePropertyDetailResource {
  TreePropertyDetailResource copyWith(
      {int? id, int? propertyId, String? value, int? parentId}) {
    return TreePropertyDetailResource(
        id: id ?? this.id,
        propertyId: propertyId ?? this.propertyId,
        value: value ?? this.value,
        parentId: parentId ?? this.parentId);
  }
}

@JsonSerializable(explicitToJson: true)
class TreePropertyDetailResourceInt64NullableTreeNode {
  TreePropertyDetailResourceInt64NullableTreeNode({
    this.item,
    this.parentId,
    this.children,
  });

  factory TreePropertyDetailResourceInt64NullableTreeNode.fromJson(
          Map<String, dynamic> json) =>
      _$TreePropertyDetailResourceInt64NullableTreeNodeFromJson(json);

  @JsonKey(name: 'item', includeIfNull: true)
  final TreePropertyDetailResource? item;
  @JsonKey(name: 'parentId', includeIfNull: true)
  final int? parentId;
  @JsonKey(
      name: 'children',
      includeIfNull: true,
      defaultValue: <TreePropertyDetailResourceInt64NullableTreeNode>[])
  final List<TreePropertyDetailResourceInt64NullableTreeNode>? children;
  static const fromJsonFactory =
      _$TreePropertyDetailResourceInt64NullableTreeNodeFromJson;
  static const toJsonFactory =
      _$TreePropertyDetailResourceInt64NullableTreeNodeToJson;
  Map<String, dynamic> toJson() =>
      _$TreePropertyDetailResourceInt64NullableTreeNodeToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is TreePropertyDetailResourceInt64NullableTreeNode &&
            (identical(other.item, item) ||
                const DeepCollectionEquality().equals(other.item, item)) &&
            (identical(other.parentId, parentId) ||
                const DeepCollectionEquality()
                    .equals(other.parentId, parentId)) &&
            (identical(other.children, children) ||
                const DeepCollectionEquality()
                    .equals(other.children, children)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(item) ^
      const DeepCollectionEquality().hash(parentId) ^
      const DeepCollectionEquality().hash(children) ^
      runtimeType.hashCode;
}

extension $TreePropertyDetailResourceInt64NullableTreeNodeExtension
    on TreePropertyDetailResourceInt64NullableTreeNode {
  TreePropertyDetailResourceInt64NullableTreeNode copyWith(
      {TreePropertyDetailResource? item,
      int? parentId,
      List<TreePropertyDetailResourceInt64NullableTreeNode>? children}) {
    return TreePropertyDetailResourceInt64NullableTreeNode(
        item: item ?? this.item,
        parentId: parentId ?? this.parentId,
        children: children ?? this.children);
  }
}

@JsonSerializable(explicitToJson: true)
class TreePropertyResource {
  TreePropertyResource({
    this.id,
    this.name,
    this.code,
    this.parentId,
    this.path,
    this.propertyDetail,
  });

  factory TreePropertyResource.fromJson(Map<String, dynamic> json) =>
      _$TreePropertyResourceFromJson(json);

  @JsonKey(name: 'id', includeIfNull: true)
  final int? id;
  @JsonKey(name: 'name', includeIfNull: true, defaultValue: '')
  final String? name;
  @JsonKey(name: 'code', includeIfNull: true, defaultValue: '')
  final String? code;
  @JsonKey(name: 'parentId', includeIfNull: true)
  final int? parentId;
  @JsonKey(name: 'path', includeIfNull: true, defaultValue: '')
  final String? path;
  @JsonKey(
      name: 'propertyDetail',
      includeIfNull: true,
      defaultValue: <TreePropertyDetailResourceInt64NullableTreeNode>[])
  final List<TreePropertyDetailResourceInt64NullableTreeNode>? propertyDetail;
  static const fromJsonFactory = _$TreePropertyResourceFromJson;
  static const toJsonFactory = _$TreePropertyResourceToJson;
  Map<String, dynamic> toJson() => _$TreePropertyResourceToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is TreePropertyResource &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.code, code) ||
                const DeepCollectionEquality().equals(other.code, code)) &&
            (identical(other.parentId, parentId) ||
                const DeepCollectionEquality()
                    .equals(other.parentId, parentId)) &&
            (identical(other.path, path) ||
                const DeepCollectionEquality().equals(other.path, path)) &&
            (identical(other.propertyDetail, propertyDetail) ||
                const DeepCollectionEquality()
                    .equals(other.propertyDetail, propertyDetail)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(code) ^
      const DeepCollectionEquality().hash(parentId) ^
      const DeepCollectionEquality().hash(path) ^
      const DeepCollectionEquality().hash(propertyDetail) ^
      runtimeType.hashCode;
}

extension $TreePropertyResourceExtension on TreePropertyResource {
  TreePropertyResource copyWith(
      {int? id,
      String? name,
      String? code,
      int? parentId,
      String? path,
      List<TreePropertyDetailResourceInt64NullableTreeNode>? propertyDetail}) {
    return TreePropertyResource(
        id: id ?? this.id,
        name: name ?? this.name,
        code: code ?? this.code,
        parentId: parentId ?? this.parentId,
        path: path ?? this.path,
        propertyDetail: propertyDetail ?? this.propertyDetail);
  }
}

@JsonSerializable(explicitToJson: true)
class Type {
  Type({
    this.name,
    this.customAttributes,
    this.isCollectible,
    this.metadataToken,
    this.isInterface,
    this.memberType,
    this.namespace,
    this.assemblyQualifiedName,
    this.fullName,
    this.assembly,
    this.module,
    this.isNested,
    this.declaringType,
    this.declaringMethod,
    this.reflectedType,
    this.underlyingSystemType,
    this.isTypeDefinition,
    this.isArray,
    this.isByRef,
    this.isPointer,
    this.isConstructedGenericType,
    this.isGenericParameter,
    this.isGenericTypeParameter,
    this.isGenericMethodParameter,
    this.isGenericType,
    this.isGenericTypeDefinition,
    this.isSZArray,
    this.isVariableBoundArray,
    this.isByRefLike,
    this.hasElementType,
    this.genericTypeArguments,
    this.genericParameterPosition,
    this.genericParameterAttributes,
    this.attributes,
    this.isAbstract,
    this.isImport,
    this.isSealed,
    this.isSpecialName,
    this.isClass,
    this.isNestedAssembly,
    this.isNestedFamANDAssem,
    this.isNestedFamily,
    this.isNestedFamORAssem,
    this.isNestedPrivate,
    this.isNestedPublic,
    this.isNotPublic,
    this.isPublic,
    this.isAutoLayout,
    this.isExplicitLayout,
    this.isLayoutSequential,
    this.isAnsiClass,
    this.isAutoClass,
    this.isUnicodeClass,
    this.isCOMObject,
    this.isContextful,
    this.isEnum,
    this.isMarshalByRef,
    this.isPrimitive,
    this.isValueType,
    this.isSignatureType,
    this.isSecurityCritical,
    this.isSecuritySafeCritical,
    this.isSecurityTransparent,
    this.structLayoutAttribute,
    this.typeInitializer,
    this.typeHandle,
    this.guid,
    this.baseType,
    this.isSerializable,
    this.containsGenericParameters,
    this.isVisible,
  });

  factory Type.fromJson(Map<String, dynamic> json) => _$TypeFromJson(json);

  @JsonKey(name: 'name', includeIfNull: true, defaultValue: '')
  final String? name;
  @JsonKey(
      name: 'customAttributes',
      includeIfNull: true,
      defaultValue: <CustomAttributeData>[])
  final List<CustomAttributeData>? customAttributes;
  @JsonKey(name: 'isCollectible', includeIfNull: true)
  final bool? isCollectible;
  @JsonKey(name: 'metadataToken', includeIfNull: true)
  final int? metadataToken;
  @JsonKey(name: 'isInterface', includeIfNull: true)
  final bool? isInterface;
  @JsonKey(
      name: 'memberType',
      includeIfNull: true,
      toJson: memberTypesToJson,
      fromJson: memberTypesFromJson)
  final enums.MemberTypes? memberType;
  @JsonKey(name: 'namespace', includeIfNull: true, defaultValue: '')
  final String? namespace;
  @JsonKey(name: 'assemblyQualifiedName', includeIfNull: true, defaultValue: '')
  final String? assemblyQualifiedName;
  @JsonKey(name: 'fullName', includeIfNull: true, defaultValue: '')
  final String? fullName;
  @JsonKey(name: 'assembly', includeIfNull: true)
  final Assembly? assembly;
  @JsonKey(name: 'module', includeIfNull: true)
  final Module? module;
  @JsonKey(name: 'isNested', includeIfNull: true)
  final bool? isNested;
  @JsonKey(name: 'declaringType', includeIfNull: true)
  final Type? declaringType;
  @JsonKey(name: 'declaringMethod', includeIfNull: true)
  final MethodBase? declaringMethod;
  @JsonKey(name: 'reflectedType', includeIfNull: true)
  final Type? reflectedType;
  @JsonKey(name: 'underlyingSystemType', includeIfNull: true)
  final Type? underlyingSystemType;
  @JsonKey(name: 'isTypeDefinition', includeIfNull: true)
  final bool? isTypeDefinition;
  @JsonKey(name: 'isArray', includeIfNull: true)
  final bool? isArray;
  @JsonKey(name: 'isByRef', includeIfNull: true)
  final bool? isByRef;
  @JsonKey(name: 'isPointer', includeIfNull: true)
  final bool? isPointer;
  @JsonKey(name: 'isConstructedGenericType', includeIfNull: true)
  final bool? isConstructedGenericType;
  @JsonKey(name: 'isGenericParameter', includeIfNull: true)
  final bool? isGenericParameter;
  @JsonKey(name: 'isGenericTypeParameter', includeIfNull: true)
  final bool? isGenericTypeParameter;
  @JsonKey(name: 'isGenericMethodParameter', includeIfNull: true)
  final bool? isGenericMethodParameter;
  @JsonKey(name: 'isGenericType', includeIfNull: true)
  final bool? isGenericType;
  @JsonKey(name: 'isGenericTypeDefinition', includeIfNull: true)
  final bool? isGenericTypeDefinition;
  @JsonKey(name: 'isSZArray', includeIfNull: true)
  final bool? isSZArray;
  @JsonKey(name: 'isVariableBoundArray', includeIfNull: true)
  final bool? isVariableBoundArray;
  @JsonKey(name: 'isByRefLike', includeIfNull: true)
  final bool? isByRefLike;
  @JsonKey(name: 'hasElementType', includeIfNull: true)
  final bool? hasElementType;
  @JsonKey(
      name: 'genericTypeArguments', includeIfNull: true, defaultValue: <Type>[])
  final List<Type>? genericTypeArguments;
  @JsonKey(name: 'genericParameterPosition', includeIfNull: true)
  final int? genericParameterPosition;
  @JsonKey(
      name: 'genericParameterAttributes',
      includeIfNull: true,
      toJson: genericParameterAttributesToJson,
      fromJson: genericParameterAttributesFromJson)
  final enums.GenericParameterAttributes? genericParameterAttributes;
  @JsonKey(
      name: 'attributes',
      includeIfNull: true,
      toJson: typeAttributesToJson,
      fromJson: typeAttributesFromJson)
  final enums.TypeAttributes? attributes;
  @JsonKey(name: 'isAbstract', includeIfNull: true)
  final bool? isAbstract;
  @JsonKey(name: 'isImport', includeIfNull: true)
  final bool? isImport;
  @JsonKey(name: 'isSealed', includeIfNull: true)
  final bool? isSealed;
  @JsonKey(name: 'isSpecialName', includeIfNull: true)
  final bool? isSpecialName;
  @JsonKey(name: 'isClass', includeIfNull: true)
  final bool? isClass;
  @JsonKey(name: 'isNestedAssembly', includeIfNull: true)
  final bool? isNestedAssembly;
  @JsonKey(name: 'isNestedFamANDAssem', includeIfNull: true)
  final bool? isNestedFamANDAssem;
  @JsonKey(name: 'isNestedFamily', includeIfNull: true)
  final bool? isNestedFamily;
  @JsonKey(name: 'isNestedFamORAssem', includeIfNull: true)
  final bool? isNestedFamORAssem;
  @JsonKey(name: 'isNestedPrivate', includeIfNull: true)
  final bool? isNestedPrivate;
  @JsonKey(name: 'isNestedPublic', includeIfNull: true)
  final bool? isNestedPublic;
  @JsonKey(name: 'isNotPublic', includeIfNull: true)
  final bool? isNotPublic;
  @JsonKey(name: 'isPublic', includeIfNull: true)
  final bool? isPublic;
  @JsonKey(name: 'isAutoLayout', includeIfNull: true)
  final bool? isAutoLayout;
  @JsonKey(name: 'isExplicitLayout', includeIfNull: true)
  final bool? isExplicitLayout;
  @JsonKey(name: 'isLayoutSequential', includeIfNull: true)
  final bool? isLayoutSequential;
  @JsonKey(name: 'isAnsiClass', includeIfNull: true)
  final bool? isAnsiClass;
  @JsonKey(name: 'isAutoClass', includeIfNull: true)
  final bool? isAutoClass;
  @JsonKey(name: 'isUnicodeClass', includeIfNull: true)
  final bool? isUnicodeClass;
  @JsonKey(name: 'isCOMObject', includeIfNull: true)
  final bool? isCOMObject;
  @JsonKey(name: 'isContextful', includeIfNull: true)
  final bool? isContextful;
  @JsonKey(name: 'isEnum', includeIfNull: true)
  final bool? isEnum;
  @JsonKey(name: 'isMarshalByRef', includeIfNull: true)
  final bool? isMarshalByRef;
  @JsonKey(name: 'isPrimitive', includeIfNull: true)
  final bool? isPrimitive;
  @JsonKey(name: 'isValueType', includeIfNull: true)
  final bool? isValueType;
  @JsonKey(name: 'isSignatureType', includeIfNull: true)
  final bool? isSignatureType;
  @JsonKey(name: 'isSecurityCritical', includeIfNull: true)
  final bool? isSecurityCritical;
  @JsonKey(name: 'isSecuritySafeCritical', includeIfNull: true)
  final bool? isSecuritySafeCritical;
  @JsonKey(name: 'isSecurityTransparent', includeIfNull: true)
  final bool? isSecurityTransparent;
  @JsonKey(name: 'structLayoutAttribute', includeIfNull: true)
  final StructLayoutAttribute? structLayoutAttribute;
  @JsonKey(name: 'typeInitializer', includeIfNull: true)
  final ConstructorInfo? typeInitializer;
  @JsonKey(name: 'typeHandle', includeIfNull: true)
  final RuntimeTypeHandle? typeHandle;
  @JsonKey(name: 'guid', includeIfNull: true, defaultValue: '')
  final String? guid;
  @JsonKey(name: 'baseType', includeIfNull: true)
  final Type? baseType;
  @JsonKey(name: 'isSerializable', includeIfNull: true)
  final bool? isSerializable;
  @JsonKey(name: 'containsGenericParameters', includeIfNull: true)
  final bool? containsGenericParameters;
  @JsonKey(name: 'isVisible', includeIfNull: true)
  final bool? isVisible;
  static const fromJsonFactory = _$TypeFromJson;
  static const toJsonFactory = _$TypeToJson;
  Map<String, dynamic> toJson() => _$TypeToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is Type &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.customAttributes, customAttributes) ||
                const DeepCollectionEquality()
                    .equals(other.customAttributes, customAttributes)) &&
            (identical(other.isCollectible, isCollectible) ||
                const DeepCollectionEquality()
                    .equals(other.isCollectible, isCollectible)) &&
            (identical(other.metadataToken, metadataToken) ||
                const DeepCollectionEquality()
                    .equals(other.metadataToken, metadataToken)) &&
            (identical(other.isInterface, isInterface) ||
                const DeepCollectionEquality()
                    .equals(other.isInterface, isInterface)) &&
            (identical(other.memberType, memberType) ||
                const DeepCollectionEquality()
                    .equals(other.memberType, memberType)) &&
            (identical(other.namespace, namespace) ||
                const DeepCollectionEquality()
                    .equals(other.namespace, namespace)) &&
            (identical(other.assemblyQualifiedName, assemblyQualifiedName) ||
                const DeepCollectionEquality().equals(
                    other.assemblyQualifiedName, assemblyQualifiedName)) &&
            (identical(other.fullName, fullName) ||
                const DeepCollectionEquality()
                    .equals(other.fullName, fullName)) &&
            (identical(other.assembly, assembly) ||
                const DeepCollectionEquality()
                    .equals(other.assembly, assembly)) &&
            (identical(other.module, module) ||
                const DeepCollectionEquality().equals(other.module, module)) &&
            (identical(other.isNested, isNested) ||
                const DeepCollectionEquality()
                    .equals(other.isNested, isNested)) &&
            (identical(other.declaringType, declaringType) ||
                const DeepCollectionEquality()
                    .equals(other.declaringType, declaringType)) &&
            (identical(other.declaringMethod, declaringMethod) ||
                const DeepCollectionEquality()
                    .equals(other.declaringMethod, declaringMethod)) &&
            (identical(other.reflectedType, reflectedType) ||
                const DeepCollectionEquality()
                    .equals(other.reflectedType, reflectedType)) &&
            (identical(other.underlyingSystemType, underlyingSystemType) ||
                const DeepCollectionEquality().equals(
                    other.underlyingSystemType, underlyingSystemType)) &&
            (identical(other.isTypeDefinition, isTypeDefinition) ||
                const DeepCollectionEquality()
                    .equals(other.isTypeDefinition, isTypeDefinition)) &&
            (identical(other.isArray, isArray) ||
                const DeepCollectionEquality()
                    .equals(other.isArray, isArray)) &&
            (identical(other.isByRef, isByRef) ||
                const DeepCollectionEquality()
                    .equals(other.isByRef, isByRef)) &&
            (identical(other.isPointer, isPointer) ||
                const DeepCollectionEquality()
                    .equals(other.isPointer, isPointer)) &&
            (identical(other.isConstructedGenericType, isConstructedGenericType) ||
                const DeepCollectionEquality().equals(
                    other.isConstructedGenericType,
                    isConstructedGenericType)) &&
            (identical(other.isGenericParameter, isGenericParameter) ||
                const DeepCollectionEquality().equals(other.isGenericParameter, isGenericParameter)) &&
            (identical(other.isGenericTypeParameter, isGenericTypeParameter) || const DeepCollectionEquality().equals(other.isGenericTypeParameter, isGenericTypeParameter)) &&
            (identical(other.isGenericMethodParameter, isGenericMethodParameter) || const DeepCollectionEquality().equals(other.isGenericMethodParameter, isGenericMethodParameter)) &&
            (identical(other.isGenericType, isGenericType) || const DeepCollectionEquality().equals(other.isGenericType, isGenericType)) &&
            (identical(other.isGenericTypeDefinition, isGenericTypeDefinition) || const DeepCollectionEquality().equals(other.isGenericTypeDefinition, isGenericTypeDefinition)) &&
            (identical(other.isSZArray, isSZArray) || const DeepCollectionEquality().equals(other.isSZArray, isSZArray)) &&
            (identical(other.isVariableBoundArray, isVariableBoundArray) || const DeepCollectionEquality().equals(other.isVariableBoundArray, isVariableBoundArray)) &&
            (identical(other.isByRefLike, isByRefLike) || const DeepCollectionEquality().equals(other.isByRefLike, isByRefLike)) &&
            (identical(other.hasElementType, hasElementType) || const DeepCollectionEquality().equals(other.hasElementType, hasElementType)) &&
            (identical(other.genericTypeArguments, genericTypeArguments) || const DeepCollectionEquality().equals(other.genericTypeArguments, genericTypeArguments)) &&
            (identical(other.genericParameterPosition, genericParameterPosition) || const DeepCollectionEquality().equals(other.genericParameterPosition, genericParameterPosition)) &&
            (identical(other.genericParameterAttributes, genericParameterAttributes) || const DeepCollectionEquality().equals(other.genericParameterAttributes, genericParameterAttributes)) &&
            (identical(other.attributes, attributes) || const DeepCollectionEquality().equals(other.attributes, attributes)) &&
            (identical(other.isAbstract, isAbstract) || const DeepCollectionEquality().equals(other.isAbstract, isAbstract)) &&
            (identical(other.isImport, isImport) || const DeepCollectionEquality().equals(other.isImport, isImport)) &&
            (identical(other.isSealed, isSealed) || const DeepCollectionEquality().equals(other.isSealed, isSealed)) &&
            (identical(other.isSpecialName, isSpecialName) || const DeepCollectionEquality().equals(other.isSpecialName, isSpecialName)) &&
            (identical(other.isClass, isClass) || const DeepCollectionEquality().equals(other.isClass, isClass)) &&
            (identical(other.isNestedAssembly, isNestedAssembly) || const DeepCollectionEquality().equals(other.isNestedAssembly, isNestedAssembly)) &&
            (identical(other.isNestedFamANDAssem, isNestedFamANDAssem) || const DeepCollectionEquality().equals(other.isNestedFamANDAssem, isNestedFamANDAssem)) &&
            (identical(other.isNestedFamily, isNestedFamily) || const DeepCollectionEquality().equals(other.isNestedFamily, isNestedFamily)) &&
            (identical(other.isNestedFamORAssem, isNestedFamORAssem) || const DeepCollectionEquality().equals(other.isNestedFamORAssem, isNestedFamORAssem)) &&
            (identical(other.isNestedPrivate, isNestedPrivate) || const DeepCollectionEquality().equals(other.isNestedPrivate, isNestedPrivate)) &&
            (identical(other.isNestedPublic, isNestedPublic) || const DeepCollectionEquality().equals(other.isNestedPublic, isNestedPublic)) &&
            (identical(other.isNotPublic, isNotPublic) || const DeepCollectionEquality().equals(other.isNotPublic, isNotPublic)) &&
            (identical(other.isPublic, isPublic) || const DeepCollectionEquality().equals(other.isPublic, isPublic)) &&
            (identical(other.isAutoLayout, isAutoLayout) || const DeepCollectionEquality().equals(other.isAutoLayout, isAutoLayout)) &&
            (identical(other.isExplicitLayout, isExplicitLayout) || const DeepCollectionEquality().equals(other.isExplicitLayout, isExplicitLayout)) &&
            (identical(other.isLayoutSequential, isLayoutSequential) || const DeepCollectionEquality().equals(other.isLayoutSequential, isLayoutSequential)) &&
            (identical(other.isAnsiClass, isAnsiClass) || const DeepCollectionEquality().equals(other.isAnsiClass, isAnsiClass)) &&
            (identical(other.isAutoClass, isAutoClass) || const DeepCollectionEquality().equals(other.isAutoClass, isAutoClass)) &&
            (identical(other.isUnicodeClass, isUnicodeClass) || const DeepCollectionEquality().equals(other.isUnicodeClass, isUnicodeClass)) &&
            (identical(other.isCOMObject, isCOMObject) || const DeepCollectionEquality().equals(other.isCOMObject, isCOMObject)) &&
            (identical(other.isContextful, isContextful) || const DeepCollectionEquality().equals(other.isContextful, isContextful)) &&
            (identical(other.isEnum, isEnum) || const DeepCollectionEquality().equals(other.isEnum, isEnum)) &&
            (identical(other.isMarshalByRef, isMarshalByRef) || const DeepCollectionEquality().equals(other.isMarshalByRef, isMarshalByRef)) &&
            (identical(other.isPrimitive, isPrimitive) || const DeepCollectionEquality().equals(other.isPrimitive, isPrimitive)) &&
            (identical(other.isValueType, isValueType) || const DeepCollectionEquality().equals(other.isValueType, isValueType)) &&
            (identical(other.isSignatureType, isSignatureType) || const DeepCollectionEquality().equals(other.isSignatureType, isSignatureType)) &&
            (identical(other.isSecurityCritical, isSecurityCritical) || const DeepCollectionEquality().equals(other.isSecurityCritical, isSecurityCritical)) &&
            (identical(other.isSecuritySafeCritical, isSecuritySafeCritical) || const DeepCollectionEquality().equals(other.isSecuritySafeCritical, isSecuritySafeCritical)) &&
            (identical(other.isSecurityTransparent, isSecurityTransparent) || const DeepCollectionEquality().equals(other.isSecurityTransparent, isSecurityTransparent)) &&
            (identical(other.structLayoutAttribute, structLayoutAttribute) || const DeepCollectionEquality().equals(other.structLayoutAttribute, structLayoutAttribute)) &&
            (identical(other.typeInitializer, typeInitializer) || const DeepCollectionEquality().equals(other.typeInitializer, typeInitializer)) &&
            (identical(other.typeHandle, typeHandle) || const DeepCollectionEquality().equals(other.typeHandle, typeHandle)) &&
            (identical(other.guid, guid) || const DeepCollectionEquality().equals(other.guid, guid)) &&
            (identical(other.baseType, baseType) || const DeepCollectionEquality().equals(other.baseType, baseType)) &&
            (identical(other.isSerializable, isSerializable) || const DeepCollectionEquality().equals(other.isSerializable, isSerializable)) &&
            (identical(other.containsGenericParameters, containsGenericParameters) || const DeepCollectionEquality().equals(other.containsGenericParameters, containsGenericParameters)) &&
            (identical(other.isVisible, isVisible) || const DeepCollectionEquality().equals(other.isVisible, isVisible)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(customAttributes) ^
      const DeepCollectionEquality().hash(isCollectible) ^
      const DeepCollectionEquality().hash(metadataToken) ^
      const DeepCollectionEquality().hash(isInterface) ^
      const DeepCollectionEquality().hash(memberType) ^
      const DeepCollectionEquality().hash(namespace) ^
      const DeepCollectionEquality().hash(assemblyQualifiedName) ^
      const DeepCollectionEquality().hash(fullName) ^
      const DeepCollectionEquality().hash(assembly) ^
      const DeepCollectionEquality().hash(module) ^
      const DeepCollectionEquality().hash(isNested) ^
      const DeepCollectionEquality().hash(declaringType) ^
      const DeepCollectionEquality().hash(declaringMethod) ^
      const DeepCollectionEquality().hash(reflectedType) ^
      const DeepCollectionEquality().hash(underlyingSystemType) ^
      const DeepCollectionEquality().hash(isTypeDefinition) ^
      const DeepCollectionEquality().hash(isArray) ^
      const DeepCollectionEquality().hash(isByRef) ^
      const DeepCollectionEquality().hash(isPointer) ^
      const DeepCollectionEquality().hash(isConstructedGenericType) ^
      const DeepCollectionEquality().hash(isGenericParameter) ^
      const DeepCollectionEquality().hash(isGenericTypeParameter) ^
      const DeepCollectionEquality().hash(isGenericMethodParameter) ^
      const DeepCollectionEquality().hash(isGenericType) ^
      const DeepCollectionEquality().hash(isGenericTypeDefinition) ^
      const DeepCollectionEquality().hash(isSZArray) ^
      const DeepCollectionEquality().hash(isVariableBoundArray) ^
      const DeepCollectionEquality().hash(isByRefLike) ^
      const DeepCollectionEquality().hash(hasElementType) ^
      const DeepCollectionEquality().hash(genericTypeArguments) ^
      const DeepCollectionEquality().hash(genericParameterPosition) ^
      const DeepCollectionEquality().hash(genericParameterAttributes) ^
      const DeepCollectionEquality().hash(attributes) ^
      const DeepCollectionEquality().hash(isAbstract) ^
      const DeepCollectionEquality().hash(isImport) ^
      const DeepCollectionEquality().hash(isSealed) ^
      const DeepCollectionEquality().hash(isSpecialName) ^
      const DeepCollectionEquality().hash(isClass) ^
      const DeepCollectionEquality().hash(isNestedAssembly) ^
      const DeepCollectionEquality().hash(isNestedFamANDAssem) ^
      const DeepCollectionEquality().hash(isNestedFamily) ^
      const DeepCollectionEquality().hash(isNestedFamORAssem) ^
      const DeepCollectionEquality().hash(isNestedPrivate) ^
      const DeepCollectionEquality().hash(isNestedPublic) ^
      const DeepCollectionEquality().hash(isNotPublic) ^
      const DeepCollectionEquality().hash(isPublic) ^
      const DeepCollectionEquality().hash(isAutoLayout) ^
      const DeepCollectionEquality().hash(isExplicitLayout) ^
      const DeepCollectionEquality().hash(isLayoutSequential) ^
      const DeepCollectionEquality().hash(isAnsiClass) ^
      const DeepCollectionEquality().hash(isAutoClass) ^
      const DeepCollectionEquality().hash(isUnicodeClass) ^
      const DeepCollectionEquality().hash(isCOMObject) ^
      const DeepCollectionEquality().hash(isContextful) ^
      const DeepCollectionEquality().hash(isEnum) ^
      const DeepCollectionEquality().hash(isMarshalByRef) ^
      const DeepCollectionEquality().hash(isPrimitive) ^
      const DeepCollectionEquality().hash(isValueType) ^
      const DeepCollectionEquality().hash(isSignatureType) ^
      const DeepCollectionEquality().hash(isSecurityCritical) ^
      const DeepCollectionEquality().hash(isSecuritySafeCritical) ^
      const DeepCollectionEquality().hash(isSecurityTransparent) ^
      const DeepCollectionEquality().hash(structLayoutAttribute) ^
      const DeepCollectionEquality().hash(typeInitializer) ^
      const DeepCollectionEquality().hash(typeHandle) ^
      const DeepCollectionEquality().hash(guid) ^
      const DeepCollectionEquality().hash(baseType) ^
      const DeepCollectionEquality().hash(isSerializable) ^
      const DeepCollectionEquality().hash(containsGenericParameters) ^
      const DeepCollectionEquality().hash(isVisible) ^
      runtimeType.hashCode;
}

extension $TypeExtension on Type {
  Type copyWith(
      {String? name,
      List<CustomAttributeData>? customAttributes,
      bool? isCollectible,
      int? metadataToken,
      bool? isInterface,
      enums.MemberTypes? memberType,
      String? namespace,
      String? assemblyQualifiedName,
      String? fullName,
      Assembly? assembly,
      Module? module,
      bool? isNested,
      Type? declaringType,
      MethodBase? declaringMethod,
      Type? reflectedType,
      Type? underlyingSystemType,
      bool? isTypeDefinition,
      bool? isArray,
      bool? isByRef,
      bool? isPointer,
      bool? isConstructedGenericType,
      bool? isGenericParameter,
      bool? isGenericTypeParameter,
      bool? isGenericMethodParameter,
      bool? isGenericType,
      bool? isGenericTypeDefinition,
      bool? isSZArray,
      bool? isVariableBoundArray,
      bool? isByRefLike,
      bool? hasElementType,
      List<Type>? genericTypeArguments,
      int? genericParameterPosition,
      enums.GenericParameterAttributes? genericParameterAttributes,
      enums.TypeAttributes? attributes,
      bool? isAbstract,
      bool? isImport,
      bool? isSealed,
      bool? isSpecialName,
      bool? isClass,
      bool? isNestedAssembly,
      bool? isNestedFamANDAssem,
      bool? isNestedFamily,
      bool? isNestedFamORAssem,
      bool? isNestedPrivate,
      bool? isNestedPublic,
      bool? isNotPublic,
      bool? isPublic,
      bool? isAutoLayout,
      bool? isExplicitLayout,
      bool? isLayoutSequential,
      bool? isAnsiClass,
      bool? isAutoClass,
      bool? isUnicodeClass,
      bool? isCOMObject,
      bool? isContextful,
      bool? isEnum,
      bool? isMarshalByRef,
      bool? isPrimitive,
      bool? isValueType,
      bool? isSignatureType,
      bool? isSecurityCritical,
      bool? isSecuritySafeCritical,
      bool? isSecurityTransparent,
      StructLayoutAttribute? structLayoutAttribute,
      ConstructorInfo? typeInitializer,
      RuntimeTypeHandle? typeHandle,
      String? guid,
      Type? baseType,
      bool? isSerializable,
      bool? containsGenericParameters,
      bool? isVisible}) {
    return Type(
        name: name ?? this.name,
        customAttributes: customAttributes ?? this.customAttributes,
        isCollectible: isCollectible ?? this.isCollectible,
        metadataToken: metadataToken ?? this.metadataToken,
        isInterface: isInterface ?? this.isInterface,
        memberType: memberType ?? this.memberType,
        namespace: namespace ?? this.namespace,
        assemblyQualifiedName:
            assemblyQualifiedName ?? this.assemblyQualifiedName,
        fullName: fullName ?? this.fullName,
        assembly: assembly ?? this.assembly,
        module: module ?? this.module,
        isNested: isNested ?? this.isNested,
        declaringType: declaringType ?? this.declaringType,
        declaringMethod: declaringMethod ?? this.declaringMethod,
        reflectedType: reflectedType ?? this.reflectedType,
        underlyingSystemType: underlyingSystemType ?? this.underlyingSystemType,
        isTypeDefinition: isTypeDefinition ?? this.isTypeDefinition,
        isArray: isArray ?? this.isArray,
        isByRef: isByRef ?? this.isByRef,
        isPointer: isPointer ?? this.isPointer,
        isConstructedGenericType:
            isConstructedGenericType ?? this.isConstructedGenericType,
        isGenericParameter: isGenericParameter ?? this.isGenericParameter,
        isGenericTypeParameter:
            isGenericTypeParameter ?? this.isGenericTypeParameter,
        isGenericMethodParameter:
            isGenericMethodParameter ?? this.isGenericMethodParameter,
        isGenericType: isGenericType ?? this.isGenericType,
        isGenericTypeDefinition:
            isGenericTypeDefinition ?? this.isGenericTypeDefinition,
        isSZArray: isSZArray ?? this.isSZArray,
        isVariableBoundArray: isVariableBoundArray ?? this.isVariableBoundArray,
        isByRefLike: isByRefLike ?? this.isByRefLike,
        hasElementType: hasElementType ?? this.hasElementType,
        genericTypeArguments: genericTypeArguments ?? this.genericTypeArguments,
        genericParameterPosition:
            genericParameterPosition ?? this.genericParameterPosition,
        genericParameterAttributes:
            genericParameterAttributes ?? this.genericParameterAttributes,
        attributes: attributes ?? this.attributes,
        isAbstract: isAbstract ?? this.isAbstract,
        isImport: isImport ?? this.isImport,
        isSealed: isSealed ?? this.isSealed,
        isSpecialName: isSpecialName ?? this.isSpecialName,
        isClass: isClass ?? this.isClass,
        isNestedAssembly: isNestedAssembly ?? this.isNestedAssembly,
        isNestedFamANDAssem: isNestedFamANDAssem ?? this.isNestedFamANDAssem,
        isNestedFamily: isNestedFamily ?? this.isNestedFamily,
        isNestedFamORAssem: isNestedFamORAssem ?? this.isNestedFamORAssem,
        isNestedPrivate: isNestedPrivate ?? this.isNestedPrivate,
        isNestedPublic: isNestedPublic ?? this.isNestedPublic,
        isNotPublic: isNotPublic ?? this.isNotPublic,
        isPublic: isPublic ?? this.isPublic,
        isAutoLayout: isAutoLayout ?? this.isAutoLayout,
        isExplicitLayout: isExplicitLayout ?? this.isExplicitLayout,
        isLayoutSequential: isLayoutSequential ?? this.isLayoutSequential,
        isAnsiClass: isAnsiClass ?? this.isAnsiClass,
        isAutoClass: isAutoClass ?? this.isAutoClass,
        isUnicodeClass: isUnicodeClass ?? this.isUnicodeClass,
        isCOMObject: isCOMObject ?? this.isCOMObject,
        isContextful: isContextful ?? this.isContextful,
        isEnum: isEnum ?? this.isEnum,
        isMarshalByRef: isMarshalByRef ?? this.isMarshalByRef,
        isPrimitive: isPrimitive ?? this.isPrimitive,
        isValueType: isValueType ?? this.isValueType,
        isSignatureType: isSignatureType ?? this.isSignatureType,
        isSecurityCritical: isSecurityCritical ?? this.isSecurityCritical,
        isSecuritySafeCritical:
            isSecuritySafeCritical ?? this.isSecuritySafeCritical,
        isSecurityTransparent:
            isSecurityTransparent ?? this.isSecurityTransparent,
        structLayoutAttribute:
            structLayoutAttribute ?? this.structLayoutAttribute,
        typeInitializer: typeInitializer ?? this.typeInitializer,
        typeHandle: typeHandle ?? this.typeHandle,
        guid: guid ?? this.guid,
        baseType: baseType ?? this.baseType,
        isSerializable: isSerializable ?? this.isSerializable,
        containsGenericParameters:
            containsGenericParameters ?? this.containsGenericParameters,
        isVisible: isVisible ?? this.isVisible);
  }
}

@JsonSerializable(explicitToJson: true)
class TypeInfo {
  TypeInfo({
    this.name,
    this.customAttributes,
    this.isCollectible,
    this.metadataToken,
    this.isInterface,
    this.memberType,
    this.namespace,
    this.assemblyQualifiedName,
    this.fullName,
    this.assembly,
    this.module,
    this.isNested,
    this.declaringType,
    this.declaringMethod,
    this.reflectedType,
    this.underlyingSystemType,
    this.isTypeDefinition,
    this.isArray,
    this.isByRef,
    this.isPointer,
    this.isConstructedGenericType,
    this.isGenericParameter,
    this.isGenericTypeParameter,
    this.isGenericMethodParameter,
    this.isGenericType,
    this.isGenericTypeDefinition,
    this.isSZArray,
    this.isVariableBoundArray,
    this.isByRefLike,
    this.hasElementType,
    this.genericTypeArguments,
    this.genericParameterPosition,
    this.genericParameterAttributes,
    this.attributes,
    this.isAbstract,
    this.isImport,
    this.isSealed,
    this.isSpecialName,
    this.isClass,
    this.isNestedAssembly,
    this.isNestedFamANDAssem,
    this.isNestedFamily,
    this.isNestedFamORAssem,
    this.isNestedPrivate,
    this.isNestedPublic,
    this.isNotPublic,
    this.isPublic,
    this.isAutoLayout,
    this.isExplicitLayout,
    this.isLayoutSequential,
    this.isAnsiClass,
    this.isAutoClass,
    this.isUnicodeClass,
    this.isCOMObject,
    this.isContextful,
    this.isEnum,
    this.isMarshalByRef,
    this.isPrimitive,
    this.isValueType,
    this.isSignatureType,
    this.isSecurityCritical,
    this.isSecuritySafeCritical,
    this.isSecurityTransparent,
    this.structLayoutAttribute,
    this.typeInitializer,
    this.typeHandle,
    this.guid,
    this.baseType,
    this.isSerializable,
    this.containsGenericParameters,
    this.isVisible,
    this.genericTypeParameters,
    this.declaredConstructors,
    this.declaredEvents,
    this.declaredFields,
    this.declaredMembers,
    this.declaredMethods,
    this.declaredNestedTypes,
    this.declaredProperties,
    this.implementedInterfaces,
  });

  factory TypeInfo.fromJson(Map<String, dynamic> json) =>
      _$TypeInfoFromJson(json);

  @JsonKey(name: 'name', includeIfNull: true, defaultValue: '')
  final String? name;
  @JsonKey(
      name: 'customAttributes',
      includeIfNull: true,
      defaultValue: <CustomAttributeData>[])
  final List<CustomAttributeData>? customAttributes;
  @JsonKey(name: 'isCollectible', includeIfNull: true)
  final bool? isCollectible;
  @JsonKey(name: 'metadataToken', includeIfNull: true)
  final int? metadataToken;
  @JsonKey(name: 'isInterface', includeIfNull: true)
  final bool? isInterface;
  @JsonKey(
      name: 'memberType',
      includeIfNull: true,
      toJson: memberTypesToJson,
      fromJson: memberTypesFromJson)
  final enums.MemberTypes? memberType;
  @JsonKey(name: 'namespace', includeIfNull: true, defaultValue: '')
  final String? namespace;
  @JsonKey(name: 'assemblyQualifiedName', includeIfNull: true, defaultValue: '')
  final String? assemblyQualifiedName;
  @JsonKey(name: 'fullName', includeIfNull: true, defaultValue: '')
  final String? fullName;
  @JsonKey(name: 'assembly', includeIfNull: true)
  final Assembly? assembly;
  @JsonKey(name: 'module', includeIfNull: true)
  final Module? module;
  @JsonKey(name: 'isNested', includeIfNull: true)
  final bool? isNested;
  @JsonKey(name: 'declaringType', includeIfNull: true)
  final Type? declaringType;
  @JsonKey(name: 'declaringMethod', includeIfNull: true)
  final MethodBase? declaringMethod;
  @JsonKey(name: 'reflectedType', includeIfNull: true)
  final Type? reflectedType;
  @JsonKey(name: 'underlyingSystemType', includeIfNull: true)
  final Type? underlyingSystemType;
  @JsonKey(name: 'isTypeDefinition', includeIfNull: true)
  final bool? isTypeDefinition;
  @JsonKey(name: 'isArray', includeIfNull: true)
  final bool? isArray;
  @JsonKey(name: 'isByRef', includeIfNull: true)
  final bool? isByRef;
  @JsonKey(name: 'isPointer', includeIfNull: true)
  final bool? isPointer;
  @JsonKey(name: 'isConstructedGenericType', includeIfNull: true)
  final bool? isConstructedGenericType;
  @JsonKey(name: 'isGenericParameter', includeIfNull: true)
  final bool? isGenericParameter;
  @JsonKey(name: 'isGenericTypeParameter', includeIfNull: true)
  final bool? isGenericTypeParameter;
  @JsonKey(name: 'isGenericMethodParameter', includeIfNull: true)
  final bool? isGenericMethodParameter;
  @JsonKey(name: 'isGenericType', includeIfNull: true)
  final bool? isGenericType;
  @JsonKey(name: 'isGenericTypeDefinition', includeIfNull: true)
  final bool? isGenericTypeDefinition;
  @JsonKey(name: 'isSZArray', includeIfNull: true)
  final bool? isSZArray;
  @JsonKey(name: 'isVariableBoundArray', includeIfNull: true)
  final bool? isVariableBoundArray;
  @JsonKey(name: 'isByRefLike', includeIfNull: true)
  final bool? isByRefLike;
  @JsonKey(name: 'hasElementType', includeIfNull: true)
  final bool? hasElementType;
  @JsonKey(
      name: 'genericTypeArguments', includeIfNull: true, defaultValue: <Type>[])
  final List<Type>? genericTypeArguments;
  @JsonKey(name: 'genericParameterPosition', includeIfNull: true)
  final int? genericParameterPosition;
  @JsonKey(
      name: 'genericParameterAttributes',
      includeIfNull: true,
      toJson: genericParameterAttributesToJson,
      fromJson: genericParameterAttributesFromJson)
  final enums.GenericParameterAttributes? genericParameterAttributes;
  @JsonKey(
      name: 'attributes',
      includeIfNull: true,
      toJson: typeAttributesToJson,
      fromJson: typeAttributesFromJson)
  final enums.TypeAttributes? attributes;
  @JsonKey(name: 'isAbstract', includeIfNull: true)
  final bool? isAbstract;
  @JsonKey(name: 'isImport', includeIfNull: true)
  final bool? isImport;
  @JsonKey(name: 'isSealed', includeIfNull: true)
  final bool? isSealed;
  @JsonKey(name: 'isSpecialName', includeIfNull: true)
  final bool? isSpecialName;
  @JsonKey(name: 'isClass', includeIfNull: true)
  final bool? isClass;
  @JsonKey(name: 'isNestedAssembly', includeIfNull: true)
  final bool? isNestedAssembly;
  @JsonKey(name: 'isNestedFamANDAssem', includeIfNull: true)
  final bool? isNestedFamANDAssem;
  @JsonKey(name: 'isNestedFamily', includeIfNull: true)
  final bool? isNestedFamily;
  @JsonKey(name: 'isNestedFamORAssem', includeIfNull: true)
  final bool? isNestedFamORAssem;
  @JsonKey(name: 'isNestedPrivate', includeIfNull: true)
  final bool? isNestedPrivate;
  @JsonKey(name: 'isNestedPublic', includeIfNull: true)
  final bool? isNestedPublic;
  @JsonKey(name: 'isNotPublic', includeIfNull: true)
  final bool? isNotPublic;
  @JsonKey(name: 'isPublic', includeIfNull: true)
  final bool? isPublic;
  @JsonKey(name: 'isAutoLayout', includeIfNull: true)
  final bool? isAutoLayout;
  @JsonKey(name: 'isExplicitLayout', includeIfNull: true)
  final bool? isExplicitLayout;
  @JsonKey(name: 'isLayoutSequential', includeIfNull: true)
  final bool? isLayoutSequential;
  @JsonKey(name: 'isAnsiClass', includeIfNull: true)
  final bool? isAnsiClass;
  @JsonKey(name: 'isAutoClass', includeIfNull: true)
  final bool? isAutoClass;
  @JsonKey(name: 'isUnicodeClass', includeIfNull: true)
  final bool? isUnicodeClass;
  @JsonKey(name: 'isCOMObject', includeIfNull: true)
  final bool? isCOMObject;
  @JsonKey(name: 'isContextful', includeIfNull: true)
  final bool? isContextful;
  @JsonKey(name: 'isEnum', includeIfNull: true)
  final bool? isEnum;
  @JsonKey(name: 'isMarshalByRef', includeIfNull: true)
  final bool? isMarshalByRef;
  @JsonKey(name: 'isPrimitive', includeIfNull: true)
  final bool? isPrimitive;
  @JsonKey(name: 'isValueType', includeIfNull: true)
  final bool? isValueType;
  @JsonKey(name: 'isSignatureType', includeIfNull: true)
  final bool? isSignatureType;
  @JsonKey(name: 'isSecurityCritical', includeIfNull: true)
  final bool? isSecurityCritical;
  @JsonKey(name: 'isSecuritySafeCritical', includeIfNull: true)
  final bool? isSecuritySafeCritical;
  @JsonKey(name: 'isSecurityTransparent', includeIfNull: true)
  final bool? isSecurityTransparent;
  @JsonKey(name: 'structLayoutAttribute', includeIfNull: true)
  final StructLayoutAttribute? structLayoutAttribute;
  @JsonKey(name: 'typeInitializer', includeIfNull: true)
  final ConstructorInfo? typeInitializer;
  @JsonKey(name: 'typeHandle', includeIfNull: true)
  final RuntimeTypeHandle? typeHandle;
  @JsonKey(name: 'guid', includeIfNull: true, defaultValue: '')
  final String? guid;
  @JsonKey(name: 'baseType', includeIfNull: true)
  final Type? baseType;
  @JsonKey(name: 'isSerializable', includeIfNull: true)
  final bool? isSerializable;
  @JsonKey(name: 'containsGenericParameters', includeIfNull: true)
  final bool? containsGenericParameters;
  @JsonKey(name: 'isVisible', includeIfNull: true)
  final bool? isVisible;
  @JsonKey(
      name: 'genericTypeParameters',
      includeIfNull: true,
      defaultValue: <Type>[])
  final List<Type>? genericTypeParameters;
  @JsonKey(
      name: 'declaredConstructors',
      includeIfNull: true,
      defaultValue: <ConstructorInfo>[])
  final List<ConstructorInfo>? declaredConstructors;
  @JsonKey(
      name: 'declaredEvents', includeIfNull: true, defaultValue: <EventInfo>[])
  final List<EventInfo>? declaredEvents;
  @JsonKey(
      name: 'declaredFields', includeIfNull: true, defaultValue: <FieldInfo>[])
  final List<FieldInfo>? declaredFields;
  @JsonKey(
      name: 'declaredMembers',
      includeIfNull: true,
      defaultValue: <MemberInfo>[])
  final List<MemberInfo>? declaredMembers;
  @JsonKey(
      name: 'declaredMethods',
      includeIfNull: true,
      defaultValue: <MethodInfo>[])
  final List<MethodInfo>? declaredMethods;
  @JsonKey(
      name: 'declaredNestedTypes',
      includeIfNull: true,
      defaultValue: <TypeInfo>[])
  final List<TypeInfo>? declaredNestedTypes;
  @JsonKey(
      name: 'declaredProperties',
      includeIfNull: true,
      defaultValue: <PropertyInfo>[])
  final List<PropertyInfo>? declaredProperties;
  @JsonKey(
      name: 'implementedInterfaces',
      includeIfNull: true,
      defaultValue: <Type>[])
  final List<Type>? implementedInterfaces;
  static const fromJsonFactory = _$TypeInfoFromJson;
  static const toJsonFactory = _$TypeInfoToJson;
  Map<String, dynamic> toJson() => _$TypeInfoToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is TypeInfo &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.customAttributes, customAttributes) ||
                const DeepCollectionEquality()
                    .equals(other.customAttributes, customAttributes)) &&
            (identical(other.isCollectible, isCollectible) ||
                const DeepCollectionEquality()
                    .equals(other.isCollectible, isCollectible)) &&
            (identical(other.metadataToken, metadataToken) ||
                const DeepCollectionEquality()
                    .equals(other.metadataToken, metadataToken)) &&
            (identical(other.isInterface, isInterface) ||
                const DeepCollectionEquality()
                    .equals(other.isInterface, isInterface)) &&
            (identical(other.memberType, memberType) ||
                const DeepCollectionEquality()
                    .equals(other.memberType, memberType)) &&
            (identical(other.namespace, namespace) ||
                const DeepCollectionEquality()
                    .equals(other.namespace, namespace)) &&
            (identical(other.assemblyQualifiedName, assemblyQualifiedName) ||
                const DeepCollectionEquality().equals(
                    other.assemblyQualifiedName, assemblyQualifiedName)) &&
            (identical(other.fullName, fullName) ||
                const DeepCollectionEquality()
                    .equals(other.fullName, fullName)) &&
            (identical(other.assembly, assembly) ||
                const DeepCollectionEquality()
                    .equals(other.assembly, assembly)) &&
            (identical(other.module, module) ||
                const DeepCollectionEquality().equals(other.module, module)) &&
            (identical(other.isNested, isNested) ||
                const DeepCollectionEquality()
                    .equals(other.isNested, isNested)) &&
            (identical(other.declaringType, declaringType) ||
                const DeepCollectionEquality()
                    .equals(other.declaringType, declaringType)) &&
            (identical(other.declaringMethod, declaringMethod) ||
                const DeepCollectionEquality()
                    .equals(other.declaringMethod, declaringMethod)) &&
            (identical(other.reflectedType, reflectedType) ||
                const DeepCollectionEquality()
                    .equals(other.reflectedType, reflectedType)) &&
            (identical(other.underlyingSystemType, underlyingSystemType) ||
                const DeepCollectionEquality().equals(
                    other.underlyingSystemType, underlyingSystemType)) &&
            (identical(other.isTypeDefinition, isTypeDefinition) ||
                const DeepCollectionEquality()
                    .equals(other.isTypeDefinition, isTypeDefinition)) &&
            (identical(other.isArray, isArray) ||
                const DeepCollectionEquality()
                    .equals(other.isArray, isArray)) &&
            (identical(other.isByRef, isByRef) ||
                const DeepCollectionEquality()
                    .equals(other.isByRef, isByRef)) &&
            (identical(other.isPointer, isPointer) ||
                const DeepCollectionEquality()
                    .equals(other.isPointer, isPointer)) &&
            (identical(other.isConstructedGenericType, isConstructedGenericType) ||
                const DeepCollectionEquality().equals(
                    other.isConstructedGenericType,
                    isConstructedGenericType)) &&
            (identical(other.isGenericParameter, isGenericParameter) ||
                const DeepCollectionEquality().equals(other.isGenericParameter, isGenericParameter)) &&
            (identical(other.isGenericTypeParameter, isGenericTypeParameter) || const DeepCollectionEquality().equals(other.isGenericTypeParameter, isGenericTypeParameter)) &&
            (identical(other.isGenericMethodParameter, isGenericMethodParameter) || const DeepCollectionEquality().equals(other.isGenericMethodParameter, isGenericMethodParameter)) &&
            (identical(other.isGenericType, isGenericType) || const DeepCollectionEquality().equals(other.isGenericType, isGenericType)) &&
            (identical(other.isGenericTypeDefinition, isGenericTypeDefinition) || const DeepCollectionEquality().equals(other.isGenericTypeDefinition, isGenericTypeDefinition)) &&
            (identical(other.isSZArray, isSZArray) || const DeepCollectionEquality().equals(other.isSZArray, isSZArray)) &&
            (identical(other.isVariableBoundArray, isVariableBoundArray) || const DeepCollectionEquality().equals(other.isVariableBoundArray, isVariableBoundArray)) &&
            (identical(other.isByRefLike, isByRefLike) || const DeepCollectionEquality().equals(other.isByRefLike, isByRefLike)) &&
            (identical(other.hasElementType, hasElementType) || const DeepCollectionEquality().equals(other.hasElementType, hasElementType)) &&
            (identical(other.genericTypeArguments, genericTypeArguments) || const DeepCollectionEquality().equals(other.genericTypeArguments, genericTypeArguments)) &&
            (identical(other.genericParameterPosition, genericParameterPosition) || const DeepCollectionEquality().equals(other.genericParameterPosition, genericParameterPosition)) &&
            (identical(other.genericParameterAttributes, genericParameterAttributes) || const DeepCollectionEquality().equals(other.genericParameterAttributes, genericParameterAttributes)) &&
            (identical(other.attributes, attributes) || const DeepCollectionEquality().equals(other.attributes, attributes)) &&
            (identical(other.isAbstract, isAbstract) || const DeepCollectionEquality().equals(other.isAbstract, isAbstract)) &&
            (identical(other.isImport, isImport) || const DeepCollectionEquality().equals(other.isImport, isImport)) &&
            (identical(other.isSealed, isSealed) || const DeepCollectionEquality().equals(other.isSealed, isSealed)) &&
            (identical(other.isSpecialName, isSpecialName) || const DeepCollectionEquality().equals(other.isSpecialName, isSpecialName)) &&
            (identical(other.isClass, isClass) || const DeepCollectionEquality().equals(other.isClass, isClass)) &&
            (identical(other.isNestedAssembly, isNestedAssembly) || const DeepCollectionEquality().equals(other.isNestedAssembly, isNestedAssembly)) &&
            (identical(other.isNestedFamANDAssem, isNestedFamANDAssem) || const DeepCollectionEquality().equals(other.isNestedFamANDAssem, isNestedFamANDAssem)) &&
            (identical(other.isNestedFamily, isNestedFamily) || const DeepCollectionEquality().equals(other.isNestedFamily, isNestedFamily)) &&
            (identical(other.isNestedFamORAssem, isNestedFamORAssem) || const DeepCollectionEquality().equals(other.isNestedFamORAssem, isNestedFamORAssem)) &&
            (identical(other.isNestedPrivate, isNestedPrivate) || const DeepCollectionEquality().equals(other.isNestedPrivate, isNestedPrivate)) &&
            (identical(other.isNestedPublic, isNestedPublic) || const DeepCollectionEquality().equals(other.isNestedPublic, isNestedPublic)) &&
            (identical(other.isNotPublic, isNotPublic) || const DeepCollectionEquality().equals(other.isNotPublic, isNotPublic)) &&
            (identical(other.isPublic, isPublic) || const DeepCollectionEquality().equals(other.isPublic, isPublic)) &&
            (identical(other.isAutoLayout, isAutoLayout) || const DeepCollectionEquality().equals(other.isAutoLayout, isAutoLayout)) &&
            (identical(other.isExplicitLayout, isExplicitLayout) || const DeepCollectionEquality().equals(other.isExplicitLayout, isExplicitLayout)) &&
            (identical(other.isLayoutSequential, isLayoutSequential) || const DeepCollectionEquality().equals(other.isLayoutSequential, isLayoutSequential)) &&
            (identical(other.isAnsiClass, isAnsiClass) || const DeepCollectionEquality().equals(other.isAnsiClass, isAnsiClass)) &&
            (identical(other.isAutoClass, isAutoClass) || const DeepCollectionEquality().equals(other.isAutoClass, isAutoClass)) &&
            (identical(other.isUnicodeClass, isUnicodeClass) || const DeepCollectionEquality().equals(other.isUnicodeClass, isUnicodeClass)) &&
            (identical(other.isCOMObject, isCOMObject) || const DeepCollectionEquality().equals(other.isCOMObject, isCOMObject)) &&
            (identical(other.isContextful, isContextful) || const DeepCollectionEquality().equals(other.isContextful, isContextful)) &&
            (identical(other.isEnum, isEnum) || const DeepCollectionEquality().equals(other.isEnum, isEnum)) &&
            (identical(other.isMarshalByRef, isMarshalByRef) || const DeepCollectionEquality().equals(other.isMarshalByRef, isMarshalByRef)) &&
            (identical(other.isPrimitive, isPrimitive) || const DeepCollectionEquality().equals(other.isPrimitive, isPrimitive)) &&
            (identical(other.isValueType, isValueType) || const DeepCollectionEquality().equals(other.isValueType, isValueType)) &&
            (identical(other.isSignatureType, isSignatureType) || const DeepCollectionEquality().equals(other.isSignatureType, isSignatureType)) &&
            (identical(other.isSecurityCritical, isSecurityCritical) || const DeepCollectionEquality().equals(other.isSecurityCritical, isSecurityCritical)) &&
            (identical(other.isSecuritySafeCritical, isSecuritySafeCritical) || const DeepCollectionEquality().equals(other.isSecuritySafeCritical, isSecuritySafeCritical)) &&
            (identical(other.isSecurityTransparent, isSecurityTransparent) || const DeepCollectionEquality().equals(other.isSecurityTransparent, isSecurityTransparent)) &&
            (identical(other.structLayoutAttribute, structLayoutAttribute) || const DeepCollectionEquality().equals(other.structLayoutAttribute, structLayoutAttribute)) &&
            (identical(other.typeInitializer, typeInitializer) || const DeepCollectionEquality().equals(other.typeInitializer, typeInitializer)) &&
            (identical(other.typeHandle, typeHandle) || const DeepCollectionEquality().equals(other.typeHandle, typeHandle)) &&
            (identical(other.guid, guid) || const DeepCollectionEquality().equals(other.guid, guid)) &&
            (identical(other.baseType, baseType) || const DeepCollectionEquality().equals(other.baseType, baseType)) &&
            (identical(other.isSerializable, isSerializable) || const DeepCollectionEquality().equals(other.isSerializable, isSerializable)) &&
            (identical(other.containsGenericParameters, containsGenericParameters) || const DeepCollectionEquality().equals(other.containsGenericParameters, containsGenericParameters)) &&
            (identical(other.isVisible, isVisible) || const DeepCollectionEquality().equals(other.isVisible, isVisible)) &&
            (identical(other.genericTypeParameters, genericTypeParameters) || const DeepCollectionEquality().equals(other.genericTypeParameters, genericTypeParameters)) &&
            (identical(other.declaredConstructors, declaredConstructors) || const DeepCollectionEquality().equals(other.declaredConstructors, declaredConstructors)) &&
            (identical(other.declaredEvents, declaredEvents) || const DeepCollectionEquality().equals(other.declaredEvents, declaredEvents)) &&
            (identical(other.declaredFields, declaredFields) || const DeepCollectionEquality().equals(other.declaredFields, declaredFields)) &&
            (identical(other.declaredMembers, declaredMembers) || const DeepCollectionEquality().equals(other.declaredMembers, declaredMembers)) &&
            (identical(other.declaredMethods, declaredMethods) || const DeepCollectionEquality().equals(other.declaredMethods, declaredMethods)) &&
            (identical(other.declaredNestedTypes, declaredNestedTypes) || const DeepCollectionEquality().equals(other.declaredNestedTypes, declaredNestedTypes)) &&
            (identical(other.declaredProperties, declaredProperties) || const DeepCollectionEquality().equals(other.declaredProperties, declaredProperties)) &&
            (identical(other.implementedInterfaces, implementedInterfaces) || const DeepCollectionEquality().equals(other.implementedInterfaces, implementedInterfaces)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(customAttributes) ^
      const DeepCollectionEquality().hash(isCollectible) ^
      const DeepCollectionEquality().hash(metadataToken) ^
      const DeepCollectionEquality().hash(isInterface) ^
      const DeepCollectionEquality().hash(memberType) ^
      const DeepCollectionEquality().hash(namespace) ^
      const DeepCollectionEquality().hash(assemblyQualifiedName) ^
      const DeepCollectionEquality().hash(fullName) ^
      const DeepCollectionEquality().hash(assembly) ^
      const DeepCollectionEquality().hash(module) ^
      const DeepCollectionEquality().hash(isNested) ^
      const DeepCollectionEquality().hash(declaringType) ^
      const DeepCollectionEquality().hash(declaringMethod) ^
      const DeepCollectionEquality().hash(reflectedType) ^
      const DeepCollectionEquality().hash(underlyingSystemType) ^
      const DeepCollectionEquality().hash(isTypeDefinition) ^
      const DeepCollectionEquality().hash(isArray) ^
      const DeepCollectionEquality().hash(isByRef) ^
      const DeepCollectionEquality().hash(isPointer) ^
      const DeepCollectionEquality().hash(isConstructedGenericType) ^
      const DeepCollectionEquality().hash(isGenericParameter) ^
      const DeepCollectionEquality().hash(isGenericTypeParameter) ^
      const DeepCollectionEquality().hash(isGenericMethodParameter) ^
      const DeepCollectionEquality().hash(isGenericType) ^
      const DeepCollectionEquality().hash(isGenericTypeDefinition) ^
      const DeepCollectionEquality().hash(isSZArray) ^
      const DeepCollectionEquality().hash(isVariableBoundArray) ^
      const DeepCollectionEquality().hash(isByRefLike) ^
      const DeepCollectionEquality().hash(hasElementType) ^
      const DeepCollectionEquality().hash(genericTypeArguments) ^
      const DeepCollectionEquality().hash(genericParameterPosition) ^
      const DeepCollectionEquality().hash(genericParameterAttributes) ^
      const DeepCollectionEquality().hash(attributes) ^
      const DeepCollectionEquality().hash(isAbstract) ^
      const DeepCollectionEquality().hash(isImport) ^
      const DeepCollectionEquality().hash(isSealed) ^
      const DeepCollectionEquality().hash(isSpecialName) ^
      const DeepCollectionEquality().hash(isClass) ^
      const DeepCollectionEquality().hash(isNestedAssembly) ^
      const DeepCollectionEquality().hash(isNestedFamANDAssem) ^
      const DeepCollectionEquality().hash(isNestedFamily) ^
      const DeepCollectionEquality().hash(isNestedFamORAssem) ^
      const DeepCollectionEquality().hash(isNestedPrivate) ^
      const DeepCollectionEquality().hash(isNestedPublic) ^
      const DeepCollectionEquality().hash(isNotPublic) ^
      const DeepCollectionEquality().hash(isPublic) ^
      const DeepCollectionEquality().hash(isAutoLayout) ^
      const DeepCollectionEquality().hash(isExplicitLayout) ^
      const DeepCollectionEquality().hash(isLayoutSequential) ^
      const DeepCollectionEquality().hash(isAnsiClass) ^
      const DeepCollectionEquality().hash(isAutoClass) ^
      const DeepCollectionEquality().hash(isUnicodeClass) ^
      const DeepCollectionEquality().hash(isCOMObject) ^
      const DeepCollectionEquality().hash(isContextful) ^
      const DeepCollectionEquality().hash(isEnum) ^
      const DeepCollectionEquality().hash(isMarshalByRef) ^
      const DeepCollectionEquality().hash(isPrimitive) ^
      const DeepCollectionEquality().hash(isValueType) ^
      const DeepCollectionEquality().hash(isSignatureType) ^
      const DeepCollectionEquality().hash(isSecurityCritical) ^
      const DeepCollectionEquality().hash(isSecuritySafeCritical) ^
      const DeepCollectionEquality().hash(isSecurityTransparent) ^
      const DeepCollectionEquality().hash(structLayoutAttribute) ^
      const DeepCollectionEquality().hash(typeInitializer) ^
      const DeepCollectionEquality().hash(typeHandle) ^
      const DeepCollectionEquality().hash(guid) ^
      const DeepCollectionEquality().hash(baseType) ^
      const DeepCollectionEquality().hash(isSerializable) ^
      const DeepCollectionEquality().hash(containsGenericParameters) ^
      const DeepCollectionEquality().hash(isVisible) ^
      const DeepCollectionEquality().hash(genericTypeParameters) ^
      const DeepCollectionEquality().hash(declaredConstructors) ^
      const DeepCollectionEquality().hash(declaredEvents) ^
      const DeepCollectionEquality().hash(declaredFields) ^
      const DeepCollectionEquality().hash(declaredMembers) ^
      const DeepCollectionEquality().hash(declaredMethods) ^
      const DeepCollectionEquality().hash(declaredNestedTypes) ^
      const DeepCollectionEquality().hash(declaredProperties) ^
      const DeepCollectionEquality().hash(implementedInterfaces) ^
      runtimeType.hashCode;
}

extension $TypeInfoExtension on TypeInfo {
  TypeInfo copyWith(
      {String? name,
      List<CustomAttributeData>? customAttributes,
      bool? isCollectible,
      int? metadataToken,
      bool? isInterface,
      enums.MemberTypes? memberType,
      String? namespace,
      String? assemblyQualifiedName,
      String? fullName,
      Assembly? assembly,
      Module? module,
      bool? isNested,
      Type? declaringType,
      MethodBase? declaringMethod,
      Type? reflectedType,
      Type? underlyingSystemType,
      bool? isTypeDefinition,
      bool? isArray,
      bool? isByRef,
      bool? isPointer,
      bool? isConstructedGenericType,
      bool? isGenericParameter,
      bool? isGenericTypeParameter,
      bool? isGenericMethodParameter,
      bool? isGenericType,
      bool? isGenericTypeDefinition,
      bool? isSZArray,
      bool? isVariableBoundArray,
      bool? isByRefLike,
      bool? hasElementType,
      List<Type>? genericTypeArguments,
      int? genericParameterPosition,
      enums.GenericParameterAttributes? genericParameterAttributes,
      enums.TypeAttributes? attributes,
      bool? isAbstract,
      bool? isImport,
      bool? isSealed,
      bool? isSpecialName,
      bool? isClass,
      bool? isNestedAssembly,
      bool? isNestedFamANDAssem,
      bool? isNestedFamily,
      bool? isNestedFamORAssem,
      bool? isNestedPrivate,
      bool? isNestedPublic,
      bool? isNotPublic,
      bool? isPublic,
      bool? isAutoLayout,
      bool? isExplicitLayout,
      bool? isLayoutSequential,
      bool? isAnsiClass,
      bool? isAutoClass,
      bool? isUnicodeClass,
      bool? isCOMObject,
      bool? isContextful,
      bool? isEnum,
      bool? isMarshalByRef,
      bool? isPrimitive,
      bool? isValueType,
      bool? isSignatureType,
      bool? isSecurityCritical,
      bool? isSecuritySafeCritical,
      bool? isSecurityTransparent,
      StructLayoutAttribute? structLayoutAttribute,
      ConstructorInfo? typeInitializer,
      RuntimeTypeHandle? typeHandle,
      String? guid,
      Type? baseType,
      bool? isSerializable,
      bool? containsGenericParameters,
      bool? isVisible,
      List<Type>? genericTypeParameters,
      List<ConstructorInfo>? declaredConstructors,
      List<EventInfo>? declaredEvents,
      List<FieldInfo>? declaredFields,
      List<MemberInfo>? declaredMembers,
      List<MethodInfo>? declaredMethods,
      List<TypeInfo>? declaredNestedTypes,
      List<PropertyInfo>? declaredProperties,
      List<Type>? implementedInterfaces}) {
    return TypeInfo(
        name: name ?? this.name,
        customAttributes: customAttributes ?? this.customAttributes,
        isCollectible: isCollectible ?? this.isCollectible,
        metadataToken: metadataToken ?? this.metadataToken,
        isInterface: isInterface ?? this.isInterface,
        memberType: memberType ?? this.memberType,
        namespace: namespace ?? this.namespace,
        assemblyQualifiedName:
            assemblyQualifiedName ?? this.assemblyQualifiedName,
        fullName: fullName ?? this.fullName,
        assembly: assembly ?? this.assembly,
        module: module ?? this.module,
        isNested: isNested ?? this.isNested,
        declaringType: declaringType ?? this.declaringType,
        declaringMethod: declaringMethod ?? this.declaringMethod,
        reflectedType: reflectedType ?? this.reflectedType,
        underlyingSystemType: underlyingSystemType ?? this.underlyingSystemType,
        isTypeDefinition: isTypeDefinition ?? this.isTypeDefinition,
        isArray: isArray ?? this.isArray,
        isByRef: isByRef ?? this.isByRef,
        isPointer: isPointer ?? this.isPointer,
        isConstructedGenericType:
            isConstructedGenericType ?? this.isConstructedGenericType,
        isGenericParameter: isGenericParameter ?? this.isGenericParameter,
        isGenericTypeParameter:
            isGenericTypeParameter ?? this.isGenericTypeParameter,
        isGenericMethodParameter:
            isGenericMethodParameter ?? this.isGenericMethodParameter,
        isGenericType: isGenericType ?? this.isGenericType,
        isGenericTypeDefinition:
            isGenericTypeDefinition ?? this.isGenericTypeDefinition,
        isSZArray: isSZArray ?? this.isSZArray,
        isVariableBoundArray: isVariableBoundArray ?? this.isVariableBoundArray,
        isByRefLike: isByRefLike ?? this.isByRefLike,
        hasElementType: hasElementType ?? this.hasElementType,
        genericTypeArguments: genericTypeArguments ?? this.genericTypeArguments,
        genericParameterPosition:
            genericParameterPosition ?? this.genericParameterPosition,
        genericParameterAttributes:
            genericParameterAttributes ?? this.genericParameterAttributes,
        attributes: attributes ?? this.attributes,
        isAbstract: isAbstract ?? this.isAbstract,
        isImport: isImport ?? this.isImport,
        isSealed: isSealed ?? this.isSealed,
        isSpecialName: isSpecialName ?? this.isSpecialName,
        isClass: isClass ?? this.isClass,
        isNestedAssembly: isNestedAssembly ?? this.isNestedAssembly,
        isNestedFamANDAssem: isNestedFamANDAssem ?? this.isNestedFamANDAssem,
        isNestedFamily: isNestedFamily ?? this.isNestedFamily,
        isNestedFamORAssem: isNestedFamORAssem ?? this.isNestedFamORAssem,
        isNestedPrivate: isNestedPrivate ?? this.isNestedPrivate,
        isNestedPublic: isNestedPublic ?? this.isNestedPublic,
        isNotPublic: isNotPublic ?? this.isNotPublic,
        isPublic: isPublic ?? this.isPublic,
        isAutoLayout: isAutoLayout ?? this.isAutoLayout,
        isExplicitLayout: isExplicitLayout ?? this.isExplicitLayout,
        isLayoutSequential: isLayoutSequential ?? this.isLayoutSequential,
        isAnsiClass: isAnsiClass ?? this.isAnsiClass,
        isAutoClass: isAutoClass ?? this.isAutoClass,
        isUnicodeClass: isUnicodeClass ?? this.isUnicodeClass,
        isCOMObject: isCOMObject ?? this.isCOMObject,
        isContextful: isContextful ?? this.isContextful,
        isEnum: isEnum ?? this.isEnum,
        isMarshalByRef: isMarshalByRef ?? this.isMarshalByRef,
        isPrimitive: isPrimitive ?? this.isPrimitive,
        isValueType: isValueType ?? this.isValueType,
        isSignatureType: isSignatureType ?? this.isSignatureType,
        isSecurityCritical: isSecurityCritical ?? this.isSecurityCritical,
        isSecuritySafeCritical:
            isSecuritySafeCritical ?? this.isSecuritySafeCritical,
        isSecurityTransparent:
            isSecurityTransparent ?? this.isSecurityTransparent,
        structLayoutAttribute:
            structLayoutAttribute ?? this.structLayoutAttribute,
        typeInitializer: typeInitializer ?? this.typeInitializer,
        typeHandle: typeHandle ?? this.typeHandle,
        guid: guid ?? this.guid,
        baseType: baseType ?? this.baseType,
        isSerializable: isSerializable ?? this.isSerializable,
        containsGenericParameters:
            containsGenericParameters ?? this.containsGenericParameters,
        isVisible: isVisible ?? this.isVisible,
        genericTypeParameters:
            genericTypeParameters ?? this.genericTypeParameters,
        declaredConstructors: declaredConstructors ?? this.declaredConstructors,
        declaredEvents: declaredEvents ?? this.declaredEvents,
        declaredFields: declaredFields ?? this.declaredFields,
        declaredMembers: declaredMembers ?? this.declaredMembers,
        declaredMethods: declaredMethods ?? this.declaredMethods,
        declaredNestedTypes: declaredNestedTypes ?? this.declaredNestedTypes,
        declaredProperties: declaredProperties ?? this.declaredProperties,
        implementedInterfaces:
            implementedInterfaces ?? this.implementedInterfaces);
  }
}

@JsonSerializable(explicitToJson: true)
class UpdateTagResource {
  UpdateTagResource({
    this.id,
    this.title,
    this.descriptionTag,
  });

  factory UpdateTagResource.fromJson(Map<String, dynamic> json) =>
      _$UpdateTagResourceFromJson(json);

  @JsonKey(name: 'id', includeIfNull: true)
  final int? id;
  @JsonKey(name: 'title', includeIfNull: true, defaultValue: '')
  final String? title;
  @JsonKey(name: 'descriptionTag', includeIfNull: true, defaultValue: '')
  final String? descriptionTag;
  static const fromJsonFactory = _$UpdateTagResourceFromJson;
  static const toJsonFactory = _$UpdateTagResourceToJson;
  Map<String, dynamic> toJson() => _$UpdateTagResourceToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is UpdateTagResource &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.title, title) ||
                const DeepCollectionEquality().equals(other.title, title)) &&
            (identical(other.descriptionTag, descriptionTag) ||
                const DeepCollectionEquality()
                    .equals(other.descriptionTag, descriptionTag)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(title) ^
      const DeepCollectionEquality().hash(descriptionTag) ^
      runtimeType.hashCode;
}

extension $UpdateTagResourceExtension on UpdateTagResource {
  UpdateTagResource copyWith({int? id, String? title, String? descriptionTag}) {
    return UpdateTagResource(
        id: id ?? this.id,
        title: title ?? this.title,
        descriptionTag: descriptionTag ?? this.descriptionTag);
  }
}

@JsonSerializable(explicitToJson: true)
class UserAnswerEntity {
  UserAnswerEntity({
    this.id,
    this.createdBy,
    this.createdDate,
    this.lastModifiedBy,
    this.lastModifiedDate,
    this.userExamResultId,
    this.questionId,
    this.content,
    this.fileUrl,
    this.mark,
    this.answer,
  });

  factory UserAnswerEntity.fromJson(Map<String, dynamic> json) =>
      _$UserAnswerEntityFromJson(json);

  @JsonKey(name: 'id', includeIfNull: true)
  final int? id;
  @JsonKey(name: 'createdBy', includeIfNull: true)
  final int? createdBy;
  @JsonKey(name: 'createdDate', includeIfNull: true)
  final DateTime? createdDate;
  @JsonKey(name: 'lastModifiedBy', includeIfNull: true)
  final int? lastModifiedBy;
  @JsonKey(name: 'lastModifiedDate', includeIfNull: true)
  final DateTime? lastModifiedDate;
  @JsonKey(name: 'userExamResultId', includeIfNull: true)
  final int? userExamResultId;
  @JsonKey(name: 'questionId', includeIfNull: true)
  final int? questionId;
  @JsonKey(name: 'content', includeIfNull: true, defaultValue: '')
  final String? content;
  @JsonKey(name: 'fileUrl', includeIfNull: true, defaultValue: '')
  final String? fileUrl;
  @JsonKey(name: 'mark', includeIfNull: true)
  final double? mark;
  @JsonKey(name: 'answer', includeIfNull: true, defaultValue: '')
  final String? answer;
  static const fromJsonFactory = _$UserAnswerEntityFromJson;
  static const toJsonFactory = _$UserAnswerEntityToJson;
  Map<String, dynamic> toJson() => _$UserAnswerEntityToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is UserAnswerEntity &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.createdBy, createdBy) ||
                const DeepCollectionEquality()
                    .equals(other.createdBy, createdBy)) &&
            (identical(other.createdDate, createdDate) ||
                const DeepCollectionEquality()
                    .equals(other.createdDate, createdDate)) &&
            (identical(other.lastModifiedBy, lastModifiedBy) ||
                const DeepCollectionEquality()
                    .equals(other.lastModifiedBy, lastModifiedBy)) &&
            (identical(other.lastModifiedDate, lastModifiedDate) ||
                const DeepCollectionEquality()
                    .equals(other.lastModifiedDate, lastModifiedDate)) &&
            (identical(other.userExamResultId, userExamResultId) ||
                const DeepCollectionEquality()
                    .equals(other.userExamResultId, userExamResultId)) &&
            (identical(other.questionId, questionId) ||
                const DeepCollectionEquality()
                    .equals(other.questionId, questionId)) &&
            (identical(other.content, content) ||
                const DeepCollectionEquality()
                    .equals(other.content, content)) &&
            (identical(other.fileUrl, fileUrl) ||
                const DeepCollectionEquality()
                    .equals(other.fileUrl, fileUrl)) &&
            (identical(other.mark, mark) ||
                const DeepCollectionEquality().equals(other.mark, mark)) &&
            (identical(other.answer, answer) ||
                const DeepCollectionEquality().equals(other.answer, answer)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(createdBy) ^
      const DeepCollectionEquality().hash(createdDate) ^
      const DeepCollectionEquality().hash(lastModifiedBy) ^
      const DeepCollectionEquality().hash(lastModifiedDate) ^
      const DeepCollectionEquality().hash(userExamResultId) ^
      const DeepCollectionEquality().hash(questionId) ^
      const DeepCollectionEquality().hash(content) ^
      const DeepCollectionEquality().hash(fileUrl) ^
      const DeepCollectionEquality().hash(mark) ^
      const DeepCollectionEquality().hash(answer) ^
      runtimeType.hashCode;
}

extension $UserAnswerEntityExtension on UserAnswerEntity {
  UserAnswerEntity copyWith(
      {int? id,
      int? createdBy,
      DateTime? createdDate,
      int? lastModifiedBy,
      DateTime? lastModifiedDate,
      int? userExamResultId,
      int? questionId,
      String? content,
      String? fileUrl,
      double? mark,
      String? answer}) {
    return UserAnswerEntity(
        id: id ?? this.id,
        createdBy: createdBy ?? this.createdBy,
        createdDate: createdDate ?? this.createdDate,
        lastModifiedBy: lastModifiedBy ?? this.lastModifiedBy,
        lastModifiedDate: lastModifiedDate ?? this.lastModifiedDate,
        userExamResultId: userExamResultId ?? this.userExamResultId,
        questionId: questionId ?? this.questionId,
        content: content ?? this.content,
        fileUrl: fileUrl ?? this.fileUrl,
        mark: mark ?? this.mark,
        answer: answer ?? this.answer);
  }
}

@JsonSerializable(explicitToJson: true)
class UserAnswerPublicResource {
  UserAnswerPublicResource({
    this.questionId,
    this.answer,
    this.content,
    this.fileUrl,
    this.isCorrect,
    this.totalQuestionExplain,
  });

  factory UserAnswerPublicResource.fromJson(Map<String, dynamic> json) =>
      _$UserAnswerPublicResourceFromJson(json);

  @JsonKey(name: 'questionId', includeIfNull: true)
  final int? questionId;
  @JsonKey(name: 'answer', includeIfNull: true, defaultValue: <AnswerUser>[])
  final List<AnswerUser>? answer;
  @JsonKey(name: 'content', includeIfNull: true, defaultValue: '')
  final String? content;
  @JsonKey(name: 'fileUrl', includeIfNull: true, defaultValue: '')
  final String? fileUrl;
  @JsonKey(name: 'isCorrect', includeIfNull: true)
  final bool? isCorrect;
  @JsonKey(name: 'totalQuestionExplain', includeIfNull: true)
  final int? totalQuestionExplain;
  static const fromJsonFactory = _$UserAnswerPublicResourceFromJson;
  static const toJsonFactory = _$UserAnswerPublicResourceToJson;
  Map<String, dynamic> toJson() => _$UserAnswerPublicResourceToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is UserAnswerPublicResource &&
            (identical(other.questionId, questionId) ||
                const DeepCollectionEquality()
                    .equals(other.questionId, questionId)) &&
            (identical(other.answer, answer) ||
                const DeepCollectionEquality().equals(other.answer, answer)) &&
            (identical(other.content, content) ||
                const DeepCollectionEquality()
                    .equals(other.content, content)) &&
            (identical(other.fileUrl, fileUrl) ||
                const DeepCollectionEquality()
                    .equals(other.fileUrl, fileUrl)) &&
            (identical(other.isCorrect, isCorrect) ||
                const DeepCollectionEquality()
                    .equals(other.isCorrect, isCorrect)) &&
            (identical(other.totalQuestionExplain, totalQuestionExplain) ||
                const DeepCollectionEquality()
                    .equals(other.totalQuestionExplain, totalQuestionExplain)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(questionId) ^
      const DeepCollectionEquality().hash(answer) ^
      const DeepCollectionEquality().hash(content) ^
      const DeepCollectionEquality().hash(fileUrl) ^
      const DeepCollectionEquality().hash(isCorrect) ^
      const DeepCollectionEquality().hash(totalQuestionExplain) ^
      runtimeType.hashCode;
}

extension $UserAnswerPublicResourceExtension on UserAnswerPublicResource {
  UserAnswerPublicResource copyWith(
      {int? questionId,
      List<AnswerUser>? answer,
      String? content,
      String? fileUrl,
      bool? isCorrect,
      int? totalQuestionExplain}) {
    return UserAnswerPublicResource(
        questionId: questionId ?? this.questionId,
        answer: answer ?? this.answer,
        content: content ?? this.content,
        fileUrl: fileUrl ?? this.fileUrl,
        isCorrect: isCorrect ?? this.isCorrect,
        totalQuestionExplain:
            totalQuestionExplain ?? this.totalQuestionExplain);
  }
}

@JsonSerializable(explicitToJson: true)
class UserAnswerResultPublicResource {
  UserAnswerResultPublicResource({
    this.examId,
    this.duration,
    this.fromType,
    this.listQuestionAnswer,
  });

  factory UserAnswerResultPublicResource.fromJson(Map<String, dynamic> json) =>
      _$UserAnswerResultPublicResourceFromJson(json);

  @JsonKey(name: 'examId', includeIfNull: true)
  final int? examId;
  @JsonKey(name: 'duration', includeIfNull: true)
  final int? duration;
  @JsonKey(name: 'fromType', includeIfNull: true)
  final int? fromType;
  @JsonKey(
      name: 'listQuestionAnswer',
      includeIfNull: true,
      defaultValue: <UserAnswerPublicResource>[])
  final List<UserAnswerPublicResource>? listQuestionAnswer;
  static const fromJsonFactory = _$UserAnswerResultPublicResourceFromJson;
  static const toJsonFactory = _$UserAnswerResultPublicResourceToJson;
  Map<String, dynamic> toJson() => _$UserAnswerResultPublicResourceToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is UserAnswerResultPublicResource &&
            (identical(other.examId, examId) ||
                const DeepCollectionEquality().equals(other.examId, examId)) &&
            (identical(other.duration, duration) ||
                const DeepCollectionEquality()
                    .equals(other.duration, duration)) &&
            (identical(other.fromType, fromType) ||
                const DeepCollectionEquality()
                    .equals(other.fromType, fromType)) &&
            (identical(other.listQuestionAnswer, listQuestionAnswer) ||
                const DeepCollectionEquality()
                    .equals(other.listQuestionAnswer, listQuestionAnswer)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(examId) ^
      const DeepCollectionEquality().hash(duration) ^
      const DeepCollectionEquality().hash(fromType) ^
      const DeepCollectionEquality().hash(listQuestionAnswer) ^
      runtimeType.hashCode;
}

extension $UserAnswerResultPublicResourceExtension
    on UserAnswerResultPublicResource {
  UserAnswerResultPublicResource copyWith(
      {int? examId,
      int? duration,
      int? fromType,
      List<UserAnswerPublicResource>? listQuestionAnswer}) {
    return UserAnswerResultPublicResource(
        examId: examId ?? this.examId,
        duration: duration ?? this.duration,
        fromType: fromType ?? this.fromType,
        listQuestionAnswer: listQuestionAnswer ?? this.listQuestionAnswer);
  }
}

@JsonSerializable(explicitToJson: true)
class UserExamRatePublicResource {
  UserExamRatePublicResource({
    this.id,
    this.user,
    this.mark,
    this.duration,
    this.rate,
  });

  factory UserExamRatePublicResource.fromJson(Map<String, dynamic> json) =>
      _$UserExamRatePublicResourceFromJson(json);

  @JsonKey(name: 'id', includeIfNull: true, defaultValue: '')
  final String? id;
  @JsonKey(name: 'user', includeIfNull: true)
  final SimpleUserEntity? user;
  @JsonKey(name: 'mark', includeIfNull: true)
  final double? mark;
  @JsonKey(name: 'duration', includeIfNull: true)
  final int? duration;
  @JsonKey(name: 'rate', includeIfNull: true)
  final RateEntity? rate;
  static const fromJsonFactory = _$UserExamRatePublicResourceFromJson;
  static const toJsonFactory = _$UserExamRatePublicResourceToJson;
  Map<String, dynamic> toJson() => _$UserExamRatePublicResourceToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is UserExamRatePublicResource &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.user, user) ||
                const DeepCollectionEquality().equals(other.user, user)) &&
            (identical(other.mark, mark) ||
                const DeepCollectionEquality().equals(other.mark, mark)) &&
            (identical(other.duration, duration) ||
                const DeepCollectionEquality()
                    .equals(other.duration, duration)) &&
            (identical(other.rate, rate) ||
                const DeepCollectionEquality().equals(other.rate, rate)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(user) ^
      const DeepCollectionEquality().hash(mark) ^
      const DeepCollectionEquality().hash(duration) ^
      const DeepCollectionEquality().hash(rate) ^
      runtimeType.hashCode;
}

extension $UserExamRatePublicResourceExtension on UserExamRatePublicResource {
  UserExamRatePublicResource copyWith(
      {String? id,
      SimpleUserEntity? user,
      double? mark,
      int? duration,
      RateEntity? rate}) {
    return UserExamRatePublicResource(
        id: id ?? this.id,
        user: user ?? this.user,
        mark: mark ?? this.mark,
        duration: duration ?? this.duration,
        rate: rate ?? this.rate);
  }
}

@JsonSerializable(explicitToJson: true)
class UserExamRatePublicResourceFilterResult {
  UserExamRatePublicResourceFilterResult({
    this.totalRows,
    this.data,
  });

  factory UserExamRatePublicResourceFilterResult.fromJson(
          Map<String, dynamic> json) =>
      _$UserExamRatePublicResourceFilterResultFromJson(json);

  @JsonKey(name: 'totalRows', includeIfNull: true)
  final int? totalRows;
  @JsonKey(
      name: 'data',
      includeIfNull: true,
      defaultValue: <UserExamRatePublicResource>[])
  final List<UserExamRatePublicResource>? data;
  static const fromJsonFactory =
      _$UserExamRatePublicResourceFilterResultFromJson;
  static const toJsonFactory = _$UserExamRatePublicResourceFilterResultToJson;
  Map<String, dynamic> toJson() =>
      _$UserExamRatePublicResourceFilterResultToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is UserExamRatePublicResourceFilterResult &&
            (identical(other.totalRows, totalRows) ||
                const DeepCollectionEquality()
                    .equals(other.totalRows, totalRows)) &&
            (identical(other.data, data) ||
                const DeepCollectionEquality().equals(other.data, data)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(totalRows) ^
      const DeepCollectionEquality().hash(data) ^
      runtimeType.hashCode;
}

extension $UserExamRatePublicResourceFilterResultExtension
    on UserExamRatePublicResourceFilterResult {
  UserExamRatePublicResourceFilterResult copyWith(
      {int? totalRows, List<UserExamRatePublicResource>? data}) {
    return UserExamRatePublicResourceFilterResult(
        totalRows: totalRows ?? this.totalRows, data: data ?? this.data);
  }
}

@JsonSerializable(explicitToJson: true)
class UserExamResultPublicResource {
  UserExamResultPublicResource({
    this.id,
    this.avatar,
    this.fullName,
    this.rank,
    this.mark,
    this.duration,
    this.createdDate,
    this.numberMemberInExam,
    this.examName,
    this.examId,
    this.userId,
    this.examType,
  });

  factory UserExamResultPublicResource.fromJson(Map<String, dynamic> json) =>
      _$UserExamResultPublicResourceFromJson(json);

  @JsonKey(name: 'id', includeIfNull: true)
  final int? id;
  @JsonKey(name: 'avatar', includeIfNull: true, defaultValue: '')
  final String? avatar;
  @JsonKey(name: 'fullName', includeIfNull: true, defaultValue: '')
  final String? fullName;
  @JsonKey(name: 'rank', includeIfNull: true)
  final int? rank;
  @JsonKey(name: 'mark', includeIfNull: true)
  final double? mark;
  @JsonKey(name: 'duration', includeIfNull: true)
  final int? duration;
  @JsonKey(name: 'createdDate', includeIfNull: true)
  final DateTime? createdDate;
  @JsonKey(name: 'numberMemberInExam', includeIfNull: true)
  final int? numberMemberInExam;
  @JsonKey(name: 'examName', includeIfNull: true, defaultValue: '')
  final String? examName;
  @JsonKey(name: 'examId', includeIfNull: true)
  final int? examId;
  @JsonKey(name: 'userId', includeIfNull: true)
  final int? userId;
  @JsonKey(name: 'examType', includeIfNull: true)
  final int? examType;
  static const fromJsonFactory = _$UserExamResultPublicResourceFromJson;
  static const toJsonFactory = _$UserExamResultPublicResourceToJson;
  Map<String, dynamic> toJson() => _$UserExamResultPublicResourceToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is UserExamResultPublicResource &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.avatar, avatar) ||
                const DeepCollectionEquality().equals(other.avatar, avatar)) &&
            (identical(other.fullName, fullName) ||
                const DeepCollectionEquality()
                    .equals(other.fullName, fullName)) &&
            (identical(other.rank, rank) ||
                const DeepCollectionEquality().equals(other.rank, rank)) &&
            (identical(other.mark, mark) ||
                const DeepCollectionEquality().equals(other.mark, mark)) &&
            (identical(other.duration, duration) ||
                const DeepCollectionEquality()
                    .equals(other.duration, duration)) &&
            (identical(other.createdDate, createdDate) ||
                const DeepCollectionEquality()
                    .equals(other.createdDate, createdDate)) &&
            (identical(other.numberMemberInExam, numberMemberInExam) ||
                const DeepCollectionEquality()
                    .equals(other.numberMemberInExam, numberMemberInExam)) &&
            (identical(other.examName, examName) ||
                const DeepCollectionEquality()
                    .equals(other.examName, examName)) &&
            (identical(other.examId, examId) ||
                const DeepCollectionEquality().equals(other.examId, examId)) &&
            (identical(other.userId, userId) ||
                const DeepCollectionEquality().equals(other.userId, userId)) &&
            (identical(other.examType, examType) ||
                const DeepCollectionEquality()
                    .equals(other.examType, examType)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(avatar) ^
      const DeepCollectionEquality().hash(fullName) ^
      const DeepCollectionEquality().hash(rank) ^
      const DeepCollectionEquality().hash(mark) ^
      const DeepCollectionEquality().hash(duration) ^
      const DeepCollectionEquality().hash(createdDate) ^
      const DeepCollectionEquality().hash(numberMemberInExam) ^
      const DeepCollectionEquality().hash(examName) ^
      const DeepCollectionEquality().hash(examId) ^
      const DeepCollectionEquality().hash(userId) ^
      const DeepCollectionEquality().hash(examType) ^
      runtimeType.hashCode;
}

extension $UserExamResultPublicResourceExtension
    on UserExamResultPublicResource {
  UserExamResultPublicResource copyWith(
      {int? id,
      String? avatar,
      String? fullName,
      int? rank,
      double? mark,
      int? duration,
      DateTime? createdDate,
      int? numberMemberInExam,
      String? examName,
      int? examId,
      int? userId,
      int? examType}) {
    return UserExamResultPublicResource(
        id: id ?? this.id,
        avatar: avatar ?? this.avatar,
        fullName: fullName ?? this.fullName,
        rank: rank ?? this.rank,
        mark: mark ?? this.mark,
        duration: duration ?? this.duration,
        createdDate: createdDate ?? this.createdDate,
        numberMemberInExam: numberMemberInExam ?? this.numberMemberInExam,
        examName: examName ?? this.examName,
        examId: examId ?? this.examId,
        userId: userId ?? this.userId,
        examType: examType ?? this.examType);
  }
}

@JsonSerializable(explicitToJson: true)
class UserExamResultPublicResourceFilterResult {
  UserExamResultPublicResourceFilterResult({
    this.totalRows,
    this.data,
  });

  factory UserExamResultPublicResourceFilterResult.fromJson(
          Map<String, dynamic> json) =>
      _$UserExamResultPublicResourceFilterResultFromJson(json);

  @JsonKey(name: 'totalRows', includeIfNull: true)
  final int? totalRows;
  @JsonKey(
      name: 'data',
      includeIfNull: true,
      defaultValue: <UserExamResultPublicResource>[])
  final List<UserExamResultPublicResource>? data;
  static const fromJsonFactory =
      _$UserExamResultPublicResourceFilterResultFromJson;
  static const toJsonFactory = _$UserExamResultPublicResourceFilterResultToJson;
  Map<String, dynamic> toJson() =>
      _$UserExamResultPublicResourceFilterResultToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is UserExamResultPublicResourceFilterResult &&
            (identical(other.totalRows, totalRows) ||
                const DeepCollectionEquality()
                    .equals(other.totalRows, totalRows)) &&
            (identical(other.data, data) ||
                const DeepCollectionEquality().equals(other.data, data)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(totalRows) ^
      const DeepCollectionEquality().hash(data) ^
      runtimeType.hashCode;
}

extension $UserExamResultPublicResourceFilterResultExtension
    on UserExamResultPublicResourceFilterResult {
  UserExamResultPublicResourceFilterResult copyWith(
      {int? totalRows, List<UserExamResultPublicResource>? data}) {
    return UserExamResultPublicResourceFilterResult(
        totalRows: totalRows ?? this.totalRows, data: data ?? this.data);
  }
}

@JsonSerializable(explicitToJson: true)
class UserInfoExamResultPublicResource {
  UserInfoExamResultPublicResource({
    this.id,
    this.avatar,
    this.fullName,
    this.numberOfExamTimes,
  });

  factory UserInfoExamResultPublicResource.fromJson(
          Map<String, dynamic> json) =>
      _$UserInfoExamResultPublicResourceFromJson(json);

  @JsonKey(name: 'id', includeIfNull: true)
  final int? id;
  @JsonKey(name: 'avatar', includeIfNull: true, defaultValue: '')
  final String? avatar;
  @JsonKey(name: 'fullName', includeIfNull: true, defaultValue: '')
  final String? fullName;
  @JsonKey(
      name: 'numberOfExamTimes',
      includeIfNull: true,
      defaultValue: <UserExamResultPublicResource>[])
  final List<UserExamResultPublicResource>? numberOfExamTimes;
  static const fromJsonFactory = _$UserInfoExamResultPublicResourceFromJson;
  static const toJsonFactory = _$UserInfoExamResultPublicResourceToJson;
  Map<String, dynamic> toJson() =>
      _$UserInfoExamResultPublicResourceToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is UserInfoExamResultPublicResource &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.avatar, avatar) ||
                const DeepCollectionEquality().equals(other.avatar, avatar)) &&
            (identical(other.fullName, fullName) ||
                const DeepCollectionEquality()
                    .equals(other.fullName, fullName)) &&
            (identical(other.numberOfExamTimes, numberOfExamTimes) ||
                const DeepCollectionEquality()
                    .equals(other.numberOfExamTimes, numberOfExamTimes)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(avatar) ^
      const DeepCollectionEquality().hash(fullName) ^
      const DeepCollectionEquality().hash(numberOfExamTimes) ^
      runtimeType.hashCode;
}

extension $UserInfoExamResultPublicResourceExtension
    on UserInfoExamResultPublicResource {
  UserInfoExamResultPublicResource copyWith(
      {int? id,
      String? avatar,
      String? fullName,
      List<UserExamResultPublicResource>? numberOfExamTimes}) {
    return UserInfoExamResultPublicResource(
        id: id ?? this.id,
        avatar: avatar ?? this.avatar,
        fullName: fullName ?? this.fullName,
        numberOfExamTimes: numberOfExamTimes ?? this.numberOfExamTimes);
  }
}

String? callingConventionsToJson(enums.CallingConventions? callingConventions) {
  return enums.$CallingConventionsMap[callingConventions];
}

enums.CallingConventions callingConventionsFromJson(
    String? callingConventions) {
  if (callingConventions == null) {
    return enums.CallingConventions.swaggerGeneratedUnknown;
  }

  return enums.$CallingConventionsMap.entries
      .firstWhere(
          (element) =>
              element.value.toLowerCase() == callingConventions.toLowerCase(),
          orElse: () => const MapEntry(
              enums.CallingConventions.swaggerGeneratedUnknown, ''))
      .key;
}

List<String> callingConventionsListToJson(
    List<enums.CallingConventions>? callingConventions) {
  if (callingConventions == null) {
    return [];
  }

  return callingConventions
      .map((e) => enums.$CallingConventionsMap[e]!)
      .toList();
}

List<enums.CallingConventions> callingConventionsListFromJson(
    List? callingConventions) {
  if (callingConventions == null) {
    return [];
  }

  return callingConventions
      .map((e) => callingConventionsFromJson(e.toString()))
      .toList();
}

String? eventAttributesToJson(enums.EventAttributes? eventAttributes) {
  return enums.$EventAttributesMap[eventAttributes];
}

enums.EventAttributes eventAttributesFromJson(String? eventAttributes) {
  if (eventAttributes == null) {
    return enums.EventAttributes.swaggerGeneratedUnknown;
  }

  return enums.$EventAttributesMap.entries
      .firstWhere(
          (element) =>
              element.value.toLowerCase() == eventAttributes.toLowerCase(),
          orElse: () =>
              const MapEntry(enums.EventAttributes.swaggerGeneratedUnknown, ''))
      .key;
}

List<String> eventAttributesListToJson(
    List<enums.EventAttributes>? eventAttributes) {
  if (eventAttributes == null) {
    return [];
  }

  return eventAttributes.map((e) => enums.$EventAttributesMap[e]!).toList();
}

List<enums.EventAttributes> eventAttributesListFromJson(List? eventAttributes) {
  if (eventAttributes == null) {
    return [];
  }

  return eventAttributes
      .map((e) => eventAttributesFromJson(e.toString()))
      .toList();
}

String? expressionTypeToJson(enums.ExpressionType? expressionType) {
  return enums.$ExpressionTypeMap[expressionType];
}

enums.ExpressionType expressionTypeFromJson(String? expressionType) {
  if (expressionType == null) {
    return enums.ExpressionType.swaggerGeneratedUnknown;
  }

  return enums.$ExpressionTypeMap.entries
      .firstWhere(
          (element) =>
              element.value.toLowerCase() == expressionType.toLowerCase(),
          orElse: () =>
              const MapEntry(enums.ExpressionType.swaggerGeneratedUnknown, ''))
      .key;
}

List<String> expressionTypeListToJson(
    List<enums.ExpressionType>? expressionType) {
  if (expressionType == null) {
    return [];
  }

  return expressionType.map((e) => enums.$ExpressionTypeMap[e]!).toList();
}

List<enums.ExpressionType> expressionTypeListFromJson(List? expressionType) {
  if (expressionType == null) {
    return [];
  }

  return expressionType
      .map((e) => expressionTypeFromJson(e.toString()))
      .toList();
}

String? fieldAttributesToJson(enums.FieldAttributes? fieldAttributes) {
  return enums.$FieldAttributesMap[fieldAttributes];
}

enums.FieldAttributes fieldAttributesFromJson(String? fieldAttributes) {
  if (fieldAttributes == null) {
    return enums.FieldAttributes.swaggerGeneratedUnknown;
  }

  return enums.$FieldAttributesMap.entries
      .firstWhere(
          (element) =>
              element.value.toLowerCase() == fieldAttributes.toLowerCase(),
          orElse: () =>
              const MapEntry(enums.FieldAttributes.swaggerGeneratedUnknown, ''))
      .key;
}

List<String> fieldAttributesListToJson(
    List<enums.FieldAttributes>? fieldAttributes) {
  if (fieldAttributes == null) {
    return [];
  }

  return fieldAttributes.map((e) => enums.$FieldAttributesMap[e]!).toList();
}

List<enums.FieldAttributes> fieldAttributesListFromJson(List? fieldAttributes) {
  if (fieldAttributes == null) {
    return [];
  }

  return fieldAttributes
      .map((e) => fieldAttributesFromJson(e.toString()))
      .toList();
}

String? genericParameterAttributesToJson(
    enums.GenericParameterAttributes? genericParameterAttributes) {
  return enums.$GenericParameterAttributesMap[genericParameterAttributes];
}

enums.GenericParameterAttributes genericParameterAttributesFromJson(
    String? genericParameterAttributes) {
  if (genericParameterAttributes == null) {
    return enums.GenericParameterAttributes.swaggerGeneratedUnknown;
  }

  return enums.$GenericParameterAttributesMap.entries
      .firstWhere(
          (element) =>
              element.value.toLowerCase() ==
              genericParameterAttributes.toLowerCase(),
          orElse: () => const MapEntry(
              enums.GenericParameterAttributes.swaggerGeneratedUnknown, ''))
      .key;
}

List<String> genericParameterAttributesListToJson(
    List<enums.GenericParameterAttributes>? genericParameterAttributes) {
  if (genericParameterAttributes == null) {
    return [];
  }

  return genericParameterAttributes
      .map((e) => enums.$GenericParameterAttributesMap[e]!)
      .toList();
}

List<enums.GenericParameterAttributes> genericParameterAttributesListFromJson(
    List? genericParameterAttributes) {
  if (genericParameterAttributes == null) {
    return [];
  }

  return genericParameterAttributes
      .map((e) => genericParameterAttributesFromJson(e.toString()))
      .toList();
}

String? layoutKindToJson(enums.LayoutKind? layoutKind) {
  return enums.$LayoutKindMap[layoutKind];
}

enums.LayoutKind layoutKindFromJson(String? layoutKind) {
  if (layoutKind == null) {
    return enums.LayoutKind.swaggerGeneratedUnknown;
  }

  return enums.$LayoutKindMap.entries
      .firstWhere(
          (element) => element.value.toLowerCase() == layoutKind.toLowerCase(),
          orElse: () =>
              const MapEntry(enums.LayoutKind.swaggerGeneratedUnknown, ''))
      .key;
}

List<String> layoutKindListToJson(List<enums.LayoutKind>? layoutKind) {
  if (layoutKind == null) {
    return [];
  }

  return layoutKind.map((e) => enums.$LayoutKindMap[e]!).toList();
}

List<enums.LayoutKind> layoutKindListFromJson(List? layoutKind) {
  if (layoutKind == null) {
    return [];
  }

  return layoutKind.map((e) => layoutKindFromJson(e.toString())).toList();
}

String? memberTypesToJson(enums.MemberTypes? memberTypes) {
  return enums.$MemberTypesMap[memberTypes];
}

enums.MemberTypes memberTypesFromJson(String? memberTypes) {
  if (memberTypes == null) {
    return enums.MemberTypes.swaggerGeneratedUnknown;
  }

  return enums.$MemberTypesMap.entries
      .firstWhere(
          (element) => element.value.toLowerCase() == memberTypes.toLowerCase(),
          orElse: () =>
              const MapEntry(enums.MemberTypes.swaggerGeneratedUnknown, ''))
      .key;
}

List<String> memberTypesListToJson(List<enums.MemberTypes>? memberTypes) {
  if (memberTypes == null) {
    return [];
  }

  return memberTypes.map((e) => enums.$MemberTypesMap[e]!).toList();
}

List<enums.MemberTypes> memberTypesListFromJson(List? memberTypes) {
  if (memberTypes == null) {
    return [];
  }

  return memberTypes.map((e) => memberTypesFromJson(e.toString())).toList();
}

String? methodAttributesToJson(enums.MethodAttributes? methodAttributes) {
  return enums.$MethodAttributesMap[methodAttributes];
}

enums.MethodAttributes methodAttributesFromJson(String? methodAttributes) {
  if (methodAttributes == null) {
    return enums.MethodAttributes.swaggerGeneratedUnknown;
  }

  return enums.$MethodAttributesMap.entries
      .firstWhere(
          (element) =>
              element.value.toLowerCase() == methodAttributes.toLowerCase(),
          orElse: () => const MapEntry(
              enums.MethodAttributes.swaggerGeneratedUnknown, ''))
      .key;
}

List<String> methodAttributesListToJson(
    List<enums.MethodAttributes>? methodAttributes) {
  if (methodAttributes == null) {
    return [];
  }

  return methodAttributes.map((e) => enums.$MethodAttributesMap[e]!).toList();
}

List<enums.MethodAttributes> methodAttributesListFromJson(
    List? methodAttributes) {
  if (methodAttributes == null) {
    return [];
  }

  return methodAttributes
      .map((e) => methodAttributesFromJson(e.toString()))
      .toList();
}

String? methodImplAttributesToJson(
    enums.MethodImplAttributes? methodImplAttributes) {
  return enums.$MethodImplAttributesMap[methodImplAttributes];
}

enums.MethodImplAttributes methodImplAttributesFromJson(
    String? methodImplAttributes) {
  if (methodImplAttributes == null) {
    return enums.MethodImplAttributes.swaggerGeneratedUnknown;
  }

  return enums.$MethodImplAttributesMap.entries
      .firstWhere(
          (element) =>
              element.value.toLowerCase() == methodImplAttributes.toLowerCase(),
          orElse: () => const MapEntry(
              enums.MethodImplAttributes.swaggerGeneratedUnknown, ''))
      .key;
}

List<String> methodImplAttributesListToJson(
    List<enums.MethodImplAttributes>? methodImplAttributes) {
  if (methodImplAttributes == null) {
    return [];
  }

  return methodImplAttributes
      .map((e) => enums.$MethodImplAttributesMap[e]!)
      .toList();
}

List<enums.MethodImplAttributes> methodImplAttributesListFromJson(
    List? methodImplAttributes) {
  if (methodImplAttributes == null) {
    return [];
  }

  return methodImplAttributes
      .map((e) => methodImplAttributesFromJson(e.toString()))
      .toList();
}

String? parameterAttributesToJson(
    enums.ParameterAttributes? parameterAttributes) {
  return enums.$ParameterAttributesMap[parameterAttributes];
}

enums.ParameterAttributes parameterAttributesFromJson(
    String? parameterAttributes) {
  if (parameterAttributes == null) {
    return enums.ParameterAttributes.swaggerGeneratedUnknown;
  }

  return enums.$ParameterAttributesMap.entries
      .firstWhere(
          (element) =>
              element.value.toLowerCase() == parameterAttributes.toLowerCase(),
          orElse: () => const MapEntry(
              enums.ParameterAttributes.swaggerGeneratedUnknown, ''))
      .key;
}

List<String> parameterAttributesListToJson(
    List<enums.ParameterAttributes>? parameterAttributes) {
  if (parameterAttributes == null) {
    return [];
  }

  return parameterAttributes
      .map((e) => enums.$ParameterAttributesMap[e]!)
      .toList();
}

List<enums.ParameterAttributes> parameterAttributesListFromJson(
    List? parameterAttributes) {
  if (parameterAttributes == null) {
    return [];
  }

  return parameterAttributes
      .map((e) => parameterAttributesFromJson(e.toString()))
      .toList();
}

String? propertyAttributesToJson(enums.PropertyAttributes? propertyAttributes) {
  return enums.$PropertyAttributesMap[propertyAttributes];
}

enums.PropertyAttributes propertyAttributesFromJson(
    String? propertyAttributes) {
  if (propertyAttributes == null) {
    return enums.PropertyAttributes.swaggerGeneratedUnknown;
  }

  return enums.$PropertyAttributesMap.entries
      .firstWhere(
          (element) =>
              element.value.toLowerCase() == propertyAttributes.toLowerCase(),
          orElse: () => const MapEntry(
              enums.PropertyAttributes.swaggerGeneratedUnknown, ''))
      .key;
}

List<String> propertyAttributesListToJson(
    List<enums.PropertyAttributes>? propertyAttributes) {
  if (propertyAttributes == null) {
    return [];
  }

  return propertyAttributes
      .map((e) => enums.$PropertyAttributesMap[e]!)
      .toList();
}

List<enums.PropertyAttributes> propertyAttributesListFromJson(
    List? propertyAttributes) {
  if (propertyAttributes == null) {
    return [];
  }

  return propertyAttributes
      .map((e) => propertyAttributesFromJson(e.toString()))
      .toList();
}

String? securityRuleSetToJson(enums.SecurityRuleSet? securityRuleSet) {
  return enums.$SecurityRuleSetMap[securityRuleSet];
}

enums.SecurityRuleSet securityRuleSetFromJson(String? securityRuleSet) {
  if (securityRuleSet == null) {
    return enums.SecurityRuleSet.swaggerGeneratedUnknown;
  }

  return enums.$SecurityRuleSetMap.entries
      .firstWhere(
          (element) =>
              element.value.toLowerCase() == securityRuleSet.toLowerCase(),
          orElse: () =>
              const MapEntry(enums.SecurityRuleSet.swaggerGeneratedUnknown, ''))
      .key;
}

List<String> securityRuleSetListToJson(
    List<enums.SecurityRuleSet>? securityRuleSet) {
  if (securityRuleSet == null) {
    return [];
  }

  return securityRuleSet.map((e) => enums.$SecurityRuleSetMap[e]!).toList();
}

List<enums.SecurityRuleSet> securityRuleSetListFromJson(List? securityRuleSet) {
  if (securityRuleSet == null) {
    return [];
  }

  return securityRuleSet
      .map((e) => securityRuleSetFromJson(e.toString()))
      .toList();
}

String? typeAttributesToJson(enums.TypeAttributes? typeAttributes) {
  return enums.$TypeAttributesMap[typeAttributes];
}

enums.TypeAttributes typeAttributesFromJson(String? typeAttributes) {
  if (typeAttributes == null) {
    return enums.TypeAttributes.swaggerGeneratedUnknown;
  }

  return enums.$TypeAttributesMap.entries
      .firstWhere(
          (element) =>
              element.value.toLowerCase() == typeAttributes.toLowerCase(),
          orElse: () =>
              const MapEntry(enums.TypeAttributes.swaggerGeneratedUnknown, ''))
      .key;
}

List<String> typeAttributesListToJson(
    List<enums.TypeAttributes>? typeAttributes) {
  if (typeAttributes == null) {
    return [];
  }

  return typeAttributes.map((e) => enums.$TypeAttributesMap[e]!).toList();
}

List<enums.TypeAttributes> typeAttributesListFromJson(List? typeAttributes) {
  if (typeAttributes == null) {
    return [];
  }

  return typeAttributes
      .map((e) => typeAttributesFromJson(e.toString()))
      .toList();
}
