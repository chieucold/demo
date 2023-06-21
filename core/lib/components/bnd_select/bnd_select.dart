import 'package:core/common/text_style.dart';
import 'package:core/common/utils/app_utils.dart';
import 'package:core/components/bnd_select/popup_menu.dart';
import 'package:core/components/bnd_select/popup_safearea.dart';
import 'package:flutter/material.dart';
import 'package:collection/collection.dart';

class BNDSelect<T> extends StatefulWidget {
  const BNDSelect({
    Key? key,
    required this.items,
    this.value,
    this.propertyTitleName = "title",
    this.propertyIdName = "id",
    this.isReturnObject = true,
    this.isShowRemove = true,
    this.borderColor,
    this.borderRadius = 10,
    this.padding = const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
    this.textStyle,
    this.isFullWidthPopup = false,
    this.onItemChanged,
    this.chooseItem,
    this.buildItem,
    this.isShowRatio = true,
    this.textStyleSelected,
    this.maxLines = 1,
    this.sizeHeight,
    this.activeColor = const Color(0xff414B5B),
    this.isShadow = false,
  }) : super(key: key);

  final List<T> items;
  final bool isReturnObject;
  final Object? value;
  final Color? borderColor;
  final String propertyIdName;
  final String propertyTitleName;
  final double borderRadius;
  final EdgeInsets padding;
  final TextStyle? textStyle;
  final TextStyle? textStyleSelected;
  final Function? onItemChanged;
  final Color activeColor;
  final bool isShowRemove;
  final bool isFullWidthPopup;
  final Widget? chooseItem;
  final Widget? buildItem;
  final bool isShowRatio;
  final int maxLines;
  final double? sizeHeight;
  final bool isShadow;
  @override
  _BNDSelectState createState() => _BNDSelectState<T>();
}

class _BNDSelectState<T> extends State<BNDSelect<T>> {
  bool isShowSelect = false;
  T? value;

  List<T> get items => widget.items;
  String title = "";

  Color get borderColor => widget.borderColor ?? const Color(0xffD9DEE7);

  double get borderRadius => widget.borderRadius;

  EdgeInsets get padding => widget.padding;

  BorderSide get borderSide => BorderSide(color: borderColor, width: 1);

  Radius get radius => Radius.circular(borderRadius);

  String get propertyIdName => widget.propertyIdName;

