import 'package:core/assets/images/images.dart';
import 'package:core/common/utils/app_utils.dart';
import 'package:flutter/material.dart';

import '../../common/constants/file_configs.dart';

class BNDNotInstalledWidget extends StatelessWidget {
  final String urlFile;
  const BNDNotInstalledWidget({
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
      ],
    );
  }
}
