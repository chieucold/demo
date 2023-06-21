import 'package:core/language/app_localizations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'dart:io';
import 'package:core/common/common.dart';

const String appName = 'VitanEdu';

void showSuccessMessage(String message, {Color? backgroundColor, Color? textColor, double? time}) {
  Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.SNACKBAR,
      timeInSecForIosWeb: 3,
      backgroundColor: backgroundColor ?? Colors.green,
      textColor: textColor ?? Colors.white,
      fontSize: 16.0);
}

void showMessage(String message, {Color? backgroundColor, Color? textColor, double? time}) {
  Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.SNACKBAR,
      timeInSecForIosWeb: 3,
      backgroundColor: backgroundColor ?? const Color(0xff161C2C),
      textColor: textColor ?? Colors.white,
      fontSize: 16.0);
}

void showErrorMessage(String message, {Color? backgroundColor, Color? textColor, double? time}) {
  Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.SNACKBAR,
      timeInSecForIosWeb: 3,
      backgroundColor: backgroundColor ?? const Color(0xffC11C3A),
      textColor: textColor ?? Colors.white,
      fontSize: 16.0);
}

Future<bool?> showAlertDialog(
  BuildContext context, {
  Function? onOk,
  Function? onCancel,
  String? cancelText,
  String? okText,
  String? alertTitle,
  String? content,
}) {
  // set up the buttons
  final Widget cancelButton = TextButton(
    child: Text(cancelText ?? AppLocalizations.of(context)!.translate("cancel")),
    onPressed: () {
      Navigator.of(context).pop();
    },
  );
  final Widget continueButton = TextButton(
    child: Text(okText ?? AppLocalizations.of(context)!.translate("continue")),
    onPressed: () {
      if (onOk != null) onOk();
      Navigator.of(context).pop();
    },
  );

  // set up the AlertDialog
  final AlertDialog alert = AlertDialog(
    title: Text(alertTitle ?? AppLocalizations.of(context)!.translate("alert_dialog_title")),
    content: Text(content ?? AppLocalizations.of(context)!.translate("confirm_delete")),
    actions: <Widget>[
      cancelButton,
      continueButton,
    ],
  );
  //
  // // show the dialog
  // showDialog<bool>(
  //   context: context,
  //   builder: (BuildContext context) {
  //     return alert;
  //   },
  // );
  return showModal(
      context: context,
      configuration: const FadeScaleTransitionConfiguration(transitionDuration: Duration(milliseconds: 500)),
      builder: (_) {
        if (Platform.isIOS) {
          return _alertConfirm(
            context,
            content,
            title: alertTitle,
            cancelText: cancelText,
            submitText: okText,
            onCancel: onCancel,
            onSubmit: onOk,
          );
        }
        return alert;
      });
}

Future<void> showConfirmDialog(
  BuildContext context,
  String content, {
  String? title,
  String? cancelText,
  String? submitText,
  Function? onCancel,
  Function? onSubmit,
}) {
  return showModal(
      context: context,
      configuration: const FadeScaleTransitionConfiguration(transitionDuration: Duration(milliseconds: 400)),
      builder: (_) {
        if (Platform.isIOS) {
          return _alertConfirm(
            context,
            content,
            title: title,
            cancelText: cancelText,
            submitText: submitText,
            onCancel: onCancel,
            onSubmit: onSubmit,
          );
        }
        return AlertDialog(
          title: Text(title ?? appName),
          elevation: 8,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          content: Text(content),
          actions: <Widget>[
            TextButton(
                child: Text(
                  cancelText ?? 'Huỷ',
                  style: const TextStyle(color: Colors.red),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                  if (onCancel != null) {
                    onCancel();
                  }
                }),
            TextButton(
              child: Text(submitText ?? 'Đồng ý'),
              onPressed: () {
                Navigator.of(context).pop();
                if (onSubmit != null) {
                  onSubmit();
                }
              },
            )
          ],
        );
      });
}

Future<T?> options<T>(
  BuildContext context, {
  String? title,
  List<T>? options,
  Widget? creatorItem(T item)?,
}) {
  if (Platform.isIOS) {
    return showCupertinoDialog(
      context: context,
      useRootNavigator: false,
      builder: (BuildContext context) {
        return _simpleOptions<T>(
          context,
          title: title,
          options: options,
          creatorItem: creatorItem,
        );
      },
    );
  }
  return showDialog<T>(
    context: context,
    builder: (BuildContext context) {
      return SimpleDialog(
        title: title != null ? Text(title) : null,
        elevation: 8,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        children: options
            ?.map(
              (item) => SimpleDialogOption(
                onPressed: () => Navigator.pop(context, item),
                child: creatorItem?.call(item),
              ),
            )
            .toList(),
      );
    },
  );
}

