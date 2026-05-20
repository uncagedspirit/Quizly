import 'package:flutter/material.dart';

import '../theme/qz_theme.dart';
import '../theme/app_text_styles.dart';

extension BuildContextExtensions on BuildContext {
  QzTheme get colors => Theme.of(this).extension<QzTheme>()!;
  QzTextStyles get text => QzTextStyles();
}
