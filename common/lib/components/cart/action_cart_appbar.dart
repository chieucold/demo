import 'package:core/assets/images/images.dart';
import 'package:core/common/color/core_color.dart';
import 'package:core/common/text_style.dart';
import 'package:core/components/payment/payment_cart/bloc/payment_bloc.dart';
import 'package:core/components/payment/payment_cart/bloc/payment_state.dart';
import 'package:core/components/payment/payment_cart/views/payment_screen.dart';
import 'package:core/components/bnd_icon_svg_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class ActionCartAppbar extends StatelessWidget {
  final double? width;
  final Function(bool isComplete, bool isDetail)? onRefresh;

  ActionCartAppbar({Key? key, this.width, this.onRefresh}) : super(key: key);

  final PaymentBloc _bloc = GetIt.I<PaymentBloc>();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PaymentBloc, PaymentState>(
      bloc: _bloc,
      builder: (BuildContext context, PaymentState state) {
        final int countCart = state.listExamPackageCart.length;
        return SizedBox(
          width: width ?? 20,
          child: Stack(
            clipBehavior: Clip.none,
            children: <Widget>[
              BNDIconSvgButton(
                icon: Images.mppIcShoppingCart,
                onTap: () async {
                  final isReload = await goToPaymentCart(context);
                  if (onRefresh != null) {
                    onRefresh!(false, isReload);
                  }
                },
              ),
              if (countCart > 0)
                Positioned(
                  top: 6,
                  right: -8,
                  child: Container(
                    width: 14,
                    height: 14,
                    alignment: Alignment.center,
                    child: Text(
                      countCart.toString(),
                      style: textStyleBodySmallest.copyWith(fontSize: 8, color: CoreColor.white),
                      textAlign: TextAlign.center,
                    ),
                    decoration: const BoxDecoration(shape: BoxShape.circle, color: CoreColor.mppNotiCartColor),
                  ),
                )
            ],
          ),
        );
      },
    );
  }
}
