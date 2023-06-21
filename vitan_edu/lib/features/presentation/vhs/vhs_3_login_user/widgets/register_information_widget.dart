import 'package:api/id/model/login_response_model.dart';
import 'package:api/id/model/update_account_request.dart';
import 'package:core/common/color/core_color.dart';
import 'package:core/common/text_style.dart';
import 'package:core/components/button/primary_button_widget.dart';
import 'package:core/components/core_component.dart';
import 'package:core/language/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:vitan_edu/core/common/injection.dart';
import 'package:vitan_edu/core/theme/custom.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vitan_edu/features/presentation/vhs/vhs_3_login_user/bloc/vhs3_login_user_bloc.dart';

class RegisterInformationWidget extends StatefulWidget {
  final LoginResponseModel loginResponseModel;

  const RegisterInformationWidget({Key? key, required this.loginResponseModel}) : super(key: key);

  @override
  _RegisterInformationWidgetState createState() => _RegisterInformationWidgetState();
}

class _RegisterInformationWidgetState extends State<RegisterInformationWidget> {
  final GlobalKey<FormBuilderState<UpdateAccountRequest>> _formKey =
      GlobalKey<FormBuilderState<UpdateAccountRequest>>();
  final VHS3LoginUserBloc _vhs3loginUserBloc = getItSuper();

  LoginResponseModel get _model => widget.loginResponseModel;
  int? _date;
  int? _month;
  int? _year;
  int? _gender;

  final List<int> _listDate = List.generate(31, (index) => index + 1);
  final List<int> _listMonth = List.generate(12, (index) => index + 1);
  final List<int> _listYear = List.generate(DateTime.now().year - 1900, (index) => DateTime.now().year - index);
  final List<int> _listGender = List.generate(3, (index) => index);

  bool isShowPassword = false;
  bool isShowRePassword = false;

  UpdateAccountRequest _data = UpdateAccountRequest();

