import 'dart:convert';

import 'package:core/common/utils/app_utils.dart';
import 'package:core/components/form/form_builder_field.dart';
import 'package:flutter/material.dart';

// ignore: always_specify_types
void setFormValue(GlobalKey<FormBuilderState> formKey, String name, dynamic value) {
  if (formKey.currentState == null) return;
  final String runTimeType = value.runtimeType.toString();
  print(runTimeType);
  if (runTimeType.contains("List")) {
    final List<Map<String, dynamic>> temps = <Map<String, dynamic>>[];
    for (final Object item in value as List<Object>) {
      temps.add(Utils.convertObjectToMap(item));
    }
    return formKey.currentState!.setInternalFieldValue(name, temps, isUpdateState: false);
  } else if (runTimeType.contains("Model")) {
    return formKey.currentState!.setInternalFieldValue(name, Utils.convertObjectToMap(value), isUpdateState: false);
  }
  formKey.currentState!.setInternalFieldValue(name, value, isUpdateState: false);
}

/// A container for form fields.
class FormBuilder<T> extends StatefulWidget {
  /// Called when one of the form fields changes.
  ///
  /// In addition to this callback being invoked, all the form fields themselves
  /// will rebuild.
  final VoidCallback? onChanged;

  /// Enables the form to veto attempts by the user to dismiss the [ModalRoute]
  /// that contains the form.
  ///
  /// If the callback returns a Future that resolves to false, the form's route
  /// will not be popped.
  ///
  /// See also:
  ///
  ///  * [WillPopScope], another widget that provides a way to intercept the
  ///    back button.
  final WillPopCallback? onWillPop;

  /// The widget below this widget in the tree.
  ///
  /// This is the root of the widget hierarchy that contains this form.
  ///
  /// {@macro flutter.widgets.child}
  final Widget child;

  /// Used to enable/disable form fields auto validation and update their error
  /// text.
  ///
  /// {@macro flutter.widgets.form.autovalidateMode}
  final AutovalidateMode? autovalidateMode;

  /// An optional Map of field initialValues. Keys correspond to the field's
  /// name and value to the initialValue of the field.
  ///
  /// The initialValues set here will be ignored if the field has a local
  /// initialValue set.
  final Map<String, dynamic> initialValue;

  /// Whether the form should ignore submitting values from fields where
  /// `enabled` is `false`.
  /// This behavior is common in HTML forms where _readonly_ values are not
  /// submitted when the form is submitted.
  ///
  /// When `true`, the final form value will not contain disabled fields.
  /// Default is `false`.
  final bool skipDisabled;

  /// Whether the form is able to receive user input.
  ///
  /// Defaults to true.
  ///
  /// When `false` all the form fields will be disabled - won't accept input -
  /// and their enabled state will be ignored.
  final bool enabled;

  /// Creates a container for form fields.
  ///
  /// The [child] argument must not be null.

  // T object;

  FormBuilder({
    Key? key,
    required this.child,
    this.onChanged,
    this.autovalidateMode,
    this.onWillPop,
    this.initialValue = const <String, dynamic>{},
    this.skipDisabled = false,
    this.enabled = true,
    //required this.object,
  }) : super(key: key);

  static FormBuilderState? of(BuildContext context) => context.findAncestorStateOfType<FormBuilderState>();

  @override
  FormBuilderState<T> createState() => FormBuilderState<T>();
}

class FormBuilderState<T> extends State<FormBuilder<T>> {
  final _formKey = GlobalKey<FormState>();

  bool get enabled => widget.enabled;

  final _fields = <String, FormBuilderFieldState>{};

  final _value = <String, dynamic>{};

  Map<String, dynamic> get value => Map<String, dynamic>.unmodifiable(_value);

  Map<String, dynamic> get initialValue => widget.initialValue;

  Map<String, FormBuilderFieldState> get fields => _fields;

  //T get object => widget.object;

  /*
    bool get hasError => _fields.values.map((e) => e.hasError).firstWhere((element) => element == false, orElse: () => true);

    bool get isValid => _fields.values.map((e) => e.isValid).firstWhere((element) => element == false, orElse: () => true);
  */
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    // set default value
    initialValue.forEach((String key, dynamic value) {
      _value[key] = value;
    });
  }

  void setInternalFieldValue(String name, dynamic value, {bool isUpdateState = true}) {
    if (name.isNotEmpty) {
      if (isUpdateState)
        setState(() {
          _value[name] = value;
        });
      else
        _value[name] = value;
    }
  }

  void removeInternalFieldValue(String name) {
    setState(() {
      _value.remove(name);
    });
  }

  void registerField(String name, FormBuilderFieldState field) {
    // Each field must have a unique name.  Ideally we could simply:
    //   assert(!_fields.containsKey(name));
    // However, Flutter will delay dispose of deactivated fields, so if a
    // field is being replaced, the new instance is registered before the old
    // one is unregistered.  To accommodate that use case, but also provide
    // assistance to accidental duplicate names, we check and emit a warning.
    assert(() {
      if (_fields.containsKey(name)) {
        print('Warning! Replacing duplicate Field for $name'
            ' -- this is OK to ignore as long as the field was intentionally replaced');
      }
      return true;
    }());
    _fields[name] = field;
  }

  void unregisterField(String name, FormBuilderFieldState field) {
    assert(_fields.containsKey(name));
    // Only remove the field when it is the one registered.  It's possible that
    // the field is replaced (registerField is called twice for a given name)
    // before unregisterField is called for the name, so just emit a warning
    // since it may be intentional.
    if (field == _fields[name]) {
      _fields.remove(name);
      _value.remove(name);
    } else {
      assert(() {
        // This is OK to ignore when you are intentionally replacing a field
        // with another field using the same name.
        print('Warning! Ignoring Field unregistration for $name'
            ' -- this is OK to ignore as long as the field was intentionally replaced');
        return true;
      }());
    }
  }

  void save() {
    _formKey.currentState!.save();
  }

  bool validate() {
    return _formKey.currentState!.validate();
  }

  bool saveAndValidate() {
    save();
    return validate();
  }

  void reset() {
    _formKey.currentState!.reset();
  }

  void patchValue(Map<String, dynamic> val) {
    val.forEach((final String key, dynamic value) {
      _fields[key]?.didChange(value);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      autovalidateMode: widget.autovalidateMode,
      onWillPop: widget.onWillPop,
      onChanged: widget.onChanged,
      child: FocusTraversalGroup(
        policy: WidgetOrderTraversalPolicy(),
        child: widget.child,
      ),
    );
  }
}
