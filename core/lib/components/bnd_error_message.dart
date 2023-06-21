import 'package:flutter/material.dart';

Widget BNDErrorMessage({String message = "", TextStyle? style}) {
  return Container(
    child: Text(
      message,
      style: style,
    ),
  );
}
