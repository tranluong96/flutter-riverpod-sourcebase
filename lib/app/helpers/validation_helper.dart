import 'package:myapp/app/helpers/regex_helper.dart';

class ValidationMessages {
  static const String requiredFieldSuffix = 'は必須項目です。';
  static const String passwordRequired = 'パスワードは必須項目です。';
  static const String passwordInvalid = '8桁以上で英文字・数字を含めてください。';
  static const String emailRequired = 'メールアドレスは必須項目です。';
  static const String emailInvalid = '正しいメールアドレスの形式で入力してください。';
  static const String confirmPasswordRequired = 'パスワード（確認用）は必須項目です。';
  static const String passwordNotMatch = 'パスワードが一致しません。';
  static const String expiryDateRequired = '有効期限は必須項目です。';
  static const String expiryDateInvalidFormat = '有効期限の形式が正しくありません';
  static const String monthInvalid = '月が正しくありません';
  static const String cardExpired = 'カードの有効期限が切れています';
}

class ValidationHelper {
  /// Validate if the input is empty
  static String? validateEmpty(String? value, {String? name}) {
    if (value == null || value.isEmpty) {
      return '${name ?? ''} ${ValidationMessages.requiredFieldSuffix}'
          .trimLeft();
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
      return emptyMessage ?? ValidationMessages.passwordRequired;
    }

    if (value.length < 8) {
      return invalidMessage ?? ValidationMessages.passwordInvalid;
    }

    final hasLetter = RegExp(r'[a-zA-Z]').hasMatch(value);
    final hasNumber = RegExp(r'[0-9]').hasMatch(value);

    if (!hasLetter || !hasNumber) {
      return invalidMessage ?? ValidationMessages.passwordInvalid;
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
      return emptyMessage ?? ValidationMessages.emailRequired;
    }

    if (!RegexHelper.emailRegex.hasMatch(value)) {
      return invalidMessage ?? ValidationMessages.emailInvalid;
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
      return emptyMessage ?? ValidationMessages.confirmPasswordRequired;
    }

    if (value != password) {
      return notMatchMessage ?? ValidationMessages.passwordNotMatch;
    }

    return null;
  }

  static String? validateExpireDate(String? value) {
    if (value == null || value.isEmpty) {
      return ValidationMessages.expiryDateRequired;
    }

    final parts = value.split('/');

    if (parts.length != 2) {
      return ValidationMessages.expiryDateInvalidFormat;
    }

    final month = int.tryParse(parts[1]);
    final year = int.tryParse(parts[0]);

    if (month == null || year == null) {
      return ValidationMessages.expiryDateInvalidFormat;
    }

    if (month < 1 || month > 12) {
      return ValidationMessages.monthInvalid;
    }

    final now = DateTime.now();
    final fullYear = 2000 + year;

    final expiryDate = DateTime(fullYear, month + 1, 0);

    if (expiryDate.isBefore(now)) {
      return ValidationMessages.cardExpired;
    }

    return null;
  }

  static bool isValidPassword(String password) {
    return RegexHelper.passwordRegex.hasMatch(password);
  }

  static ({String passwordError, String confirmError}) validateResetPassword({
    required String password,
    required String confirmPassword,
  }) {
    String passwordError = '';
    String confirmError = '';

    if (password.isEmpty) {
      passwordError = ValidationMessages.passwordRequired;
    } else if (!isValidPassword(password)) {
      passwordError = ValidationMessages.passwordInvalid;
    }

    if (confirmPassword.isEmpty) {
      confirmError = ValidationMessages.confirmPasswordRequired;
    } else if (passwordError.isEmpty && password != confirmPassword) {
      confirmError = ValidationMessages.passwordNotMatch;
    }

    return (passwordError: passwordError, confirmError: confirmError);
  }
}
