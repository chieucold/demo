import 'package:core/common/color/core_color.dart';
import 'package:core/common/text_style.dart';
import 'package:flutter/widgets.dart';

class NewsItemListWidget extends StatelessWidget {
  NewsItemListWidget({
    Key? key,
    required this.image,
    required this.title,
    this.date = "",
    this.padding,
    this.titleStyle,
    this.dateStyle,
  }) : super(key: key);
  final Widget? image;
  final String? title;
  final TextStyle? titleStyle;
  final TextStyle? dateStyle;
  final String? date;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: padding ?? CoreColor.paddingBodyDefault,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          image ?? const SizedBox(),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  title ?? '',
                  style: titleStyle ?? textStyleBodySmallBold,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                if (date != "")
                  Container(
                    margin: const EdgeInsets.only(top: 6),
                    child: Text(
                      date ?? '',
                      style: textStyleBodySmall.copyWith(color: CoreColor.vnDateNewsColor.withOpacity(0.5)),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
