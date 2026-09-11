import 'package:flutter/services.dart';

class OnlyNumberDateExpFormatter extends TextInputFormatter {
  final RegExp _regExp = RegExp(r'^[0-9/]*$');

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    if (_regExp.hasMatch(newValue.text)) {
      return newValue;
    }
    return oldValue;
  }
}
