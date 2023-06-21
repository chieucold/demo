import 'package:json_annotation/json_annotation.dart';
import 'package:collection/collection.dart';

part 'system_api_models.g.dart';

@JsonSerializable(explicitToJson: true)
class ApiResponse {
  ApiResponse({
    this.version,
    this.statusCode,
    this.message,
    this.isError,
    this.responseException,
    this.result,
  });

  factory ApiResponse.fromJson(Map<String, dynamic> json) =>
      _$ApiResponseFromJson(json);

  @JsonKey(name: 'version', includeIfNull: true, defaultValue: '')
  final String? version;
  @JsonKey(name: 'statusCode', includeIfNull: true)
  final int? statusCode;
  @JsonKey(name: 'message', includeIfNull: true, defaultValue: '')
  final String? message;
  @JsonKey(name: 'isError', includeIfNull: true)
  final bool? isError;
  @JsonKey(name: 'responseException', includeIfNull: true)
  final dynamic responseException;
  @JsonKey(name: 'result', includeIfNull: true)
  final dynamic result;
  static const fromJsonFactory = _$ApiResponseFromJson;
  static const toJsonFactory = _$ApiResponseToJson;
  Map<String, dynamic> toJson() => _$ApiResponseToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ApiResponse &&
            (identical(other.version, version) ||
                const DeepCollectionEquality()
                    .equals(other.version, version)) &&
            (identical(other.statusCode, statusCode) ||
                const DeepCollectionEquality()
                    .equals(other.statusCode, statusCode)) &&
            (identical(other.message, message) ||
                const DeepCollectionEquality()
                    .equals(other.message, message)) &&
            (identical(other.isError, isError) ||
                const DeepCollectionEquality()
                    .equals(other.isError, isError)) &&
            (identical(other.responseException, responseException) ||
                const DeepCollectionEquality()
                    .equals(other.responseException, responseException)) &&
            (identical(other.result, result) ||
                const DeepCollectionEquality().equals(other.result, result)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(version) ^
      const DeepCollectionEquality().hash(statusCode) ^
      const DeepCollectionEquality().hash(message) ^
      const DeepCollectionEquality().hash(isError) ^
      const DeepCollectionEquality().hash(responseException) ^
      const DeepCollectionEquality().hash(result) ^
      runtimeType.hashCode;
}

extension $ApiResponseExtension on ApiResponse {
  ApiResponse copyWith(
      {String? version,
      int? statusCode,
      String? message,
      bool? isError,
      dynamic? responseException,
      dynamic? result}) {
    return ApiResponse(
        version: version ?? this.version,
        statusCode: statusCode ?? this.statusCode,
        message: message ?? this.message,
        isError: isError ?? this.isError,
        responseException: responseException ?? this.responseException,
        result: result ?? this.result);
  }
}

@JsonSerializable(explicitToJson: true)
class BlockCategoryUserResource {
  BlockCategoryUserResource({
    this.blockCategoryId,
    this.title,
    this.icon,
    this.commonDataId,
  });

  factory BlockCategoryUserResource.fromJson(Map<String, dynamic> json) =>
      _$BlockCategoryUserResourceFromJson(json);

  @JsonKey(name: 'blockCategoryId', includeIfNull: true)
  final int? blockCategoryId;
  @JsonKey(name: 'title', includeIfNull: true, defaultValue: '')
  final String? title;
  @JsonKey(name: 'icon', includeIfNull: true, defaultValue: '')
  final String? icon;
  @JsonKey(name: 'commonDataId', includeIfNull: true)
  final int? commonDataId;
  static const fromJsonFactory = _$BlockCategoryUserResourceFromJson;
  static const toJsonFactory = _$BlockCategoryUserResourceToJson;
  Map<String, dynamic> toJson() => _$BlockCategoryUserResourceToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is BlockCategoryUserResource &&
            (identical(other.blockCategoryId, blockCategoryId) ||
                const DeepCollectionEquality()
                    .equals(other.blockCategoryId, blockCategoryId)) &&
            (identical(other.title, title) ||
                const DeepCollectionEquality().equals(other.title, title)) &&
            (identical(other.icon, icon) ||
                const DeepCollectionEquality().equals(other.icon, icon)) &&
            (identical(other.commonDataId, commonDataId) ||
                const DeepCollectionEquality()
                    .equals(other.commonDataId, commonDataId)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(blockCategoryId) ^
      const DeepCollectionEquality().hash(title) ^
      const DeepCollectionEquality().hash(icon) ^
      const DeepCollectionEquality().hash(commonDataId) ^
      runtimeType.hashCode;
}

extension $BlockCategoryUserResourceExtension on BlockCategoryUserResource {
  BlockCategoryUserResource copyWith(
      {int? blockCategoryId, String? title, String? icon, int? commonDataId}) {
    return BlockCategoryUserResource(
        blockCategoryId: blockCategoryId ?? this.blockCategoryId,
        title: title ?? this.title,
        icon: icon ?? this.icon,
        commonDataId: commonDataId ?? this.commonDataId);
  }
}

@JsonSerializable(explicitToJson: true)
class FileEntity {
  FileEntity({
    this.id,
    this.createdBy,
    this.createdDate,
    this.lastModifiedBy,
    this.lastModifiedDate,
    this.name,
    this.fileServer,
    this.path,
    this.contentType,
    this.size,
    this.extension,
    this.folderId,
    this.block,
    this.status,
    this.avatar,
    this.thumbnails,
    this.streamUrl,
    this.duration,
    this.fileType,
  });

