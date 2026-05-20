import 'package:flutter/services.dart' as services;

class QzHaptics {
  QzHaptics._();

  static void lightTap() => services.HapticFeedback.lightImpact();
  static void mediumTap() => services.HapticFeedback.mediumImpact();
  static void heavyTap() => services.HapticFeedback.heavyImpact();
  static void selection() => services.HapticFeedback.selectionClick();
}
