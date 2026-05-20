import 'package:flutter/material.dart';

import '../../core/theme/tokens.dart';
import '../../core/extensions/context_extensions.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    super.key,
    required this.label,
    this.onPressed,
    this.icon,
    this.isLoading = false,
    this.expanded = true,
  });

  final String label;
  final VoidCallback? onPressed;
  final IconData? icon;
  final bool isLoading;
  final bool expanded;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return GestureDetector(
      onTap: onPressed,
      child: AnimatedScale(
        scale: onPressed != null ? 1.0 : 0.98,
        duration: QzDur.instant,
        child: Container(
          width: expanded ? double.infinity : null,
          height: 56,
          padding: const EdgeInsets.symmetric(horizontal: QzSpacing.s8),
          decoration: BoxDecoration(
            color: onPressed != null ? colors.brand : colors.ink4,
            borderRadius: BorderRadius.circular(QzRadius.lg),
          ),
          alignment: Alignment.center,
          child: isLoading
              ? SizedBox(
                  width: 24,
                  height: 24,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    color: colors.brandInk,
                  ),
                )
              : Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      label,
                      style: context.text.headingSm.copyWith(
                        color: colors.brandInk,
                      ),
                    ),
                    if (icon != null) ...[
                      const SizedBox(width: QzSpacing.s4),
                      Icon(icon, size: 16, color: colors.brandInk),
                    ],
                  ],
                ),
        ),
      ),
    );
  }
}

class SecondaryButton extends StatelessWidget {
  const SecondaryButton({
    super.key,
    required this.label,
    this.onPressed,
    this.icon,
    this.isLoading = false,
    this.expanded = true,
  });

  final String label;
  final VoidCallback? onPressed;
  final IconData? icon;
  final bool isLoading;
  final bool expanded;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: expanded ? double.infinity : null,
        height: 56,
        padding: const EdgeInsets.symmetric(horizontal: QzSpacing.s8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(QzRadius.lg),
          boxShadow: [
            BoxShadow(
              color: colors.ink,
              spreadRadius: 0,
              blurRadius: 0,
              offset: const Offset(0, 0),
            ),
          ],
        ),
        alignment: Alignment.center,
        child: Text(
          label,
          style: context.text.headingSm.copyWith(color: colors.ink),
        ),
      ),
    );
  }
}

class TextButtonLink extends StatelessWidget {
  const TextButtonLink({
    super.key,
    required this.label,
    this.onPressed,
  });

  final String label;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return GestureDetector(
      onTap: onPressed,
      child: Text(
        label,
        style: context.text.bodyMd.copyWith(color: colors.brand),
      ),
    );
  }
}
