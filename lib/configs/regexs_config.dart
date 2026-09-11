class RegexsConfig {

  /// Validate email format
  /// - Cannot be empty
  /// - Must be a valid email format
  static final emailRegex = RegExp(
    r"""^(?:"([!#$%&'*+\-/=?^_{|}~a-zA-Z0-9.]+)"|([a-zA-Z0-9!#$%&'*+/=?^_{|}~-]+(?:\.[a-zA-Z0-9!#$%&'*+/=?^_{|}~-]+)*))@([a-zA-Z0-9](?:[a-zA-Z0-9-]*[a-zA-Z0-9])?\.)+[a-zA-Z]{2,}$""",
  );

  /// Validate password:
  /// - Cannot be empty
  /// - At least 8 characters
  /// - Contains both letters and numbers
  static final passwordRegex = RegExp(r'^(?=.*[A-Za-z])(?=.*\d).{8,}$');

  /// Validate password contains at least one letter
  /// - Contains at least one letter
  static final hasLetterRegex = RegExp(r'[a-zA-Z]');

  /// Validate password contains at least one number
  /// - Contains at least one number
  static final hasNumberRegex = RegExp(r'[0-9]');
}
