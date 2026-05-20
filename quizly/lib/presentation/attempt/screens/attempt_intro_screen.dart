import 'package:flutter/material.dart';

import '../../../core/extensions/context_extensions.dart';
import '../../../core/theme/tokens.dart';
import '../../shared/widgets/primary_button.dart';
import '../../shared/widgets/app_text_field.dart';
import '../../shared/widgets/tag_chip.dart';

class AttemptIntroScreen extends StatelessWidget {
  const AttemptIntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return Scaffold(
      backgroundColor: colors.paper,
      body: SafeArea(
        child: Column(
          children: [
            _buildTopBar(),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: QzSpacing.s9),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: QzSpacing.s9),
                    _buildQuizInfoCard(),
                    const SizedBox(height: QzSpacing.s9),
                    _buildCreatedBy(),
                    const SizedBox(height: QzSpacing.s9),
                    _buildNameInput(),
                    const SizedBox(height: QzSpacing.s7),
                    _buildDeadlineCountdown(),
                  ],
                ),
              ),
            ),
            _buildBottomButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildTopBar() {
    final colors = context.colors;

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
          ],
        ),
      ),
    );
  }

  Widget _buildQuizInfoCard() {
    final colors = context.colors;

    return Container(
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
          Text(
            '\u{1F3B2}',
            style: const TextStyle(fontSize: 40),
          ),
          const SizedBox(height: QzSpacing.s5),
          Text(
            'General Knowledge Quiz',
            style: context.text.headingLg.copyWith(color: colors.ink),
          ),
          const SizedBox(height: QzSpacing.s3),
          Text(
            'Test your knowledge across a variety of topics including science, history, and pop culture.',
            style: context.text.bodyMd.copyWith(color: colors.ink2),
          ),
          const SizedBox(height: QzSpacing.s7),
          Row(
            children: [
              TagChip(label: '10 Questions'),
              const SizedBox(width: QzSpacing.s3),
              TagChip(label: '60s per question'),
              const SizedBox(width: QzSpacing.s3),
              TagChip(label: 'MCQ'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCreatedBy() {
    final colors = context.colors;

    return Row(
      children: [
        Container(
          width: 28,
          height: 28,
          decoration: BoxDecoration(
            color: const Color(0xFFF1A791),
            borderRadius: BorderRadius.circular(QzRadius.sm),
          ),
          alignment: Alignment.center,
          child: const Text(
            'S',
            style: TextStyle(
              fontFamily: 'Geist',
              fontSize: 12,
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
          ),
        ),
        const SizedBox(width: QzSpacing.s5),
        Text(
          'Created by Saakshi',
          style: context.text.bodyMd.copyWith(color: colors.ink2),
        ),
      ],
    );
  }

  Widget _buildNameInput() {
    final colors = context.colors;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Your display name',
          style: context.text.labelMd.copyWith(color: colors.ink2),
        ),
        const SizedBox(height: QzSpacing.s3),
        AppTextField(
          hint: 'Enter your name',
          maxLength: 30,
        ),
      ],
    );
  }

  Widget _buildDeadlineCountdown() {
    final colors = context.colors;

    return Row(
      children: [
        Icon(Icons.access_time, size: 16, color: colors.warm),
        const SizedBox(width: QzSpacing.s3),
        Text(
          'Closes in 3 hours',
          style: context.text.bodyMd.copyWith(color: colors.warm),
        ),
      ],
    );
  }

  Widget _buildBottomButton() {
    final colors = context.colors;

    return Container(
      padding: EdgeInsets.only(
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
      child: PrimaryButton(label: 'Start Quiz', onPressed: () {}),
    );
  }
}
