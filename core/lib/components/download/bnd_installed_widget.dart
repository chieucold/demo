import 'package:core/assets/images/images.dart';
import 'package:core/common/common.dart';
import 'package:core/common/constants/file_configs.dart';
import 'package:flutter/material.dart';

class BNDInstalledWidget extends StatelessWidget {
  final String urlFile;
  const BNDInstalledWidget({
    Key? key,
    required this.urlFile,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Images.svgAssets(
          getIconFile[Utils.getExtension(urlFile)]!,
          package: 'core',
        ),
        const SizedBox(
          width: 6,
        ),
        Expanded(
          child: Text(
            Utils.getFileName(urlFile),
            style: const TextStyle(fontSize: 14),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        Images.svgAssets(
          Images.icUploadSuccess,
          package: 'core',
        ),
      ],
    );
  }
}
