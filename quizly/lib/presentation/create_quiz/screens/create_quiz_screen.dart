import 'package:flutter/material.dart';

import '../../../core/extensions/context_extensions.dart';
import '../../../core/theme/tokens.dart';
import '../../shared/widgets/primary_button.dart';
import '../../shared/widgets/app_text_field.dart';
import '../../shared/widgets/tag_chip.dart';

class CreateQuizScreen extends StatefulWidget {
  const CreateQuizScreen({super.key});

  @override
  State<CreateQuizScreen> createState() => _CreateQuizScreenState();
}

class _CreateQuizScreenState extends State<CreateQuizScreen> {
  bool _isAnonymous = false;
  int _revealMode = 0;
  int _timerIndex = 0;
  int _deadlineIndex = 0;
  final List<String> _questions = [];

  final _revealModes = ['After Submit', 'After Quiz Closes', 'Never'];
  final _timerOptions = ['No timer', '30s / Q', '60s / Q', '120s / Q'];
  final _deadlineOptions = ['No deadline', '1 hour', '6 hours', '24 hours', '3 days'];

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
                    AppTextField(
                      label: 'Quiz Title',
                      hint: 'Enter a catchy title',
                      maxLength: 80,
                    ),
                    const SizedBox(height: QzSpacing.s7),
                    AppTextField(
                      label: 'Description',
                      hint: 'What is this quiz about?',
                      maxLines: 3,
                      maxLength: 200,
                    ),
                    const SizedBox(height: QzSpacing.s9),
                    _buildSettingsSection(),
                    const SizedBox(height: QzSpacing.s9),
                    _buildQuestionsSection(),
                    const SizedBox(height: QzSpacing.s13),
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
              onTap: () => Navigator.pop(context),
              child: SizedBox(
                width: 36,
                height: 36,
                child: Icon(Icons.arrow_back, size: 20, color: colors.ink),
              ),
            ),
            const SizedBox(width: QzSpacing.s5),
            Expanded(
              child: Text(
                'New Quiz',
                style: context.text.headingMd.copyWith(color: colors.ink),
              ),
            ),
            TextButtonLink(label: 'Save draft', onPressed: () {}),
          ],
        ),
      ),
    );
  }

  Widget _buildSettingsSection() {
    final colors = context.colors;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Settings',
          style: context.text.headingSm.copyWith(color: colors.ink),
        ),
        const SizedBox(height: QzSpacing.s7),
        Container(
          padding: const EdgeInsets.all(QzSpacing.s7),
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
              _buildToggleRow('Anonymous Mode'),
              const SizedBox(height: QzSpacing.s5),
              _buildChipPicker('Reveal Mode', _revealModes, _revealMode,
                  (i) => setState(() => _revealMode = i)),
              const SizedBox(height: QzSpacing.s5),
              _buildChipPicker('Timer', _timerOptions, _timerIndex,
                  (i) => setState(() => _timerIndex = i)),
              const SizedBox(height: QzSpacing.s5),
              _buildChipPicker('Deadline', _deadlineOptions, _deadlineIndex,
                  (i) => setState(() => _deadlineIndex = i)),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildToggleRow(String label) {
    final colors = context.colors;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: context.text.bodyMd.copyWith(color: colors.ink)),
        GestureDetector(
          onTap: () => setState(() => _isAnonymous = !_isAnonymous),
          child: Container(
            width: 44,
            height: 26,
            padding: const EdgeInsets.all(3),
            decoration: BoxDecoration(
              color: _isAnonymous ? colors.brand : colors.ink4,
              borderRadius: BorderRadius.circular(13),
            ),
            child: AnimatedAlign(
              alignment: _isAnonymous
                  ? Alignment.centerRight
                  : Alignment.centerLeft,
              duration: QzDur.fast,
              child: Container(
                width: 20,
                height: 20,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildChipPicker(
      String label, List<String> options, int selected, ValueChanged<int> onSelect) {
    final colors = context.colors;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: context.text.labelMd.copyWith(color: colors.ink2),
        ),
        const SizedBox(height: QzSpacing.s3),
        Wrap(
          spacing: QzSpacing.s3,
          runSpacing: QzSpacing.s3,
          children: List.generate(options.length, (i) {
            final isSelected = i == selected;
            return GestureDetector(
              onTap: () => onSelect(i),
              child: Container(
                padding: const EdgeInsets.symmetric(
                  vertical: QzSpacing.s3,
                  horizontal: QzSpacing.s5,
                ),
                decoration: BoxDecoration(
                  color: isSelected ? colors.brand : colors.paper,
                  borderRadius: BorderRadius.circular(QzRadius.md),
                  boxShadow: isSelected
                      ? [
                          BoxShadow(
                            color: colors.brandInk,
                            spreadRadius: 0,
                            blurRadius: 0,
                            offset: const Offset(0, 1),
                          ),
                        ]
                      : [
                          BoxShadow(
                            color: colors.line,
                            spreadRadius: 0,
                            blurRadius: 0,
                            offset: const Offset(0, -1.5),
                          ),
                        ],
                ),
                child: Text(
                  options[i],
                  style: context.text.bodySm.copyWith(
                    color: isSelected ? colors.brandInk : colors.ink,
                  ),
                ),
              ),
            );
          }),
        ),
      ],
    );
  }

  Widget _buildQuestionsSection() {
    final colors = context.colors;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Questions',
              style: context.text.headingSm.copyWith(color: colors.ink),
            ),
            Text(
              '${_questions.length} added',
              style: context.text.bodyXs.copyWith(color: colors.ink3),
            ),
          ],
        ),
        const SizedBox(height: QzSpacing.s7),
        ..._questions.map((q) => _buildQuestionPill(q)),
        GestureDetector(
          onTap: _onAddQuestion,
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(QzSpacing.s7),
            decoration: BoxDecoration(
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
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.add, size: 18, color: colors.ink2),
                const SizedBox(width: QzSpacing.s3),
                Text(
                  'Add Question',
                  style: context.text.bodyMd.copyWith(color: colors.ink2),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildQuestionPill(String text) {
    final colors = context.colors;

    return Container(
      padding: const EdgeInsets.all(QzSpacing.s5),
      margin: const EdgeInsets.only(bottom: QzSpacing.s3),
      decoration: BoxDecoration(
        color: colors.card,
        borderRadius: BorderRadius.circular(QzRadius.md),
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
          Expanded(
            child: Text(
              text,
              style: context.text.bodyMd.copyWith(color: colors.ink),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() => _questions.remove(text));
            },
            child: Icon(Icons.close, size: 16, color: colors.ink3),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomBar() {
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
      child: PrimaryButton(label: 'Publish & Get Code', onPressed: _questions.isNotEmpty ? () {} : null),
    );
  }

  void _onAddQuestion() {
    Navigator.pushNamed(context, '/quiz/create/question').then((result) {
      if (result != null && mounted) {
        setState(() => _questions.add(result.toString()));
      }
    });
  }
}
