import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../core/theme/tokens.dart';
import '../../../core/extensions/context_extensions.dart';

class AppTextField extends StatelessWidget {
  const AppTextField({
    super.key,
    this.label,
    this.hint,
    this.controller,
    this.obscureText = false,
    this.keyboardType,
    this.maxLines = 1,
    this.maxLength,
    this.errorText,
    this.inputFormatters,
    this.onChanged,
    this.onSubmitted,
  });

  final String? label;
  final String? hint;
  final TextEditingController? controller;
  final bool obscureText;
  final TextInputType? keyboardType;
  final int maxLines;
  final int? maxLength;
  final String? errorText;
  final List<TextInputFormatter>? inputFormatters;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final height = maxLines == 1 ? 52.0 : null;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label != null) ...[
          Text(label!, style: context.text.labelMd.copyWith(color: colors.ink2)),
          const SizedBox(height: QzSpacing.s2),
        ],
        Container(
          height: height,
          padding: const EdgeInsets.symmetric(
            horizontal: QzSpacing.s7,
            vertical: QzSpacing.s5,
          ),
          decoration: BoxDecoration(
            color: colors.card,
            borderRadius: BorderRadius.circular(QzRadius.lg),
            boxShadow: [
              BoxShadow(
                color: errorText != null ? colors.wrong : colors.line,
                spreadRadius: 0,
                blurRadius: 0,
                offset: const Offset(0, -1.5),
              ),
            ],
          ),
          child: TextField(
            controller: controller,
            obscureText: obscureText,
            keyboardType: keyboardType,
            maxLines: maxLines,
            maxLength: maxLength,
            inputFormatters: inputFormatters,
            onChanged: onChanged,
            onSubmitted: onSubmitted,
            style: context.text.bodyMd.copyWith(color: colors.ink),
            decoration: InputDecoration(
              hintText: hint,
              hintStyle: context.text.bodyMd.copyWith(color: colors.ink3),
              border: InputBorder.none,
              isDense: true,
              contentPadding: EdgeInsets.zero,
              counterText: '',
            ),
          ),
        ),
        if (errorText != null) ...[
          const SizedBox(height: QzSpacing.s3),
          Text(
            errorText!,
            style: context.text.bodySm.copyWith(color: colors.wrong),
          ),
        ],
      ],
    );
  }
}
