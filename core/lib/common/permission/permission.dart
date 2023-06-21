import 'dart:io';
import 'package:app_settings/app_settings.dart';
import 'package:core/shared_preferences/global_variable_resource.dart';
import 'package:core/shared_preferences/local_storage_manager.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:permission_handler/permission_handler.dart';

Permission get permissionStorage => Platform.isIOS ? Permission.photos : Permission.storage;

const permissionCamera = Permission.camera;
const permissionMicro = Permission.microphone;
const permissionContact = Permission.contacts;

Future<void> checkPermission(Permission p, {VoidCallback? onAllowed, VoidCallback? onNeverAllowed}) async {
  final PermissionStatus result = await p.request();
  if (result.isGranted) {
    onAllowed?.call();
  } else if (result.isPermanentlyDenied) {
    onNeverAllowed?.call();
  }
}

Future<void> onSettingsTap() async {
  // final bool open = await openAppSettings();
  await AppSettings.openDeviceSettings(asAnotherTask: true);
  // print("-----openSettings---$open--");
}
