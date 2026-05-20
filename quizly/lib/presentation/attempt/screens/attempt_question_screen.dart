import 'package:flutter/material.dart';

import '../../../core/extensions/context_extensions.dart';
import '../../../core/theme/tokens.dart';
import '../../shared/widgets/primary_button.dart';
import '../../shared/widgets/tag_chip.dart';
import '../../shared/widgets/option_tile.dart';
import '../../shared/widgets/progress_segments.dart';
import '../../shared/widgets/confirm_dialog.dart';
import '../../../core/router/route_names.dart';

class AttemptQuestionScreen extends StatefulWidget {
  const AttemptQuestionScreen({super.key});

  @override
  State<AttemptQuestionScreen> createState() => _AttemptQuestionScreenState();
}

class _AttemptQuestionScreenState extends State<AttemptQuestionScreen> {
  int _currentQuestion = 2;
  int _selectedOption = -1;
  final _totalQuestions = 10;
  final _totalSeconds = 60;
  int _secondsLeft = 42;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return Scaffold(
      backgroundColor: colors.paper,
      body: SafeArea(
        child: Column(
          children: [
            _buildTopBar(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: QzSpacing.s9),
              child: ProgressSegments(total: _totalQuestions, current: _currentQuestion),
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: QzSpacing.s9),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: QzSpacing.s5),
                    TagChip(label: 'Science'),
                    const SizedBox(height: QzSpacing.s7),
                    Text(
                      'What is the chemical symbol for gold?',
                      style: context.text.headingLg.copyWith(color: colors.ink),
                    ),
                    const SizedBox(height: QzSpacing.s9),
                    ...List.generate(4, (i) {
                      final labels = ['Au', 'Ag', 'Fe', 'Cu'];
                      return OptionTile(
                        index: i,
                        text: labels[i],
                        isSelected: _selectedOption == i,
                        onTap: () => setState(() => _selectedOption = i),
                      );
                    }),
                  ],
                ),
              ),
            ),
            _buildBottomBar(),
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
              onTap: () => showConfirmDialog(
                context,
                title: 'Exit quiz?',
                body: 'Your progress will be lost.',
                confirmLabel: 'Exit',
                isDestructive: true,
              ),
              child: SizedBox(
                width: 36,
                height: 36,
                child: Icon(Icons.close, size: 20, color: colors.ink),
              ),
            ),
            const SizedBox(width: QzSpacing.s3),
            Text(
              '${_currentQuestion + 1} of $_totalQuestions',
              style: context.text.bodyMd.copyWith(color: colors.ink2),
            ),
            const Spacer(),
            _buildTimerPill(),
          ],
        ),
      ),
    );
  }

  Widget _buildTimerPill() {
    final colors = context.colors;
    final isUrgent = _secondsLeft <= 10;

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
            '${_secondsLeft}s',
            style: const TextStyle(
              fontFamily: 'JetBrainsMono',
              fontSize: 13,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomBar() {
    final colors = context.colors;
    final isLast = _currentQuestion >= _totalQuestions - 1;

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
      child: PrimaryButton(
        label: isLast ? 'Finish' : 'Next',
        onPressed: _selectedOption >= 0
            ? () {
                if (isLast) {
                  Navigator.pushReplacementNamed(context, '/attempt/result/abc123');
                } else {
                  setState(() {
                    _currentQuestion++;
                    _selectedOption = -1;
                  });
                }
              }
            : null,
      ),
    );
  }
}
