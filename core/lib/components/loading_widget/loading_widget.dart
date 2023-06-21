import 'package:core/common/color/core_color.dart';
import 'package:core/common/common.dart';
import 'package:core/common/dimension.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class LoadingWidget extends StatelessWidget {
  final LoadingEnum type;
  final int? itemCount;

  LoadingWidget(this.type, {this.itemCount});

  Widget _height(double height) => SizedBox(height: height);
  Widget _width(double width) => SizedBox(width: width);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      direction: ShimmerDirection.ltr,
      period: const Duration(milliseconds: 1000),
      baseColor: CoreColor.colorLoadingShimmer,
      highlightColor: CoreColor.colorHighlightLoadingShimmer,
      child: Container(
        child: _buildLoading(context, type),
      ),
    );
  }

  Widget _buildLoading(BuildContext context, LoadingEnum type) {
    switch (type) {
      case LoadingEnum.event:
        return _shimmerEventLoading(context);
      case LoadingEnum.sale:
        return _shimmerSaleLoading(context);
      case LoadingEnum.blockGrid:
        return _shimmerBlockGridLoading(context);
      case LoadingEnum.blockList:
        return _shimmerBlockListLoading(context);
      case LoadingEnum.exam:
        return _shimmerExamLoading(context);
      case LoadingEnum.list:
        return _shimmerListLoading(context);
      default:
        return _shimmerDefaultLoading(context);
    }
  }

  Widget _shimmerDefaultLoading(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(bottom: height(context, 20), left: 30, right: 30, top: 10),
        child: Column(children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width - 50,
                margin: EdgeInsets.only(bottom: height(context, 10)),
                height: height(context, 16),
                color: CoreColor.textWhiteColor,
              ),
              Container(
                width: MediaQuery.of(context).size.width - 50,
                height: height(context, 16),
                margin: EdgeInsets.only(bottom: height(context, 10)),
                color: CoreColor.textWhiteColor,
              ),
              Container(
                width: MediaQuery.of(context).size.width - 50,
                height: height(context, 16),
                margin: EdgeInsets.only(bottom: height(context, 10)),
                color: CoreColor.textWhiteColor,
              ),
            ],
          ),
        ]));
  }

  Widget _shimmerEventLoading(BuildContext context) {
    return Container(
      height: 250,
      margin: EdgeInsets.only(left: width(context, 25), right: width(context, 25), top: height(context, 10)),
      child: Column(
        children: <Widget>[
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              width: width(context, 100),
              color: CoreColor.textWhiteColor,
              height: height(context, 30),
            ),
          ),
          Column(
            children: <int>[0, 1]
                .map((_) => Container(
                      margin: EdgeInsets.only(top: height(context, 10)),
                      child: Column(
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Container(
                                height: height(context, 100),
                                width: width(context, 100),
                                decoration: BoxDecoration(
                                    color: CoreColor.textWhiteColor, borderRadius: BorderRadius.circular(12)),
                              ),
                              _width(height(context, 20)),
                              Expanded(
                                  child: Column(
                                children: <Widget>[
                                  Container(
                                    height: height(context, 30),
                                    color: CoreColor.textWhiteColor,
                                    margin: EdgeInsets.only(bottom: height(context, 10)),
                                  ),
                                  Row(
                                    children: <Widget>[
                                      Expanded(
                                        child: Container(
                                          color: CoreColor.textWhiteColor,
                                          height: height(context, 16),
                                          width: width(context, 50),
                                        ),
                                      ),
                                      _width(width(context, 40)),
                                      Container(
                                          child: Container(
                                        height: height(context, 16),
                                        width: width(context, 50),
                                        color: CoreColor.textWhiteColor,
                                      ))
                                    ],
                                  )
                                ],
                              ))
                            ],
                          )
                        ],
                      ),
                    ))
                .toList(),
          ),
        ],
      ),
    );
  }

  Widget _shimmerSaleLoading(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: width(context, 25), right: width(context, 25), top: height(context, 10)),
      height: MediaQuery.of(context).size.width + 2 * 25,
      child: Column(
        children: <Widget>[
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              width: width(context, 100),
              color: CoreColor.textWhiteColor,
              height: height(context, 30),
            ),
          ),
          Row(
            children: <Widget>[
              Column(
                children: <int>[0, 1]
                    .map((_) => Container(
                          margin: EdgeInsets.only(top: height(context, 10)),
                          child: Column(
                            children: <Widget>[
                              Container(
                                height: height(context, 130),
                                width: width(context, 150),
                                decoration: BoxDecoration(
                                    color: CoreColor.textWhiteColor, borderRadius: BorderRadius.circular(12)),
                              ),
                              _height(height(context, 10)),
                              Container(
                                height: height(context, 24),
                                width: width(context, 150),
                                color: CoreColor.textWhiteColor,
                              )
                            ],
                          ),
                        ))
                    .toList(),
              ),
              _width(width(context, 20)),
              Column(
                children: <int>[0, 1]
                    .map((_) => Container(
                          margin: EdgeInsets.only(top: height(context, 10)),
                          child: Column(
                            children: <Widget>[
                              Container(
                                height: height(context, 130),
                                width: width(context, 150),
                                decoration: BoxDecoration(
                                    color: CoreColor.textWhiteColor, borderRadius: BorderRadius.circular(12)),
                              ),
                              _height(height(context, 10)),
                              Container(
                                height: height(context, 24),
                                width: width(context, 150),
                                color: CoreColor.textWhiteColor,
                              )
                            ],
                          ),
                        ))
                    .toList(),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _shimmerBlockGridLoading(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: width(context, 30), right: width(context, 30), bottom: height(context, 10)),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Column(
                children: <int>[0, 1, 2, 3]
                    .map((_) => Container(
                          margin: EdgeInsets.only(top: height(context, 10)),
                          child: Row(
                            children: <Widget>[
                              Container(
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                    color: CoreColor.textWhiteColor, borderRadius: BorderRadius.circular(12)),
                              ),
                              _width(width(context, 10)),
                              Container(
                                height: height(context, 24),
                                width: width(context, 80),
                                color: CoreColor.textWhiteColor,
                              )
                            ],
                          ),
                        ))
                    .toList(),
              ),
              _width(width(context, 20)),
              Column(
                children: <int>[0, 1, 2, 3]
                    .map((_) => Container(
                          margin: EdgeInsets.only(top: height(context, 10)),
                          child: Row(
                            children: <Widget>[
                              Container(
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                    color: CoreColor.textWhiteColor, borderRadius: BorderRadius.circular(12)),
                              ),
                              _width(width(context, 10)),
                              Container(
                                height: height(context, 24),
                                width: width(context, 80),
                                color: CoreColor.textWhiteColor,
                              )
                            ],
                          ),
                        ))
                    .toList(),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _shimmerBlockListLoading(BuildContext context) {
    final double _widthDevice = MediaQuery.of(context).size.width;
    return ListView.separated(
        shrinkWrap: true,
        primary: false,
        padding: CoreColor.paddingBodyDefault,
        itemBuilder: (_, int i) {
          return Row(
            children: <Widget>[
              Container(
                height: 56,
                width: 56,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(16), color: Colors.white),
              ),
              _width(20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(height: 10, width: _widthDevice * 0.4, color: Colors.white),
                  _height(6),
                  Container(height: 6, width: _widthDevice * 0.2, color: Colors.white),
                  _height(6),
                  Container(height: 6, width: _widthDevice * 0.1, color: Colors.white),
                ],
              )
            ],
          );
        },
        separatorBuilder: (_, __) => _height(20),
        itemCount: itemCount ?? 5);
  }

  Widget _shimmerExamLoading(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: width(context, 30), right: width(context, 30), bottom: height(context, 10)),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Column(
                children: <int>[
                  0,
                  1,
                ]
                    .map((_) => Container(
                          margin: EdgeInsets.only(top: height(context, 10)),
                          child: Row(
                            children: <Widget>[
                              Container(
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                    color: CoreColor.textWhiteColor, borderRadius: BorderRadius.circular(12)),
                              ),
                              _width(width(context, 10)),
                              Container(
                                height: height(context, 24),
                                width: width(context, 80),
                                color: CoreColor.textWhiteColor,
                              )
                            ],
                          ),
                        ))
                    .toList(),
              ),
              _width(width(context, 20)),
              Column(
                children: <int>[
                  0,
                  1,
                ]
                    .map((_) => Container(
                          margin: EdgeInsets.only(top: height(context, 10)),
                          child: Row(
                            children: <Widget>[
                              Container(
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                    color: CoreColor.textWhiteColor, borderRadius: BorderRadius.circular(12)),
                              ),
                              _width(width(context, 10)),
                              Container(
                                height: height(context, 24),
                                width: width(context, 80),
                                color: CoreColor.textWhiteColor,
                              )
                            ],
                          ),
                        ))
                    .toList(),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _shimmerListLoading(BuildContext context) {
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
            _height(12),
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
