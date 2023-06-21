import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class BndQrCodeWidget extends StatefulWidget {
  final EdgeInsets? padding;
  final double? size;
  const BndQrCodeWidget({Key? key,this.padding,this.size}) : super(key: key);

  @override
  State<BndQrCodeWidget> createState() => _BndQrCodeWidgetState();
}

class _BndQrCodeWidgetState extends State<BndQrCodeWidget> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: QrImage(
        data: '127372323892938',
        version: 1,
        size: widget.size,
        padding: widget.padding??EdgeInsets.zero,
        gapless: false,
        errorStateBuilder: (BuildContext context, Object? err) {
          return const Center(
            child:  Text(
              "Uh oh! Something went wrong...",
              textAlign: TextAlign.center,
            ),
          );
        },
      ),
    );
  }
}
