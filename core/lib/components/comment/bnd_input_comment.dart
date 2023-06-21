import 'package:core/common/color/core_color.dart';
import 'package:core/components/core_component.dart';
import 'package:core/model/user_info.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import 'bnd_comment_form.dart';

class BNDInputComment extends StatelessWidget {
  final ScrollController controller;
  BNDInputComment({Key? key, required this.controller}) : super(key: key);
  final UserInfo? currentUser = GetIt.I<AuthenticateApp>().getUserInfo();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: CoreColor.paddingBodyDefault.copyWith(bottom: 16, top: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          BnDAvatar(
            name: currentUser?.name ?? "A",
            imageUrl: currentUser?.avatar ?? "",
            size: 25,
            viewImage: true,
          ),
          const SizedBox(width: 6),
          Expanded(
            child: BNDCommentForm(controller: controller),
          ),
        ],
      ),
    );
  }
}
