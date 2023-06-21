import 'package:core/common/realtime/bnd_signalr.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

Future<void> initRealtime(BuildContext context) async {
  final BNDSignalR _signalR = GetIt.I<BNDSignalR>();
  await _signalR.initConnection();
}
