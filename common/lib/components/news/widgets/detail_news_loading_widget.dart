import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class NewsDetailLoading extends StatelessWidget {
  const NewsDetailLoading({Key? key}) : super(key: key);

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
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      child: Shimmer.fromColors(
        baseColor: Colors.grey[200]!,
        highlightColor: Colors.grey[100]!,
        enabled: true,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            for (int i = 0; i < widthTitle.length; i++)
              Container(
                margin: const EdgeInsets.only(top: 8),
                width: widthTitle[i],
                height: 15.0,
                color: Colors.white,
              ),
            const SizedBox(height: 20),
            for (int i = 0; i < 25; i++)
              Container(
                margin: const EdgeInsets.only(top: 4),
                width: widthDevice,
                height: 8.0,
                color: Colors.white,
              ),
            const SizedBox(height: 24),
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              primary: false,
              itemBuilder: (_, __) => Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      width: 64.0,
                      height: 64.0,
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
                              margin: const EdgeInsets.only(bottom: 4),
                              width: widthTitle[i],
                              height: 8.0,
                              color: Colors.white,
                            ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              itemCount: 6,
            ),
          ],
        ),
      ),
    );
  }
}
