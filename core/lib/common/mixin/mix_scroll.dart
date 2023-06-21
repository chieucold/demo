import 'package:flutter/material.dart';

mixin MixScroll<T extends StatefulWidget> on State<T> {
  final ScrollController _scrollController = ScrollController();

  ScrollController get scrollController => _scrollController;


  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

}
