import 'package:common/components/event/veo/veo5_event_detail/view/widgets/veo5_info_item_widget.dart';
import 'package:core/assets/images/images.dart';
import 'package:core/common/color/core_color.dart';
import 'package:core/language/app_localizations.dart';
import 'package:core/common/text_style.dart';
import 'package:flutter/material.dart';

class VEO5OrganizationWidget extends StatefulWidget {
   VEO5OrganizationWidget({Key? key}) : super(key: key);

  @override
  _VEO5OrganizationWidgetState createState() => _VEO5OrganizationWidgetState();
}

class _VEO5OrganizationWidgetState extends State<VEO5OrganizationWidget> {
  @override
  Widget build(BuildContext context) {
    return VEO5InfoItemWidget(
      icon: "",
      title: "IDP Center",
      description: "Đơn vị tổ chức",
      startWidget: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Images.svgAssets(
          Images.icLocation,
        ),
      ),
      //toDo chưa xử lý
      endWidget: Container(
        padding: const EdgeInsets.all(6),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8), color: CoreColor.veo5InviteTextColor.withOpacity(0.1)),
        child: Text(
          AppLocalizations.of(context)!.translate("follow"),
          style: textStyleBodySmallest.copyWith(
            color: CoreColor.veo5InviteTextColor,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}
