import 'package:flutter/material.dart';

import '../../core/theme/tokens.dart';
import '../../core/extensions/context_extensions.dart';

class TagChip extends StatelessWidget {
  const TagChip({
    super.key,
    required this.label,
    this.color,
    this.outlined = false,
  });

  final String label;
  final Color? color;
  final bool outlined;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final bg = color ?? colors.ink4;

    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: QzSpacing.s1,
        horizontal: QzSpacing.s3,
      ),
      decoration: BoxDecoration(
        color: outlined ? Colors.transparent : bg,
        borderRadius: BorderRadius.circular(QzRadius.xs),
        boxShadow: outlined
            ? [
                BoxShadow(
                  color: colors.ink,
                  spreadRadius: 0,
                  blurRadius: 0,
                  offset: const Offset(0, -1.5),
                ),
              ]
            : null,
      ),
      child: Text(
        label,
        style: context.text.labelSm.copyWith(
          color: outlined ? colors.ink : colors.ink,
        ),
      ),
    );
  }
}
