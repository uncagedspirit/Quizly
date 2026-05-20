import 'package:flutter/material.dart';

import '../../../core/theme/tokens.dart';
import '../../../core/extensions/context_extensions.dart';

class StatPill extends StatelessWidget {
  const StatPill({
    super.key,
    required this.value,
    required this.label,
    this.color,
  });

  final String value;
  final String label;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final tint = color ?? colors.ink;

    return Container(
      padding: const EdgeInsets.all(QzSpacing.s5),
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
      child: Column(
        children: [
          Text(
            value,
            style: TextStyle(
              fontFamily: 'Geist',
              fontSize: 24,
              fontWeight: FontWeight.w600,
              color: tint,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            label,
            style: context.text.overline.copyWith(color: colors.ink3),
          ),
        ],
      ),
    );
  }
}

class LeaderboardRow extends StatelessWidget {
  const LeaderboardRow({
    super.key,
    required this.rank,
    required this.name,
    required this.score,
    required this.time,
    this.isCurrentUser = false,
  });

  final int rank;
  final String name;
  final String score;
  final String time;
  final bool isCurrentUser;

  Color get _avatarColor {
    final colors = [
      const Color(0xFFF1A791),
      const Color(0xFFF9E761),
      const Color(0xFFE2A50F),
      const Color(0xFF506834),
      const Color(0xFFD77204),
    ];
    return colors[name.hashCode.abs() % colors.length];
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: QzSpacing.s3,
        horizontal: QzSpacing.s5,
      ),
      decoration: BoxDecoration(
        color: isCurrentUser ? colors.paper2 : colors.card,
        borderRadius: BorderRadius.circular(QzRadius.md),
        boxShadow: isCurrentUser
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
      child: Row(
        children: [
          SizedBox(
            width: 26,
            child: Text(
              '$rank',
              style: context.text.bodyMd.copyWith(
                fontWeight: FontWeight.w700,
                color: colors.ink,
              ),
            ),
          ),
          const SizedBox(width: QzSpacing.s5),
          Container(
            width: 28,
            height: 28,
            decoration: BoxDecoration(
              color: _avatarColor,
              borderRadius: BorderRadius.circular(QzRadius.sm),
            ),
            alignment: Alignment.center,
            child: Text(
              name.isNotEmpty ? name[0].toUpperCase() : '?',
              style: const TextStyle(
                fontFamily: 'Geist',
                fontSize: 12,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(width: QzSpacing.s5),
          Expanded(
            child: Text(
              name,
              style: context.text.bodyMd.copyWith(color: colors.ink),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Text(
            time,
            style: context.text.bodyXs.copyWith(
              fontFamily: 'JetBrainsMono',
              color: colors.ink2,
            ),
          ),
          const SizedBox(width: QzSpacing.s7),
          Text(
            score,
            style: TextStyle(
              fontFamily: 'Geist',
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: colors.ink,
            ),
          ),
        ],
      ),
    );
  }
}
