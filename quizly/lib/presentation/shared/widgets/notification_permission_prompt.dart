import 'package:flutter/material.dart';

import '../../../core/extensions/context_extensions.dart';
import '../../../core/theme/tokens.dart';
import 'primary_button.dart';

class NotificationPermissionPrompt {
  NotificationPermissionPrompt._();

  static Future<bool?> show(BuildContext context) {
    return showDialog<bool>(
      context: context,
      builder: (_) => AlertDialog(
        backgroundColor: context.colors.card,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(QzRadius.heroLg),
        ),
        title: Row(
          children: [
            const Text('🔔', style: TextStyle(fontSize: 28)),
            const SizedBox(width: QzSpacing.s5),
            Expanded(
              child: Text(
                'Stay in the loop',
                style: context.text.headingMd.copyWith(
                  color: context.colors.ink,
                ),
              ),
            ),
          ],
        ),
        content: Text(
          'Get notified when quiz results are\nrevealed and new attempts come in.',
          style: context.text.bodyMd.copyWith(color: context.colors.ink2),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: Text(
              'Maybe later',
              style: context.text.labelMd.copyWith(
                color: context.colors.ink3,
              ),
            ),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            child: Text(
              'Enable',
              style: context.text.labelMd.copyWith(
                color: context.colors.brand,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
