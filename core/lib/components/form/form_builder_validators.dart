import 'package:core/common/constants/validate_keys.dart';
import 'package:core/common/utils/app_utils.dart';
import 'package:core/common/utils/validators.dart';
import 'package:core/language/app_localizations.dart';
import 'package:flutter/material.dart';

class FormBuilderValidators {
  /// [FormFieldValidator] that is composed of other [FormFieldValidator]s.
  /// Each validator is run against the [FormField] value and if any returns a
  /// non-null result validation fails, otherwise, validation passes
  static FormFieldValidator<T> compose<T>(List<FormFieldValidator<T>> validators) {
    return (valueCandidate) {
      for (var validator in validators) {
        final validatorResult = validator.call(valueCandidate);
        if (validatorResult != null) {
          return validatorResult;
        }
      }
      return null;
    };
  }

  /// [FormFieldValidator] that requires the field have a non-empty value.
  static FormFieldValidator<T> required<T>(
    BuildContext context, {
    String? errorText,
  }) {
    return (T? valueCandidate) {
      if (valueCandidate == null ||
          (valueCandidate is String && valueCandidate.trim().isEmpty) ||
          (valueCandidate is Iterable && valueCandidate.isEmpty) ||
          (valueCandidate is Map && valueCandidate.isEmpty)) {
        return errorText ?? AppLocalizations.of(context)!.translate(ValidateKey.requiredErrorText);
      }
      return null;
    };
  }

  /// [FormFieldValidator] that requires the field's value be equal to the
  /// provided value.
  static FormFieldValidator<T> equal<T>(
    BuildContext context,
    T value, {
    String? errorText,
  }) =>
      (valueCandidate) => valueCandidate != value
          ? errorText ?? '${AppLocalizations.of(context)!.translate(ValidateKey.equalErrorText)} ${value.toString()}'
          : null;

  /// [FormFieldValidator] that requires the field's value be not equal to
  /// the provided value.
  static FormFieldValidator<T> notEqual<T>(
    BuildContext context,
    T value, {
    String? errorText,
  }) =>
      (valueCandidate) => valueCandidate == value
          ? errorText ?? '${AppLocalizations.of(context)!.translate(ValidateKey.notEqualErrorText)} ${value.toString()}'
          : null;

  /// [FormFieldValidator] that requires the field's value to be greater than
  /// (or equal) to the provided number.
  static FormFieldValidator<T> min<T>(
    BuildContext context,
    num min, {
    bool inclusive = true,
    String? errorText,
  }) {
    return (T? valueCandidate) {
      if (valueCandidate != null) {
        assert(valueCandidate is num || valueCandidate is String);
        final number = valueCandidate is num ? valueCandidate : num.tryParse(valueCandidate.toString());

        if (number != null && (inclusive ? number < min : number <= min)) {
          return errorText ?? '${AppLocalizations.of(context)!.translate(ValidateKey.minErrorText)} ${min.toString()}';
        }
      }
      return null;
    };
  }

  /// [FormFieldValidator] that requires the field's value to be less than
  /// (or equal) to the provided number.
  static FormFieldValidator<T> max<T>(
    BuildContext context,
    num max, {
    bool inclusive = true,
    String? errorText,
  }) {
    return (T? valueCandidate) {
      if (valueCandidate != null) {
        assert(valueCandidate is num || valueCandidate is String);
        final number = valueCandidate is num ? valueCandidate : num.tryParse(valueCandidate.toString());

        if (number != null && (inclusive ? number > max : number >= max)) {
          return errorText ?? '${AppLocalizations.of(context)!.translate(ValidateKey.maxErrorText)} ${max.toString()}';
        }
      }
      return null;
    };
  }

  /// [FormFieldValidator] that requires the length of the field's value to be
  /// greater than or equal to the provided minimum length.
  static FormFieldValidator<String> minLength(
    BuildContext context,
    int minLength, {
    bool allowEmpty = false,
    String? errorText,
  }) {
    assert(minLength > 0);
    return (valueCandidate) {
      final valueLength = valueCandidate?.length ?? 0;
      return valueLength < minLength && (!allowEmpty || valueLength > 0)
          ? errorText ??
              '${AppLocalizations.of(context)!.translate(ValidateKey.minLengthErrorText)} ${minLength.toString()}'
          : null;
    };
  }

  /// [FormFieldValidator] that requires the length of the field's value to be
  /// less than or equal to the provided maximum length.
  static FormFieldValidator<String> maxLength(
    BuildContext context,
    int maxLength, {
    String? errorText,
  }) {
    assert(maxLength > 0);
    return (valueCandidate) => null != valueCandidate && valueCandidate.length > maxLength
        ? errorText ??
            '${AppLocalizations.of(context)!.translate(ValidateKey.maxLengthErrorText)} ${maxLength.toString()}'
        : null;
  }

