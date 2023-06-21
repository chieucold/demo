import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:core/common/extension/string_extension.dart';

class BndQrCodeScan extends StatefulWidget {
  final Function getResult;
  final Widget? content;
  final bool pauseWhenKnow = true;
  final Color borderColor;

  BndQrCodeScan({Key? key, required this.getResult, this.content, this.borderColor = Colors.red}) : super(key: key);
  @override
  _BndQrCodeScanState createState() => _BndQrCodeScanState();
}

class _BndQrCodeScanState extends State<BndQrCodeScan> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  Barcode? result;
  QRViewController? controller;
  double get screenSize => MediaQuery.of(context).size.height < MediaQuery.of(context).size.width
      ? MediaQuery.of(context).size.height
      : MediaQuery.of(context).size.width;
  double get areaSize => screenSize - 50;

  // In order to get hot reload to work we need to pause the camera if the platform
  // is android, or resume the camera if the platform is iOS.
  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    } else if (Platform.isIOS) {
      controller!.resumeCamera();
    }
  }

  @override
  Widget build(BuildContext context) {
    return QRView(
      key: qrKey,
      onQRViewCreated: _onQRViewCreated,
      cameraFacing: CameraFacing.back,
      overlay: QrScannerOverlayShape(
        borderColor: widget.borderColor,
        borderRadius: 0,
        borderLength: 20,
        borderWidth: 10,
        cutOutSize: areaSize,
      ),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((Barcode scanData) {
      setState(() {
        result = scanData;

        if (!scanData.code.isNullOrEmpty && widget.pauseWhenKnow) controller.pauseCamera();
        widget.getResult(scanData.code);
      });
    });
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
