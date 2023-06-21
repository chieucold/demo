import 'package:api/api/commondata_api_models.dart';
import 'package:core/common/color/core_color.dart';
import 'package:core/components/core_component.dart';
import 'package:flutter/material.dart';

class VEO5ListMemberWidget extends StatelessWidget {
  final List<SimpleUserEntity> members;
  const VEO5ListMemberWidget({Key? key, this.members = const <SimpleUserEntity>[]}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final int length = members.length.toInt();
    return Container(
      margin: EdgeInsets.only(right: members.length > 3 ? 18 * 2 + 8 : (members.length - 1) * 18 + 8),
      child: Stack(
        clipBehavior: Clip.none,
        children: <Widget>[
          for (int index = 0; index < 3; index++)
            if (index < length)
              index == 0
                  ? Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: CoreColor.textWhiteColor, width: 2), shape: BoxShape.circle),
                      child: _buildAvatar(index),
                    )
                  : Positioned(
                      bottom: 0,
                      top: 0,
                      right: -20 * index.toDouble(),
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: CoreColor.textWhiteColor, width: 2), shape: BoxShape.circle),
                        child: _buildAvatar(index),
                      ),
                    ),
        ].reversed.toList(),
      ),
    );
  }

  Widget _buildAvatar(int index) {
    return BnDAvatar(
      size: 16,
      textSize: 12,
      name: members[index].fullName,
      imageUrl: members[index].avatar,
    );
  }
}
