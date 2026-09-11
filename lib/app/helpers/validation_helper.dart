import 'package:myapp/app/configs/regexs_config.dart';
import 'package:myapp/app/helpers/message_helper.dart';

class ValidationHelper {
  /// Validate if the input is empty
  static String? validateEmpty(String? value, {String? name}) {
    if (value == null || value.isEmpty) {
      return '${name ?? ''} ${MessageHelper.requiredEnterField}'.trimLeft();
    }
    return null;
  }

  /// Validate password:
  /// - Cannot be empty
  /// - At least 8 characters
  /// - Contains both letters and numbers
  static String? validatePassword(
    String? value, {
    String? emptyMessage,
    String? invalidMessage,
  }) {
    if (value == null || value.isEmpty) {
      return emptyMessage ?? MessageHelper.passwordRequired;
    }

    if (value.length < 8) {
      return invalidMessage ?? MessageHelper.passwordFormatInvalid;
    }

    final hasLetter = RegExp(r'[a-zA-Z]').hasMatch(value);
    final hasNumber = RegExp(r'[0-9]').hasMatch(value);

    if (!hasLetter || !hasNumber) {
      return invalidMessage ?? MessageHelper.passwordFormatInvalid;
    }

    return null;
  }

  /// Validate email format
  static String? validateEmail(
    String? value, {
    String? emptyMessage,
    String? invalidMessage,
  }) {
    if (value == null || value.isEmpty) {
      return emptyMessage ?? MessageHelper.emailRequired;
    }

    if (!RegexsConfig.emailRegex.hasMatch(value)) {
      return invalidMessage ?? MessageHelper.emailFormatInvalid;
    }

    return null;
  }

  /// Validate confirm password matches the original password
  static String? validateConfirmPassword(
    String? value,
    String password, {
    String? emptyMessage,
    String? notMatchMessage,
  }) {
    if (value == null || value.isEmpty) {
      return emptyMessage ?? MessageHelper.passwordConfirmRequired;
    }

    if (value != password) {
      return notMatchMessage ?? MessageHelper.passwordConfirmNotMatch;
    }

    return null;
  }

  static String? validateExpireDate(String? value) {
    if (value == null || value.isEmpty) {
      return MessageHelper.expiryDateRequired;
    }

    final parts = value.split('/');

    if (parts.length != 2) {
      return MessageHelper.expiryDateFormatInvalid;
    }

    final month = int.tryParse(parts[1]);
    final year = int.tryParse(parts[0]);

    if (month == null || year == null) {
      return MessageHelper.expiryDateFormatInvalid;
    }

    if (month < 1 || month > 12) {
      return MessageHelper.monthInvalid;
    }

    final now = DateTime.now();
    final fullYear = 2000 + year;

    final expiryDate = DateTime(fullYear, month + 1, 0);

    if (expiryDate.isBefore(now)) {
      return MessageHelper.cardExpired;
    }

    return null;
  }

  static bool isValidPassword(String password) {
    return RegexsConfig.passwordRegex.hasMatch(password);
  }

  static ({String passwordError, String confirmError}) validateResetPassword({
    required String password,
    required String confirmPassword,
  }) {
    String passwordError = '';
    String confirmError = '';

    if (password.isEmpty) {
      passwordError = MessageHelper.passwordRequired;
    } else if (!isValidPassword(password)) {
      passwordError = MessageHelper.passwordFormatInvalid;
    }

    if (confirmPassword.isEmpty) {
      confirmError = MessageHelper.passwordConfirmRequired;
    } else if (passwordError.isEmpty && password != confirmPassword) {
      confirmError = MessageHelper.passwordConfirmNotMatch;
    }

    return (passwordError: passwordError, confirmError: confirmError);
  }
}
