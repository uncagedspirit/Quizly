import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/extensions/context_extensions.dart';
import '../../../core/router/route_names.dart';
import '../../../core/theme/tokens.dart';
import '../../../core/theme/qz_theme.dart';
import '../../shared/widgets/primary_button.dart';
import '../../shared/widgets/stat_pill.dart';

class AttemptResultScreen extends StatelessWidget {
  const AttemptResultScreen({super.key, required this.attemptId});

  final String attemptId;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    const score = 8;
    const total = 10;
    const pct = score / total;

    Color bandColor;
    String emoji;
    if (pct >= 0.8) {
      bandColor = const Color(0xFFF9E761);
      emoji = '\u{1F3C6}';
    } else if (pct >= 0.5) {
      bandColor = const Color(0xFFB9CD38);
      emoji = '\u{1F44F}';
    } else {
      bandColor = const Color(0xFFF1A791);
      emoji = '\u{1F4DA}';
    }

    return Scaffold(
      backgroundColor: colors.paper,
      body: SafeArea(
        child: Column(
          children: [
            _buildTopBar(context, colors),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    _buildHeroBand(
                        context, colors, bandColor, emoji, score, total,),
                    Padding(
                      padding:
                          const EdgeInsets.symmetric(horizontal: QzSpacing.s9),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: QzSpacing.s9),
                          _buildStatPills(context, colors),
                          const SizedBox(height: QzSpacing.s9),
                          _buildMiniLeaderboard(context, colors),
                          const SizedBox(height: QzSpacing.s5),
                          _buildSeeFullLeaderboard(context, colors),
                          const SizedBox(height: QzSpacing.s9),
                          _buildQuestionBreakdown(context, colors),
                          const SizedBox(height: QzSpacing.s13),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            _buildBottomRow(context, colors),
          ],
        ),
      ),
    );
  }

  Widget _buildTopBar(BuildContext context, QzTheme colors) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: QzSpacing.s7),
      child: SizedBox(
        height: 52,
        child: Row(
          children: [
            GestureDetector(
              onTap: () => context.go(RouteNames.home),
              child: SizedBox(
                width: 36,
                height: 36,
                child: Icon(Icons.close, size: 20, color: colors.ink),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeroBand(BuildContext context, QzTheme colors, Color bandColor,
      String emoji, int score, int total,) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: QzSpacing.s13),
      decoration: BoxDecoration(color: bandColor.withAlpha(50)),
      child: Column(
        children: [
          Text(emoji, style: const TextStyle(fontSize: 48)),
          const SizedBox(height: QzSpacing.s7),
          Text(
            '$score / $total',
            style: TextStyle(
              fontFamily: 'Geist',
              fontSize: 56,
              fontWeight: FontWeight.w800,
              color: colors.ink,
            ),
          ),
          const SizedBox(height: QzSpacing.s3),
          Text(
            'Great job!',
            style: context.text.headingMd.copyWith(color: colors.ink2),
          ),
        ],
      ),
    );
  }

  Widget _buildStatPills(BuildContext context, QzTheme colors) {
    return const Row(
      children: [
        Expanded(child: StatPill(value: '8', label: 'Correct')),
        SizedBox(width: QzSpacing.s3),
        Expanded(child: StatPill(value: '2', label: 'Wrong')),
        SizedBox(width: QzSpacing.s3),
        Expanded(child: StatPill(value: '#4', label: 'Rank')),
        SizedBox(width: QzSpacing.s3),
        Expanded(child: StatPill(value: '2m 14s', label: 'Time')),
      ],
    );
  }

  Widget _buildMiniLeaderboard(BuildContext context, QzTheme colors) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Leaderboard',
          style: context.text.headingSm.copyWith(color: colors.ink),
        ),
        const SizedBox(height: QzSpacing.s5),
        _buildMiniRow(context, colors, 1, 'Priya', '10/10', '1m 42s'),
        _buildMiniRow(context, colors, 2, 'Rohit', '9/10', '2m 05s'),
        _buildMiniRow(context, colors, 3, 'Simran', '8/10', '1m 58s'),
        _buildMiniRow(context, colors, 4, 'You', '8/10', '2m 14s', isMe: true),
        _buildMiniRow(context, colors, 5, 'Amit', '7/10', '2m 40s'),
      ],
    );
  }

  Widget _buildMiniRow(BuildContext context, QzTheme colors, int rank,
      String name, String score, String time,
      {bool isMe = false,}) {
    final avatarColor = [
      const Color(0xFFF1A791),
      const Color(0xFFF9E761),
      const Color(0xFFE2A50F),
      const Color(0xFF506834),
      const Color(0xFFD77204),
    ][(name.hashCode.abs()) % 5];

    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: QzSpacing.s3,
        horizontal: QzSpacing.s5,
      ),
      margin: const EdgeInsets.only(bottom: QzSpacing.s2),
      decoration: BoxDecoration(
        color: isMe ? colors.paper2 : colors.card,
        borderRadius: BorderRadius.circular(QzRadius.md),
        boxShadow: isMe
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
            width: 24,
            height: 24,
            decoration: BoxDecoration(
              color: avatarColor,
              borderRadius: BorderRadius.circular(QzRadius.sm),
            ),
            alignment: Alignment.center,
            child: Text(
              name[0],
              style: const TextStyle(
                fontFamily: 'Geist',
                fontSize: 11,
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
            ),
          ),
          Text(
            time,
            style: context.text.bodyXs.copyWith(
              fontFamily: 'JetBrainsMono',
              color: colors.ink2,
            ),
          ),
          const SizedBox(width: QzSpacing.s5),
          Text(
            score,
            style: TextStyle(
              fontFamily: 'Geist',
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: colors.ink,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSeeFullLeaderboard(BuildContext context, QzTheme colors) {
    return Center(
      child: GestureDetector(
        onTap: () {},
        child: Text(
          'See full leaderboard',
          style: context.text.bodyMd.copyWith(color: colors.brand),
        ),
      ),
    );
  }

  Widget _buildQuestionBreakdown(BuildContext context, QzTheme colors) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Question Breakdown',
          style: context.text.headingSm.copyWith(color: colors.ink),
        ),
        const SizedBox(height: QzSpacing.s5),
        _buildQRow(context, colors, 0, 'What is the capital of France?', true),
        _buildQRow(context, colors, 1, 'What is 2+2?', true),
        _buildQRow(context, colors, 2, 'Who wrote Romeo and Juliet?', false),
      ],
    );
  }

  Widget _buildQRow(BuildContext context, QzTheme colors, int index,
      String question, bool isCorrect,) {
    return Container(
      padding: const EdgeInsets.all(QzSpacing.s5),
      margin: const EdgeInsets.only(bottom: QzSpacing.s3),
      decoration: BoxDecoration(
        color: colors.card,
        borderRadius: BorderRadius.circular(QzRadius.md),
      ),
      child: Row(
        children: [
          Container(
            width: 24,
            height: 24,
            decoration: BoxDecoration(
              color: isCorrect ? colors.correct : colors.wrong,
              shape: BoxShape.circle,
            ),
            alignment: Alignment.center,
            child: Icon(
              isCorrect ? Icons.check : Icons.close,
              size: 14,
              color: Colors.white,
            ),
          ),
          const SizedBox(width: QzSpacing.s5),
          Expanded(
            child: Text(
              '$index. $question',
              style: context.text.bodySm.copyWith(color: colors.ink),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomRow(BuildContext context, QzTheme colors) {
    return Container(
      padding: const EdgeInsets.only(
        left: QzSpacing.s9,
        right: QzSpacing.s9,
        top: QzSpacing.s5,
        bottom: QzSpacing.s9,
      ),
      decoration: BoxDecoration(
        color: colors.paper,
        boxShadow: [
          BoxShadow(
            color: colors.line,
            spreadRadius: 0,
            blurRadius: 0,
            offset: const Offset(0, -1),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: SecondaryButton(
              label: 'Challenge',
              icon: Icons.bolt,
              onPressed: () {},
            ),
          ),
          const SizedBox(width: QzSpacing.s3),
          Expanded(
            child: PrimaryButton(
              label: 'Share',
              icon: Icons.share,
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}
