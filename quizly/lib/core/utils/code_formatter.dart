import 'package:flutter/services.dart';

import '../constants/app_constants.dart';

class CodeFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    final text = newValue.text
        .replaceAll(RegExp(r'[^a-zA-Z0-9]'), '')
        .toUpperCase()
        .substring(
          0,
          newValue.text.replaceAll(RegExp(r'[^a-zA-Z0-9]'), '').length.clamp(
            0,
            AppConstants.quizCodeLength,
          ),
        );

    return TextEditingValue(
      text: text,
      selection: TextSelection.collapsed(offset: text.length),
    );
  }
}

String parseCodeFromInput(String input) {
  return input
      .replaceAll(RegExp(r'[^a-zA-Z0-9]'), '')
      .toUpperCase()
      .substring(
        0,
        input
            .replaceAll(RegExp(r'[^a-zA-Z0-9]'), '')
            .length
            .clamp(0, AppConstants.quizCodeLength),
      );
}
