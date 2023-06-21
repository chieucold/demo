import 'package:core/common/color/core_color.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class LoadingMainWidget extends StatelessWidget {
  const LoadingMainWidget({Key? key}) : super(key: key);

  Widget _height(double height, {Widget? child}) => SizedBox(height: height, child: child);
  Widget _width(double width) => SizedBox(width: width);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        enabled: true,
        child: Column(
          children: [
            _height(
              72,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: 3,
                padding: CoreColor.paddingBodyDefault.copyWith(top: 16, bottom: 8),
                itemBuilder: (_, int i) => Column(
                  children: [
                    _item(100, 28),
                    _height(8),
                    _item(100, 5),
                  ],
                ),
                separatorBuilder: (_, __) => _width(10),
              ),
            ),
            Expanded(child: _buildList()),
          ],
        ),
      ),
    );
  }

  Widget _buildList() {
    return ListView.separated(
      itemCount: 10,
      padding: CoreColor.paddingBodyDefault.copyWith(top: 20, bottom: 8),
      itemBuilder: (BuildContext context, int index) => _buildContent(context),
      separatorBuilder: (_, int index) => _height(32),
    );
  }

  Widget _buildContent(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _item(160, 28),
        _height(12),
        _item(120, 36),
        _height(12),
        _item(220, 52, radius: 8),
        _height(12),
        _item(double.infinity, 150, radius: 8)
      ],
    );
  }

  Widget _item(double width, double height, {double? radius}) => Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(radius ?? 4),
        ),
      );
}
