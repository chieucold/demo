import 'package:carousel_slider/carousel_slider.dart';
import 'package:core/common/app_settings/app_settings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class CarouselSliderWidget extends StatefulWidget {
  final List<Widget> listChildCarousel;
  final double? viewportFraction;
  final double? aspectRatio;
  final double? height;
  final bool isAutoPlay;
  final double slideControllerSize;
  final double slideControllerSpace;
  final Color slideControllerColor;
  final Color slideControllerColorActive;
  final double slideControllerMargin;
  final bool hasDot;
  final Function(int index)? onPageChanged;

  CarouselSliderWidget({
    Key? key,
    required this.listChildCarousel,
    this.viewportFraction = 1,
    this.aspectRatio = 1,
    this.height = 0,
    this.isAutoPlay = true,
    this.slideControllerSize = 10,
    this.slideControllerSpace = 2,
    this.slideControllerColor = const Color(0xffE2E2E2),
    this.slideControllerColorActive = const Color(0xff414B5B),
    this.slideControllerMargin = 0,
    this.hasDot = false,
    this.onPageChanged,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _CarouselWithIndicatorStateWidget();
  }
}

class _CarouselWithIndicatorStateWidget extends State<CarouselSliderWidget> {
  List<Widget> _listChildCarousel = <Widget>[];
  double _viewportFraction = 1;
  int _current = 0;

  double get slideControllerSize => widget.slideControllerSize;

  int get _durationPlay => GetIt.I<AppSettings>().getAppSettings.configs.durationAdvertisement;

  final PageStorageKey<String> _pageStorageKey = const PageStorageKey<String>('keyStorage');

  @override
  Widget build(BuildContext context) {
    _viewportFraction = widget.viewportFraction!;
    _listChildCarousel = widget.listChildCarousel;

    return Column(
      children: [
        CarouselSlider(
          items: _listChildCarousel,
          options: CarouselOptions(
            pageViewKey: _pageStorageKey,
            disableCenter: true,
            height: widget.height,
            autoPlay: widget.isAutoPlay,
            viewportFraction: _viewportFraction,
            autoPlayInterval: Duration(seconds: _durationPlay),
            //aspectRatio: widget.aspectRatio ?? 0,
            onPageChanged: (int index, CarouselPageChangedReason reason) {
              if (widget.onPageChanged != null) {
                widget.onPageChanged!(index);
              }
              setState(() {
                _current = index;
              });
            },
          ),
        ),
        SizedBox(
          height: widget.hasDot ? widget.slideControllerMargin : 0,
        ),
        widget.hasDot
            ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: _listChildCarousel.map((Widget url) {
                  final int index = _listChildCarousel.indexOf(url);
                  return Container(
                    width: slideControllerSize,
                    height: slideControllerSize,
                    margin: EdgeInsets.symmetric(horizontal: widget.slideControllerSpace),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: _current != index ? widget.slideControllerColor : widget.slideControllerColorActive),
                  );
                }).toList(),
              )
            : const SizedBox(),
      ],
    );
  }
}
