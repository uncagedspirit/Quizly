import 'package:flutter/material.dart';

import '../../../core/extensions/context_extensions.dart';
import '../../../core/theme/tokens.dart';
import '../../../core/theme/qz_theme.dart';
import '../../shared/widgets/primary_button.dart';
import '../../shared/widgets/tag_chip.dart';

class ChallengeIntroScreen extends StatelessWidget {
  const ChallengeIntroScreen({super.key, required this.challengeId});

  final String challengeId;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return Scaffold(
      backgroundColor: colors.paper,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: QzSpacing.s9),
          child: Column(
            children: [
              _buildTopBar(context, colors),
              const Spacer(),
              Column(
                children: [
                  const Text(
                    '\u2694\uFE0F',
                    style: TextStyle(fontSize: 64),
                  ),
                  const SizedBox(height: QzSpacing.s7),
                  Text(
                    'Aryan challenged you',
                    style: context.text.headingLg.copyWith(color: colors.ink),
                  ),
                  const SizedBox(height: QzSpacing.s5),
                  Text(
                    'They scored 8 / 10 in 2 minutes 14 seconds. Can you beat them?',
                    style: context.text.bodyMd.copyWith(color: colors.ink2),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: QzSpacing.s11),
                  _buildQuizInfoCard(context, colors),
                ],
              ),
              const Spacer(),
              PrimaryButton(
                label: 'Take the Challenge',
                icon: Icons.bolt,
                onPressed: () {},
              ),
              const SizedBox(height: QzSpacing.s9),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTopBar(BuildContext context, QzTheme colors) {
    return SizedBox(
      height: 52,
      child: Row(
        children: [
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: SizedBox(
              width: 36,
              height: 36,
              child: Icon(Icons.close, size: 20, color: colors.ink),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildQuizInfoCard(BuildContext context, QzTheme colors) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(QzSpacing.s9),
      decoration: BoxDecoration(
        color: colors.card,
        borderRadius: BorderRadius.circular(QzRadius.hero),
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 38,
                height: 38,
                decoration: BoxDecoration(
                  color: const Color(0xFF506834),
                  borderRadius: BorderRadius.circular(QzRadius.sm),
                ),
                alignment: Alignment.center,
                child: const Text(
                  'G',
                  style: TextStyle(
                    fontFamily: 'Geist',
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(width: QzSpacing.s5),
              Expanded(
                child: Text(
                  'General Knowledge Quiz',
                  style: context.text.headingSm.copyWith(color: colors.ink),
                ),
              ),
            ],
          ),
          const SizedBox(height: QzSpacing.s7),
          Text(
            'Test your knowledge across a variety of topics including science, history, and pop culture.',
            style: context.text.bodySm.copyWith(color: colors.ink2),
          ),
          const SizedBox(height: QzSpacing.s7),
          const Wrap(
            spacing: QzSpacing.s3,
            runSpacing: QzSpacing.s3,
            children: [
              TagChip(label: '10 Questions'),
              TagChip(label: '60s per question'),
              TagChip(label: 'Created by Saakshi'),
            ],
          ),
        ],
      ),
    );
  }
}
