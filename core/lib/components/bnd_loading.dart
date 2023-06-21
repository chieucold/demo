import 'package:core/common/color/core_color.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

Widget loadingDefaultWidget(double height, {double? width, Widget? child, double? radius, Color? color}) {
  return Container(
    height: height,
    width: width,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(radius ?? 10)),
      color: color ?? CoreColor.colorLoadingShimmer,
    ),
    child: child,
  );
}

Widget loadingDefaultCircleWidget(double size) {
  return Container(
    height: size,
    width: size,
    decoration: BoxDecoration(
      borderRadius: const BorderRadius.all(Radius.circular(90)),
      color: CoreColor.colorLoadingShimmer,
    ),
  );
}

Widget lineTextLoadingWidget({double? width, double? height}) {
  return Container(
    height: height ?? 6.0,
    width: width ?? 100.0,
    decoration: BoxDecoration(
      color: CoreColor.colorLoadingShimmer,
    ),
  );
}

class BnDLoading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Container(
            padding: const EdgeInsets.only(left: 16, right: 16),
            child: Shimmer.fromColors(
              baseColor: Colors.grey[300]!,
              highlightColor: Colors.grey[100]!,
              enabled: true,
              child: Column(
                children: <int>[0, 1, 2, 3].map((_) => _buildContent(context)).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContent(BuildContext context) {
    return _defaultLoading(context);
  }

  Widget _defaultLoading(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(bottom: 24),
        child: Column(children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width - 50,
                height: 8.0,
                color: Colors.white,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 2.0),
              ),
              Container(
                width: MediaQuery.of(context).size.width - 50,
                height: 8.0,
                color: Colors.white,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 2.0),
              ),
              Container(
                width: MediaQuery.of(context).size.width - 50,
                height: 8.0,
                color: Colors.white,
              ),
            ],
          ),
        ]));
  }
}
