import 'package:flutter/material.dart';

import 'app_colors.dart';

class QzTheme extends ThemeExtension<QzTheme> {
  final Color brand;
  final Color brandInk;
  final Color warm;
  final Color gold;
  final Color yellow;
  final Color peach;
  final Color moss;
  final Color correct;
  final Color wrong;

  final Color paper;
  final Color paper2;
  final Color card;
  final Color line;
  final Color ink;
  final Color ink2;
  final Color ink3;
  final Color ink4;

  const QzTheme({
    required this.brand,
    required this.brandInk,
    required this.warm,
    required this.gold,
    required this.yellow,
    required this.peach,
    required this.moss,
    required this.correct,
    required this.wrong,
    required this.paper,
    required this.paper2,
    required this.card,
    required this.line,
    required this.ink,
    required this.ink2,
    required this.ink3,
    required this.ink4,
  });

  static QzTheme light() => const QzTheme(
        brand: QzColors.brandLight,
        brandInk: QzColors.brandInkLight,
        warm: QzColors.warmLight,
        gold: QzColors.goldLight,
        yellow: QzColors.yellow,
        peach: QzColors.peach,
        moss: QzColors.mossLight,
        correct: QzColors.correctLight,
        wrong: QzColors.wrongLight,
        paper: QzColors.paperLight,
        paper2: QzColors.paper2Light,
        card: QzColors.cardLight,
        line: QzColors.lineLight,
        ink: QzColors.inkLight,
        ink2: QzColors.ink2Light,
        ink3: QzColors.ink3Light,
        ink4: QzColors.ink4Light,
      );

  static QzTheme dark() => const QzTheme(
        brand: QzColors.brandDark,
        brandInk: QzColors.brandInkDark,
        warm: QzColors.warmDark,
        gold: QzColors.goldDark,
        yellow: QzColors.yellow,
        peach: QzColors.peach,
        moss: QzColors.mossDark,
        correct: QzColors.correctDark,
        wrong: QzColors.wrongDark,
        paper: QzColors.paperDark,
        paper2: QzColors.paper2Dark,
        card: QzColors.cardDark,
        line: QzColors.lineDark,
        ink: QzColors.inkDark,
        ink2: QzColors.ink2Dark,
        ink3: QzColors.ink3Dark,
        ink4: QzColors.ink4Dark,
      );

  @override
  QzTheme copyWith({
    Color? brand,
    Color? brandInk,
    Color? warm,
    Color? gold,
    Color? yellow,
    Color? peach,
    Color? moss,
    Color? correct,
    Color? wrong,
    Color? paper,
    Color? paper2,
    Color? card,
    Color? line,
    Color? ink,
    Color? ink2,
    Color? ink3,
    Color? ink4,
  }) {
    return QzTheme(
      brand: brand ?? this.brand,
      brandInk: brandInk ?? this.brandInk,
      warm: warm ?? this.warm,
      gold: gold ?? this.gold,
      yellow: yellow ?? this.yellow,
      peach: peach ?? this.peach,
      moss: moss ?? this.moss,
      correct: correct ?? this.correct,
      wrong: wrong ?? this.wrong,
      paper: paper ?? this.paper,
      paper2: paper2 ?? this.paper2,
      card: card ?? this.card,
      line: line ?? this.line,
      ink: ink ?? this.ink,
      ink2: ink2 ?? this.ink2,
      ink3: ink3 ?? this.ink3,
      ink4: ink4 ?? this.ink4,
    );
  }

  @override
  QzTheme lerp(ThemeExtension<QzTheme>? other, double t) {
    if (other is! QzTheme) return this;
    return QzTheme(
      brand: Color.lerp(brand, other.brand, t)!,
      brandInk: Color.lerp(brandInk, other.brandInk, t)!,
      warm: Color.lerp(warm, other.warm, t)!,
      gold: Color.lerp(gold, other.gold, t)!,
      yellow: Color.lerp(yellow, other.yellow, t)!,
      peach: Color.lerp(peach, other.peach, t)!,
      moss: Color.lerp(moss, other.moss, t)!,
      correct: Color.lerp(correct, other.correct, t)!,
      wrong: Color.lerp(wrong, other.wrong, t)!,
      paper: Color.lerp(paper, other.paper, t)!,
      paper2: Color.lerp(paper2, other.paper2, t)!,
      card: Color.lerp(card, other.card, t)!,
      line: Color.lerp(line, other.line, t)!,
      ink: Color.lerp(ink, other.ink, t)!,
      ink2: Color.lerp(ink2, other.ink2, t)!,
      ink3: Color.lerp(ink3, other.ink3, t)!,
      ink4: Color.lerp(ink4, other.ink4, t)!,
    );
  }
}
