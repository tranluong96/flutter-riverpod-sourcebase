class RegexHelper {
  static final emailRegex = RegExp(
    r"""^(?:"([!#$%&'*+\-/=?^_{|}~a-zA-Z0-9.]+)"|([a-zA-Z0-9!#$%&'*+/=?^_{|}~-]+(?:\.[a-zA-Z0-9!#$%&'*+/=?^_{|}~-]+)*))@([a-zA-Z0-9](?:[a-zA-Z0-9-]*[a-zA-Z0-9])?\.)+[a-zA-Z]{2,}$""",
  );

  static final passwordRegex = RegExp(r'^(?=.*[A-Za-z])(?=.*\d).{8,}$');
}