  factory FileEntity.fromJson(Map<String, dynamic> json) =>
      _$FileEntityFromJson(json);

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
  @JsonKey(name: 'fileServer', includeIfNull: true, defaultValue: '')
  final String? fileServer;
  @JsonKey(name: 'path', includeIfNull: true, defaultValue: '')
  final String? path;
  @JsonKey(name: 'contentType', includeIfNull: true, defaultValue: '')
  final String? contentType;
  @JsonKey(name: 'size', includeIfNull: true)
  final int? size;
  @JsonKey(name: 'extension', includeIfNull: true, defaultValue: '')
  final String? extension;
  @JsonKey(name: 'folderId', includeIfNull: true)
  final int? folderId;
  @JsonKey(name: 'block', includeIfNull: true, defaultValue: '')
  final String? block;
  @JsonKey(name: 'status', includeIfNull: true)
  final int? status;
  @JsonKey(name: 'avatar', includeIfNull: true, defaultValue: '')
  final String? avatar;
  @JsonKey(name: 'thumbnails', includeIfNull: true, defaultValue: '')
  final String? thumbnails;
  @JsonKey(name: 'streamUrl', includeIfNull: true, defaultValue: '')
  final String? streamUrl;
  @JsonKey(name: 'duration', includeIfNull: true)
  final double? duration;
  @JsonKey(name: 'fileType', includeIfNull: true, defaultValue: '')
  final String? fileType;
  static const fromJsonFactory = _$FileEntityFromJson;
  static const toJsonFactory = _$FileEntityToJson;
  Map<String, dynamic> toJson() => _$FileEntityToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is FileEntity &&
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
            (identical(other.fileServer, fileServer) ||
                const DeepCollectionEquality()
                    .equals(other.fileServer, fileServer)) &&
            (identical(other.path, path) ||
                const DeepCollectionEquality().equals(other.path, path)) &&
            (identical(other.contentType, contentType) ||
                const DeepCollectionEquality()
                    .equals(other.contentType, contentType)) &&
            (identical(other.size, size) ||
                const DeepCollectionEquality().equals(other.size, size)) &&
            (identical(other.extension, extension) ||
                const DeepCollectionEquality()
                    .equals(other.extension, extension)) &&
            (identical(other.folderId, folderId) ||
                const DeepCollectionEquality()
                    .equals(other.folderId, folderId)) &&
            (identical(other.block, block) ||
                const DeepCollectionEquality().equals(other.block, block)) &&
            (identical(other.status, status) ||
                const DeepCollectionEquality().equals(other.status, status)) &&
            (identical(other.avatar, avatar) ||
                const DeepCollectionEquality().equals(other.avatar, avatar)) &&
            (identical(other.thumbnails, thumbnails) ||
                const DeepCollectionEquality()
                    .equals(other.thumbnails, thumbnails)) &&
            (identical(other.streamUrl, streamUrl) ||
                const DeepCollectionEquality()
                    .equals(other.streamUrl, streamUrl)) &&
            (identical(other.duration, duration) ||
                const DeepCollectionEquality()
                    .equals(other.duration, duration)) &&
            (identical(other.fileType, fileType) ||
                const DeepCollectionEquality()
                    .equals(other.fileType, fileType)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(createdBy) ^
      const DeepCollectionEquality().hash(createdDate) ^
      const DeepCollectionEquality().hash(lastModifiedBy) ^
      const DeepCollectionEquality().hash(lastModifiedDate) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(fileServer) ^
      const DeepCollectionEquality().hash(path) ^
      const DeepCollectionEquality().hash(contentType) ^
      const DeepCollectionEquality().hash(size) ^
      const DeepCollectionEquality().hash(extension) ^
      const DeepCollectionEquality().hash(folderId) ^
      const DeepCollectionEquality().hash(block) ^
      const DeepCollectionEquality().hash(status) ^
      const DeepCollectionEquality().hash(avatar) ^
      const DeepCollectionEquality().hash(thumbnails) ^
      const DeepCollectionEquality().hash(streamUrl) ^
      const DeepCollectionEquality().hash(duration) ^
      const DeepCollectionEquality().hash(fileType) ^
      runtimeType.hashCode;
}

extension $FileEntityExtension on FileEntity {
  FileEntity copyWith(
      {int? id,
      int? createdBy,
      DateTime? createdDate,
      int? lastModifiedBy,
      DateTime? lastModifiedDate,
      String? name,
      String? fileServer,
      String? path,
      String? contentType,
      int? size,
      String? extension,
      int? folderId,
      String? block,
      int? status,
      String? avatar,
      String? thumbnails,
      String? streamUrl,
      double? duration,
      String? fileType}) {
    return FileEntity(
        id: id ?? this.id,
        createdBy: createdBy ?? this.createdBy,
        createdDate: createdDate ?? this.createdDate,
        lastModifiedBy: lastModifiedBy ?? this.lastModifiedBy,
        lastModifiedDate: lastModifiedDate ?? this.lastModifiedDate,
        name: name ?? this.name,
        fileServer: fileServer ?? this.fileServer,
        path: path ?? this.path,
        contentType: contentType ?? this.contentType,
        size: size ?? this.size,
        extension: extension ?? this.extension,
        folderId: folderId ?? this.folderId,
        block: block ?? this.block,
        status: status ?? this.status,
        avatar: avatar ?? this.avatar,
        thumbnails: thumbnails ?? this.thumbnails,
        streamUrl: streamUrl ?? this.streamUrl,
        duration: duration ?? this.duration,
        fileType: fileType ?? this.fileType);
  }
}

@JsonSerializable(explicitToJson: true)
class FileResource {
  FileResource({
    this.id,
    this.createdBy,
    this.createdDate,
    this.lastModifiedBy,
    this.lastModifiedDate,
    this.name,
    this.fileServer,
    this.path,
    this.contentType,
    this.size,
    this.extension,
    this.folderId,
    this.block,
    this.status,
    this.avatar,
    this.thumbnails,
    this.streamUrl,
    this.duration,
    this.fileType,
    this.domain,
  });

