import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/extensions/context_extensions.dart';
import '../../../core/theme/tokens.dart';
import '../../shared/widgets/app_text_field.dart';
import '../../shared/widgets/primary_button.dart';
import '../../../core/router/route_names.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return Scaffold(
      backgroundColor: colors.paper,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: QzSpacing.s9),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: QzSpacing.s13),
              Text(
                'Welcome back',
                style: context.text.headingLg.copyWith(color: colors.ink),
              ),
              const SizedBox(height: QzSpacing.s3),
              Text(
                'Sign in to create and share quizzes',
                style: context.text.bodyMd.copyWith(color: colors.ink3),
              ),
              const SizedBox(height: QzSpacing.s11),
              const AppTextField(
                label: 'Email',
                hint: 'Enter your email',
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: QzSpacing.s5),
              const AppTextField(
                label: 'Password',
                hint: 'Enter your password',
                obscureText: true,
              ),
              const SizedBox(height: QzSpacing.s3),
              Align(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  onTap: () {},
                  child: Text(
                    'Forgot password?',
                    style: context.text.bodySm.copyWith(color: colors.brand),
                  ),
                ),
              ),
              const Spacer(),
              PrimaryButton(label: 'Sign In', onPressed: () {}),
              const SizedBox(height: QzSpacing.s7),
              Center(
                child: GestureDetector(
                  onTap: () => context.push(RouteNames.signup),
                  child: RichText(
                    text: TextSpan(
                      style: context.text.bodyMd.copyWith(color: colors.ink2),
                      children: [
                        const TextSpan(text: 'New here?'),
                        TextSpan(
                          text: 'Create account',
                          style: context.text.bodyMd.copyWith(
                            color: colors.brand,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: QzSpacing.s9),
              Center(
                child: GestureDetector(
                  onTap: () => context.go(RouteNames.home),
                  child: Text(
                    'Continue without account',
                    style: context.text.bodyMd.copyWith(color: colors.brand),
                  ),
                ),
              ),
              const SizedBox(height: QzSpacing.s11),
            ],
          ),
        ),
      ),
    );
  }
}
