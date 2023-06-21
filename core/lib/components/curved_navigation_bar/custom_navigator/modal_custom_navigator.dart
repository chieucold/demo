import 'package:core/components/curved_navigation_bar/custom_navigator/bloc/hide_appear_navigator_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import 'bloc/hide_appear_navigator_state.dart';

class ModalCustomNavigator extends StatefulWidget {
  const ModalCustomNavigator({Key? key, required this.popupWidget}) : super(key: key);
  final Widget popupWidget;

  @override
  _ModalCustomNavigatorState createState() => _ModalCustomNavigatorState();
}

class _ModalCustomNavigatorState extends State<ModalCustomNavigator> with SingleTickerProviderStateMixin {
  bool _isExpanded = true;
  late AnimationController _expandController;
  late Animation<double> _animation;
  final HideAppearNavigatorBloc _hideAppearBloc = GetIt.I<HideAppearNavigatorBloc>();

  @override
  void initState() {
    super.initState();
    _expandController = AnimationController(vsync: this, duration: const Duration(milliseconds: 500));
    _animation =
        CurvedAnimation(parent: _expandController, curve: Curves.fastOutSlowIn, reverseCurve: Curves.fastOutSlowIn);
    _expandController.addListener(() {
      if (_expandController.isDismissed && !_isExpanded) {
        _hideAppearBloc.changeStatus(true);
      }
    });
    _expand();
  }

  Future<void> _expand() async {
    if (_isExpanded) {
      return _expandController.forward();
    }
    return _expandController.reverse();
  }

  @override
  void dispose() {
    _expandController.dispose();
    super.dispose();
  }

  void _onPress() {
    _isExpanded = !_isExpanded;
    setState(() {});
    _expand();
  }

  Future<void> _onClose() async {
    if (!_isExpanded) return;
    _onPress();
    await Future<void>.delayed(const Duration(milliseconds: 500));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HideAppearNavigatorBloc, HideAppearNavigatorState>(
      builder: (BuildContext context, HideAppearNavigatorState state) {
        if (_expandController.isDismissed && state is AppearNavigatorState) {
          _isExpanded = true;
          _expand();
        }
        if (state is HideNavigatorState) {
          _isExpanded = false;
          _expand();
          return const SizedBox();
        }
        return IgnorePointer(
          ignoring: !_isExpanded,
          child: GestureDetector(
            onTap: _onClose,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 500),
              color: !_isExpanded ? Colors.transparent : const Color(0xff161C2C).withOpacity(0.9),
              alignment: Alignment.bottomCenter,
              child: SizeTransition(
                sizeFactor: _animation,
                child: GestureDetector(
                  onTap: () {},
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Stack(
                        children: <Widget>[
                          widget.popupWidget,
                          Positioned(
                              right: 0, top: 10, child: IconButton(onPressed: _onClose, icon: const Icon(Icons.close))),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