  factory FileResource.fromJson(Map<String, dynamic> json) =>
      _$FileResourceFromJson(json);

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
  @JsonKey(name: 'fileServer', includeIfNull: true, defaultValue: '')
  final String? fileServer;
  @JsonKey(name: 'path', includeIfNull: true, defaultValue: '')
  final String? path;
  @JsonKey(name: 'contentType', includeIfNull: true, defaultValue: '')
  final String? contentType;
  @JsonKey(name: 'size', includeIfNull: true)
  final int? size;
  @JsonKey(name: 'extension', includeIfNull: true, defaultValue: '')
  final String? extension;
  @JsonKey(name: 'folderId', includeIfNull: true)
  final int? folderId;
  @JsonKey(name: 'block', includeIfNull: true, defaultValue: '')
  final String? block;
  @JsonKey(name: 'status', includeIfNull: true)
  final int? status;
  @JsonKey(name: 'avatar', includeIfNull: true, defaultValue: '')
  final String? avatar;
  @JsonKey(name: 'thumbnails', includeIfNull: true, defaultValue: '')
  final String? thumbnails;
  @JsonKey(name: 'streamUrl', includeIfNull: true, defaultValue: '')
  final String? streamUrl;
  @JsonKey(name: 'duration', includeIfNull: true)
  final double? duration;
  @JsonKey(name: 'fileType', includeIfNull: true, defaultValue: '')
  final String? fileType;
  @JsonKey(name: 'domain', includeIfNull: true, defaultValue: '')
  final String? domain;
  static const fromJsonFactory = _$FileResourceFromJson;
  static const toJsonFactory = _$FileResourceToJson;
  Map<String, dynamic> toJson() => _$FileResourceToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is FileResource &&
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
            (identical(other.fileServer, fileServer) ||
                const DeepCollectionEquality()
                    .equals(other.fileServer, fileServer)) &&
            (identical(other.path, path) ||
                const DeepCollectionEquality().equals(other.path, path)) &&
            (identical(other.contentType, contentType) ||
                const DeepCollectionEquality()
                    .equals(other.contentType, contentType)) &&
            (identical(other.size, size) ||
                const DeepCollectionEquality().equals(other.size, size)) &&
            (identical(other.extension, extension) ||
                const DeepCollectionEquality()
                    .equals(other.extension, extension)) &&
            (identical(other.folderId, folderId) ||
                const DeepCollectionEquality()
                    .equals(other.folderId, folderId)) &&
            (identical(other.block, block) ||
                const DeepCollectionEquality().equals(other.block, block)) &&
            (identical(other.status, status) ||
                const DeepCollectionEquality().equals(other.status, status)) &&
            (identical(other.avatar, avatar) ||
                const DeepCollectionEquality().equals(other.avatar, avatar)) &&
            (identical(other.thumbnails, thumbnails) ||
                const DeepCollectionEquality()
                    .equals(other.thumbnails, thumbnails)) &&
            (identical(other.streamUrl, streamUrl) ||
                const DeepCollectionEquality()
                    .equals(other.streamUrl, streamUrl)) &&
            (identical(other.duration, duration) ||
                const DeepCollectionEquality()
                    .equals(other.duration, duration)) &&
            (identical(other.fileType, fileType) ||
                const DeepCollectionEquality()
                    .equals(other.fileType, fileType)) &&
            (identical(other.domain, domain) ||
                const DeepCollectionEquality().equals(other.domain, domain)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(createdBy) ^
      const DeepCollectionEquality().hash(createdDate) ^
      const DeepCollectionEquality().hash(lastModifiedBy) ^
      const DeepCollectionEquality().hash(lastModifiedDate) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(fileServer) ^
      const DeepCollectionEquality().hash(path) ^
      const DeepCollectionEquality().hash(contentType) ^
      const DeepCollectionEquality().hash(size) ^
      const DeepCollectionEquality().hash(extension) ^
      const DeepCollectionEquality().hash(folderId) ^
      const DeepCollectionEquality().hash(block) ^
      const DeepCollectionEquality().hash(status) ^
      const DeepCollectionEquality().hash(avatar) ^
      const DeepCollectionEquality().hash(thumbnails) ^
      const DeepCollectionEquality().hash(streamUrl) ^
      const DeepCollectionEquality().hash(duration) ^
      const DeepCollectionEquality().hash(fileType) ^
      const DeepCollectionEquality().hash(domain) ^
      runtimeType.hashCode;
}

extension $FileResourceExtension on FileResource {
  FileResource copyWith(
      {int? id,
      int? createdBy,
      DateTime? createdDate,
      int? lastModifiedBy,
      DateTime? lastModifiedDate,
      String? name,
      String? fileServer,
      String? path,
      String? contentType,
      int? size,
      String? extension,
      int? folderId,
      String? block,
      int? status,
      String? avatar,
      String? thumbnails,
      String? streamUrl,
      double? duration,
      String? fileType,
      String? domain}) {
    return FileResource(
        id: id ?? this.id,
        createdBy: createdBy ?? this.createdBy,
        createdDate: createdDate ?? this.createdDate,
        lastModifiedBy: lastModifiedBy ?? this.lastModifiedBy,
        lastModifiedDate: lastModifiedDate ?? this.lastModifiedDate,
        name: name ?? this.name,
        fileServer: fileServer ?? this.fileServer,
        path: path ?? this.path,
        contentType: contentType ?? this.contentType,
        size: size ?? this.size,
        extension: extension ?? this.extension,
        folderId: folderId ?? this.folderId,
        block: block ?? this.block,
        status: status ?? this.status,
        avatar: avatar ?? this.avatar,
        thumbnails: thumbnails ?? this.thumbnails,
        streamUrl: streamUrl ?? this.streamUrl,
        duration: duration ?? this.duration,
        fileType: fileType ?? this.fileType,
        domain: domain ?? this.domain);
  }
}

@JsonSerializable(explicitToJson: true)
class FileStorageCallbackResource {
  FileStorageCallbackResource({
    this.name,
    this.fileServer,
    this.path,
    this.physicalPath,
    this.domain,
    this.metaData,
    this.status,
    this.contentType,
    this.size,
    this.extension,
    this.block,
    this.thumbnails,
    this.streamUrl,
    this.duration,
    this.fileType,
  });

