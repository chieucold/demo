import 'dart:math';
import 'package:flutter/material.dart';
import 'const.dart';

class SeekBar extends StatefulWidget {
  final Duration duration;
  final Duration position;
  final Duration bufferedPosition;
  final ValueChanged<Duration>? onChanged;
  final ValueChanged<Duration>? onChangeEnd;

  SeekBar({
    required this.duration,
    required this.position,
    required this.bufferedPosition,
    this.onChanged,
    this.onChangeEnd,
  });

  @override
  _SeekBarState createState() => _SeekBarState();
}

class _SeekBarState extends State<SeekBar> {
  double? _dragValue;
  late SliderThemeData _sliderThemeData;

  Duration get _currentDuration => (widget.duration - widget.position);

  Duration get _remaining => widget.duration.inSeconds < 1 && _currentDuration.inMilliseconds != 0
      ? const Duration(seconds: 1)
      : _currentDuration;

  Duration get _totalDuration => widget.duration.inSeconds < 1 && widget.duration.inMilliseconds != 0
      ? const Duration(seconds: 1)
      : widget.duration;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _sliderThemeData = SliderTheme.of(context).copyWith(trackHeight: 4.0);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
          alignment: Alignment.center,
          width: MediaQuery.of(context).size.width * 0.26,
          child: Text(
              '${RegExp(r'((^0*[1-9]\d*:)?\d{2}:\d{2})\.\d+$').firstMatch("$_remaining")?.group(1)} / ${RegExp(r'((^0*[1-9]\d*:)?\d{2}:\d{2})\.\d+$').firstMatch("$_totalDuration")?.group(1)}',
              style: TextStyle(color: blackColor, fontSize: 14)),
        ),
        Expanded(child: _buildSlider()),
      ],
    );
  }

  Widget _buildSlider() {
    return Container(
      width: double.infinity,
      child: SliderTheme(
        data: _sliderThemeData.copyWith(
          inactiveTrackColor: greyColor,
          activeTrackColor: blackColor,
          thumbColor: blackColor,
          thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 6.0),
          trackShape: const RectangularSliderTrackShape(),
        ),
        child: Slider(
          min: 0.0,
          max: widget.duration.inMilliseconds.toDouble(),
          value:
              min(_dragValue ?? widget.position.inMilliseconds.toDouble(), widget.duration.inMilliseconds.toDouble()),
          onChanged: (double value) {
            print(value.round());

            setState(() {
              _dragValue = value;
            });
            if (widget.onChanged != null) {
              widget.onChanged!(Duration(milliseconds: value.round()));
            }
          },
          onChangeEnd: (double value) {
            if (widget.onChangeEnd != null) {
              widget.onChangeEnd!(Duration(milliseconds: value.round()));
            }
            _dragValue = null;
          },
        ),
      ),
    );
  }
}

class PositionData {
  final Duration position;
  final Duration bufferedPosition;
  final Duration duration;

  PositionData(this.position, this.bufferedPosition, this.duration);
}
