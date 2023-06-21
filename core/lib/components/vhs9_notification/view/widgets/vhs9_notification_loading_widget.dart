import 'package:core/assets/images/images.dart';
import 'package:core/common/color/core_color.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class VHS9NotificationLoadingWidget extends StatelessWidget {
  const VHS9NotificationLoadingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double widthDevice = MediaQuery.of(context).size.width;
    final List<double> widthTitle = <double>[
      widthDevice * 3 / 4,
      widthDevice / 2,
      widthDevice * 2 / 3,
    ];
    return Container(
      padding: CoreColor.paddingBodyDefault.copyWith(top: 12),
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
                Stack(
                  children: <Widget>[
                    Container(
                      width: 10,
                      height: 10,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: CoreColor.filterHasDataColor,
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.all(6),
                      child: const CircleAvatar(radius: 28, backgroundColor: Colors.white),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Images.svgAssets(
                        Images.vhs9IcAdmin,
                        height: 18,
                        width: 18,
                      ),
                    )
                  ],
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
                          height: 8.0,
                          color: Colors.white,
                        ),
                      Row(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(bottom: 6),
                            width: 24,
                            height: 24,
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), color: Colors.white),
                          ),
                          Container(
                            margin: const EdgeInsets.only(bottom: 6, left: 6),
                            width: widthDevice * 1 / 5,
                            height: 8.0,
                            color: Colors.white,
                          ),
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          itemCount: 20,
        ),
      ),
    );
  }
}
