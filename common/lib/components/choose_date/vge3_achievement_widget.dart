// ignore_for_file: use_key_in_widget_constructors

import 'package:common/common/color/common_color.dart';
import 'package:common/components/choose_date/vce10_date_selected_widget.dart';
import 'package:core/language/app_localizations.dart';
import 'package:core/common/text_style.dart';
import 'package:flutter/material.dart';

import 'vge3_day_selected_widget.dart';

class VGE3AchievementWidget extends StatelessWidget {
  final String fromDate;
  final String toDate;
  final Function(DateTime, DateTime)? onChange;
  final Function(DateTime timeRequest) onChangeTime;
  final bool isShowTitle;
  final bool isShowSelectDate;

  const VGE3AchievementWidget({
    required this.fromDate,
    required this.toDate,
    this.onChange,
    required this.onChangeTime,
    this.isShowTitle = true,
    this.isShowSelectDate = true,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        isShowTitle
            ? Padding(
                padding: CommonColor.paddingBodyDefault.copyWith(top: 8, bottom: 8),
                child: Text(
                  AppLocalizations.of(context)!.translate('academic_achievement'),
                  style: textStyleHeadline6,
                ),
              )
            : const SizedBox(height: 16),
        if (isShowSelectDate)
        VGE3DaySelectedWidget(
          onChangeTime: (DateTime timeRequest) => onChangeTime(timeRequest),
          fromDate: fromDate,
          toDate: toDate,
        ),
        VCE10DateSelectedWidget(
          fromDate: DateTime.parse(fromDate),
          toDate: DateTime.parse(toDate),
          getDate: (DateTime fromDate, DateTime toDate, bool validate) {
            if (validate && onChange != null) {
              onChange!(fromDate, toDate);
            }
          },
        )
      ],
    );
  }
}
