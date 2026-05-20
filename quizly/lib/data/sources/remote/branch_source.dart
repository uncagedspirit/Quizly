import 'dart:async';

import 'package:flutter_branch_sdk/flutter_branch_sdk.dart';
import 'package:flutter/foundation.dart';

import '../../../domain/models/challenge.dart';

sealed class DeeplinkData {}

class QuizLink extends DeeplinkData {
  final String code;
  const QuizLink({required this.code});
}

class ChallengeLink extends DeeplinkData {
  final String challengeId;
  final String quizId;
  const ChallengeLink({required this.challengeId, required this.quizId});
}

class BranchSource {
  StreamSubscription<Map>? _subscription;
  final _linkController = StreamController<DeeplinkData>.broadcast();

  Stream<DeeplinkData> get linkStream => _linkController.stream;

  Future<void> init() async {
    await FlutterBranchSdk.init(
      enableLogging: kDebugMode,
      disableTracking: false,
    );

    _subscription = FlutterBranchSdk.listSession().listen(
      _onLinkReceived,
      onError: (e) => debugPrint('Branch error: $e'),
    );
  }

  void _onLinkReceived(Map<dynamic, dynamic> data) {
    if (data['+clicked_branch_link'] == true) {
      final type = data['type'] as String?;
      switch (type) {
        case 'quiz':
          _linkController.add(QuizLink(code: data['code'] as String));
        case 'challenge':
          _linkController.add(ChallengeLink(
            challengeId: data['challengeId'] as String,
            quizId: data['quizId'] as String,
          ));
      }
    }
  }

  Future<String> generateQuizLink({
    required String quizId,
    required String quizCode,
    required String quizTitle,
  }) async {
    final buo = BranchUniversalObject(
      canonicalIdentifier: 'quiz/$quizId',
      title: 'Take this quiz: $quizTitle',
      contentDescription: 'Quizly — Share quizzes with anyone, anywhere.',
      contentMetadata: BranchContentMetaData()
        ..addCustomMetadata('type', 'quiz')
        ..addCustomMetadata('code', quizCode)
        ..addCustomMetadata('quizId', quizId),
    );

    final lp = BranchLinkProperties(
      channel: 'app_share',
      feature: 'quiz_share',
    )..addControlParam(r'$desktop_url', 'https://quizly.app');

    final response = await FlutterBranchSdk.getShortUrl(
      buo: buo,
      linkProperties: lp,
    );

    if (response.success) {
      return response.result;
    }
    throw Exception('Failed to generate link');
  }

  Future<String> generateChallengeLink({
    required String challengeId,
    required String quizId,
    required String quizTitle,
    required String challengerName,
    required String challengerScoreText,
  }) async {
    final buo = BranchUniversalObject(
      canonicalIdentifier: 'challenge/$challengeId',
      title: '$challengerName scored $challengerScoreText on $quizTitle',
      contentDescription: 'Can you beat them?',
      contentMetadata: BranchContentMetaData()
        ..addCustomMetadata('type', 'challenge')
        ..addCustomMetadata('challengeId', challengeId)
        ..addCustomMetadata('quizId', quizId)
        ..addCustomMetadata('challengerName', challengerName)
        ..addCustomMetadata('challengerScoreText', challengerScoreText),
    );

    final lp = BranchLinkProperties(
      channel: 'app_share',
      feature: 'challenge',
    )..addControlParam(r'$desktop_url', 'https://quizly.app');

    final response = await FlutterBranchSdk.getShortUrl(
      buo: buo,
      linkProperties: lp,
    );

    if (response.success) {
      return response.result;
    }
    throw Exception('Failed to generate challenge link');
  }

  void dispose() {
    _subscription?.cancel();
    _linkController.close();
  }
}
