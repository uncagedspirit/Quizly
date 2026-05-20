import 'package:flutter/material.dart';

import '../../core/theme/tokens.dart';
import '../../core/extensions/context_extensions.dart';

Future<bool?> showConfirmDialog(
  BuildContext context, {
  required String title,
  required String body,
  String confirmLabel = 'Confirm',
  String cancelLabel = 'Cancel',
  bool isDestructive = false,
}) {
  return showDialog<bool>(
    context: context,
    builder: (ctx) {
      final colors = context.colors;

      return AlertDialog(
        backgroundColor: colors.card,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(QzRadius.heroLg),
        ),
        title: Text(title, style: context.text.headingMd.copyWith(color: colors.ink)),
        content: Text(body, style: context.text.bodyMd.copyWith(color: colors.ink2)),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx, false),
            child: Text(
              cancelLabel,
              style: context.text.labelMd.copyWith(color: colors.ink2),
            ),
          ),
          TextButton(
            onPressed: () => Navigator.pop(ctx, true),
            child: Text(
              confirmLabel,
              style: context.text.labelMd.copyWith(
                color: isDestructive ? colors.wrong : colors.brand,
              ),
            ),
          ),
        ],
      );
    },
  );
}

Future<void> showAppBottomSheet(
  BuildContext context, {
  required Widget child,
}) {
  return showModalBottomSheet(
    context: context,
    backgroundColor: context.colors.card,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(QzRadius.heroLg)),
    ),
    builder: (_) => SafeArea(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(
          QzSpacing.s9,
          QzSpacing.s9,
          QzSpacing.s9,
          QzSpacing.s9,
        ),
        child: child,
      ),
    ),
  );
}
