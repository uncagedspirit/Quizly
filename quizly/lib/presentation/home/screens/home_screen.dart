import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/extensions/context_extensions.dart';
import '../../../core/theme/tokens.dart';
import '../../shared/controllers/connectivity_controller.dart';
import '../../shared/widgets/code_input_field.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  int _tabIndex = 0;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final isOnline = ref.watch(connectivityControllerProvider).valueOrNull ?? true;

    return Scaffold(
      backgroundColor: colors.paper,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: QzSpacing.s9),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (!isOnline)
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(
                    vertical: QzSpacing.s2,
                  ),
                  color: colors.wrong.withAlpha(30),
                  child: Text(
                    "You're offline",
                    textAlign: TextAlign.center,
                    style: context.text.bodySm.copyWith(color: colors.wrong),
                  ),
                ),
              const SizedBox(height: QzSpacing.s6),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Quizly',
                    style: context.text.displayMd.copyWith(color: colors.ink),
                  ),
                  Container(
                    width: 32,
                    height: 32,
                    decoration: BoxDecoration(
                      color: colors.peach,
                      borderRadius: BorderRadius.circular(QzRadius.sm),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      '?',
                      style: TextStyle(
                        fontFamily: 'Geist',
                        fontSize: 13,
                        fontWeight: FontWeight.w700,
                        color: colors.ink,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: QzSpacing.s9),
              Container(
                padding: const EdgeInsets.all(QzSpacing.s9),
                decoration: BoxDecoration(
                  color: colors.ink,
                  borderRadius: BorderRadius.circular(QzRadius.hero),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'GOT A CODE?',
                      style: context.text.overline.copyWith(
                        color: colors.paper.withAlpha(140),
                      ),
                    ),
                    const SizedBox(height: QzSpacing.s3),
                    Text(
                      "Let's play.",
                      style: TextStyle(
                        fontFamily: 'Geist',
                        fontSize: 30,
                        fontWeight: FontWeight.w700,
                        letterSpacing: -0.02 * 30,
                        color: colors.paper,
                      ),
                    ),
                    const SizedBox(height: QzSpacing.s6),
                    CodeInputField(
                      onComplete: (code) {
                        debugPrint('Code entered: $code');
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(height: QzSpacing.s9),
              Row(
                children: [
                  _buildTab('Created', 0),
                  const SizedBox(width: QzSpacing.s3),
                  _buildTab('Attempted', 1),
                ],
              ),
              const SizedBox(height: QzSpacing.s7),
              Expanded(
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      if (_tabIndex == 0)
                        Text(
                          '🌱',
                          style: const TextStyle(fontSize: 56),
                        ),
                      const SizedBox(height: QzSpacing.s5),
                      Text(
                        _tabIndex == 0
                            ? 'No quizzes yet'
                            : 'No attempts yet',
                        style: context.text.headingMd
                            .copyWith(color: colors.ink),
                      ),
                      const SizedBox(height: QzSpacing.s5),
                      Text(
                        _tabIndex == 0
                            ? 'Create your first quiz to share\nwith friends.'
                            : 'Enter a code above to attempt a quiz',
                        style: context.text.bodyMd.copyWith(
                          color: colors.ink3,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTab(String label, int index) {
    final colors = context.colors;
    final isActive = _tabIndex == index;

    return GestureDetector(
      onTap: () => setState(() => _tabIndex = index),
      child: Container(
        padding: const EdgeInsets.symmetric(
          vertical: QzSpacing.s4,
          horizontal: QzSpacing.s7,
        ),
        decoration: BoxDecoration(
          color: isActive ? colors.card : Colors.transparent,
          borderRadius: BorderRadius.circular(QzRadius.md),
          boxShadow: isActive
              ? [
                  BoxShadow(
                    color: colors.ink4,
                    blurRadius: 2,
                    offset: const Offset(0, 1),
                  ),
                ]
              : null,
        ),
        child: Text(
          label,
          style: context.text.labelMd.copyWith(
            color: isActive ? colors.ink : colors.ink3,
          ),
        ),
      ),
    );
  }
}