  factory FileStorageCallbackResource.fromJson(Map<String, dynamic> json) =>
      _$FileStorageCallbackResourceFromJson(json);

  @JsonKey(name: 'name', includeIfNull: true, defaultValue: '')
  final String? name;
  @JsonKey(name: 'fileServer', includeIfNull: true, defaultValue: '')
  final String? fileServer;
  @JsonKey(name: 'path', includeIfNull: true, defaultValue: '')
  final String? path;
  @JsonKey(name: 'physicalPath', includeIfNull: true, defaultValue: '')
  final String? physicalPath;
  @JsonKey(name: 'domain', includeIfNull: true, defaultValue: '')
  final String? domain;
  @JsonKey(name: 'metaData', includeIfNull: true, defaultValue: '')
  final String? metaData;
  @JsonKey(name: 'status', includeIfNull: true)
  final int? status;
  @JsonKey(name: 'contentType', includeIfNull: true, defaultValue: '')
  final String? contentType;
  @JsonKey(name: 'size', includeIfNull: true)
  final int? size;
  @JsonKey(name: 'extension', includeIfNull: true, defaultValue: '')
  final String? extension;
  @JsonKey(name: 'block', includeIfNull: true, defaultValue: '')
  final String? block;
  @JsonKey(name: 'thumbnails', includeIfNull: true, defaultValue: '')
  final String? thumbnails;
  @JsonKey(name: 'streamUrl', includeIfNull: true, defaultValue: '')
  final String? streamUrl;
  @JsonKey(name: 'duration', includeIfNull: true)
  final double? duration;
  @JsonKey(name: 'fileType', includeIfNull: true, defaultValue: '')
  final String? fileType;
  static const fromJsonFactory = _$FileStorageCallbackResourceFromJson;
  static const toJsonFactory = _$FileStorageCallbackResourceToJson;
  Map<String, dynamic> toJson() => _$FileStorageCallbackResourceToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is FileStorageCallbackResource &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.fileServer, fileServer) ||
                const DeepCollectionEquality()
                    .equals(other.fileServer, fileServer)) &&
            (identical(other.path, path) ||
                const DeepCollectionEquality().equals(other.path, path)) &&
            (identical(other.physicalPath, physicalPath) ||
                const DeepCollectionEquality()
                    .equals(other.physicalPath, physicalPath)) &&
            (identical(other.domain, domain) ||
                const DeepCollectionEquality().equals(other.domain, domain)) &&
            (identical(other.metaData, metaData) ||
                const DeepCollectionEquality()
                    .equals(other.metaData, metaData)) &&
            (identical(other.status, status) ||
                const DeepCollectionEquality().equals(other.status, status)) &&
            (identical(other.contentType, contentType) ||
                const DeepCollectionEquality()
                    .equals(other.contentType, contentType)) &&
            (identical(other.size, size) ||
                const DeepCollectionEquality().equals(other.size, size)) &&
            (identical(other.extension, extension) ||
                const DeepCollectionEquality()
                    .equals(other.extension, extension)) &&
            (identical(other.block, block) ||
                const DeepCollectionEquality().equals(other.block, block)) &&
            (identical(other.thumbnails, thumbnails) ||
                const DeepCollectionEquality()
                    .equals(other.thumbnails, thumbnails)) &&
            (identical(other.streamUrl, streamUrl) ||
                const DeepCollectionEquality()
                    .equals(other.streamUrl, streamUrl)) &&
            (identical(other.duration, duration) ||
                const DeepCollectionEquality()
                    .equals(other.duration, duration)) &&
            (identical(other.fileType, fileType) ||
                const DeepCollectionEquality()
                    .equals(other.fileType, fileType)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(fileServer) ^
      const DeepCollectionEquality().hash(path) ^
      const DeepCollectionEquality().hash(physicalPath) ^
      const DeepCollectionEquality().hash(domain) ^
      const DeepCollectionEquality().hash(metaData) ^
      const DeepCollectionEquality().hash(status) ^
      const DeepCollectionEquality().hash(contentType) ^
      const DeepCollectionEquality().hash(size) ^
      const DeepCollectionEquality().hash(extension) ^
      const DeepCollectionEquality().hash(block) ^
      const DeepCollectionEquality().hash(thumbnails) ^
      const DeepCollectionEquality().hash(streamUrl) ^
      const DeepCollectionEquality().hash(duration) ^
      const DeepCollectionEquality().hash(fileType) ^
      runtimeType.hashCode;
}

extension $FileStorageCallbackResourceExtension on FileStorageCallbackResource {
  FileStorageCallbackResource copyWith(
      {String? name,
      String? fileServer,
      String? path,
      String? physicalPath,
      String? domain,
      String? metaData,
      int? status,
      String? contentType,
      int? size,
      String? extension,
      String? block,
      String? thumbnails,
      String? streamUrl,
      double? duration,
      String? fileType}) {
    return FileStorageCallbackResource(
        name: name ?? this.name,
        fileServer: fileServer ?? this.fileServer,
        path: path ?? this.path,
        physicalPath: physicalPath ?? this.physicalPath,
        domain: domain ?? this.domain,
        metaData: metaData ?? this.metaData,
        status: status ?? this.status,
        contentType: contentType ?? this.contentType,
        size: size ?? this.size,
        extension: extension ?? this.extension,
        block: block ?? this.block,
        thumbnails: thumbnails ?? this.thumbnails,
        streamUrl: streamUrl ?? this.streamUrl,
        duration: duration ?? this.duration,
        fileType: fileType ?? this.fileType);
  }
}

@JsonSerializable(explicitToJson: true)
class GroupUpdateResource {
  GroupUpdateResource({
    this.id,
    this.createdBy,
    this.createdDate,
    this.lastModifiedBy,
    this.lastModifiedDate,
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
    this.userIds,
  });

