import 'package:flutter/material.dart';

import '../../../core/theme/tokens.dart';
import '../../../core/extensions/context_extensions.dart';

class ProgressSegments extends StatelessWidget {
  const ProgressSegments({
    super.key,
    required this.total,
    required this.current,
  });

  final int total;
  final int current;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return Row(
      children: List.generate(total, (index) {
        final isDone = index < current;
        final isCurrent = index == current;

        return Expanded(
          child: Container(
            height: 3,
            margin: EdgeInsets.only(right: index < total - 1 ? 4 : 0),
            decoration: BoxDecoration(
              color: isDone
                  ? colors.ink
                  : isCurrent
                      ? colors.ink
                      : colors.ink4,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
        );
      }),
    );
  }
}

class TimerPill extends StatelessWidget {
  const TimerPill({
    super.key,
    required this.seconds,
    required this.totalSeconds,
  });

  final int seconds;
  final int totalSeconds;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    // ignore: unused_local_variable
    final isUrgent = seconds <= 5;

    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: QzSpacing.s4,
        vertical: QzSpacing.s2,
      ),
      decoration: BoxDecoration(
        color: isUrgent ? colors.wrong.withAlpha(30) : colors.card,
        borderRadius: BorderRadius.circular(QzRadius.xs),
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
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.timer_outlined,
            size: 14,
            color: isUrgent ? colors.wrong : colors.ink2,
          ),
          const SizedBox(width: 4),
          Text(
            '${seconds}s',
            style: TextStyle(
              fontFamily: 'JetBrainsMono',
              fontSize: 13,
              fontWeight: FontWeight.w600,
              color: isUrgent ? colors.wrong : colors.ink,
            ),
          ),
        ],
      ),
    );
  }
}
