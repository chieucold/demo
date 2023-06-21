import 'package:core/common/text_style.dart';
import 'package:core/components/core_component.dart';
import 'package:flutter/material.dart';

class BndBottomSheetCustomWidget extends StatelessWidget {
  final String? title;
  final Widget page;

  const BndBottomSheetCustomWidget({Key? key, this.title, required this.page}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
            child: BndGestureDetector(
                onTap: () => Navigator.pop(context),
                child: const SizedBox(
                  height: double.infinity,
                  width: double.infinity,
                ))),
        Container(
            margin: const EdgeInsets.symmetric(horizontal: 24),
            decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.white.withOpacity(0.8),
                    spreadRadius: 10,
                    blurRadius: 5.0,
                    offset: const Offset(0.0, 3.0),
                  ),
                ],
                borderRadius: const BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)))),
        Container(
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20))),
          child: Column(
            children: [
              const SizedBox(height: 12),
              Container(
                width: 26,
                height: 5,
                decoration: const BoxDecoration(
                    color: Color.fromRGBO(178, 178, 178, 0.5), borderRadius: BorderRadius.all(Radius.circular(3))),
              ),
              if (title != null && title!.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.only(top: 23, bottom: 32),
                  child: Text(title ?? '',
                      style: textStyleHeadline6.copyWith(fontWeight: FontWeight.w600, fontFamily: fontGilroy)),
                ),
              page,
            ],
          ),
        )
      ],
    );
  }
}
