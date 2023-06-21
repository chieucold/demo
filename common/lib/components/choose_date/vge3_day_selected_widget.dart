import 'package:common/common/color/common_color.dart';
import 'package:core/language/app_localizations.dart';
import 'package:core/common/text_style.dart';
import 'package:flutter/material.dart';

class VGE3DaySelectedWidget extends StatefulWidget {
  final String fromDate;
  final String toDate;
  final Function(DateTime timeRequest) onChangeTime;

  const VGE3DaySelectedWidget({
    Key? key,
    required this.onChangeTime,
    required this.fromDate,
    required this.toDate,
  }) : super(key: key);

  @override
  _VGE3DaySelectedWidgetState createState() => _VGE3DaySelectedWidgetState();
}

class _VGE3DaySelectedWidgetState extends State<VGE3DaySelectedWidget> {
  final DateTime dateTimeNow = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: CommonColor.paddingBodyDefault.copyWith(top: 8, bottom: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          _buildItemDateSelected(AppLocalizations.of(context)!.translate('the_past_7_days'),
              DateTime(dateTimeNow.year, dateTimeNow.month, dateTimeNow.day - 7)),
          _buildItemDateSelected(AppLocalizations.of(context)!.translate('the_past_1_month'),
              DateTime(dateTimeNow.year, dateTimeNow.month - 1, dateTimeNow.day)),
          _buildItemDateSelected(AppLocalizations.of(context)!.translate('the_past_2_month'),
              DateTime(dateTimeNow.year, dateTimeNow.month - 2, dateTimeNow.day)),
        ],
      ),
    );
  }

  Widget _buildItemDateSelected(String label, DateTime dateTimeRequest) {
    return Flexible(
      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () {
          widget.onChangeTime(dateTimeRequest);
          setState(() {});
        },
        child: Container(
          margin: const EdgeInsets.only(left: 5.0),
          padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 12),
          decoration: BoxDecoration(
              color: _getColor(DateTime.parse(widget.fromDate), dateTimeRequest),
              borderRadius: const BorderRadius.all(Radius.circular(20))),
          child: Text(label,
              style: textStyleBodySmall.copyWith(
                  color: _getColorText(DateTime.parse(widget.fromDate), dateTimeRequest),
                  fontWeight: FontWeight.w600,
                  overflow: TextOverflow.ellipsis,
                  fontSize: 14)),
        ),
      ),
    );
  }

  Color _getColor(
    DateTime? startDate,
    DateTime dateTimeRequest,
  ) {
    if (DateTime(startDate!.year, startDate.month, startDate.day) ==
        DateTime(dateTimeRequest.year, dateTimeRequest.month, dateTimeRequest.day)) {
      return CommonColor.vge3DateSelectedColor;
    } else {
      return CommonColor.vge3DateUnSelectedColor;
    }
  }

  Color _getColorText(
    DateTime? startDate,
    DateTime dateTimeRequest,
  ) {
    if (DateTime(startDate!.year, startDate.month, startDate.day) ==
        DateTime(dateTimeRequest.year, dateTimeRequest.month, dateTimeRequest.day)) {
      return Colors.white;
    } else {
      return Colors.black;
    }
  }
}
