import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/theme/tokens.dart';
import '../../../core/extensions/context_extensions.dart';

class InAppNotificationBanner extends StatefulWidget {
  final String title;
  final String body;
  final VoidCallback? onTap;

  const InAppNotificationBanner({
    super.key,
    required this.title,
    required this.body,
    this.onTap,
  });

  @override
  State<InAppNotificationBanner> createState() =>
      _InAppNotificationBannerState();
}

class _InAppNotificationBannerState extends State<InAppNotificationBanner>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<Offset> _slideAnimation;
  late final Timer _autoCloseTimer;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, -1),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOut,
    ),);
    _controller.forward();

    _autoCloseTimer = Timer(const Duration(seconds: 4), () {
      if (mounted) {
        _controller.reverse().then((_) {
          if (mounted) Navigator.maybePop(context);
        });
      }
    });
  }

  @override
  void dispose() {
    _autoCloseTimer.cancel();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return Material(
      child: SlideTransition(
        position: _slideAnimation,
        child: SafeArea(
          child: GestureDetector(
            onTap: widget.onTap,
            child: Container(
              padding: const EdgeInsets.all(QzSpacing.s5),
              decoration: BoxDecoration(
                color: colors.card,
                boxShadow: [
                  BoxShadow(
                    color: colors.line,
                    blurRadius: 0,
                    offset: const Offset(0, 1),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          widget.title,
                          style: context.text.headingSm.copyWith(color: colors.ink),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          widget.body,
                          style: context.text.bodySm.copyWith(color: colors.ink2),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class NotificationRouter {
  static void handleTap(String? payload, GoRouter router) {
    if (payload == null) return;
    try {
      final data = jsonDecode(payload) as Map<String, dynamic>;
      final type = data['type'] as String?;
      switch (type) {
        case 'deadline_reveal':
          final attemptId = data['attemptId'] as String?;
          if (attemptId != null) router.push('/attempt/result/$attemptId');
        case 'deadline_soon':
          final quizId = data['quizId'] as String?;
          if (quizId != null) router.push('/quiz/$quizId');
        case 'new_attempt':
          final quizId = data['quizId'] as String?;
          if (quizId != null) router.push('/quiz/$quizId');
        case 'challenge':
          final challengeId = data['challengeId'] as String?;
          if (challengeId != null) router.push('/challenge/$challengeId');
      }
    } catch (_) {}
  }

  static void handleRemoteMessage(
    Map<String, dynamic> data,
    GoRouter router,
  ) {
    final type = data['type'] as String?;
    switch (type) {
      case 'deadline_reveal':
        final attemptId = data['attemptId'] as String?;
        if (attemptId != null) router.push('/attempt/result/$attemptId');
      case 'new_attempt':
        final quizId = data['quizId'] as String?;
        if (quizId != null) router.push('/quiz/$quizId');
      case 'challenge':
        final challengeId = data['challengeId'] as String?;
        if (challengeId != null) router.push('/challenge/$challengeId');
    }
  }
}  Widget build(BuildContext context) {
    final colors = context.colors;

    return Material(
      child: SlideTransition(
        position: _slideAnimation,
        child: SafeArea(
          child: GestureDetector(
            onTap: widget.onTap,
            child: Container(
              padding: const EdgeInsets.all(QzSpacing.s5),
              decoration: BoxDecoration(
                color: colors.card,
                boxShadow: [
                  BoxShadow(
                    color: colors.line,
                    blurRadius: 0,
                    offset: const Offset(0, 1),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          widget.title,
                          style: context.text.headingSm.copyWith(color: colors.ink),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          widget.body,
                          style: context.text.bodySm.copyWith(color: colors.ink2),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class NotificationRouter {
  static void handleTap(String? payload, GoRouter router) {
    if (payload == null) return;
    try {
      final data = jsonDecode(payload) as Map<String, dynamic>;
      final type = data['type'] as String?;
      switch (type) {
        case 'deadline_reveal':
          final attemptId = data['attemptId'] as String?;
          if (attemptId != null) router.push('/attempt/result/$attemptId');
        case 'deadline_soon':
          final quizId = data['quizId'] as String?;
          if (quizId != null) router.push('/quiz/$quizId');
        case 'new_attempt':
          final quizId = data['quizId'] as String?;
          if (quizId != null) router.push('/quiz/$quizId');
        case 'challenge':
          final challengeId = data['challengeId'] as String?;
          if (challengeId != null) router.push('/challenge/$challengeId');
      }
    } catch (_) {}
  }

  static void handleRemoteMessage(
    Map<String, dynamic> data,
    GoRouter router,
  ) {
    final type = data['type'] as String?;
    switch (type) {
      case 'deadline_reveal':
        final attemptId = data['attemptId'] as String?;
        if (attemptId != null) router.push('/attempt/result/$attemptId');
      case 'new_attempt':
        final quizId = data['quizId'] as String?;
        if (quizId != null) router.push('/quiz/$quizId');
      case 'challenge':
        final challengeId = data['challengeId'] as String?;
        if (challengeId != null) router.push('/challenge/$challengeId');
    }
  }
}
