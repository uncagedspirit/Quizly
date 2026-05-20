import 'package:flutter/material.dart';

import '../../../core/extensions/context_extensions.dart';
import '../../../core/theme/tokens.dart';

class ReportBottomSheet extends StatefulWidget {
  final String quizId;
  final String deviceId;
  final String? reporterId;
  final void Function(String reason, String? details) onSubmit;

  const ReportBottomSheet({
    super.key,
    required this.quizId,
    required this.deviceId,
    this.reporterId,
    required this.onSubmit,
  });

  static Future<void> show(
    BuildContext context, {
    required String quizId,
    required String deviceId,
    String? reporterId,
    required void Function(String reason, String? details) onSubmit,
  }) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: context.colors.card,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(QzRadius.heroLg)),
      ),
      builder: (_) => ReportBottomSheet(
        quizId: quizId,
        deviceId: deviceId,
        reporterId: reporterId,
        onSubmit: onSubmit,
      ),
    );
  }

  @override
  State<ReportBottomSheet> createState() => _ReportBottomSheetState();
}

class _ReportBottomSheetState extends State<ReportBottomSheet> {
  String? _selectedReason;
  final _detailsController = TextEditingController();
  bool _showDetails = false;

  static const _reasons = [
    'inappropriate',
    'spam',
    'incorrect',
    'other',
  ];

  String _reasonLabel(String reason) => switch (reason) {
        'inappropriate' => 'Inappropriate',
        'spam' => 'Spam',
        'incorrect' => 'Incorrect info',
        'other' => 'Other',
        _ => reason,
      };

  @override
  void dispose() {
    _detailsController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return Padding(
      padding: const EdgeInsets.all(QzSpacing.s9),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Container(
              width: 36,
              height: 4,
              decoration: BoxDecoration(
                color: colors.line,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ),
          const SizedBox(height: QzSpacing.s7),
          Text(
            'Report Quiz',
            style: context.text.headingMd.copyWith(color: colors.ink),
          ),
          const SizedBox(height: QzSpacing.s2),
          Text(
            'Let us know what\'s wrong with this quiz',
            style: context.text.bodySm.copyWith(color: colors.ink3),
          ),
          const SizedBox(height: QzSpacing.s7),
          Wrap(
            spacing: QzSpacing.s3,
            runSpacing: QzSpacing.s3,
            children: _reasons.map((reason) {
              final isSelected = _selectedReason == reason;
              return GestureDetector(
                onTap: () {
                  setState(() {
                    _selectedReason = reason;
                    _showDetails = reason == 'other';
                  });
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: QzSpacing.s5,
                    vertical: QzSpacing.s3,
                  ),
                  decoration: BoxDecoration(
                    color: isSelected ? colors.brand : colors.ink4,
                    borderRadius: BorderRadius.circular(QzRadius.md),
                  ),
                  child: Text(
                    _reasonLabel(reason),
                    style: context.text.labelSm.copyWith(
                      color: isSelected ? colors.brandInk : colors.ink,
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
          if (_showDetails) ...[
            const SizedBox(height: QzSpacing.s7),
            TextField(
              controller: _detailsController,
              maxLength: 500,
              maxLines: 3,
              style: context.text.bodyMd.copyWith(color: colors.ink),
              decoration: InputDecoration(
                hintText: 'Additional details (optional)',
                hintStyle: context.text.bodyMd.copyWith(color: colors.ink3),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(QzRadius.lg),
                  borderSide: BorderSide(color: colors.line),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(QzRadius.lg),
                  borderSide: BorderSide(color: colors.line),
                ),
                counterStyle: context.text.bodyXs.copyWith(color: colors.ink3),
              ),
            ),
          ],
          const SizedBox(height: QzSpacing.s7),
          SizedBox(
            width: double.infinity,
            height: 56,
            child: ElevatedButton(
              onPressed: _selectedReason != null
                  ? () {
                      widget.onSubmit(
                        _selectedReason!,
                        _showDetails
                            ? _detailsController.text.trim().isEmpty
                                ? null
                                : _detailsController.text.trim()
                            : null,
                      );
                      Navigator.pop(context);
                    }
                  : null,
              style: ElevatedButton.styleFrom(
                backgroundColor: colors.brand,
                disabledBackgroundColor: colors.ink4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(QzRadius.lg),
                ),
              ),
              child: Text(
                'Submit Report',
                style: context.text.headingSm.copyWith(
                  color: _selectedReason != null ? colors.brandInk : colors.ink3,
                ),
              ),
            ),
          ),
          const SizedBox(height: QzSpacing.s7),
        ],
      ),
    );
  }
}