  /// [FormFieldValidator] that requires the field's value to be a valid email address.
  static FormFieldValidator<String> email(
    BuildContext context, {
    String? errorText,
  }) =>
      (valueCandidate) => true == valueCandidate?.isNotEmpty && !isEmail(valueCandidate!.trim())
          ? errorText ?? AppLocalizations.of(context)!.translate(ValidateKey.emailErrorText)
          : null;

  /// [FormFieldValidator] that requires the field's value to be a valid url.
  static FormFieldValidator<String> url(
    BuildContext context, {
    String? errorText,
    List<String> protocols = const ['http', 'https', 'ftp'],
    bool requireTld = true,
    bool requireProtocol = false,
    bool allowUnderscore = false,
    List<String> hostWhitelist = const [],
    List<String> hostBlacklist = const [],
  }) =>
      (valueCandidate) => true == valueCandidate?.isNotEmpty &&
              !isURL(valueCandidate!,
                  protocols: protocols,
                  requireTld: requireTld,
                  requireProtocol: requireProtocol,
                  allowUnderscore: allowUnderscore,
                  hostWhitelist: hostWhitelist,
                  hostBlacklist: hostBlacklist)
          ? errorText ?? AppLocalizations.of(context)!.translate(ValidateKey.urlErrorText)
          : null;

  /// [FormFieldValidator] that requires the field's value to match the provided regex pattern.
  static FormFieldValidator<String> match(
    BuildContext context,
    String pattern, {
    String? errorText,
  }) =>
      (valueCandidate) => true == valueCandidate?.isNotEmpty && !RegExp(pattern).hasMatch(valueCandidate!)
          ? errorText ?? AppLocalizations.of(context)!.translate(ValidateKey.matchErrorText)
          : null;

  /// [FormFieldValidator] that requires the field's value to be a valid number.
  static FormFieldValidator<String> numeric(
    BuildContext context, {
    String? errorText,
  }) =>
      (valueCandidate) => true == valueCandidate?.isNotEmpty && null == num.tryParse(valueCandidate!)
          ? errorText ?? AppLocalizations.of(context)!.translate(ValidateKey.numericErrorText)
          : null;

  /// [FormFieldValidator] that requires the field's value to be a valid integer.
  static FormFieldValidator<String> integer(
    BuildContext context, {
    String? errorText,
    int? radix,
  }) =>
      (valueCandidate) => true == valueCandidate?.isNotEmpty && null == int.tryParse(valueCandidate!, radix: radix)
          ? errorText ?? AppLocalizations.of(context)!.translate(ValidateKey.integerErrorText)
          : null;

  /// [FormFieldValidator] that requires the field's value to be a valid credit card number.
  static FormFieldValidator<String> creditCard(
    BuildContext context, {
    String? errorText,
  }) =>
      (valueCandidate) => true == valueCandidate?.isNotEmpty && !isCreditCard(valueCandidate!)
          ? errorText ?? AppLocalizations.of(context)!.translate(ValidateKey.creditCardErrorText)
          : null;

  /// [FormFieldValidator] that requires the field's value to be a valid IP address.
  /// * [version] is a `String` or an `int`.
  static FormFieldValidator<String> ip(
    BuildContext context, {
    int? version,
    String? errorText,
  }) =>
      (valueCandidate) => true == valueCandidate?.isNotEmpty && !isIP(valueCandidate!, version)
          ? errorText ?? AppLocalizations.of(context)!.translate(ValidateKey.ipErrorText)
          : null;

  /// [FormFieldValidator] that requires the field's value to be a valid date string.
  static FormFieldValidator<String> dateString(
    BuildContext context, {
    String? errorText,
  }) =>
      (valueCandidate) => true == valueCandidate?.isNotEmpty && !isDate(valueCandidate!)
          ? errorText ?? AppLocalizations.of(context)!.translate(ValidateKey.dateStringErrorText)
          : null;

  /// [FormFieldValidator] that requires the length of the field's value to be
  /// greater than or equal to the provided minimum length.
  static FormFieldValidator<DateTime> dateGreaterThan(
    BuildContext context,
    DateTime date, {
    bool allowEmpty = false,
    String? errorText,
  }) {
    return (valueCandidate) {
      return (valueCandidate == null || Utils.dateDiffToSeconds(valueCandidate, date) < 0)
          ? errorText ??
              '${AppLocalizations.of(context)!.translate(ValidateKey.dateGreaterThanErrorText)} ${date.toString()}'
          : null;
    };
  }

  static FormFieldValidator<DateTime> dateGreaterThanNow(
    BuildContext context, {
    bool allowEmpty = false,
    String? errorText,
  }) {
    return (valueCandidate) {
      return (valueCandidate == null || Utils.dateDiffToSeconds(valueCandidate, DateTime.now()) < 0)
          ? errorText ?? AppLocalizations.of(context)!.translate(ValidateKey.dateGreaterThanNowErrorText)
          : null;
    };
  }
}
