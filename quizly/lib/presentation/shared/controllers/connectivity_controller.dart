import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../shared/controllers/app_providers.dart';

part 'connectivity_controller.g.dart';

@riverpod
class ConnectivityController extends _$ConnectivityController {
  @override
  Future<bool> build() async {
    final result = await Connectivity().checkConnectivity();
    final isOnline = !result.contains(ConnectivityResult.none);

    Connectivity().onConnectivityChanged.listen((results) async {
      final online = !results.contains(ConnectivityResult.none);
      if (online) {
        await _flushPendingSubmissions();
      }
      state = AsyncData(online);
    });

    return isOnline;
  }

  Future<void> _flushPendingSubmissions() async {
    final attemptRepo = ref.read(attemptRepositoryProvider);
    await attemptRepo.flushPendingSubmissions();
  }
}
