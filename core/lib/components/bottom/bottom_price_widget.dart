import 'package:core/common/color/core_color.dart';
import 'package:core/common/common.dart';
import 'package:core/common/text_style.dart';
import 'package:core/components/bnd_touch.dart';
import 'package:core/language/app_localizations.dart';
import 'package:flutter/material.dart';
import '../../assets/images/images.dart';

class BottomPriceWidget extends StatelessWidget {
  const BottomPriceWidget({
    Key? key,
    this.price = 0,
    this.oldPrice,
    this.buttonColor,
    required this.onTapButtonBuyNow,
    this.onTapButtonAddCard,
  }) : super(key: key);
  final double price;
  final double? oldPrice;
  final Color? buttonColor;
  final Function onTapButtonBuyNow;
  final Function? onTapButtonAddCard;

  Widget _height(double height) => SizedBox(height: height);

  Widget _width(double width) => SizedBox(width: width);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: CoreColor.paddingBodyDefault.copyWith(top: 12, bottom: 12),
      decoration: BoxDecoration(
        border: Border.symmetric(
          horizontal: BorderSide(color: CoreColor.dividerColor, width: 1),
        ),
      ),
      child: Column(
        children: [
          Row(
            children: <Widget>[
              _buildPrice(context),
              const Spacer(),
              _buildButton(context),
            ],
          ),
          const SizedBox(
            height: 50,
          )
        ],
      ),
    );
  }

  Widget _buildPrice(BuildContext context) {
    double percentDiscount = 0;
    if (oldPrice != null && oldPrice! > 0) percentDiscount = (oldPrice! - price) / oldPrice!;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        RichText(
          text: TextSpan(
            children: <TextSpan>[
              if (oldPrice != null)
                TextSpan(
                    text: AppLocalizations.of(context)!.displayCurrency(oldPrice!.toDouble()),
                    style: textStyleBodySmallest.copyWith(
                      color: CoreColor.textColor,
                      decoration: TextDecoration.lineThrough,
                    )),
              if (percentDiscount != null)
                TextSpan(
                    text: ' (-${AppLocalizations.of(context)!.displayNumber(double.parse((percentDiscount * 100).toStringAsFixed(0)))}%)',
                    style: textStyleBodySmallest.copyWith(
                      color: CoreColor.learnAppThemeColor,
                    )),
            ],
          ),
        ),
        _height(2),
        Text(
          AppLocalizations.of(context)!.displayCurrency(price.toDouble()),
          style: textStyleHeadline6.copyWith(
            fontWeight: FontWeight.w600,
            color: CoreColor.priceColor,
          ),
        )
      ],
    );
  }

  Widget _buildButton(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(90),
        color: Utils.getCurrentAppColor,
      ),
      child: Row(
        children: <Widget>[
          BndTouch(
            onPressed: onTapButtonAddCard != null ? () => onTapButtonAddCard!() : null,
            child: Container(
              width: 42,
              height: 42,
              margin: const EdgeInsets.all(4),
              decoration: const BoxDecoration(shape: BoxShape.circle, color: CoreColor.white),
              alignment: Alignment.center,
              child: Images.svgAssets(Images.mppIcShoppingCart, color: CoreColor.textColor, width: 20, height: 20),
            ),
          ),
          Container(
            // color: Colors.red,
            child: BndTouch(
              onPressed: () => onTapButtonBuyNow(),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  AppLocalizations.of(context)!.translate('buy_now').toUpperCase(),
                  style: textStyleBodyDefault.copyWith(
                      color: CoreColor.white, fontWeight: FontWeight.w600, fontFamily: fontGilroy),
                ),
              ),
            ),
          ),
          _width(16)
        ],
      ),
    );
  }
}
