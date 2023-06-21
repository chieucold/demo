import 'package:core/common/color/core_color.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class VNListHotNewsLoadingWidget extends StatelessWidget {
  const VNListHotNewsLoadingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double widthDevice = MediaQuery.of(context).size.width;
    return Container(
      padding: CoreColor.paddingBodyDefault.copyWith(top: 12, bottom: 12),
      child: Shimmer.fromColors(
        baseColor: Colors.grey[200]!,
        highlightColor: Colors.grey[100]!,
        enabled: true,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              margin: const EdgeInsets.only(top: 8),
              width: widthDevice / 2,
              height: 15.0,
              color: Colors.white,
            ),
            const SizedBox(height: 12),
            Container(
              height: 200,
              child: ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 5,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int i) {
                  return Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.white),
                    margin: const EdgeInsets.only(right: 30),
                    width: widthDevice * 0.7,
                  );
                },
              ),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}

class VNListNewsLoadingWidget extends StatelessWidget {
  const VNListNewsLoadingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double widthDevice = MediaQuery.of(context).size.width;
    final List<double> widthTitle = <double>[
      widthDevice * 3 / 4,
      widthDevice / 2,
      widthDevice * 2 / 3,
      widthDevice * 2 / 7
    ];
    return Container(
      padding: CoreColor.paddingBodyDefault.copyWith(top: 12, bottom: 12),
      child: Shimmer.fromColors(
        baseColor: Colors.grey[200]!,
        highlightColor: Colors.grey[100]!,
        enabled: true,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              margin: const EdgeInsets.only(top: 8),
              width: widthDevice / 2,
              height: 15.0,
              color: Colors.white,
            ),
            const SizedBox(height: 12),
            Expanded(
              child: ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (_, __) => Padding(
                  padding: const EdgeInsets.only(bottom: 12.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        width: 74.0,
                        height: 74.0,
                        color: Colors.white,
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.0),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            for (int i = 0; i < widthTitle.length; i++)
                              Container(
                                margin: const EdgeInsets.only(bottom: 6),
                                width: widthTitle[i],
                                height: 10.0,
                                color: Colors.white,
                              ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                itemCount: 10,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class VNListRelativeNewsLoadingWidget extends StatelessWidget {
  final int itemCount;
  const VNListRelativeNewsLoadingWidget({Key? key, this.itemCount = 3}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double widthDevice = MediaQuery.of(context).size.width;
    final List<double> widthTitle = <double>[
      widthDevice * 3 / 4,
      widthDevice / 2,
      widthDevice * 2 / 3,
      widthDevice * 2 / 7
    ];
    return Container(
      padding: CoreColor.paddingBodyDefault.copyWith(top: 12, bottom: 12),
      child: Shimmer.fromColors(
        baseColor: Colors.grey[200]!,
        highlightColor: Colors.grey[100]!,
        enabled: true,
        child: ListView.builder(
          shrinkWrap: true,
          primary: false,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (_, __) => Padding(
            padding: const EdgeInsets.only(bottom: 12.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  width: 74.0,
                  height: 74.0,
                  color: Colors.white,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      for (int i = 0; i < widthTitle.length; i++)
                        Container(
                          margin: const EdgeInsets.only(bottom: 6),
                          width: widthTitle[i],
                          height: 10.0,
                          color: Colors.white,
                        ),
                    ],
                  ),
                )
              ],
            ),
          ),
          itemCount: itemCount,
        ),
      ),
    );
  }
}
