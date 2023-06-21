library passcode_screen;

import 'dart:async';

import 'package:core/common/bnd_cupertino_will_pop_scope/cupertino_will_pop_scope.dart';
import 'package:core/common/color/core_color.dart';
import 'package:core/common/constants/user_settings.dart';
import 'package:core/common/text_style.dart';
import 'package:core/components/bnd_message.dart';
import 'package:core/language/app_localizations.dart';
import 'package:core/passcode/circle.dart';
import 'package:core/passcode/keyboard.dart';
import 'package:core/passcode/shake_curve.dart';
import 'package:core/shared_preferences/local_storage_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../common/utils/app_utils.dart';

typedef PasswordEnteredCallback = void Function(String text);
typedef IsValidCallback = void Function();
typedef CancelCallback = void Function();
typedef ResetCallback = void Function();

class PassCodeScreen extends StatefulWidget {
  final int passwordDigits;
  final PasswordEnteredCallback passwordEnteredCallback;

  // Cancel button and delete button will be switched based on the screen state
  final Widget cancelButton;
  final Widget deleteButton;
  final Stream<bool> shouldTriggerVerification;
  final CircleUIConfig circleUIConfig;
  final KeyboardUIConfig keyboardUIConfig;

  //isValidCallback will be invoked after passcode screen will pop.
  final IsValidCallback? isValidCallback;
  final bool isCancel;
  final bool isReset;

  final Color? backgroundColor;
  final Widget? bottomWidget;
  final List<String>? digits;

  PassCodeScreen({
    Key? key,
    this.passwordDigits = 6,
    required this.passwordEnteredCallback,
    required this.cancelButton,
    required this.deleteButton,
    required this.shouldTriggerVerification,
    this.isValidCallback,
    required this.isReset,
    CircleUIConfig? circleUIConfig,
    KeyboardUIConfig? keyboardUIConfig,
    this.bottomWidget,
    this.backgroundColor,
    this.isCancel = false,
    this.digits,
  })  : circleUIConfig = circleUIConfig ?? const CircleUIConfig(),
        keyboardUIConfig = keyboardUIConfig ?? const KeyboardUIConfig(),
        super(key: key);

  @override
  State<StatefulWidget> createState() => _PassCodeScreenState();
}

class _PassCodeScreenState extends State<PassCodeScreen> with SingleTickerProviderStateMixin {
  late StreamSubscription<bool> streamSubscription;
  String enteredPasscode = '';
  String firstPassCode = '';
  String rePassCode = '';

  final int _amountInvalidPassCode = 5;
  final int _timerLockDefault = 180;
  final int _timerLockAccount = LocalStoreManager.getInt(UserSettings.keySaveLockAccountTime);
  late int countInvalidPass;
  late int _start;

  bool isFirstPassCode = true;

  bool get _isCancel => widget.isCancel;
  late AnimationController controller;
  late Animation<double> animation;
  late Timer _timer;