  @override
  void initState() {
    super.initState();
    _data
      ..username = widget.loginResponseModel.userInfo?.userName ?? ''
      ..firstName = _model.userInfo?.firstName ?? ''
      ..lastName = _model.userInfo?.lastName ?? ''
      ..gender = _model.userInfo?.gender ?? 3
      ..birthdate = _model.userInfo?.birthdate
      ..address = _model.userInfo?.address ?? ''
      ..id = widget.loginResponseModel.userInfo?.id ?? 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Col,

      body: FormBuilder<UpdateAccountRequest>(
        key: _formKey,
        initialValue: _data.toJson(),
        child: SafeArea(
          child: OrientationBuilder(
            builder: (context, orientation) {
              final bool isLandscape = orientation == Orientation.landscape;
              return SingleChildScrollView(
                padding: CustomTheme.paddingBodyDefault.copyWith(top: 24, bottom: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(AppLocalizations.of(context)!.translate('sign_up'),
                            style: TextStyle(fontWeight: FontWeight.w800, fontSize: 26, color: kTextColor)),
                        SizedBox(width: ScreenUtil().screenWidth * 0.2),
                        BndGestureDetector(
                          onTap: () => Navigator.pop(context, true),
                          child: Text(AppLocalizations.of(context)!.translate('skip'),
                              style: textStyleBodyDefault.copyWith(color: kTextColor)),
                        ),
                      ],
                    ),
                    const SizedBox(height: 40),
                    Text(
                        AppLocalizations.of(context)!
                            .translate('to_secure_your_account_the_information_below_is_require'),
                        style: textStyleBodyDefault.copyWith(
                            fontSize: 16.sp, fontWeight: FontWeight.w400, color: CustomTheme.buttonBorderDefaultColor)),
                    const SizedBox(height: 16),
                    _buildField(_data.firstName, label: 'first_name', name: 'firstName', validateLength: 1),
                    _buildField(_data.lastName, label: 'name', name: 'lastName', validateLength: 1),
                    _buildField('',
                        label: 'password',
                        name: 'password',
                        isPassword: isShowPassword,
                        textCapitalization: TextCapitalization.sentences,
                        suffixIcon: _buildSuffixIcon(true)),
                    _buildField('',
                        label: 'rePassword',
                        name: 'rePassword',
                        textCapitalization: TextCapitalization.sentences,
                        isPassword: isShowRePassword,
                        suffixIcon: _buildSuffixIcon(false)),
                    _buildField(_data.address, label: 'address', name: 'address', validateLength: 0),
                    ..._buildDateOfBirth,
                    PrimaryButtonWidget(
                        isGradient: false,
                        backgroundColor: CustomTheme.primaryColor,
                        padding: EdgeInsets.symmetric(vertical: 18),
                        radius: 15,
                        iconSize: 0,
                        onPressed: () async {
                          if (_formKey.currentState!.saveAndValidate() &&
                              _date != null &&
                              _month != null &&
                              _year != null &&
                              _gender != null) {
                            _data = UpdateAccountRequest.fromJson(_formKey.currentState!.value);
                            DateTime _dateMap = DateTime(_year ?? 0, _month ?? 0, _date ?? 0);
                            _data.birthdate = _dateMap;
                            _data.gender = _gender ?? 0;
                            if (_data.password == _data.rePassword) {
                              _vhs3loginUserBloc.updateAccount(_data);
                            } else {
                              showErrorMessage(AppLocalizations.of(context)!.translate('alert_re_input_password'));
                            }
                          } else {
                            showErrorMessage(AppLocalizations.of(context)!.translate('alert_input_data'));
                          }
                        },
                        title: AppLocalizations.of(context)!.translate('completed')),
                    const SizedBox(height: 8),
                    BndGestureDetector(
                        child: Text(
                          AppLocalizations.of(context)!.translate('cancel_one'),
                          style: textStyleBodySmall.copyWith(color: kTextColor),
                        ),
                        onTap: () => Navigator.pop(context))
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildSuffixIcon(bool isPassword) {
    return IconButton(
        onPressed: () {
          setState(() {
            if (isPassword) {
              isShowPassword = !isShowPassword;
            } else {
              isShowRePassword = !isShowRePassword;
            }
          });
        },
        icon: Icon(
          (isPassword ? isShowPassword : isShowRePassword) ? Icons.visibility : Icons.visibility_off,
          color: Colors.grey,
        ));
  }

  Widget _buildField(String value,
      {required String label,
      required String name,
      bool isPassword = false,
      Widget? suffixIcon,
      TextCapitalization textCapitalization = TextCapitalization.none,
      int validateLength = 6}) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: BNDTextField<String>(
        autofocus: true,
        maxLines: 1,
        name: name,
        initialValue: value,
        labelText: AppLocalizations.of(context)!.translate(label),
        labelTextStyle:
            textStyleBodySmall.copyWith(color: CustomTheme.vhsTextFormWeb, fontSize: 16, fontWeight: FontWeight.w400),
        obscureText: isPassword,
        style: textStyleBodyDefault.copyWith(fontSize: 16.sp, fontWeight: FontWeight.w400),
        textCapitalization: textCapitalization,
        validator: validateLength > 0
            ? FormBuilderValidators.compose(
                <FormFieldValidator<String>>[
                  FormBuilderValidators.required(context),
                  FormBuilderValidators.minLength(context, validateLength)
                ],
              )
            : null,
        decoration: InputDecoration(
          contentPadding: CustomTheme.paddingBodyDefault.copyWith(top: 16, bottom: 16),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0), borderSide: BorderSide(color: CustomTheme.vhsTextFormWeb)),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0), borderSide: BorderSide(color: CustomTheme.vhsTextFormWeb)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0), borderSide: BorderSide(color: CustomTheme.vhsTextFormWeb)),
          errorBorder:
              OutlineInputBorder(borderRadius: BorderRadius.circular(10.0), borderSide: BorderSide(color: Colors.red)),
          focusedErrorBorder:
              OutlineInputBorder(borderRadius: BorderRadius.circular(10.0), borderSide: BorderSide(color: Colors.red)),
          filled: true,
          fillColor: Colors.white70,
          suffixIcon: suffixIcon,
        ),
      ),
    );
  }

  List<Widget> get _buildDateOfBirth {
    return [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Divider(color: CustomTheme.buttonBorderDefaultColor),
            Container(
              // alignment: Alignment.center,
              color: kTextWhiteColor,
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                AppLocalizations.of(context)!.translate('date_of_birth'),
                style: textStyleBodySmall.copyWith(color: kTextColor),
              ),
            )
          ],
        ),
      ),
      Row(
        children: [
          _buildDropdown(0),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: _buildDropdownMonth(),
          )),
          _buildDropdown(2)
        ],
      ),
      const SizedBox(height: 16),
      _buildDropdown(1),
      const SizedBox(height: 16)
    ];
  }

  Widget _buildDropdown(int type) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.fromLTRB(21, 4, 10, 4),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          border: Border.all(width: 1, color: CustomTheme.buttonBorderDefaultColor)),
      child: DropdownButton<int>(
        value: _getValueDate(type),
        icon: Icon(Icons.arrow_drop_down, color: CustomTheme.buttonBorderDefaultColor),
        menuMaxHeight: 200,
        hint: Text(AppLocalizations.of(context)!.translate(_getHintTextDopdown(type))),
        elevation: 16,
        style: textStyleBodySmall.copyWith(color: CustomTheme.requestBtnAcceptColor),
        underline: const SizedBox.shrink(),
        onChanged: (int? newValue) {
          setState(() {
            if (type == 0) {
              _date = newValue;
            } else if (type == 1) {
              _gender = newValue;
            } else if (type == 2) {
              _year = newValue;
            }
          });
        },
        items: _getListDropdown(type).map<DropdownMenuItem<int>>((int value) {
          return DropdownMenuItem<int>(
            enabled: true,
            value: value,
            child: Text(type == 1 ? _getItemDropdown(value) : value.toString(),
                style: textStyleBodySmall.copyWith(color: CustomTheme.textRegisterGreyColor)),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildDropdownMonth() {
    return Container(
      padding: EdgeInsets.fromLTRB(21, 4, 10, 4),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          border: Border.all(width: 1, color: CustomTheme.buttonBorderDefaultColor)),
      child: DropdownButton<int>(
        value: null,
        icon: Row(
          children: [
            const SizedBox(width: 4),
            Text(
              (_month ?? '').toString(),
              style: textStyleBodySmall.copyWith(color: kTextColor),
              overflow: TextOverflow.ellipsis,
            ),
            Icon(Icons.arrow_drop_down, color: CustomTheme.buttonBorderDefaultColor)
          ],
        ),
        // isExpanded: true,
        hint: Text(
          AppLocalizations.of(context)!.translate('month'),
          style: textStyleBodySmall.copyWith(color: kTextColor),
        ),
        menuMaxHeight: 200,
        elevation: 16,
        style: textStyleBodySmall.copyWith(color: CustomTheme.requestBtnAcceptColor),
        underline: const SizedBox.shrink(),
        onChanged: (int? newValue) {
          setState(() {
            _month = newValue;
          });
        },
        items: _listMonth.map<DropdownMenuItem<int>>((int value) {
          return DropdownMenuItem<int>(
            value: value,
            child: Text(value.toString(), style: textStyleBodySmall.copyWith(color: CustomTheme.textRegisterGreyColor)),
          );
        }).toList(),
      ),
    );
  }

  List<int> _getListDropdown(int type) {
    if (type == 0) {
      return _listDate;
    } else if (type == 1) {
      return _listGender;
    } else {
      return _listYear;
    }
  }

  int? _getValueDate(int type) {
    if (type == 0) {
      return _date;
    } else if (type == 1) {
      return _gender;
    } else {
      return _year;
    }
  }

  String _getHintTextDopdown(int type) {
    if (type == 0) {
      return 'date';
    } else if (type == 1) {
      return 'gender';
    } else {
      return 'year';
    }
  }

  String _getItemDropdown(int value) {
    switch (value) {
      case 0:
        return AppLocalizations.of(context)!.translate('no_determined');
      case 2:
        return AppLocalizations.of(context)!.translate('female');
      default:
        return AppLocalizations.of(context)!.translate('male');
    }
  }
}
