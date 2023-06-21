import 'dart:typed_data';
import 'package:api/api/system_api.dart';
import 'package:core/common/constants/block_settings.dart';
import 'package:core/common/constants/user_settings.dart';
import 'package:core/common/enums/block_enum.dart';
import 'package:core/common/utils/app_utils.dart';
import 'package:core/components/upload/src/client.dart';
import 'package:core/components/upload/src/store.dart';
import 'package:core/model/file_info.dart';
import 'package:core/shared_preferences/local_storage_manager.dart';
import 'package:get_it/get_it.dart';
import 'package:mime_type/mime_type.dart';
import 'package:cross_file/cross_file.dart' show XFile;
import 'package:http/http.dart' as http;

typedef void onUploadComplete(FileInfo? data);
typedef void onUploadCompletes(List<FileInfo> data);
typedef void onProgress(FileInfo? data);

Future<void> uploadFiles(
  List<String> filePaths, {
  Function? onProgress,
  onUploadCompletes? onUploadComplete,
}) async {
  int totalProcess = 0;
  final int fileLength = filePaths.length;

  final String server = await getServerUpload();
  final List<FileInfo> fileInfos = <FileInfo>[];
  for (final String path in filePaths) {
    await uploadFile(path, urlUploadServer: server, onUploadComplete: (FileInfo? info) {
      if (info != null) fileInfos.add(info);
      totalProcess++;
      if (totalProcess == fileLength) {
        if (onUploadComplete != null) onUploadComplete(fileInfos);
      } else {
        if (onProgress != null) onProgress(info);
      }
    }).then((_) => null);
  }
}

Future<TusClient?> uploadFile(
  String filePath, {
  Function? onProgress,
  onUploadComplete? onUploadComplete,
  String urlUploadServer = "",
  Function? onError,
}) async {
  final XFile xFile = XFile(filePath);
  return upload(Utils.getFileName(filePath), xFile,
      onError: onError, urlUploadServer: urlUploadServer, onProgress: onProgress, onComplete: (FileInfo? data) {
    if (onUploadComplete != null) onUploadComplete(data);
  });
}

Future<void> uploadBytes(
  String fileName,
  Uint8List? bytes, {
  Function? onProgress,
  onUploadComplete? onUploadComplete,
  Function? onError,
}) async {
  if (bytes == null) return;
  final XFile file = XFile.fromData(
    bytes,
    name: fileName,
  );
  await upload(fileName, file, onError: onError, onProgress: onProgress, onComplete: (FileInfo? data) {
    if (onUploadComplete != null) onUploadComplete(data);
  });
}

Future<TusClient?> upload(
  String fileName,
  XFile file, {
  Function? onProgress,
  Function? onComplete,
  Function? onError,
  String urlUploadServer = "",
}) async {
  final String mimeType = mime(fileName) ?? "";
  final String block =
      BlockEnum.values[LocalStoreManager.getInt(BlockSettings.blockKey)].toString().replaceAll("BlockEnum.", "");
  if (mimeType.isEmpty) return null;
  // ignore: parameter_assignments
  if (urlUploadServer.isEmpty) urlUploadServer = await getServerUpload();
  final TusClient _client = TusClient(Uri.parse(urlUploadServer), file,
      store: TusMemoryStore(),
      headers: _headerUpload(),
      metadata: <String, String>{
        "name": fileName,
        "type": mimeType,
        "contentType": mimeType,
        "zone": "SYSTEM",
        "block": block.toUpperCase(),
        "filetype": mimeType,
        "filename": fileName
      });

  // ignore: unawaited_futures
  _client.upload(
    onComplete: (http.Response temp) {
      print(temp.statusCode);
      if (temp.statusCode != 200 && temp.statusCode != 204) {
        //Nodata
        if (onError != null) onError(temp.body);
      } else if (onComplete != null) {
        final Map<String, String> headers = temp.headers;
        if (headers["x-file-info"] == null) return onComplete(null);
        onComplete(FileInfo.fromJson(Utils.base64ToMap(headers["x-file-info"].toString())));
      }
    },
    onProgress: (double progress) {
      if (onProgress != null) onProgress(progress);
    },
  );

  return _client;
}

Future<String> getServerUpload() async {
  try {
    final SystemApi systemAPI = GetIt.I();
    final ServerResource result = await systemAPI.serverGetUploadServer();
    return result.publicDomain + "/upload";
  } catch (e) {
    return "";
  }
}

Map<String, String> _headerUpload() {
  return <String, String>{"Authorization": "Bearer ${LocalStoreManager.getString(UserSettings.tokenUser)}"};
}
