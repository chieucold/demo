import 'package:core/common/color/core_color.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'dart:math';

class ShimmerListWidget extends StatelessWidget {
  final int length;
  final double height;

  const ShimmerListWidget({Key? key, this.length = 4, this.height = 100.0}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Shimmer.fromColors(
      baseColor: Colors.grey[200]!,
      highlightColor: Colors.grey[100]!,
      enabled: true,
      child: ListView.separated(
        itemCount: length,
        itemBuilder: (BuildContext context, int index) => _buildContent(context),
        separatorBuilder: (_, int index) => Divider(
          height: 6.0,
          thickness: 6.0,
          color: CoreColor.dividerColor,
        ),
      ),
    ));
  }

  Widget _buildContent(BuildContext context) {
    return Container(
      // decoration:
      //     BoxDecoration(color: CoreColor.dividerColor, borderRadius: const BorderRadius.all(Radius.circular(12.0))),
      margin: CoreColor.paddingBodyDefault.copyWith(top: 8, bottom: 8),
      // height: height,
      child: Row(
        children: [
          Container(
            height: height,
            width: height,
            decoration: const BoxDecoration(shape: BoxShape.circle, color: CoreColor.white),
          ),
          const SizedBox(width: 20),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                  color: CoreColor.dividerColor, borderRadius: const BorderRadius.all(Radius.circular(12.0))),
              margin: const EdgeInsets.only(top: 8, bottom: 8),
              height: height,
            ),
          ),
        ],
      ),
    );
  }
}
