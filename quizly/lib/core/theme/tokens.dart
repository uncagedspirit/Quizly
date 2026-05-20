import 'package:flutter/material.dart';

class QzSpacing {
  QzSpacing._();
  static const double s1 = 4.0;
  static const double s2 = 6.0;
  static const double s3 = 8.0;
  static const double s4 = 10.0;
  static const double s5 = 12.0;
  static const double s6 = 14.0;
  static const double s7 = 16.0;
  static const double s8 = 18.0;
  static const double s9 = 22.0;
  static const double s10 = 26.0;
  static const double s11 = 32.0;
  static const double s12 = 38.0;
  static const double s13 = 56.0;
}

class QzRadius {
  QzRadius._();
  static const double xs = 4.0;
  static const double sm = 6.0;
  static const double md = 8.0;
  static const double lg = 10.0;
  static const double xl = 12.0;
  static const double xxl = 14.0;
  static const double hero = 16.0;
  static const double heroLg = 18.0;
}

class QzDur {
  QzDur._();
  static const Duration instant = Duration(milliseconds: 100);
  static const Duration fast = Duration(milliseconds: 200);
  static const Duration medium = Duration(milliseconds: 320);
  static const Duration slow = Duration(milliseconds: 500);
  static const Duration celebration = Duration(milliseconds: 700);
}

class QzEase {
  QzEase._();
  static const Cubic standard = Cubic(0.3, 0.7, 0.4, 1);
  static const Cubic emphasis = Cubic(0.2, 1.6, 0.4, 1);
  static const Cubic decel = Cubic(0, 0, 0.2, 1);
}
