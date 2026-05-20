import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../core/extensions/context_extensions.dart';
import '../../../core/theme/tokens.dart';
import '../../../core/theme/qz_theme.dart';
import '../../shared/widgets/stat_pill.dart';
import '../../shared/widgets/tag_chip.dart';
import '../../shared/widgets/confirm_dialog.dart';

class QuizDetailScreen extends StatelessWidget {
  const QuizDetailScreen({super.key, required this.quizId});

  final String quizId;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    const code = 'A7XK9M';

    return Scaffold(
      backgroundColor: colors.paper,
      body: SafeArea(
        child: Column(
          children: [
            _buildTopBar(context, colors),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: QzSpacing.s9),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: QzSpacing.s5),
                    _buildCodeShareRow(context, colors, code),
                    const SizedBox(height: QzSpacing.s9),
                    _buildStatsRow(),
                    const SizedBox(height: QzSpacing.s9),
                    _buildHardestQuestion(context, colors),
                    const SizedBox(height: QzSpacing.s9),
                    _buildMiniLeaderboard(context, colors),
                    const SizedBox(height: QzSpacing.s9),
                    _buildDangerZone(context, colors),
                    const SizedBox(height: QzSpacing.s13),
                  ],
                ),
              ),
            ),
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
              onTap: () => Navigator.pop(context),
              child: const SizedBox(
                width: 36,
                height: 36,
                child: Icon(Icons.arrow_back, size: 20),
              ),
            ),
            const SizedBox(width: QzSpacing.s5),
            Expanded(
              child: Text(
                'General Knowledge Quiz',
                style: context.text.headingMd.copyWith(color: colors.ink),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            GestureDetector(
              onTap: () {},
              child: const SizedBox(
                width: 36,
                height: 36,
                child: Icon(Icons.more_vert, size: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCodeShareRow(
      BuildContext context, QzTheme colors, String code) {
    return Row(
      children: [
        Expanded(
          child: GestureDetector(
            onTap: () {
              Clipboard.setData(ClipboardData(text: code));
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Code copied!', style: context.text.bodyMd),
                  backgroundColor: colors.ink,
                  duration: const Duration(seconds: 1),
                ),
              );
            },
            child: Container(
              padding: const EdgeInsets.symmetric(
                vertical: QzSpacing.s3,
                horizontal: QzSpacing.s5,
              ),
              decoration: BoxDecoration(
                color: colors.card,
                borderRadius: BorderRadius.circular(QzRadius.md),
                boxShadow: [
                  BoxShadow(
                    color: colors.line,
                    blurRadius: 0,
                    offset: const Offset(0, 1),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Icon(Icons.tag, size: 16, color: colors.ink2),
                  const SizedBox(width: QzSpacing.s3),
                  Text(
                    code,
                    style: context.text.monoSm.copyWith(color: colors.ink),
                  ),
                  const Spacer(),
                  Icon(Icons.copy, size: 14, color: colors.ink3),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(width: QzSpacing.s3),
        GestureDetector(
          onTap: () {},
          child: Container(
            padding: const EdgeInsets.all(QzSpacing.s5),
            decoration: BoxDecoration(
              color: colors.card,
              borderRadius: BorderRadius.circular(QzRadius.md),
              boxShadow: [
                BoxShadow(
                  color: colors.line,
                  blurRadius: 0,
                  offset: const Offset(0, 1),
                ),
              ],
            ),
            child: Icon(Icons.share, size: 18, color: colors.ink),
          ),
        ),
      ],
    );
  }

  Widget _buildStatsRow() {
    return const Row(
      children: [
        Expanded(child: StatPill(value: '86', label: 'Attempts')),
        SizedBox(width: QzSpacing.s3),
        Expanded(child: StatPill(value: '68%', label: 'Avg Score')),
        SizedBox(width: QzSpacing.s3),
        Expanded(child: StatPill(value: '#12', label: 'Today')),
        SizedBox(width: QzSpacing.s3),
        Expanded(child: StatPill(value: '3m 24s', label: 'Avg Time')),
      ],
    );
  }

  Widget _buildHardestQuestion(BuildContext context, QzTheme colors) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Hardest Question',
          style: context.text.headingSm.copyWith(color: colors.ink),
        ),
        const SizedBox(height: QzSpacing.s5),
        Container(
          padding: const EdgeInsets.all(QzSpacing.s7),
          decoration: BoxDecoration(
            color: colors.card,
            borderRadius: BorderRadius.circular(QzRadius.lg),
            boxShadow: [
              BoxShadow(
                color: colors.line,
                blurRadius: 0,
                offset: const Offset(0, 1),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'What is the rarest blood type?',
                style: context.text.bodyMd.copyWith(color: colors.ink),
              ),
              const SizedBox(height: QzSpacing.s5),
              const Row(
                children: [TagChip(label: 'Only 12% correct')],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildMiniLeaderboard(BuildContext context, QzTheme colors) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Top Players',
              style: context.text.headingSm.copyWith(color: colors.ink),
            ),
            GestureDetector(
              onTap: () {},
              child: Text(
                'View all',
                style: context.text.bodySm.copyWith(color: colors.brand),
              ),
            ),
          ],
        ),
        const SizedBox(height: QzSpacing.s5),
        _buildLeaderRow(context, colors, 1, 'Priya S.', '10/10', '1m 42s'),
        _buildLeaderRow(context, colors, 2, 'Rohit K.', '9/10', '2m 05s'),
        _buildLeaderRow(context, colors, 3, 'Simran D.', '8/10', '1m 58s'),
        _buildLeaderRow(context, colors, 4, 'Amit P.', '7/10', '2m 40s'),
        _buildLeaderRow(context, colors, 5, 'Neha G.', '7/10', '3m 10s'),
      ],
    );
  }

  Widget _buildLeaderRow(BuildContext context, QzTheme colors, int rank,
      String name, String score, String time) {
    final avatarColor = const [
      Color(0xFFF1A791),
      Color(0xFFF9E761),
      Color(0xFFE2A50F),
      Color(0xFF506834),
      Color(0xFFD77204),
    ][name.hashCode.abs() % 5];

    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: QzSpacing.s3,
        horizontal: QzSpacing.s5,
      ),
      margin: const EdgeInsets.only(bottom: QzSpacing.s2),
      decoration: BoxDecoration(
        color: colors.card,
        borderRadius: BorderRadius.circular(QzRadius.md),
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
            style: const TextStyle(
              fontFamily: 'Geist',
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDangerZone(BuildContext context, QzTheme colors) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Danger Zone',
          style: context.text.headingSm.copyWith(color: colors.wrong),
        ),
        const SizedBox(height: QzSpacing.s5),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(QzRadius.lg),
            boxShadow: [
              BoxShadow(
                color: colors.wrong.withAlpha(40),
                blurRadius: 0,
                offset: const Offset(0, -1.5),
              ),
            ],
          ),
          child: Column(
            children: [
              _buildDangerAction(context, colors, 'Edit Quiz',
                  Icons.edit_outlined, () {}),
              _buildDangerAction(context, colors, 'Close Quiz',
                  Icons.lock_outline, () {}),
              _buildDangerAction(context, colors, 'Delete Quiz',
                  Icons.delete_outline, () {
                showConfirmDialog(
                  context,
                  title: 'Delete Quiz?',
                  body: 'This action cannot be undone.',
                  confirmLabel: 'Delete',
                  isDestructive: true,
                );
              }),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildDangerAction(BuildContext context, QzTheme colors,
      String label, IconData icon, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(
          vertical: QzSpacing.s6,
          horizontal: QzSpacing.s7,
        ),
        decoration: BoxDecoration(
          color: colors.card,
          border: Border(
            bottom: BorderSide(color: colors.line, width: 1),
          ),
        ),
        child: Row(
          children: [
            Icon(icon, size: 18, color: colors.ink2),
            const SizedBox(width: QzSpacing.s5),
            Text(
              label,
              style: context.text.bodyMd.copyWith(color: colors.ink),
            ),
            const Spacer(),
            Icon(Icons.chevron_right, size: 18, color: colors.ink3),
          ],
        ),
      ),
    );
  }
}
