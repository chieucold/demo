import 'dart:async';

import 'package:common/common/color/common_color.dart';
import 'package:core/assets/images/images.dart';
import 'package:core/common/text_style.dart';
import 'package:core/components/core_component.dart';
import 'package:flutter/material.dart';

class SearchWidget extends StatefulWidget {
  final String? hintText;
  final Function onSubmit;
  final String? initValue;
  final bool isShowIcon;
  final bool isDoneSearch;

  const SearchWidget({Key? key, this.hintText, required this.onSubmit, this.initValue, this.isShowIcon = false, this.isDoneSearch = true})
      : super(key: key);

  @override
  _SearchWidgetState createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  String? keySearch;
  Timer? _debounce;

  @override
  void initState() {
    keySearch = widget.initValue;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Images.svgAssets(Images.icSearch2, color: CommonColor.textColor),
        const SizedBox(width: 12),
        Expanded(
            child: BNDTextField<String>(
          initialValue: keySearch,
          textInputAction: TextInputAction.search,
          onFieldSubmitted: (String _text) {
            if (widget.isDoneSearch){
              keySearch = _text;
              widget.onSubmit(_text);
            }
          },
          onChanged: (String? _text) {
            keySearch = _text;
            if (_debounce?.isActive ?? false) _debounce!.cancel();
            _debounce = Timer(const Duration(milliseconds: 500), () {
              widget.onSubmit(_text);
            });
          },
          style: TextStyle(color: CommonColor.textColor),
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: widget.hintText,
            hintStyle: textStyleBodyDefault.copyWith(
              color: CommonColor.vce5SearchTextColor,
              fontWeight: FontWeight.w400,
            ),
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            errorBorder: InputBorder.none,
            disabledBorder: InputBorder.none,
          ),
        )),
      ],
    );
  }
}
