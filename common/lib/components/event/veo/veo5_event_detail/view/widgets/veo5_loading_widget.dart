import 'package:core/common/color/core_color.dart';
import 'package:core/components/bnd_loading.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class VEO5LoadingWidget extends StatelessWidget {
  const VEO5LoadingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      direction: ShimmerDirection.ltr,
      period: const Duration(milliseconds: 500),
      baseColor: CoreColor.colorLoadingShimmer,
      highlightColor: CoreColor.colorHighlightLoadingShimmer,
      child: Column(
        children: <Widget>[
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  loadingDefaultWidget(200),
                  Container(
                    padding: const EdgeInsets.only(left: 24, top: 20, right: 24),
                    child: Column(
                      children: <Widget>[
                        lineTextLoadingWidget(width: double.infinity, height: 36),
                        const SizedBox(
                          height: 14,
                        ),
                        _buildInfoWidget(),
                        const SizedBox(height: 24,),
                        _buildInfoWidget(),
                        const SizedBox(height: 24,),
                        _buildDescription(),
                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          _buildBottomButton()
        ],
      ),
    );
  }
  
  Widget _buildInfoWidget() {
    return Row(
      children: <Widget>[
        loadingDefaultWidget(48, width: 48, radius: 12),
        const SizedBox(width: 14,),
        Expanded(
          child: Column(
            children: <Widget>[
              lineTextLoadingWidget(width: double.infinity, height: 16),
              const SizedBox(height: 4,),
              lineTextLoadingWidget(width: double.infinity - 70, height: 12),
            ],
          ),
        )
      ],
    );
  }

  Widget _buildDescription(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        lineTextLoadingWidget(width: 80, height: 18),
        const SizedBox(
          height: 8,
        ),
        lineTextLoadingWidget(width: double.infinity, height: 16),
        const SizedBox(height: 4,),
        lineTextLoadingWidget(width: double.infinity, height: 16),
        const SizedBox(height: 4,),
        lineTextLoadingWidget(width: double.infinity, height: 16),
        const SizedBox(height: 4,),
        lineTextLoadingWidget(width: 200, height: 16),
      ],
    );
  }
  
  Widget _buildBottomButton() {
    return Container(
      alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 30, bottom: 10, top: 10),
        decoration: const BoxDecoration(
          border: Border(top: BorderSide(
            color: Colors.grey
          ))
        ),
        child: loadingDefaultWidget(40, width: 130, radius: 90));
  }
}
