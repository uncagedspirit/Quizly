import 'package:flutter/material.dart';

import '../../core/theme/tokens.dart';
import '../../core/extensions/context_extensions.dart';

class OptionTile extends StatelessWidget {
  const OptionTile({
    super.key,
    required this.index,
    required this.text,
    this.isSelected = false,
    this.isCorrect = false,
    this.isWrong = false,
    this.onTap,
  });

  final int index;
  final String text;
  final bool isSelected;
  final bool isCorrect;
  final bool isWrong;
  final VoidCallback? onTap;

  String get _letter => String.fromCharCode(65 + index);

  Color get _letterColor {
    final colors = [
      const Color(0xFFF1A791),
      const Color(0xFFF9E761),
      const Color(0xFFE2A50F),
      const Color(0xFF506834),
    ];
    return colors[index % colors.length];
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    Color bg = colors.card;
    if (isCorrect) bg = colors.correct.withAlpha(30);
    if (isWrong) bg = colors.wrong.withAlpha(30);

    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(QzSpacing.s6),
        margin: const EdgeInsets.only(bottom: QzSpacing.s3),
        decoration: BoxDecoration(
          color: bg,
          borderRadius: BorderRadius.circular(QzRadius.lg),
          boxShadow: [
            if (isSelected)
              BoxShadow(
                color: colors.ink,
                spreadRadius: 0,
                blurRadius: 0,
                offset: const Offset(0, -2.5),
              )
            else
              BoxShadow(
                color: colors.line,
                spreadRadius: 0,
                blurRadius: 0,
                offset: const Offset(0, 1),
              ),
          ],
        ),
        child: Row(
          children: [
            Container(
              width: 36,
              height: 36,
              decoration: BoxDecoration(
                color: _letterColor,
                borderRadius: BorderRadius.circular(QzRadius.sm),
              ),
              alignment: Alignment.center,
              child: Text(
                _letter,
                style: const TextStyle(
                  fontFamily: 'Geist',
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(width: QzSpacing.s6),
            Expanded(
              child: Text(
                text,
                style: context.text.headingSm.copyWith(color: colors.ink),
              ),
            ),
            if (isSelected)
              Container(
                width: 22,
                height: 22,
                decoration: BoxDecoration(
                  color: colors.ink,
                  shape: BoxShape.circle,
                ),
                child: Icon(Icons.check, size: 14, color: colors.card),
              ),
          ],
        ),
      ),
    );
  }
}