  factory GroupUpdateResource.fromJson(Map<String, dynamic> json) =>
      _$GroupUpdateResourceFromJson(json);

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
  @JsonKey(name: 'userIds', includeIfNull: true, defaultValue: <int>[])
  final List<int>? userIds;
  static const fromJsonFactory = _$GroupUpdateResourceFromJson;
  static const toJsonFactory = _$GroupUpdateResourceToJson;
  Map<String, dynamic> toJson() => _$GroupUpdateResourceToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is GroupUpdateResource &&
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
            (identical(other.userIds, userIds) ||
                const DeepCollectionEquality().equals(other.userIds, userIds)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(createdBy) ^
      const DeepCollectionEquality().hash(createdDate) ^
      const DeepCollectionEquality().hash(lastModifiedBy) ^
      const DeepCollectionEquality().hash(lastModifiedDate) ^
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
      const DeepCollectionEquality().hash(userIds) ^
      runtimeType.hashCode;
}

extension $GroupUpdateResourceExtension on GroupUpdateResource {
  GroupUpdateResource copyWith(
      {int? id,
      int? createdBy,
      DateTime? createdDate,
      int? lastModifiedBy,
      DateTime? lastModifiedDate,
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
      List<int>? userIds}) {
    return GroupUpdateResource(
        id: id ?? this.id,
        createdBy: createdBy ?? this.createdBy,
        createdDate: createdDate ?? this.createdDate,
        lastModifiedBy: lastModifiedBy ?? this.lastModifiedBy,
        lastModifiedDate: lastModifiedDate ?? this.lastModifiedDate,
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
        userIds: userIds ?? this.userIds);
  }
}

@JsonSerializable(explicitToJson: true)
class IndexBlock {
  IndexBlock({
    this.index,
    this.block,
    this.baseUrl,
    this.create,
    this.reindex,
  });

