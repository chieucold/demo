import 'package:json_annotation/json_annotation.dart';

part 'file_download.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class FileDownloadModel {
  String fileName;
  String localPath;

  FileDownloadModel(this.fileName, this.localPath);

  factory FileDownloadModel.fromJson(Map<String, dynamic> json) => _$FileDownloadModelFromJson(json);

  Map<String, dynamic> toJson() => _$FileDownloadModelToJson(this);
}
