import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class WidgetLoadingShimmer extends StatelessWidget {
  const WidgetLoadingShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Shimmer.fromColors(
      baseColor: Colors.grey[200]!,
      highlightColor: Colors.grey[100]!,
      enabled: true,
      child: Column(
        children: <Widget>[
          const SizedBox(height: 20),
          Container(
            color: Colors.grey[200],
            width: 80,
            height: 30,
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            color: Colors.grey[200],
            width: 250,
            height: 50,
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            child: Column(
              children: <int>[
                0,
                1,
                2,
                3,
              ].map((_) => _buildContent(context)).toList(),
            ),
          ),
        ],
      ),
    )));
  }

  Widget _buildContent(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(15)), color: Colors.grey),
      margin: const  EdgeInsets.only(
        left: 30,
        right: 30,
        bottom: 16,
      ),
      width: 315,
      height: 65,
    );
  }
}
