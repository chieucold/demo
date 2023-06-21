import 'dart:math';

import 'package:common/common/color/common_color.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class VGE3LoadingChartWidget extends StatelessWidget {
  VGE3LoadingChartWidget({Key? key}) : super(key: key);

  final int countColumn = 8;
  final Random rng = Random();
  final List<double> _heightChart = <double>[];

  @override
  Widget build(BuildContext context) {
    _getValueHeightChart();
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            padding: CommonColor.paddingBodyDefault.copyWith(top: 16.sp, bottom: 16.sp),
            height: 232.sp,
            child: Shimmer.fromColors(
              baseColor: Colors.grey[200]!,
              highlightColor: Colors.grey[100]!,
              enabled: true,
              child: Column(
                children: <Widget>[
                  Expanded(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          SizedBox(width: 10.sp),
                          for (int i = 0; i < _heightChart.length; i++)
                            Container(
                              margin: EdgeInsets.only(left: 20.sp),
                              width: 15.sp,
                              height: _heightChart[i],
                              color: CommonColor.textColor,
                            ),
                          SizedBox(height: 190.sp, width: 20.sp)
                        ],
                      ),
                    ),
                  ),
                  Container(height: 2, color: CommonColor.black)
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _getValueHeightChart() {
    final double min = 40.sp;
    final double max = 190.sp;
    for (int i = 0; i < countColumn; i++) {
      final int value = min.toInt() + rng.nextInt(max.toInt() - min.toInt());
      _heightChart.add(value.toDouble());
    }
  }
}
