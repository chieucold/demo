import 'package:core/common/app_settings/app_settings.dart';
import 'package:core/common/bloc/base_state.dart';
import 'package:core/common/color/core_color.dart';
import 'package:core/common/dimension.dart' as dimension;
import 'package:core/common/enums/advertisement_enum.dart';
import 'package:core/components/advertisement_slider_widget/bloc/advertisement_slider_bloc.dart';
import 'package:core/components/core_component.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:shimmer/shimmer.dart';
import 'bloc/advertisement_slider_child_widget.dart';

class AdvertisementSliderWidget extends StatefulWidget {
  final bool? countAdvertisement;
  final double height;
  final AdvertisementPositionEnum position;
  final int numberItem;
  final double viewport;
  final double slideControllerSize;
  final Color? slideControllerColorActive;
  final double slideControllerMargin;

  AdvertisementSliderWidget(
      {Key? key,
      this.countAdvertisement = true,
      this.height = 150,
      this.position = AdvertisementPositionEnum.Empty,
      this.numberItem = 2,
      this.slideControllerSize = 0,
      this.viewport = 0.8,
      this.slideControllerColorActive,
      this.slideControllerMargin = 0})
      : super(key: key);

  @override
  State<AdvertisementSliderWidget> createState() => _AdvertisementSliderWidgetState();
}

class _AdvertisementSliderWidgetState extends State<AdvertisementSliderWidget> with TickerProviderStateMixin {
  final AdvertisementSliderBloc _bannerBloc = GetIt.I<AdvertisementSliderBloc>();
  int index = 0;

  @override
  Widget build(BuildContext context) {
    final double _height = dimension.height(context, widget.height);
    return _buildAdvertisementSliderWidget(context, _height);
  }

  BlocProvider<AdvertisementSliderBloc> _buildAdvertisementSliderWidget(BuildContext context, double _height) {
    return BlocProvider<AdvertisementSliderBloc>(
        create: (BuildContext context) =>
            _bannerBloc..getListBanner(numberItem: widget.numberItem, position: widget.position),
        child: BlocBuilder<AdvertisementSliderBloc, BaseStateBloc<String>>(
          builder: (BuildContext context, BaseStateBloc<String> state) {
            if (state is InitState) {
              return _buildLoading(context, _height);
            } else if (state is LoadingState) {
              return _buildLoading(context, _height);
            } else if (state is LoadedState) {
              final String _url = state.model;
              // return const SizedBox();
              return _buildLoaded(_url);
            }
            if (state is ErrorState) {
              return const SizedBox();
            } else {
              return const SizedBox();
            }
          },
        ));
  }

  Widget _buildLoaded(String url) {
    return CarouselSliderChildWidget(height: _bannerBloc.sizeHeight, url: url);
  }

  Widget _buildLoading(BuildContext context, double _height) {
    return Shimmer.fromColors(
      direction: ShimmerDirection.ltr,
      period: const Duration(milliseconds: 1000),
      baseColor: CoreColor.colorLoadingShimmer,
      highlightColor: CoreColor.colorHighlightLoadingShimmer,
      child: Column(
        children: <Widget>[
          Padding(
            child: loadingDefaultWidget(_height),
            padding: const EdgeInsets.symmetric(horizontal: 20),
          ),
          const SizedBox(
            height: 10,
          ),
          widget.numberItem > 1
              ? Container(
                  height: dimension.height(context, 16),
                  width: dimension.width(context, 50),
                  color: Colors.white,
                  margin: EdgeInsets.only(bottom: dimension.height(context, 10)),
                )
              : const SizedBox()
        ],
      ),
    );
  }
}
