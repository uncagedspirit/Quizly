import 'package:flutter/material.dart';

import '../../core/theme/tokens.dart';
import '../../core/extensions/context_extensions.dart';

class EmptyState extends StatelessWidget {
  const EmptyState({
    super.key,
    required this.title,
    required this.description,
    this.actionLabel,
    this.onAction,
    this.emoji,
  });

  final String title;
  final String description;
  final String? actionLabel;
  final VoidCallback? onAction;
  final String? emoji;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: QzSpacing.s11),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (emoji != null) ...[
              Text(
                emoji!,
                style: const TextStyle(fontSize: 56),
              ),
              const SizedBox(height: QzSpacing.s5),
            ],
            Text(
              title,
              style: context.text.headingMd.copyWith(color: colors.ink),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: QzSpacing.s5),
            Text(
              description,
              style: context.text.bodyMd.copyWith(color: colors.ink3),
              textAlign: TextAlign.center,
            ),
            if (actionLabel != null && onAction != null) ...[
              const SizedBox(height: QzSpacing.s9),
              GestureDetector(
                onTap: onAction,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: QzSpacing.s11,
                    vertical: QzSpacing.s7,
                  ),
                  decoration: BoxDecoration(
                    color: colors.brand,
                    borderRadius: BorderRadius.circular(QzRadius.lg),
                  ),
                  child: Text(
                    actionLabel!,
                    style: context.text.headingSm.copyWith(
                      color: colors.brandInk,
                    ),
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

class LoadingView extends StatelessWidget {
  const LoadingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 28,
        height: 28,
        child: CircularProgressIndicator(
          strokeWidth: 2,
          color: context.colors.brand,
        ),
      ),
    );
  }
}

class ErrorView extends StatelessWidget {
  const ErrorView({
    super.key,
    required this.message,
    this.onRetry,
  });

  final String message;
  final VoidCallback? onRetry;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: QzSpacing.s11),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(message, style: context.text.bodyMd.copyWith(color: colors.wrong)),
            if (onRetry != null) ...[
              const SizedBox(height: QzSpacing.s7),
              GestureDetector(
                onTap: onRetry,
                child: Text(
                  'Retry',
                  style: context.text.labelMd.copyWith(color: colors.brand),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
