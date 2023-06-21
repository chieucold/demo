import 'package:core/common/common.dart';
import 'package:core/components/bottom_sheet/bnd_bottom_sheet_custom_widget.dart';
import 'package:core/components/core_component.dart';
import 'package:core/usecases/app/app_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:share_plus/share_plus.dart';

Future<void> onShare(
  BuildContext context,
  int objectType,
  int objectId,
) async {
  final AppUseCases _appUseCase = GetIt.I<AppUseCases>();
  showLoading();
  await _appUseCase.appGetLink(objectType, objectId).then((Either<String, String> data) {
    data.fold((String failure) {
      showErrorMessage(failure);
    }, (String? url) async {
      if (url != null) {
        final RenderBox box = context.findRenderObject() as RenderBox;
        final String subject = "No";
        await Share.share(url, subject: subject, sharePositionOrigin: box.localToGlobal(Offset.zero) & box.size);
      }
    });
  });
  hideLoading();
}

Future<T?> showBottomSheetCustom<T extends Object>(BuildContext context,
    {String title = '',
    required Widget page,
    String textButton = '',
    TextStyle? textStyleButton,
    Color? backgroundButton}) {
  return showMaterialModalBottomSheet<T?>(
    backgroundColor: Colors.transparent,
    isDismissible: true,
    enableDrag: true,
    context: context,
    builder: (BuildContext context) => BndBottomSheetCustomWidget(title: title, page: page),
  );
}

bool isCurrentScreen(BuildContext context, String screenName) => ModalRoute.of(context)!.settings.name == screenName;
