import 'dart:io';

import 'package:core/common/common.dart';
import 'package:core/common/extension/double_extension.dart';
import 'package:core/components/download/bnd_download.dart';
import 'package:core/components/download/bnd_installed_widget.dart';
import 'package:core/components/download/bnd_progress_install_widget.dart';
import 'package:core/language/app_localizations.dart';
import 'package:core/model/file_download.dart';
import 'package:core/shared_preferences/local_storage_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'bnd_not_installed_widget.dart';

class BNDDownloadFileWidget extends StatefulWidget {
  final String urlFile;
  final Widget? notInstalledWidget;
  final Widget? installedWidget;
  final Widget? progressWidget;
  final Function(double progress) onProgress;
  const BNDDownloadFileWidget({
    Key? key,
    required this.urlFile,
    this.installedWidget,
    this.notInstalledWidget,
    this.progressWidget,
    required this.onProgress,
  }) : super(key: key);

  @override
  _BNDDownloadFileWidgetState createState() => _BNDDownloadFileWidgetState();
}

class _BNDDownloadFileWidgetState extends State<BNDDownloadFileWidget> {
  double _progressDownload = 0.0;
  String fileName = "";
  String filePath = "";
  String _nameDoc = '';
  late bool _isDownloaded = false;
  late SharedPreferences prefs;
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

  @override
  void initState() {
    super.initState();
    _checkDownloaded();
  }

  Future<void> _checkDownloaded() async {
    //TODO: fix cứng:
    final String nameDocument = Utils.getFileName(widget.urlFile);
    _nameDoc = nameDocument;
    final FileDownloadModel? file = getLocalFile(nameDocument);
    _isDownloaded = file != null;

    if (_isDownloaded) {
      fileName = file!.fileName;
      filePath = file.localPath;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        if (_isDownloaded) {
          //Open File
          // await _onRefresh();
          // final OpenResult res = await OpenFile.open(filePath);
          // print(res.message);
          await checkPathFileExit(Utils.getFileName(widget.urlFile));
        } else {
          //Download
          await _onDownload();
        }
      },
      child: Container(
        child: _buildDownload(context),
      ),
    );
  }

  Future<void> _onDownload() async {
    await downloadFile(widget.urlFile, onProcess: (double progress) {
      widget.onProgress(progress);
      setState(() {
        _progressDownload = progress.toPrecision(2);
      });
      // _showProgressNotification(progress.toInt(), context, widget.urlFile);
    }, onSuccessed: (String path) {
      _progressDownload = 100;
      print('success');
      // _showProgressNotification(100, context, widget.urlFile);
      filePath = path;
      _onSuccess();
      // _checkDownloaded();
    });
  }

  Future<void> _onRefresh() async {
    await LocalStoreManager.remove(Utils.getFileName(_nameDoc));
    await _checkDownloaded();
  }

  Widget _buildDownload(BuildContext context) {
    final String examPDF = widget.urlFile;
    print(Utils.getExtension(examPDF));
    if (_isDownloaded) {
      print('_isDownloaded');
      // Đã tải xong
      return widget.installedWidget ?? BNDInstalledWidget(urlFile: widget.urlFile);
    } else {
      if (_progressDownload == 0.0) {
        // Chưa tải
        return widget.notInstalledWidget ?? BNDNotInstalledWidget(urlFile: widget.urlFile);
      }
      // Đang tải
      return widget.progressWidget ??
          BNDProgressInstallWidget(urlFile: widget.urlFile, progressDownload: _progressDownload);
    }
  }

  Future<void> _onSuccess() async {
    setState(() {
      _isDownloaded = true;
    });
  }

  Future<void> _showProgressNotification(int progress, BuildContext context, String filetile) async {
    const int maxProgress = 100;
    if (Platform.isAndroid) {
      final AndroidNotificationDetails androidPlatformChannelSpecifics = AndroidNotificationDetails(
        'progress channel',
        'progress channel',
        'progress channel description',
        channelShowBadge: false,
        importance: Importance.max,
        priority: Priority.high,
        onlyAlertOnce: true,
        showProgress: true,
        maxProgress: maxProgress,
        progress: progress,
      );
      final NotificationDetails platformChannelSpecifics =
          NotificationDetails(android: androidPlatformChannelSpecifics);
      await flutterLocalNotificationsPlugin.show(
          0, filetile, AppLocalizations.of(context)!.translate('downloading'), platformChannelSpecifics,
          payload: 'item x');
    }
    if (progress == maxProgress) {
      await flutterLocalNotificationsPlugin.cancel(0);
      await _showSuccessNotification(context, filetile);
    }
  }

  Future<void> _showSuccessNotification(BuildContext context, String filetile) async {
    const AndroidNotificationDetails androidPlatformChannelSpecifics = AndroidNotificationDetails(
        'your channel id', 'your channel name', 'your channel description',
        importance: Importance.max, priority: Priority.high, ticker: 'ticker');
    const NotificationDetails platformChannelSpecifics = NotificationDetails(android: androidPlatformChannelSpecifics);
    await flutterLocalNotificationsPlugin.show(
        0, filetile, AppLocalizations.of(context)!.translate('download_success'), platformChannelSpecifics,
        payload: 'item x');
  }
}