  @override
  initState() {
    super.initState();

    /// get timer lock account old
    _start = _timerLockAccount > 0 ? _timerLockAccount : _timerLockDefault;

    countInvalidPass = _timerLockAccount > 0 ? _amountInvalidPassCode : 0;

    /// check nếu vẫn còn khoá tài khoản khi nhập sai thì tính tiếp thời gian
    if (countInvalidPass >= _amountInvalidPassCode) {
      print('ISLOCK ${countInvalidPass > _amountInvalidPassCode}');
      _startScheduleLockAccount();
    }

    streamSubscription = widget.shouldTriggerVerification.listen((isValid) => _showValidation(isValid));
    controller = AnimationController(duration: const Duration(milliseconds: 500), vsync: this);
    final Animation curve = CurvedAnimation(parent: controller, curve: ShakeCurve());
    animation = Tween(begin: 0.0, end: 10.0).animate(curve as Animation<double>)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          setState(() {
            enteredPasscode = '';
            controller.value = 0;
          });
        }
      })
      ..addListener(() {
        setState(() {
          // the animation object’s value is the changed state
        });
      });
  }

  @override
  Widget build(BuildContext context) {
    return ConditionalWillPopScope(
      onWillPop: () async {
        if (_isCancel) {
          Navigator.pop(context);
        }
        return Future<bool>.value(_isCancel);
      },
      shouldAddCallback: _isCancel,
      child: Scaffold(
        backgroundColor: widget.backgroundColor ?? Colors.black.withOpacity(0.8),
        body: SafeArea(
          child: AbsorbPointer(
            absorbing: countInvalidPass >= _amountInvalidPassCode,
            child: OrientationBuilder(
              builder: (BuildContext context, Orientation orientation) {
                return orientation == Orientation.portrait
                    ? _buildPortraitPassCodeScreen()
                    : _buildLandscapePassCodeScreen();
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPortraitPassCodeScreen() => Stack(
        children: <Widget>[
          Positioned(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildTitle(),
                  Container(
                    margin: const EdgeInsets.only(top: 20),
                    height: 40,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: _buildCircles(),
                    ),
                  ),
                  _buildKeyboard(),
                  widget.bottomWidget ?? Container()
                ],
              ),
            ),
          ),
          Positioned(
            child: Align(
              alignment: Alignment.bottomRight,
              child: _buildDeleteButton(),
            ),
          ),
          Visibility(
              visible: countInvalidPass == 5,
              child: Positioned.fill(
                child: Container(
                  padding: const EdgeInsets.only(bottom: 24),
                  alignment: Alignment.bottomCenter,
                  width: double.infinity,
                  height: double.infinity,
                  color: Colors.transparent,
                  child: Text(
                    AppLocalizations.of(context)!.translate('temporarily_lock_application') +
                        ' ' +
                        '${Duration(seconds: _start).inMinutes}:' +
                        '${Duration(seconds: _start).inSeconds.remainder(60)}'.padLeft(2, '0'),
                    style: textStyleBodyDefault.copyWith(color: kTextWhiteColor),
                  ),
                ),
              ))
        ],
      );

  Widget _buildLandscapePassCodeScreen() => Stack(
        children: <Widget>[
          Positioned(
            child: Center(
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    child: Stack(
                      children: <Widget>[
                        Positioned(
                          child: Align(
                            alignment: Alignment.center,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                _buildTitle(),
                                Container(
                                  margin: const EdgeInsets.only(top: 20),
                                  height: 40,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: _buildCircles(),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        widget.bottomWidget != null
                            ? Positioned(
                                child: Align(alignment: Alignment.topCenter, child: widget.bottomWidget),
                              )
                            : Container()
                      ],
                    ),
                  ),
                  _buildKeyboard(),
                ],
              ),
            ),
          ),
          Positioned(
            child: Align(
              alignment: Alignment.bottomRight,
              child: _buildDeleteButton(),
            ),
          )
        ],
      );

  Widget _buildKeyboard() => Container(
        child: Keyboard(
          onKeyboardTap: _onKeyboardButtonPressed,
          keyboardUIConfig: widget.keyboardUIConfig,
          digits: widget.digits,
        ),
      );

  List<Widget> _buildCircles() {
    var list = <Widget>[];
    var config = widget.circleUIConfig;
    var extraSize = animation.value;
    for (int i = 0; i < widget.passwordDigits; i++) {
      list.add(
        Container(
          margin: const EdgeInsets.all(8),
          child: Circle(
            filled: i < enteredPasscode.length,
            circleUIConfig: config,
            extraSize: extraSize,
          ),
        ),
      );
    }
    return list;
  }

  void _onDeleteCancelButtonPressed() {
    if (enteredPasscode.length > 0) {
      setState(() {
        enteredPasscode = enteredPasscode.substring(0, enteredPasscode.length - 1);
      });
    } else {
      if (widget.isCancel) {
        Navigator.pop(context);
      }
    }
  }

  void _onKeyboardButtonPressed(String text) {
    if (text == Keyboard.deleteButton) {
      _onDeleteCancelButtonPressed();
      return;
    }
    setState(() {
      if (enteredPasscode.length < widget.passwordDigits && isFirstPassCode && !widget.isReset) {
        enteredPasscode += text;
        // print('FIRST -- $enteredPasscode');
        if (enteredPasscode.length == widget.passwordDigits) {
          isFirstPassCode = false;
          firstPassCode = enteredPasscode;
          resetPassCode();
          print(firstPassCode);
        }
      } else if (enteredPasscode.length < widget.passwordDigits) {
        enteredPasscode += text;
        // print('TWO -- $enteredPasscode');
        if (enteredPasscode.length == widget.passwordDigits) {
          // print('OK $enteredPasscode - $firstPassCode');
          if (widget.isReset) {
            ///logic
            checkPassCode();
          } else {
            if (enteredPasscode == firstPassCode) {
              widget.passwordEnteredCallback(enteredPasscode);
            } else {
              resetPassCode();
              showErrorMessage(AppLocalizations.of(context)!.translate('incorrect_password_passcode'));
            }
          }
        }
      }
    });
  }

  @override
  didUpdateWidget(PassCodeScreen old) {
    super.didUpdateWidget(old);
    // in case the stream instance changed, subscribe to the new one
    if (widget.shouldTriggerVerification != old.shouldTriggerVerification) {
      streamSubscription.cancel();
      streamSubscription = widget.shouldTriggerVerification.listen((isValid) => _showValidation(isValid));
    }
  }

  Future<void> checkPassCode() async {
    final String codeMd5 = Utils.generateMd5(enteredPasscode);
    final String localCode = LocalStoreManager.getString(UserSettings.keyPassCode);
    if (codeMd5 == localCode) {
      widget.passwordEnteredCallback(enteredPasscode);
    } else {
      countInvalidPass += 1;
      resetPassCode();
      showErrorMessage(AppLocalizations.of(context)!.translate('incorrect_password_passcode'));
      if (countInvalidPass >= _amountInvalidPassCode) {
        _startScheduleLockAccount();
      }
    }
  }

  void _startScheduleLockAccount() {
    final Duration oneDecimal = const Duration(seconds: 1);
    _timer = Timer.periodic(
        oneDecimal,
        (Timer timer) => setState(() {
              if (_start < 1) {
                _start = _timerLockDefault;
                LocalStoreManager.setInt(UserSettings.keySaveLockAccountTime, 0);
                _timer.cancel();
                countInvalidPass = 0;
              } else {
                _start -= 1;
                LocalStoreManager.setInt(UserSettings.keySaveLockAccountTime, _start);
                print(_start);
              }
            }));
  }

  @override
  dispose() {
    controller.dispose();
    streamSubscription.cancel();
    super.dispose();
  }

  void _showValidation(bool isValid) {
    if (isValid) {
      Navigator.maybePop(context).then((pop) => _validationCallback());
    } else {
      controller.forward();
    }
  }

  void _validationCallback() {
    if (widget.isValidCallback != null) {
      widget.isValidCallback!();
    } else {
      print("You didn't implement validation callback. Please handle a state by yourself then.");
    }
  }

  void resetPassCode() {
    enteredPasscode = '';
  }

  Widget _buildDeleteButton() {
    return Container(
      child: CupertinoButton(
        onPressed: _onDeleteCancelButtonPressed,
        child: Container(
          margin: widget.keyboardUIConfig.digitInnerMargin,
          child: enteredPasscode.length == 0 ? widget.cancelButton : widget.deleteButton,
        ),
      ),
    );
  }

  Widget _buildTitle() {
    return Text(
      AppLocalizations.of(context)!.translate(isFirstPassCode ? 'input_passcode' : 'confirm_pass_code'),
      textAlign: TextAlign.center,
      style: const TextStyle(color: Colors.white, fontSize: 28),
    );
  }
}
