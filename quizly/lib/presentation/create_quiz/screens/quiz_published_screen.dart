import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../core/extensions/context_extensions.dart';
import '../../../core/theme/tokens.dart';
import '../../shared/widgets/primary_button.dart';

class QuizPublishedScreen extends StatelessWidget {
  const QuizPublishedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    const code = 'A7XK9M';
    const shareLink = 'quizly.app/play/A7XK9M';

    return Scaffold(
      backgroundColor: colors.paper,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: QzSpacing.s9),
          child: Column(
            children: [
              _buildTopBar(),
              const Spacer(),
              Column(
                children: [
                  Text(
                    '\u{1F389}',
                    style: const TextStyle(fontSize: 64),
                  ),
                  const SizedBox(height: QzSpacing.s7),
                  Text(
                    'Your quiz is live',
                    style: context.text.headingLg.copyWith(color: colors.ink),
                  ),
                  const SizedBox(height: QzSpacing.s7),
                  GestureDetector(
                    onTap: () {
                      Clipboard.setData(const ClipboardData(text: code));
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            'Code copied!',
                            style: context.text.bodyMd,
                          ),
                          backgroundColor: colors.ink,
                          duration: const Duration(seconds: 1),
                        ),
                      );
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: QzSpacing.s11,
                        horizontal: QzSpacing.s11,
                      ),
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
                      child: Text(
                        code,
                        style: context.text.monoLg.copyWith(
                          color: colors.ink,
                          letterSpacing: 8,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: QzSpacing.s5),
                  Text(
                    'Tap to copy',
                    style: context.text.bodyXs.copyWith(color: colors.ink3),
                  ),
                  const SizedBox(height: QzSpacing.s9),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.share, size: 16, color: colors.ink3),
                      const SizedBox(width: QzSpacing.s3),
                      Text(
                        shareLink,
                        style: context.text.bodyMd.copyWith(color: colors.ink3),
                      ),
                    ],
                  ),
                ],
              ),
              const Spacer(),
              PrimaryButton(
                label: 'Share Now',
                icon: Icons.share,
                onPressed: () {},
              ),
              const SizedBox(height: QzSpacing.s5),
              SecondaryButton(
                label: 'Go to Dashboard',
                onPressed: () => Navigator.popUntil(context, (r) => r.isFirst),
              ),
              const SizedBox(height: QzSpacing.s9),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTopBar() {
    final colors = context.colors;

    return SizedBox(
      height: 52,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
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
}
