import 'package:core/assets/images/images.dart';
import 'package:core/common/constants/block_settings.dart';
import 'package:core/common/dimension.dart';
import 'package:core/common/enums/block_enum.dart';
import 'package:core/language/app_localizations.dart';
import 'package:core/shared_preferences/local_storage_manager.dart';
import 'package:flutter/material.dart';

import 'bnd_image.dart';

class BnDNoData extends StatelessWidget {
  BnDNoData({Key? key, this.isNodataText = false, this.blockId, this.text = ''}) : super(key: key);
  final int? blockId;
  final bool isNodataText;
  final String text;

  @override
  Widget build(BuildContext context) {
    return !isNodataText
        ? _buildOrientation(child: _buildNoDataWidgetImage(context))
        : _buildOrientation(child: _buildNoDataWidget(context));
  }

  Widget _buildOrientation({required Widget child}) {
    return OrientationBuilder(builder: (BuildContext context, Orientation orientation) {
      if (orientation == Orientation.portrait) {
        return child;
      }
      return ListView(
        physics: const NeverScrollableScrollPhysics(),
        children: <Widget>[
          Container(
            margin: const EdgeInsets.only(top: 50),
            child: child,
          )
        ],
      );
    });
  }

  Center _buildNoDataWidget(BuildContext context) {
    return Center(
      child: Text(
        AppLocalizations.of(context)!.translate("no_data"),
        style: const TextStyle(fontSize: 16, color: Color(0xff414B5B)),
      ),
    );
  }

  Center _buildNoDataWidgetImage(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          BNDImage(imageUrl: _getImageFromBlockId, height: height(context, 203), width: width(context, 305)),
          Text(
            text.isNotEmpty ? text : AppLocalizations.of(context)!.translate("no_data"),
            style:
                TextStyle(fontWeight: FontWeight.w400, fontSize: 16, color: const Color(0xff414B5B).withOpacity(0.8)),
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }

  String get _getImageFromBlockId {
    // final int _blocId = blockId ?? LocalStoreManager.getInt(BlockSettings.blockKey);
    // if (_blocId == BlockEnum.SupperApp.index) {
    //   return Images.icEmptyVitan;
    // } else if (_blocId == BlockEnum.Exam.index) {
    //   return Images.icEmptyExam;
    // } else if (_blocId == BlockEnum.Guide.index) {
    //   return Images.icEmptyGuide;
    // } else if (_blocId == BlockEnum.Learn.index) {
    //   return Images.icEmptyLearn;
    // }
    return Images.icEmptyDefault;
  }
}
