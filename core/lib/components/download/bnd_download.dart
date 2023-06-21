import 'package:core/common/constants/packages.dart';
import 'package:core/common/utils/app_utils.dart';
import 'package:core/model/file_download.dart';
import 'package:core/shared_preferences/local_storage_manager.dart';
import 'package:path_provider/path_provider.dart';
import 'package:dio/dio.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:open_file/open_file.dart';

import 'dart:io';

//TODO(25/10)
Future<void> downloadFile(String uri, {Function? onProcess, Function? onSuccessed}) async {
  final PermissionStatus status = await Permission.storage.status;
  if (!status.isGranted) {
    await Permission.storage.request();
  }

  final FileDownloadModel? file = getLocalFile(uri);
  if (file != null) {
    if (onSuccessed != null) onSuccessed(file.localPath);
    return;
  }

  final Dio dio = Dio();
  double progress = 0;
  final String fileName = Utils.getFileName(uri);
  // ignore: unawaited_futures
  final String path = await getDownloadFilePath(fileName);

  // ignore: unawaited_futures
  dio.download(
    uri,
    path,
    onReceiveProgress: (int rcv, int total) {
      progress = ((rcv / total) * 100);
      print(progress);
      if (progress == 100) {
        if (onSuccessed != null) {
          onSuccessed(path);
        }
        setLocalFile(fileName, path);
      } else if (onProcess != null) onProcess(progress);
    },
    deleteOnError: true,
  ).then((_) {});
}

Future<String> getDownloadFilePath(String name) async {
  final Directory? dir = Platform.isAndroid
      ? await _getDownloadFilePathAndroid() //FOR ANDROID
      : await getApplicationSupportDirectory();
  if (dir != null) {
    final String path = '${dir.path}/$name';
    final bool _exit = await dir.exists();
    if (!_exit) {
      await dir.create();
    }

    print(dir.path);
    return path;
  }
  return "";
}

Future<bool> checkPathFileExit(String name) async {
  final Directory? dir = Platform.isAndroid
      ? await _getDownloadFilePathAndroid() //FOR ANDROID
      : await getApplicationSupportDirectory();
  if (dir != null) {
    final String path = '${dir.path}/$name';
    final bool _exit = await File(path).exists();
    // final bool _exit = await dir.exists();
    if (_exit) {
      await OpenFile.open(path);
      return true;
    }
    return false;
  }
  return false;
}

Future<Directory?> _getDownloadFilePathAndroid() async {
  Directory? directory = await getExternalStorageDirectory();
  if (directory != null) {
    String newPath = "";

    final List<String> paths = directory.path.split("/");
    for (int x = 1; x < paths.length; x++) {
      final String folder = paths[x];
      if (folder != "Android") {
        newPath += "/" + folder;
      } else {
        break;
      }
    }
    newPath = newPath + "/" + appName;
    print(newPath);
    directory = Directory(newPath);

    return directory;
  }
  return null;
}

FileDownloadModel? getLocalFile(String fileUrl) {
  final String nameDocument = Utils.getFileName(fileUrl);
  final Map<String, dynamic>? object = LocalStoreManager.getObject(nameDocument);
  if (object == null) {
    return null;
  } else {
    final FileDownloadModel fileInfo = FileDownloadModel.fromJson(object);
    return fileInfo;
  }
}

FileDownloadModel? setLocalFile(String fileName, String localPath) {
  final FileDownloadModel fileInfo = FileDownloadModel(fileName, localPath);
  LocalStoreManager.setObject(fileName, fileInfo.toJson());
  return null;
}
