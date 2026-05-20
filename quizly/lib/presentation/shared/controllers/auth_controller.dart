import 'dart:async';

import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../domain/models/app_user.dart';
import '../../shared/controllers/app_providers.dart';

part 'auth_controller.g.dart';

sealed class AuthState {}

class AuthAuthenticated extends AuthState {
  final AppUser user;
  const AuthAuthenticated(this.user);
}

class AuthGuest extends AuthState {
  final String deviceId;
  const AuthGuest(this.deviceId);
}

class AuthSignedOut extends AuthState {}

@Riverpod(keepAlive: true)
Stream<AuthState> authStateChanges(AuthStateChangesRef ref) {
  final authRepo = ref.watch(authRepositoryProvider);
  final deviceId = authRepo.deviceId ?? 'unknown';

  return authRepo.authStateChanges().asyncMap((user) async {
    if (user != null) {
      final profile = await authRepo.getCurrentUserProfile();
      if (profile != null) return AuthAuthenticated(profile);
    }
    return AuthGuest(deviceId);
  });
}
