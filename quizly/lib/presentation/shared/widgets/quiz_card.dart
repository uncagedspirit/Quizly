import 'package:flutter/material.dart';

import '../../core/theme/tokens.dart';
import '../../core/extensions/context_extensions.dart';
import '../../../domain/models/quiz.dart';

class QuizCard extends StatelessWidget {
  const QuizCard({
    super.key,
    required this.quiz,
    this.onTap,
    this.onLongPress,
  });

  final Quiz quiz;
  final VoidCallback? onTap;
  final VoidCallback? onLongPress;

  Color get _blockColor {
    final colors = [
      const Color(0xFFF1A791),
      const Color(0xFFF9E761),
      const Color(0xFFE2A50F),
      const Color(0xFF506834),
      const Color(0xFFD77204),
    ];
    return colors[quiz.title.hashCode.abs() % colors.length];
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return GestureDetector(
      onTap: onTap,
      onLongPress: onLongPress,
      child: Container(
        padding: const EdgeInsets.symmetric(
          vertical: QzSpacing.s5,
          horizontal: QzSpacing.s6,
        ),
        decoration: BoxDecoration(
          color: colors.card,
          borderRadius: BorderRadius.circular(QzRadius.lg),
          boxShadow: [
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
              width: 38,
              height: 38,
              decoration: BoxDecoration(
                color: _blockColor,
                borderRadius: BorderRadius.circular(QzRadius.sm),
              ),
              alignment: Alignment.center,
              child: Text(
                quiz.title.isNotEmpty ? quiz.title[0].toUpperCase() : '?',
                style: const TextStyle(
                  fontFamily: 'Geist',
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(width: QzSpacing.s5),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    quiz.title,
                    style: context.text.bodyMd.copyWith(
                      fontWeight: FontWeight.w600,
                      color: colors.ink,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 2),
                  Text(
                    '${quiz.questionCount} questions',
                    style: context.text.bodyXs.copyWith(color: colors.ink3),
                  ),
                ],
              ),
            ),
            if (quiz.stats.attemptCount > 0)
              Text(
                '${quiz.stats.attemptCount}',
                style: TextStyle(
                  fontFamily: 'Geist',
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                  color: colors.ink,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
