import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'core/theme/app_theme.dart';
import 'core/router/app_router.dart';
import 'presentation/shared/controllers/theme_controller.dart';
import 'presentation/shared/controllers/app_providers.dart';
import 'presentation/shared/widgets/in_app_notification.dart';

class QuizlyApp extends ConsumerStatefulWidget {
  const QuizlyApp({super.key});

  @override
  ConsumerState<QuizlyApp> createState() => _QuizlyAppState();
}

class _QuizlyAppState extends ConsumerState<QuizlyApp> {
  StreamSubscription<dynamic>? _backgroundSub;

  @override
  void initState() {
    super.initState();
    _setupFcmHandlers();
  }

  @override
  void dispose() {
    _backgroundSub?.cancel();
    super.dispose();
  }

  void _setupFcmHandlers() {
    final notificationRepo = ref.read(notificationRepositoryProvider);

    notificationRepo.getInitialMessage().then((dynamic msg) {
      if (msg != null) _routeNotification(msg);
    });

    _backgroundSub =
        notificationRepo.onMessageOpenedApp.listen(_routeNotification);
  }

  void _routeNotification(dynamic msg) {
    if (!mounted) return;
    final router = ref.read(appRouterProvider);
    NotificationRouter.handleRemoteMessage(
      Map<String, dynamic>.from(msg.data as Map),
      router,
    );
  }

  @override
  Widget build(BuildContext context) {
    final router = ref.watch(appRouterProvider);
    final themeMode = ref.watch(themeControllerProvider);

    return MaterialApp.router(
      title: 'Quizly',
      theme: AppTheme.light(),
      darkTheme: AppTheme.dark(),
      themeMode: themeMode,
      routerConfig: router,
      debugShowCheckedModeBanner: false,
      builder: (context, child) {
        return FcmForegroundListener(
          router: router,
          child: child ?? const SizedBox.shrink(),
        );
      },
    );
  }
}

class FcmForegroundListener extends ConsumerStatefulWidget {
  final GoRouter router;
  final Widget child;

  const FcmForegroundListener({
    super.key,
    required this.router,
    required this.child,
  });

  @override
  ConsumerState<FcmForegroundListener> createState() =>
      _FcmForegroundListenerState();
}

class _FcmForegroundListenerState
    extends ConsumerState<FcmForegroundListener> {
  StreamSubscription<dynamic>? _sub;

  @override
  void initState() {
    super.initState();
    final notificationRepo = ref.read(notificationRepositoryProvider);
    _sub = notificationRepo.onForegroundMessage.listen((dynamic msg) {
      _showBanner(msg);
    });
  }

  @override
  void dispose() {
    _sub?.cancel();
    super.dispose();
  }

  void _showBanner(dynamic message) {
    final notification = message.notification;
    if (notification == null) return;

    OverlayEntry? entry;
    entry = OverlayEntry(
      builder: (_) => Positioned(
        top: 0,
        left: 0,
        right: 0,
        child: InAppNotificationBanner(
          title: (notification?.title ?? '') as String,
          body: (notification?.body ?? '') as String,
          onTap: () {
            entry?.remove();
            NotificationRouter.handleRemoteMessage(
              Map<String, dynamic>.from(message.data as Map),
              widget.router,
            );
          },
        ),
      ),
    );

    Overlay.of(context).insert(entry!);
    Future.delayed(const Duration(seconds: 4), () => entry?.remove());
  }

  @override
  Widget build(BuildContext context) => widget.child;
}      title: 'Quizly',
      theme: AppTheme.light(),
      darkTheme: AppTheme.dark(),
      themeMode: themeMode,
      routerConfig: router,
      debugShowCheckedModeBanner: false,
      builder: (context, child) {
        return FcmForegroundListener(
          router: router,
          child: child ?? const SizedBox.shrink(),
        );
      },
    );
  }
}

class FcmForegroundListener extends ConsumerStatefulWidget {
  final GoRouter router;
  final Widget child;

  const FcmForegroundListener({
    super.key,
    required this.router,
    required this.child,
  });

  @override
  ConsumerState<FcmForegroundListener> createState() =>
      _FcmForegroundListenerState();
}

class _FcmForegroundListenerState
    extends ConsumerState<FcmForegroundListener> {
  StreamSubscription<dynamic>? _sub;

  @override
  void initState() {
    super.initState();
    final notificationRepo = ref.read(notificationRepositoryProvider);
    _sub = notificationRepo.onForegroundMessage.listen((dynamic msg) {
      _showBanner(msg);
    });
  }

  @override
  void dispose() {
    _sub?.cancel();
    super.dispose();
  }

  void _showBanner(dynamic message) {
    final notification = message.notification;
    if (notification == null) return;

    OverlayEntry? entry;
    entry = OverlayEntry(
      builder: (_) => Positioned(
        top: 0,
        left: 0,
        right: 0,
        child: InAppNotificationBanner(
          title: (notification?.title ?? '') as String,
          body: (notification?.body ?? '') as String,
          onTap: () {
            entry?.remove();
            NotificationRouter.handleRemoteMessage(
              Map<String, dynamic>.from(message.data as Map),
              widget.router,
            );
          },
        ),
      ),
    );

    Overlay.of(context).insert(entry!);
    Future.delayed(const Duration(seconds: 4), () => entry?.remove());
  }

  @override
  Widget build(BuildContext context) => widget.child;
}