  factory IndexBlock.fromJson(Map<String, dynamic> json) =>
      _$IndexBlockFromJson(json);

  @JsonKey(name: 'index', includeIfNull: true, defaultValue: '')
  final String? index;
  @JsonKey(name: 'block', includeIfNull: true, defaultValue: '')
  final String? block;
  @JsonKey(name: 'baseUrl', includeIfNull: true, defaultValue: '')
  final String? baseUrl;
  @JsonKey(name: 'create', includeIfNull: true, defaultValue: '')
  final String? create;
  @JsonKey(name: 'reindex', includeIfNull: true, defaultValue: '')
  final String? reindex;
  static const fromJsonFactory = _$IndexBlockFromJson;
  static const toJsonFactory = _$IndexBlockToJson;
  Map<String, dynamic> toJson() => _$IndexBlockToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is IndexBlock &&
            (identical(other.index, index) ||
                const DeepCollectionEquality().equals(other.index, index)) &&
            (identical(other.block, block) ||
                const DeepCollectionEquality().equals(other.block, block)) &&
            (identical(other.baseUrl, baseUrl) ||
                const DeepCollectionEquality()
                    .equals(other.baseUrl, baseUrl)) &&
            (identical(other.create, create) ||
                const DeepCollectionEquality().equals(other.create, create)) &&
            (identical(other.reindex, reindex) ||
                const DeepCollectionEquality().equals(other.reindex, reindex)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(index) ^
      const DeepCollectionEquality().hash(block) ^
      const DeepCollectionEquality().hash(baseUrl) ^
      const DeepCollectionEquality().hash(create) ^
      const DeepCollectionEquality().hash(reindex) ^
      runtimeType.hashCode;
}

extension $IndexBlockExtension on IndexBlock {
  IndexBlock copyWith(
      {String? index,
      String? block,
      String? baseUrl,
      String? create,
      String? reindex}) {
    return IndexBlock(
        index: index ?? this.index,
        block: block ?? this.block,
        baseUrl: baseUrl ?? this.baseUrl,
        create: create ?? this.create,
        reindex: reindex ?? this.reindex);
  }
}

@JsonSerializable(explicitToJson: true)
class IndexCreate {
  IndexCreate({
    this.index,
    this.block,
    this.replica,
    this.shard,
    this.isReindex,
  });

  factory IndexCreate.fromJson(Map<String, dynamic> json) =>
      _$IndexCreateFromJson(json);

  @JsonKey(name: 'index', includeIfNull: true, defaultValue: '')
  final String? index;
  @JsonKey(name: 'block', includeIfNull: true, defaultValue: '')
  final String? block;
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
            (identical(other.block, block) ||
                const DeepCollectionEquality().equals(other.block, block)) &&
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
      const DeepCollectionEquality().hash(block) ^
      const DeepCollectionEquality().hash(replica) ^
      const DeepCollectionEquality().hash(shard) ^
      const DeepCollectionEquality().hash(isReindex) ^
      runtimeType.hashCode;
}

extension $IndexCreateExtension on IndexCreate {
  IndexCreate copyWith(
      {String? index,
      String? block,
      int? replica,
      int? shard,
      bool? isReindex}) {
    return IndexCreate(
        index: index ?? this.index,
        block: block ?? this.block,
        replica: replica ?? this.replica,
        shard: shard ?? this.shard,
        isReindex: isReindex ?? this.isReindex);
  }
}

@JsonSerializable(explicitToJson: true)
class IndexDetail {
  IndexDetail({
    this.id,
    this.docsCount,
    this.docsDeleted,
    this.health,
    this.block,
    this.index,
    this.uuid,
    this.primary,
    this.primaryStoreSize,
    this.replica,
    this.status,
    this.storeSize,
    this.totalMemory,
  });

  factory IndexDetail.fromJson(Map<String, dynamic> json) =>
      _$IndexDetailFromJson(json);

