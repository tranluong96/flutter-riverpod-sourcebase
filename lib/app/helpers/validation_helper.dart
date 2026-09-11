import 'package:myapp/app/configs/regexs_config.dart';
import 'package:myapp/i18n/strings.g.dart';

class ValidationHelper {
  static String? validateEmpty(String? value, {String? name}) {
    if (value == null || value.isEmpty) {
      if (name == null || name.trim().isEmpty) {
        return t.validation.field_required;
      }
      return t.validation.required_field(Name: name);
    }
    return null;
  }

  static String? validateEmail(
    String? value, {
    String? emptyMessage,
    String? invalidMessage,
  }) {
    if (value == null || value.isEmpty) {
      return emptyMessage ?? t.validation.email_required;
    }

    if (!RegexsConfig.emailRegex.hasMatch(value)) {
      return invalidMessage ?? t.validation.email_format_invalid;
    }

    return null;
  }

  static const int _minLength = 8;

  static String? validatePassword(
    String? value, {
    String? emptyMessage,
    String? invalidMessage,
  }) {
    if (value == null || value.isEmpty) {
      return emptyMessage ?? t.validation.password_required;
    }

    final isValid =
        value.length >= _minLength &&
        RegexsConfig.hasLetterRegex.hasMatch(value) &&
        RegexsConfig.hasNumberRegex.hasMatch(value);

    return isValid
        ? null
        : invalidMessage ?? t.validation.password_format_invalid;
  }

  static String? validateConfirmPassword(
    String? value,
    String password, {
    String? emptyMessage,
    String? notMatchMessage,
  }) {
    if (value == null || value.isEmpty) {
      return emptyMessage ?? t.validation.password_confirm_required;
    }

    return value == password
        ? null
        : notMatchMessage ?? t.validation.password_confirm_not_match;
  }
}
