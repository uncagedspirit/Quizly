import 'package:flutter/material.dart';

import '../../../core/constants/app_constants.dart';
import '../../../core/theme/tokens.dart';
import '../../../core/extensions/context_extensions.dart';

class CodeInputField extends StatefulWidget {
  const CodeInputField({
    super.key,
    this.onComplete,
    this.big = false,
  });

  final ValueChanged<String>? onComplete;
  final bool big;

  @override
  State<CodeInputField> createState() => _CodeInputFieldState();
}

class _CodeInputFieldState extends State<CodeInputField> {
  late final TextEditingController _controller;
  final _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
    _controller.addListener(_onChanged);
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  void _onChanged() {
    final text = _controller.text
        .replaceAll(RegExp(r'[^a-zA-Z0-9]'), '')
        .toUpperCase();

    if (text != _controller.text) {
      _controller.value = TextEditingValue(
        text: text,
        selection: TextSelection.collapsed(offset: text.length),
      );
      return;
    }

    if (text.length == AppConstants.quizCodeLength) {
      widget.onComplete?.call(text);
    }
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final values = _controller.text.split('');
    final slotSize = widget.big ? 56.0 : 44.0;
    final slotHeight = widget.big ? 64.0 : 52.0;
    final fontSize = widget.big ? 32.0 : 24.0;

    return GestureDetector(
      onTap: () => _focusNode.requestFocus(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(AppConstants.quizCodeLength, (index) {
          final hasChar = index < values.length;
          return Container(
            width: slotSize,
            height: slotHeight,
            margin: EdgeInsets.only(
              right: index < AppConstants.quizCodeLength - 1 ? 6 : 0,
            ),
            decoration: BoxDecoration(
              color: hasChar ? colors.card : Colors.transparent,
              borderRadius: BorderRadius.circular(QzRadius.md),
              boxShadow: hasChar
                  ? [
                      BoxShadow(
                        color: colors.line,
                        spreadRadius: 0,
                        blurRadius: 0,
                        offset: const Offset(0, 1),
                      ),
                    ]
                  : [
                      BoxShadow(
                        color: colors.ink4,
                        spreadRadius: 0,
                        blurRadius: 0,
                        offset: const Offset(0, -1.5),
                      ),
                    ],
            ),
            alignment: Alignment.center,
            child: hasChar
                ? Text(
                    values[index],
                    style: TextStyle(
                      fontFamily: 'JetBrainsMono',
                      fontSize: fontSize,
                      fontWeight: FontWeight.w600,
                      color: colors.ink,
                    ),
                  )
                : const SizedBox.shrink(),
          );
        }),
      ),
    );
  }
}
