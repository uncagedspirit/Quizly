import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/router/route_names.dart';
import '../../../../core/theme/tokens.dart';
import '../../../../core/extensions/context_extensions.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      if (mounted) {
        context.go(RouteNames.login);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return Scaffold(
      backgroundColor: colors.paper,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Quizly.',
              style: TextStyle(
                fontFamily: 'Geist',
                fontSize: 86,
                height: 0.92,
                fontWeight: FontWeight.w800,
                letterSpacing: -0.034 * 86,
                color: colors.ink,
              ),
            ),
            const SizedBox(height: QzSpacing.s7),
            Text(
              'Quizzes, shared simply.',
              style: context.text.bodyXs.copyWith(color: colors.ink3),
            ),
          ],
        ),
      ),
    );
  }
}
