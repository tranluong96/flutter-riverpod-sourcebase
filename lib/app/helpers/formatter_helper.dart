import 'package:flutter/services.dart';

class CardDateExpireFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    var digits = newValue.text.replaceAll('/', '');

    if (digits.length > 4) {
      digits = digits.substring(0, 4);
    }

    final buffer = StringBuffer();
    int selectionIndex = newValue.selection.baseOffset;

    for (int i = 0; i < digits.length; i++) {
      if (i == 2) {
        buffer.write('/');
        if (i < selectionIndex) {
          selectionIndex++;
        }
      }
      buffer.write(digits[i]);
    }

    final formatted = buffer.toString();

    if (selectionIndex > formatted.length) {
      selectionIndex = formatted.length;
    }

    return TextEditingValue(
      text: formatted,
      selection: TextSelection.collapsed(offset: selectionIndex),
    );
  }
}

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

class NumberCardFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    // Remove all spaces
    String text = newValue.text.replaceAll(' ', '');

    // Only numbers
    text = text.replaceAll(RegExp(r'[^0-9]'), '');

    // Limit 16 digits
    if (text.length > 16) {
      text = text.substring(0, 16);
    }

    // Add space every 4 digits
    String formatted = '';
    for (int i = 0; i < text.length; i++) {
      if (i % 4 == 0 && i != 0) {
        formatted += ' ';
      }
      formatted += text[i];
    }

    return TextEditingValue(
      text: formatted,
      selection: TextSelection.collapsed(offset: formatted.length),
    );
  }
}
