import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/extensions/context_extensions.dart';
import '../../../core/theme/tokens.dart';
import '../../shared/widgets/app_text_field.dart';
import '../../shared/widgets/primary_button.dart';
class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

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
                'Create an account',
                style: context.text.headingLg.copyWith(color: colors.ink),
              ),
              const SizedBox(height: QzSpacing.s3),
              Text(
                'Start creating and sharing quizzes',
                style: context.text.bodyMd.copyWith(color: colors.ink3),
              ),
              const SizedBox(height: QzSpacing.s11),
              const AppTextField(
                label: 'Display Name',
                hint: 'Your name',
              ),
              const SizedBox(height: QzSpacing.s5),
              const AppTextField(
                label: 'Email',
                hint: 'Enter your email',
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: QzSpacing.s5),
              const AppTextField(
                label: 'Password',
                hint: 'Min. 8 characters',
                obscureText: true,
              ),
              const Spacer(),
              PrimaryButton(label: 'Sign Up', onPressed: () {}),
              const SizedBox(height: QzSpacing.s7),
              Center(
                child: GestureDetector(
                  onTap: () => context.pop(),
                  child: RichText(
                    text: TextSpan(
                      style: context.text.bodyMd.copyWith(color: colors.ink2),
                      children: [
                        const TextSpan(text: 'Already have an account? '),
                        TextSpan(
                          text: 'Sign in',
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
              const SizedBox(height: QzSpacing.s11),
            ],
          ),
        ),
      ),
    );
  }
}
