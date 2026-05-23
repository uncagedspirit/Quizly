import 'package:flutter/material.dart';

import '../../../core/extensions/context_extensions.dart';
import '../../../core/theme/tokens.dart';
import '../../shared/widgets/primary_button.dart';
import '../../shared/widgets/app_text_field.dart';

class AddQuestionScreen extends StatefulWidget {
  const AddQuestionScreen({super.key});

  @override
  State<AddQuestionScreen> createState() => _AddQuestionScreenState();
}

class _AddQuestionScreenState extends State<AddQuestionScreen> {
  int _questionType = 0;
  final _questionController = TextEditingController();
  final _optionControllers = List.generate(4, (_) => TextEditingController());
  final _explanationController = TextEditingController();
  int _correctIndex = 0;

  final _types = ['MCQ', 'True / False'];

  @override
  void dispose() {
    _questionController.dispose();
    _explanationController.dispose();
    for (final c in _optionControllers) {
      c.dispose();
    }
    super.dispose();
  }

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
                    _buildTypeSelector(),
                    const SizedBox(height: QzSpacing.s7),
                    AppTextField(
                      label: 'Question',
                      hint: 'Enter your question',
                      controller: _questionController,
                      maxLines: 3,
                      maxLength: 300,
                    ),
                    const SizedBox(height: QzSpacing.s9),
                    _buildOptionsSection(),
                    const SizedBox(height: QzSpacing.s9),
                    AppTextField(
                      label: 'Explanation (optional)',
                      hint: 'Helpful hint after answering',
                      controller: _explanationController,
                      maxLines: 2,
                    ),
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
                'Question',
                style: context.text.headingMd.copyWith(color: colors.ink),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pop(context, _questionController.text);
              },
              child: Text(
                'Save',
                style: context.text.labelMd.copyWith(color: colors.brand),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTypeSelector() {
    final colors = context.colors;

    return Row(
      children: List.generate(_types.length, (i) {
        final isSelected = i == _questionType;
        return Expanded(
          child: GestureDetector(
            onTap: () => setState(() => _questionType = i),
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: QzSpacing.s4),
              margin: EdgeInsets.only(right: i == 0 ? QzSpacing.s3 : 0),
              decoration: BoxDecoration(
                color: isSelected ? colors.ink : colors.card,
                borderRadius: BorderRadius.circular(QzRadius.sm),
                boxShadow: [
                  if (isSelected)
                    BoxShadow(
                      color: colors.paper,
                      spreadRadius: 0,
                      blurRadius: 0,
                      offset: const Offset(0, -1.5),
                    ),
                ],
              ),
              alignment: Alignment.center,
              child: Text(
                _types[i],
                style: context.text.labelMd.copyWith(
                  color: isSelected ? colors.paper : colors.ink2,
                ),
              ),
            ),
          ),
        );
      }),
    );
  }

  Widget _buildOptionsSection() {
    final colors = context.colors;
    final optionCount = _questionType == 1 ? 2 : 4;
    final letterColors = [
      const Color(0xFFF1A791),
      const Color(0xFFF9E761),
      const Color(0xFFE2A50F),
      const Color(0xFF506834),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Options',
          style: context.text.headingSm.copyWith(color: colors.ink),
        ),
        const SizedBox(height: QzSpacing.s3),
        Text(
          'Tap the letter to mark correct',
          style: context.text.bodyXs.copyWith(color: colors.ink3),
        ),
        const SizedBox(height: QzSpacing.s5),
        ...List.generate(optionCount, (i) {
          final isCorrect = i == _correctIndex;
          final letter = String.fromCharCode(65 + i);

          return Container(
            padding: const EdgeInsets.all(QzSpacing.s3),
            margin: const EdgeInsets.only(bottom: QzSpacing.s3),
            decoration: BoxDecoration(
              color: colors.card,
              borderRadius: BorderRadius.circular(QzRadius.lg),
              boxShadow: [
                BoxShadow(
                  color: isCorrect ? colors.ink : colors.line,
                  spreadRadius: 0,
                  blurRadius: 0,
                  offset: Offset(0, isCorrect ? -2.5 : 1),
                ),
              ],
            ),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () => setState(() => _correctIndex = i),
                  child: Container(
                    width: 36,
                    height: 36,
                    decoration: BoxDecoration(
                      color: letterColors[i % letterColors.length],
                      borderRadius: BorderRadius.circular(QzRadius.sm),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      letter,
                      style: const TextStyle(
                        fontFamily: 'Geist',
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: QzSpacing.s5),
                Expanded(
                  child: TextField(
                    controller: _optionControllers[i],
                    style: context.text.bodyMd.copyWith(color: colors.ink),
                    decoration: InputDecoration(
                      hintText: 'Option $letter',
                      hintStyle: context.text.bodyMd.copyWith(color: colors.ink3),
                      border: InputBorder.none,
                      isDense: true,
                      contentPadding: EdgeInsets.zero,
                    ),
                  ),
                ),
                if (isCorrect)
                  Container(
                    width: 22,
                    height: 22,
                    decoration: BoxDecoration(
                      color: colors.brand,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(Icons.check, size: 14, color: colors.brandInk),
                  ),
              ],
            ),
          );
        }),
      ],
    );
  }

  Widget _buildBottomBar() {
    final colors = context.colors;
    final canSave = _questionController.text.isNotEmpty;

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
      child: PrimaryButton(
        label: 'Save Question',
        onPressed: canSave
            ? () {
                Navigator.pop(context, _questionController.text);
              }
            : null,
      ),
    );
  }
}
