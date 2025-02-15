import 'package:common/src/theme/colors/abstract_color.dart';
import 'package:flutter/material.dart';

///Dark Color Palette
class DarkColors implements AbstractColor {
  @override
  Brightness get brightness => Brightness.dark;

  @override
  String get themeCode => 'dark';

  @override
  Color get primary => const Color(0xFF007AFF);
  @override
  Color get onPrimary => const Color(0xFFFFFFFF);
  @override
  Color get primaryContainer => const Color(0xFF4F378B);
  @override
  Color get onPrimaryContainer => const Color(0xFF161616);
  @override
  Color get secondary => const Color(0xFF20C3E0);
  @override
  Color get onSecondary => const Color(0xFF332D41);
  @override
  Color get secondaryContainer => const Color(0xFF4A4458);
  @override
  Color get onSecondaryContainer => const Color(0xFFE8DEF8);
  @override
  Color get tertiary => const Color(0xFF34C759);
  @override
  Color get onTertiary => const Color(0xFF492532);
  @override
  Color get tertiaryContainer => const Color(0xFF633B48);
  @override
  Color get onTertiaryContainer => const Color(0xFFFFD8E4);
  @override
  Color get error => const Color(0xFFFF3337);
  @override
  Color get onError => const Color(0xFFFDAF36);
  @override
  Color get errorContainer => const Color(0xFF8C1D18);
  @override
  Color get onErrorContainer => const Color(0xFFF9DEDC);
  @override
  Color get outline => const Color(0xFFC7C7CC);
  @override
  Color get background => const Color(0xFF1C1B1F);
  @override
  Color get onBackground => const Color(0xFFE6E1E5);
  @override
  Color get surface => const Color(0xFF000000);
  @override
  Color get onSurface => const Color(0xFFFFFFFF);
  @override
  Color get surfaceVariant => const Color(0xFF49454F);
  @override
  Color get onSurfaceVariant => const Color(0xFF7F7F7F);
  @override
  Color get inverseSurface => const Color(0xFFE6E1E5);
  @override
  Color get onInverseSurface => const Color(0xFF313033);
  @override
  Color get inversePrimary => const Color(0xFF6750A4);
  @override
  Color get shadow => const Color(0xFF000000);
  @override
  Color get surfaceTint => const Color(0xFFD0BCFF);
  @override
  Color get outlineVariant => const Color(0xFF8E8E93); // Grey Text Color

  @override
  Color get scrim => const Color(0xFF000000);
}
