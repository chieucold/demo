import 'package:core/assets/images/images.dart';
import 'package:core/common/constants/file_configs.dart';
import 'package:core/common/utils/app_utils.dart';
import 'package:core/language/app_localizations.dart';
import 'package:flutter/material.dart';

class BNDProgressInstallWidget extends StatelessWidget {
  final double progressDownload;
  final String urlFile;
  const BNDProgressInstallWidget({Key? key, required this.urlFile, this.progressDownload = 0.0}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Images.svgAssets(
              getIconFile[Utils.getExtension(urlFile)] ?? Images.icDownloadDoc,
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
        ),
        Column(
          children: <Widget>[
            Container(
              padding: const EdgeInsets.only(top: 8),
              child: LinearProgressIndicator(
                value: progressDownload / 100,
                valueColor: const AlwaysStoppedAnimation<Color>(Color(0xff2EADC9)),
                backgroundColor: const Color(0xff2EADC9).withOpacity(0.2),
              ),
            ),
            const SizedBox(
              height: 2,
            ),
            progressDownload == 0
                ? const SizedBox(
                    height: 12,
                  )
                : Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      "${AppLocalizations.of(context)!.translate("uploading")} $progressDownload%",
                      style: const TextStyle(fontSize: 12, color: Color(0xffD1D6DE)),
                    ),
                  ),
          ],
        ),
      ],
    );
  }
}
