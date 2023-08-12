import 'package:flutter/services.dart';

class UpperCaseTextFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    return TextEditingValue(
      text: newValue.text.toUpperCase(),
      selection: newValue.selection,
    );
  }
}

class YearInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    final text = newValue.text;
    final length = text.length;

    // max length
    if (length > 4) {
      return oldValue;
    }

    return newValue;
  }
}

class TahunAkademikInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    final text = newValue.text;
    final length = text.length;

    // max length
    if (length > 8) {
      return oldValue;
    }

    if (length >= 5 && !text.contains('-')) {
      return TextEditingValue(
        text: '${text.substring(0, 4)}-${text.substring(4)}',
        selection: TextSelection.collapsed(offset: length + 1),
      );
    }

    return newValue;
  }
}