  @JsonKey(name: 'id', includeIfNull: true, defaultValue: '')
  final String? id;
  @JsonKey(name: 'docsCount', includeIfNull: true, defaultValue: '')
  final String? docsCount;
  @JsonKey(name: 'docsDeleted', includeIfNull: true, defaultValue: '')
  final String? docsDeleted;
  @JsonKey(name: 'health', includeIfNull: true, defaultValue: '')
  final String? health;
  @JsonKey(name: 'block', includeIfNull: true, defaultValue: '')
  final String? block;
  @JsonKey(name: 'index', includeIfNull: true, defaultValue: '')
  final String? index;
  @JsonKey(name: 'uuid', includeIfNull: true, defaultValue: '')
  final String? uuid;
  @JsonKey(name: 'primary', includeIfNull: true, defaultValue: '')
  final String? primary;
  @JsonKey(name: 'primaryStoreSize', includeIfNull: true, defaultValue: '')
  final String? primaryStoreSize;
  @JsonKey(name: 'replica', includeIfNull: true, defaultValue: '')
  final String? replica;
  @JsonKey(name: 'status', includeIfNull: true, defaultValue: '')
  final String? status;
  @JsonKey(name: 'storeSize', includeIfNull: true, defaultValue: '')
  final String? storeSize;
  @JsonKey(name: 'totalMemory', includeIfNull: true, defaultValue: '')
  final String? totalMemory;
  static const fromJsonFactory = _$IndexDetailFromJson;
  static const toJsonFactory = _$IndexDetailToJson;
  Map<String, dynamic> toJson() => _$IndexDetailToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is IndexDetail &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.docsCount, docsCount) ||
                const DeepCollectionEquality()
                    .equals(other.docsCount, docsCount)) &&
            (identical(other.docsDeleted, docsDeleted) ||
                const DeepCollectionEquality()
                    .equals(other.docsDeleted, docsDeleted)) &&
            (identical(other.health, health) ||
                const DeepCollectionEquality().equals(other.health, health)) &&
            (identical(other.block, block) ||
                const DeepCollectionEquality().equals(other.block, block)) &&
            (identical(other.index, index) ||
                const DeepCollectionEquality().equals(other.index, index)) &&
            (identical(other.uuid, uuid) ||
                const DeepCollectionEquality().equals(other.uuid, uuid)) &&
            (identical(other.primary, primary) ||
                const DeepCollectionEquality()
                    .equals(other.primary, primary)) &&
            (identical(other.primaryStoreSize, primaryStoreSize) ||
                const DeepCollectionEquality()
                    .equals(other.primaryStoreSize, primaryStoreSize)) &&
            (identical(other.replica, replica) ||
                const DeepCollectionEquality()
                    .equals(other.replica, replica)) &&
            (identical(other.status, status) ||
                const DeepCollectionEquality().equals(other.status, status)) &&
            (identical(other.storeSize, storeSize) ||
                const DeepCollectionEquality()
                    .equals(other.storeSize, storeSize)) &&
            (identical(other.totalMemory, totalMemory) ||
                const DeepCollectionEquality()
                    .equals(other.totalMemory, totalMemory)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(docsCount) ^
      const DeepCollectionEquality().hash(docsDeleted) ^
      const DeepCollectionEquality().hash(health) ^
      const DeepCollectionEquality().hash(block) ^
      const DeepCollectionEquality().hash(index) ^
      const DeepCollectionEquality().hash(uuid) ^
      const DeepCollectionEquality().hash(primary) ^
      const DeepCollectionEquality().hash(primaryStoreSize) ^
      const DeepCollectionEquality().hash(replica) ^
      const DeepCollectionEquality().hash(status) ^
      const DeepCollectionEquality().hash(storeSize) ^
      const DeepCollectionEquality().hash(totalMemory) ^
      runtimeType.hashCode;
}

extension $IndexDetailExtension on IndexDetail {
  IndexDetail copyWith(
      {String? id,
      String? docsCount,
      String? docsDeleted,
      String? health,
      String? block,
      String? index,
      String? uuid,
      String? primary,
      String? primaryStoreSize,
      String? replica,
      String? status,
      String? storeSize,
      String? totalMemory}) {
    return IndexDetail(
        id: id ?? this.id,
        docsCount: docsCount ?? this.docsCount,
        docsDeleted: docsDeleted ?? this.docsDeleted,
        health: health ?? this.health,
        block: block ?? this.block,
        index: index ?? this.index,
        uuid: uuid ?? this.uuid,
        primary: primary ?? this.primary,
        primaryStoreSize: primaryStoreSize ?? this.primaryStoreSize,
        replica: replica ?? this.replica,
        status: status ?? this.status,
        storeSize: storeSize ?? this.storeSize,
        totalMemory: totalMemory ?? this.totalMemory);
  }
}

@JsonSerializable(explicitToJson: true)
class IndexDetailFilterResult {
  IndexDetailFilterResult({
    this.totalRows,
    this.data,
  });

  factory IndexDetailFilterResult.fromJson(Map<String, dynamic> json) =>
      _$IndexDetailFilterResultFromJson(json);

  @JsonKey(name: 'totalRows', includeIfNull: true)
  final int? totalRows;
  @JsonKey(name: 'data', includeIfNull: true, defaultValue: <IndexDetail>[])
  final List<IndexDetail>? data;
  static const fromJsonFactory = _$IndexDetailFilterResultFromJson;
  static const toJsonFactory = _$IndexDetailFilterResultToJson;
  Map<String, dynamic> toJson() => _$IndexDetailFilterResultToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is IndexDetailFilterResult &&
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

extension $IndexDetailFilterResultExtension on IndexDetailFilterResult {
  IndexDetailFilterResult copyWith({int? totalRows, List<IndexDetail>? data}) {
    return IndexDetailFilterResult(
        totalRows: totalRows ?? this.totalRows, data: data ?? this.data);
  }
}

@JsonSerializable(explicitToJson: true)
class SEODetailEntity {
  SEODetailEntity({
    this.title,
    this.description,
    this.image,
    this.languageCode,
  });