  Color get colorBackground => const Color(0xff161C2C).withOpacity(0.9);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    value = getItem();
    changeTitle();
  }

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      ignoring: false,
      child: InkWell(
        onTap: () async {
          setFocus();
          await _openMenu();
          setFocus();
        },
        child: _buildChooseItem(isShowSelect),
      ),
    );
  }

  Widget _buildItems() {
    return Container(
      height: widget.sizeHeight,
      padding: const EdgeInsets.only(top: 8, bottom: 8),
      constraints: const BoxConstraints(maxHeight: 300),
      decoration: BoxDecoration(
          border: Border.all(color: borderColor, width: 1),
          color: Colors.white,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(borderRadius),
            bottomRight: Radius.circular(borderRadius),
          )),
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: items.length,
        itemBuilder: (BuildContext context, int index) {
          final T item = items[index];
          return Padding(
            padding: padding.copyWith(top: 8, bottom: 8),
            child: Row(
              children: <Widget>[
                if (widget.isShowRatio)
                  SizedBox(
                    height: 20,
                    width: 20,
                    child: Radio<T>(
                      activeColor: widget.activeColor,
                      value: item,
                      groupValue: value,
                      onChanged: (T? value) {
                        onChanged(value);
                      },
                    ),
                  ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      onChanged(item);
                    },
                    child: Text(Utils.getPropertyValueByName<String>(item, widget.propertyTitleName) ?? "",
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: value == item ? widget.textStyleSelected : widget.textStyle),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildChooseItem(bool isShowSelect) {
    return widget.chooseItem ??
        Container(
          padding: padding,
          decoration: BoxDecoration(
              borderRadius: isShowSelect
                  ? BorderRadius.only(topLeft: radius, topRight: radius)
                  : BorderRadius.circular(borderRadius),
              border: Border.all(color: borderColor, width: 1)),
          child: Row(
            children: <Widget>[
              Expanded(
                  child: Container(
                child: Text(
                  title,
                  style: widget.textStyle,
                  maxLines: widget.maxLines,
                  overflow: TextOverflow.ellipsis,
                ),
              )),
              if (widget.isShowRemove && value != null)
                GestureDetector(
                  onTap: () {
                    onChanged(null);
                  },
                  child: const Icon(
                    Icons.close,
                    size: 18,
                  ),
                ),
              const Icon(
                Icons.keyboard_arrow_down,
              ),
            ],
          ),
        );
  }

  void setFocus() {
    setState(() {
      isShowSelect = !isShowSelect;
    });
  }

  void changeTitle() {
    title = Utils.getPropertyValueByName<String>(value, widget.propertyTitleName) ?? "";
  }

  void onChanged(T? value) {
    Navigator.pop(context);
    setState(() {
      this.value = value;
      //isShowSelect = !isShowSelect;
      changeTitle();
    });
    if (widget.onItemChanged != null) {
      if (widget.isReturnObject)
        widget.onItemChanged!(value);
      else
        widget.onItemChanged!(Utils.getPropertyValueByName<Object>(value, propertyIdName));
    }
  }

  T? getItem() {
    Map<String, dynamic> temp;
    if (propertyIdName.isNotEmpty && widget.value != null)
      return items.firstWhereOrNull((T element) {
        if (element == null) return false;
        temp = Utils.convertObjectToMap(element);
        return temp[propertyIdName] == widget.value;
      });
  }

  Future<void> _openMenu() {
    final RenderBox popupButtonObject = context.findRenderObject() as RenderBox;
    final RenderBox overlay = Overlay.of(context)!.context.findRenderObject() as RenderBox;

    RelativeRect position = RelativeRect.fromSize(
      Rect.fromPoints(
        popupButtonObject.localToGlobal(popupButtonObject.size.bottomLeft(Offset.zero), ancestor: overlay),
        popupButtonObject.localToGlobal(popupButtonObject.size.bottomRight(Offset.zero), ancestor: overlay),
      ),
      Size(overlay.size.width, overlay.size.height),
    );
    // position = RelativeRect.fromLTRB(
    //     position.left, position.top - 10, position.right, position.bottom);
    return customShowMenu<T>(
        popupSafeArea: const PopupSafeArea(),
        barrierColor: Colors.transparent,
        color: Colors.transparent,
        shape: null,
        context: context,
        position: position,
        elevation: 0,
        isScrollable: !widget.isShadow,
        items: [
          if (!widget.isShadow)
            CustomPopupMenuItem(
              child: MediaQuery.removePadding(
                removeTop: true,
                context: context,
                child: Container(
                  padding: EdgeInsets.zero,
                  width: !widget.isFullWidthPopup ? popupButtonObject.size.width : MediaQuery.of(context).size.width,
                  child: widget.buildItem ?? _buildItems(),
                ),
              ),
            )
          else
            CustomPopupMenuItem(
              child: MediaQuery.removePadding(
                removeTop: true,
                context: context,
                child: GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Column(
                    children: <Widget>[
                      Stack(
                        children: <Widget>[
                          Positioned(
                            bottom: 0,
                            right: 0,
                            left: 0,
                            height: 12,
                            child: Container(
                              color: colorBackground,
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(top: position.top),
                            decoration: const BoxDecoration(
                                borderRadius: BorderRadius.vertical(
                              bottom: Radius.circular(12),
                            )),
                            width: !widget.isFullWidthPopup
                                ? popupButtonObject.size.width
                                : MediaQuery.of(context).size.width,
                            child: widget.buildItem ?? _buildItems(),
                          ),
                        ],
                      ),
                      _buildBackground()
                    ],
                  ),
                ),
              ),
            ),
        ]);
  }

  Widget _buildBackground() {
    return Container(
      height: 10000,
      color: colorBackground,
    );
  }
}
