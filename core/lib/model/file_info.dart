class FileInfo {
  FileInfo({
    this.name = "",
    this.path = "",
    this.pathWithDomain = "",
    this.contentType = "",
    this.extension = "",
    this.fileType = "",
  });

  final String name;
  final String path;
  final String pathWithDomain;
  final String contentType;
  final String extension;
  final String fileType;

  factory FileInfo.fromJson(Map<String, dynamic> json) => FileInfo(
        name: json["Name"] ?? "",
        path: json["Path"] ?? "",
        contentType: json["ContentType"] ?? "",
        extension: json["Extension"] ?? "",
        pathWithDomain: json["PathWithDomain"] ?? "",
        fileType: json["FileType"] ?? "",
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        "Name": name,
        "Path": path,
        "ContentType": contentType,
        "Extension": extension,
        "PathWithDomain": pathWithDomain,
        "FileType": fileType,
      };
}