Future<T?> alert<T>(
  BuildContext context,
  dynamic content, {
  Function? onSubmit,
  String? title,
  String? submit,
  bool? barrierDismissible,
}) {
  if (Platform.isIOS) {
    return showCupertinoDialog(
      context: context, useRootNavigator: false,
      barrierDismissible: barrierDismissible ?? false, // user must tap button!
      builder: (BuildContext context) {
        return _alert(
          context,
          content,
          onSubmit: onSubmit,
          title: title,
          submit: submit,
        );
      },
    );
  }
  return showDialog<T>(
    context: context,
    barrierDismissible: barrierDismissible ?? false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        elevation: 8,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        title: title?.isNotEmpty == true ? Text(title!) : Text(appName),
        content: content is String && content.isNotEmpty == true ? Text(content) : content,
        actions: <Widget>[
          TextButton(
            child: Text(submit ?? 'OK'),
            onPressed: () {
              Navigator.of(context).pop();
              if (onSubmit != null) {
                onSubmit();
              }
            },
          )
        ],
      );
    },
  );
}

CupertinoAlertDialog _alertConfirm(
  BuildContext context,
  String? content, {
  String? title,
  String? cancelText,
  String? submitText,
  Function? onCancel,
  Function? onSubmit,
}) {
  return CupertinoAlertDialog(
    title: Text(title ?? appName),
    content: Text(content ?? ''),
    actions: <Widget>[
      CupertinoDialogAction(
          child: Text(cancelText ?? AppLocalizations.of(context)!.translate('cancel')),
          onPressed: () {
            Navigator.of(context).pop();
            if (onCancel != null) {
              onCancel();
            }
          }),
      CupertinoDialogAction(
        child: Text(submitText ?? AppLocalizations.of(context)!.translate('accept')),
        onPressed: () {
          Navigator.of(context).pop();
          if (onSubmit != null) {
            onSubmit();
          }
        },
      )
    ],
  );
}

CupertinoAlertDialog _simpleOptions<T>(
  BuildContext context, {
  String? title,
  List<T>? options,
  Widget? creatorItem(T item)?,
}) {
  return CupertinoAlertDialog(
    title: title != null ? Text(title) : null,
    actions: options
            ?.map(
              (item) => CupertinoDialogAction(
                onPressed: () => Navigator.pop(context, item),
                child: creatorItem?.call(item) ?? Container(),
              ),
            )
            .toList() ??
        [],
  );
}

CupertinoAlertDialog _alert(
  BuildContext context,
  dynamic content, {
  Function? onSubmit,
  String? title,
  String? submit,
}) {
  return CupertinoAlertDialog(
    title: Text(title ?? appName),
    content: content is String && content.isNotEmpty == true ? Text(content) : content,
    actions: <Widget>[
      CupertinoDialogAction(
        child: Text(submit ?? 'OK'),
        onPressed: () {
          Navigator.of(context).pop();
          if (onSubmit != null) {
            onSubmit();
          }
        },
      )
    ],
  );
}

Future<T?> confirmSheet<T>(
  BuildContext context, {
  String? title,
  String? content,
  String? cancelText,
  String? submitText,
  Color? submitColor,
  Color? cancelColor,
}) {
  return showCupertinoModalPopup(
      context: context,
      useRootNavigator: false,
      builder: (popupContext) {
        return CupertinoActionSheet(
          title: Text(
            title ?? appName,
            style: Theme.of(context).textTheme.subtitle2!.copyWith(fontWeight: FontWeight.w500),
          ),
          message: (content != null && content.length > 0)
              ? Container(
                  alignment: Alignment.center,
                  child: Text(content, style: Theme.of(context).textTheme.caption),
                )
              : null,
          actions: [
            CupertinoActionSheetAction(
              onPressed: () {
                Navigator.of(popupContext).pop(true);
              },
              child: Text(
                submitText ?? "Xác nhận",
                style: TextStyle(
                  color: submitColor ?? Color(0XFF007AFF),
                  fontWeight: FontWeight.w400,
                ),
              ),
            )
          ],
          cancelButton: CupertinoActionSheetAction(
            onPressed: () {
              Navigator.of(popupContext).pop();
            },
            child: Text(
              cancelText ?? "Hủy",
              style: TextStyle(
                color: cancelColor ?? Color(0XFF007AFF),
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        );
      });
}
