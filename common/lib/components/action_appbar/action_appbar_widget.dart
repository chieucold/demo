import 'package:common/route/route_goto.dart';
import 'package:core/assets/images/images.dart';
import 'package:core/common/color/core_color.dart';
import 'package:core/common/common.dart';
import 'package:core/components/bnd_touch.dart';
import 'package:core/components/notification/bloc/noti_count_bloc.dart';
import 'package:core/components/notification/bloc/noti_count_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ActionAppbarWidget extends StatelessWidget {
  const ActionAppbarWidget({Key? key, required this.blockEnum, this.onTapNotification, this.onTapSearch})
      : super(key: key);
  final BlockEnum blockEnum;
  final Function()? onTapNotification;
  final Function()? onTapSearch;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 12, 60.sp, 6),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(90), color: CoreColor.white),
      child: Row(
        children: <Widget>[
          BndTouch(
            onPressed: onTapNotification ?? () => goToVHS9Notification(context),
            child: Stack(
              children: <Widget>[
                BlocBuilder<NotiCountBloc, NotiCountState>(
                  builder: (context, state) {
                    if (state.data.guideNotSeen == 0) {
                      return const SizedBox.shrink();
                    }
                    return Positioned(
                      right: 6,
                      top: 2,
                      child: Container(
                        height: 8,
                        width: 8,
                        decoration: const BoxDecoration(shape: BoxShape.circle, color: Colors.red),
                      ),
                    );
                  },
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(16, 0, 12, 0),
                  alignment: Alignment.center,
                  child: Images.svgAssets(Images.icNotiOutline,
                      width: 20, height: 22, color: CoreColor.cricleBackgroundColor),
                ),
              ],
            ),
          ),
          Container(
            color: CoreColor.dividerColor,
            height: 20,
            width: 1,
          ),
          BndTouch(
            onPressed: onTapSearch ??
                () => goToVSR3SearchScreen(context,
                    blockModel: listBlockWithVitan.firstWhere((BlockModel e) => e.id == blockEnum.index)),
            child: Container(
              padding: const EdgeInsets.fromLTRB(12, 0, 16, 0),
              alignment: Alignment.center,
              child: Images.svgAssets(Images.icSearch, width: 14, height: 14, color: CoreColor.cricleBackgroundColor),
            ),
          ),
        ],
      ),
    );
  }
}
