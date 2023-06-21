import 'package:core/assets/images/images.dart';
import 'package:core/common/app_settings/app_settings.dart';
import 'package:core/common/color/core_color.dart';
import 'package:core/common/common.dart';
import 'package:core/common/dimension.dart';
import 'package:core/common/text_style.dart';
import 'package:core/components/core_component.dart';
import 'package:core/language/app_localizations.dart';
import 'package:core/model/user_info.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:api/common/model/app_settings/app_settings_entity.dart';

class BlockItemWidget extends StatelessWidget {
  BlockItemWidget({Key? key, required this.item}) : super(key: key);
  final BlockModel item;
  final List<UserTestGuide> _listUserTestGuide = GetIt.I<AppSettings>().configs.userTestGuide;
  final UserInfo? currentUser = GetIt.I<AuthenticateApp>().getUserInfo();

  @override
  Widget build(BuildContext context) {
    final List<String> _emailUser = _listUserTestGuide.map((e) => e.user).toList();
    final bool _isActive = item.isActive ||
        item.id == BlockEnum.SupperApp.index ||
        item.id == BlockEnum.Guide.index && _emailUser.contains(currentUser?.email ?? '');
    return Container(
      margin: const EdgeInsetsDirectional.all(2),
      child: Row(
        children: <Widget>[
          Center(child: Images.svgAssets(item.icon.replaceAll('.svg', _isActive ? '.svg' : '_grey.svg'))),
          Expanded(
            child: Container(
              margin: EdgeInsetsDirectional.only(start: height(context, 10)),
              alignment: AlignmentDirectional.bottomStart,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  RichText(
                    text: TextSpan(
                      children: <TextSpan>[
                        TextSpan(text: 'Vitan', style: textStyleHeadline6.copyWith(color: CoreColor.textColor)),
                        TextSpan(
                          text: AppLocalizations.of(context)!.translate(item.name).replaceAll('Vitan', ''),
                          style: textStyleHeadline6.copyWith(
                              color: _isActive ? item.backgroundColor : CoreColor.textColor),
                        ),
                      ],
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    AppLocalizations.of(context)!.translate(item.title),
                    style: textStyleBodyDefault.copyWith(color: CoreColor.textColor),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