  factory SEODetailEntity.fromJson(Map<String, dynamic> json) =>
      _$SEODetailEntityFromJson(json);

  @JsonKey(name: 'title', includeIfNull: true, defaultValue: '')
  final String? title;
  @JsonKey(name: 'description', includeIfNull: true, defaultValue: '')
  final String? description;
  @JsonKey(name: 'image', includeIfNull: true, defaultValue: '')
  final String? image;
  @JsonKey(name: 'languageCode', includeIfNull: true, defaultValue: '')
  final String? languageCode;
  static const fromJsonFactory = _$SEODetailEntityFromJson;
  static const toJsonFactory = _$SEODetailEntityToJson;
  Map<String, dynamic> toJson() => _$SEODetailEntityToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is SEODetailEntity &&
            (identical(other.title, title) ||
                const DeepCollectionEquality().equals(other.title, title)) &&
            (identical(other.description, description) ||
                const DeepCollectionEquality()
                    .equals(other.description, description)) &&
            (identical(other.image, image) ||
                const DeepCollectionEquality().equals(other.image, image)) &&
            (identical(other.languageCode, languageCode) ||
                const DeepCollectionEquality()
                    .equals(other.languageCode, languageCode)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(title) ^
      const DeepCollectionEquality().hash(description) ^
      const DeepCollectionEquality().hash(image) ^
      const DeepCollectionEquality().hash(languageCode) ^
      runtimeType.hashCode;
}

extension $SEODetailEntityExtension on SEODetailEntity {
  SEODetailEntity copyWith(
      {String? title,
      String? description,
      String? image,
      String? languageCode}) {
    return SEODetailEntity(
        title: title ?? this.title,
        description: description ?? this.description,
        image: image ?? this.image,
        languageCode: languageCode ?? this.languageCode);
  }
}

@JsonSerializable(explicitToJson: true)
class UserInGroupFilterResource {
  UserInGroupFilterResource({
    this.sortExpression,
    this.pageSize,
    this.pageIndex,
    this.keyword,
    this.status,
    this.groupId,
  });

  factory UserInGroupFilterResource.fromJson(Map<String, dynamic> json) =>
      _$UserInGroupFilterResourceFromJson(json);

  @JsonKey(name: 'sortExpression', includeIfNull: true, defaultValue: '')
  final String? sortExpression;
  @JsonKey(name: 'pageSize', includeIfNull: true)
  final int? pageSize;
  @JsonKey(name: 'pageIndex', includeIfNull: true)
  final int? pageIndex;
  @JsonKey(name: 'keyword', includeIfNull: true, defaultValue: '')
  final String? keyword;
  @JsonKey(name: 'status', includeIfNull: true)
  final int? status;
  @JsonKey(name: 'groupId', includeIfNull: true)
  final int? groupId;
  static const fromJsonFactory = _$UserInGroupFilterResourceFromJson;
  static const toJsonFactory = _$UserInGroupFilterResourceToJson;
  Map<String, dynamic> toJson() => _$UserInGroupFilterResourceToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is UserInGroupFilterResource &&
            (identical(other.sortExpression, sortExpression) ||
                const DeepCollectionEquality()
                    .equals(other.sortExpression, sortExpression)) &&
            (identical(other.pageSize, pageSize) ||
                const DeepCollectionEquality()
                    .equals(other.pageSize, pageSize)) &&
            (identical(other.pageIndex, pageIndex) ||
                const DeepCollectionEquality()
                    .equals(other.pageIndex, pageIndex)) &&
            (identical(other.keyword, keyword) ||
                const DeepCollectionEquality()
                    .equals(other.keyword, keyword)) &&
            (identical(other.status, status) ||
                const DeepCollectionEquality().equals(other.status, status)) &&
            (identical(other.groupId, groupId) ||
                const DeepCollectionEquality().equals(other.groupId, groupId)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(sortExpression) ^
      const DeepCollectionEquality().hash(pageSize) ^
      const DeepCollectionEquality().hash(pageIndex) ^
      const DeepCollectionEquality().hash(keyword) ^
      const DeepCollectionEquality().hash(status) ^
      const DeepCollectionEquality().hash(groupId) ^
      runtimeType.hashCode;
}

extension $UserInGroupFilterResourceExtension on UserInGroupFilterResource {
  UserInGroupFilterResource copyWith(
      {String? sortExpression,
      int? pageSize,
      int? pageIndex,
      String? keyword,
      int? status,
      int? groupId}) {
    return UserInGroupFilterResource(
        sortExpression: sortExpression ?? this.sortExpression,
        pageSize: pageSize ?? this.pageSize,
        pageIndex: pageIndex ?? this.pageIndex,
        keyword: keyword ?? this.keyword,
        status: status ?? this.status,
        groupId: groupId ?? this.groupId);
  }
}
