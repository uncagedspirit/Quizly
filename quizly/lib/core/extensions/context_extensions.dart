import 'package:flutter/material.dart';

import '../theme/qz_theme.dart';
import '../theme/app_text_styles.dart';

extension BuildContextExtensions on BuildContext {
  QzTheme get colors => Theme.of(this).extension<QzTheme>()!;
}

extension TextStylesOnContext on BuildContext {
  QzTextStyles get text => const QzTextStyles._();
}
