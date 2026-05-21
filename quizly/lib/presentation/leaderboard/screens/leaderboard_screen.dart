import 'package:flutter/material.dart';

import '../../../core/extensions/context_extensions.dart';
import '../../../core/theme/tokens.dart';
import '../../../core/theme/qz_theme.dart';
import '../../shared/widgets/stat_pill.dart';

class LeaderboardScreen extends StatelessWidget {
  const LeaderboardScreen({super.key, required this.quizId});

  final String quizId;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return Scaffold(
      backgroundColor: colors.paper,
      body: SafeArea(
        child: Column(
          children: [
            _buildTopBar(context, colors),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: QzSpacing.s9),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'General Knowledge Quiz',
                    style: context.text.headingMd.copyWith(color: colors.ink),
                  ),
                  const SizedBox(height: QzSpacing.s1),
                  Text(
                    '24 attempts',
                    style: context.text.bodyXs.copyWith(color: colors.ink3),
                  ),
                  const SizedBox(height: QzSpacing.s5),
                ],
              ),
            ),
            Expanded(
              child: Stack(
                children: [
                  ListView.separated(
                    padding:
                        const EdgeInsets.symmetric(horizontal: QzSpacing.s9),
                    itemCount: 30,
                    separatorBuilder: (_, __) =>
                        const SizedBox(height: QzSpacing.s2),
                    itemBuilder: (ctx, index) {
                      final rank = index + 1;
                      const names = [
                        'Priya S.', 'Rohit K.', 'Simran D.', 'You', 'Amit P.',
                        'Neha G.', 'Vikram R.', 'Sanya M.', 'Karan B.',
                        'Anju T.', 'Deepak K.', 'Meera J.', 'Ravi S.',
                        'Lata M.', 'Arun V.', 'Sneha P.', 'Mohan L.',
                        'Pooja R.', 'Rajesh G.', 'Kavita D.', 'Suresh T.',
                        'Anita K.', 'Dinesh P.', 'Rekha S.', 'Manoj V.',
                        'Geeta N.', 'Prakash B.', 'Leela R.', 'Hari O.',
                        'Uma J.',
                      ];
                      const scores = [
                        '10/10', '9/10', '8/10', '8/10', '7/10',
                        '7/10', '7/10', '6/10', '6/10', '6/10',
                        '5/10', '5/10', '5/10', '4/10', '4/10',
                        '4/10', '3/10', '3/10', '3/10', '2/10',
                        '2/10', '2/10', '1/10', '1/10', '1/10',
                        '1/10', '0/10', '0/10', '0/10', '0/10',
                      ];
                      const times = [
                        '1m 42s', '2m 05s', '1m 58s', '2m 14s', '2m 40s',
                        '3m 10s', '3m 30s', '2m 50s', '3m 00s', '3m 20s',
                        '4m 10s', '4m 30s', '3m 50s', '4m 00s', '4m 20s',
                        '5m 10s', '5m 30s', '4m 50s', '5m 00s', '5m 20s',
                        '6m 10s', '6m 30s', '5m 50s', '6m 00s', '6m 20s',
                        '7m 10s', '7m 30s', '6m 50s', '7m 00s', '7m 20s',
                      ];
                      return LeaderboardRow(
                        rank: rank,
                        name: names[index],
                        score: scores[index],
                        time: times[index],
                        isCurrentUser: rank == 4,
                      );
                    },
                  ),
                  Positioned(
                    left: 0,
                    right: 0,
                    bottom: 0,
                    child: _buildStickyFooter(context, colors),
                  ),
                ],
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
              child: SizedBox(
                width: 36,
                height: 36,
                child: Icon(Icons.arrow_back, size: 20, color: colors.ink),
              ),
            ),
            const SizedBox(width: QzSpacing.s5),
            Text(
              'Leaderboard',
              style: context.text.headingMd.copyWith(color: colors.ink),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStickyFooter(BuildContext context, QzTheme colors) {
    return Container(
      padding: const EdgeInsets.all(QzSpacing.s5),
      margin: const EdgeInsets.only(
        left: QzSpacing.s9,
        right: QzSpacing.s9,
        bottom: QzSpacing.s5,
      ),
      decoration: BoxDecoration(
        color: colors.card,
        borderRadius: BorderRadius.circular(QzRadius.lg),
        boxShadow: [
          BoxShadow(
            color: colors.ink,
            blurRadius: 0,
            offset: const Offset(0, 0),
          ),
        ],
      ),
      child: Row(
        children: [
          Icon(Icons.emoji_events, size: 18, color: colors.gold),
          const SizedBox(width: QzSpacing.s5),
          Text(
            "You're ranked #4 out of 24",
            style: context.text.bodyMd.copyWith(
              color: colors.ink,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}                  const SizedBox(height: QzSpacing.s5),
                ],
              ),
            ),
            Expanded(
              child: Stack(
                children: [
                  ListView.separated(
                    padding:
                        const EdgeInsets.symmetric(horizontal: QzSpacing.s9),
                    itemCount: 30,
                    separatorBuilder: (_, __) =>
                        const SizedBox(height: QzSpacing.s2),
                    itemBuilder: (ctx, index) {
                      final rank = index + 1;
                      const names = [
                        'Priya S.', 'Rohit K.', 'Simran D.', 'You', 'Amit P.',
                        'Neha G.', 'Vikram R.', 'Sanya M.', 'Karan B.',
                        'Anju T.', 'Deepak K.', 'Meera J.', 'Ravi S.',
                        'Lata M.', 'Arun V.', 'Sneha P.', 'Mohan L.',
                        'Pooja R.', 'Rajesh G.', 'Kavita D.', 'Suresh T.',
                        'Anita K.', 'Dinesh P.', 'Rekha S.', 'Manoj V.',
                        'Geeta N.', 'Prakash B.', 'Leela R.', 'Hari O.',
                        'Uma J.',
                      ];
                      const scores = [
                        '10/10', '9/10', '8/10', '8/10', '7/10',
                        '7/10', '7/10', '6/10', '6/10', '6/10',
                        '5/10', '5/10', '5/10', '4/10', '4/10',
                        '4/10', '3/10', '3/10', '3/10', '2/10',
                        '2/10', '2/10', '1/10', '1/10', '1/10',
                        '1/10', '0/10', '0/10', '0/10', '0/10',
                      ];
                      const times = [
                        '1m 42s', '2m 05s', '1m 58s', '2m 14s', '2m 40s',
                        '3m 10s', '3m 30s', '2m 50s', '3m 00s', '3m 20s',
                        '4m 10s', '4m 30s', '3m 50s', '4m 00s', '4m 20s',
                        '5m 10s', '5m 30s', '4m 50s', '5m 00s', '5m 20s',
                        '6m 10s', '6m 30s', '5m 50s', '6m 00s', '6m 20s',
                        '7m 10s', '7m 30s', '6m 50s', '7m 00s', '7m 20s',
                      ];
                      return LeaderboardRow(
                        rank: rank,
                        name: names[index],
                        score: scores[index],
                        time: times[index],
                        isCurrentUser: rank == 4,
                      );
                    },
                  ),
                  Positioned(
                    left: 0,
                    right: 0,
                    bottom: 0,
                    child: _buildStickyFooter(context, colors),
                  ),
                ],
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
            Text(
              'Leaderboard',
              style: context.text.headingMd.copyWith(color: colors.ink),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStickyFooter(BuildContext context, QzTheme colors) {
    return Container(
      padding: const EdgeInsets.all(QzSpacing.s5),
      margin: const EdgeInsets.only(
        left: QzSpacing.s9,
        right: QzSpacing.s9,
        bottom: QzSpacing.s5,
      ),
      decoration: BoxDecoration(
        color: colors.card,
        borderRadius: BorderRadius.circular(QzRadius.lg),
        boxShadow: [
          BoxShadow(
            color: colors.ink,
            blurRadius: 0,
            offset: const Offset(0, 0),
          ),
        ],
      ),
      child: Row(
        children: [
          Icon(Icons.emoji_events, size: 18, color: colors.gold),
          const SizedBox(width: QzSpacing.s5),
          Text(
            "You're ranked #4 out of 24",
            style: context.text.bodyMd.copyWith(
              color: colors.ink,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
