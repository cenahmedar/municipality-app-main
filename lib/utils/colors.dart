import 'package:flutter/material.dart';

import 'logs.dart';

class HexColor extends Color {
  static int _getColorFromHex(dynamic hexColor) {
    try {
      if (hexColor is String) {
        hexColor = hexColor.toUpperCase().replaceAll('#', '');
        if (hexColor.length == 6) {
          hexColor = 'FF$hexColor';
        }

        if (hexColor.isNotEmpty) {
          return int.parse(hexColor, radix: 16);
        }
      }
      return int.parse('FFFFFFFF', radix: 16);
    } catch (e, trace) {
      printLog(e);
      printLog(trace);
      return int.parse('FFFFFFFF', radix: 16);
    }
  }

  HexColor(final hexColor) : super(_getColorFromHex(hexColor));

  // ignore: prefer_constructors_over_static_methods
  static HexColor fromJson(dynamic json) => HexColor(json);

  static List<HexColor>? fromListJson(List listJson) {
    try {
      final listColor = listJson.map((e) {
        // ignore: avoid_as
        return HexColor.fromJson(e as String);
        // ignore: avoid_as
      }).toList();

      // ignore: avoid_as
      return listColor;
    } catch (e, trace) {
      printLog(e);
      printLog(trace);
      return [];
    }
  }

  String toJson() => super.value.toRadixString(16);
}

/// Color theme
const ColorScheme kColorScheme = ColorScheme(
  primary: dPrimaryColor,
  //ahmed
  //primaryVariant: kGrey900,
  secondary: kTeal50,
  //ahmed
  //secondaryVariant: kGrey900,
  surface: kSurfaceWhite,
  background: Colors.white,
  error: kErrorRed,
  onPrimary: kDarkBG,
  onSecondary: kGrey900,
  onSurface: kGrey900,
  onBackground: kGrey900,
  onError: kSurfaceWhite,
  brightness: Brightness.light,
);

// default colors
const dPrimaryColor = Color(0xFF1B305D);
const dPrimaryColor50 = Color(0x801B305D);
const dSecondaryColor = Color(0xFFA8C1E5);
const dBackgroundColor = Color(0xFFFFFFFF);
const dTextColor = Color(0xFF000000);

/// basic colors
const kTeal50 = Color(0xFFE0F2F1);
const kTeal100 = Color(0xFF3FC1BE);

const kTeal400 = Color(0xFF26A69A);
const kGrey900 = Color(0xFF263238);
const kGrey600 = Color(0xFF546E7A);
const kGrey200 = Color(0xFFEEEEEE);
const kGrey400 = Color(0xFF90a4ae);
const kErrorRed = Color(0xFFe74c3c);
const kColorRed = Color(0xFFF3090B);
const kSurfaceWhite = Color(0xFFFFFBFA);
const kRedColorHeart = Color(0xFFf22742);

/// color for theme
const kLightPrimary = Color(0xfffcfcff);
const kLightAccent = Color(0xFF546E7A);
const kDarkAccent = Color(0xffF4F5F5);

const kLightBG = Color(0xffF1F2F3);
const kDarkBG = Color(0xff1B1D26);
const kDarkBgLight = Color(0xff282D39);

const KSilver = Color(0xffc4c4c4);

// 100% — FF
// 99% — FC
// 98% — FA
// 97% — F7
// 96% — F5
// 95% — F2
// 94% — F0
// 93% — ED
// 92% — EB
// 91% — E8
// 90% — E6
// 89% — E3
// 88% — E0
// 87% — DE
// 86% — DB
// 85% — D9
// 84% — D6
// 83% — D4
// 82% — D1
// 81% — CF
// 80% — CC
// 79% — C9
// 78% — C7
// 77% — C4
// 76% — C2
// 75% — BF
// 74% — BD
// 73% — BA
// 72% — B8
// 71% — B5
// 70% — B3
// 69% — B0
// 68% — AD
// 67% — AB
// 66% — A8
// 65% — A6
// 64% — A3
// 63% — A1
// 62% — 9E
// 61% — 9C
// 60% — 99
// 59% — 96
// 58% — 94
// 57% — 91
// 56% — 8F
// 55% — 8C
// 54% — 8A
// 53% — 87
// 52% — 85
// 51% — 82
// 50% — 80
// 49% — 7D
// 48% — 7A
// 47% — 78
// 46% — 75
// 45% — 73
// 44% — 70
// 43% — 6E
// 42% — 6B
// 41% — 69
// 40% — 66
// 39% — 63
// 38% — 61
// 37% — 5E
// 36% — 5C
// 35% — 59
// 34% — 57
// 33% — 54
// 32% — 52
// 31% — 4F
// 30% — 4D
// 29% — 4A
// 28% — 47
// 27% — 45
// 26% — 42
// 25% — 40
// 24% — 3D
// 23% — 3B
// 22% — 38
// 21% — 36
// 20% — 33
// 19% — 30
// 18% — 2E
// 17% — 2B
// 16% — 29
// 15% — 26
// 14% — 24
// 13% — 21
// 12% — 1F
// 11% — 1C
// 10% — 1A
// 9% — 17
// 8% — 14
// 7% — 12
// 6% — 0F
// 5% — 0D
// 4% — 0A
// 3% — 08
// 2% — 05
// 1% — 03
// 0% — 00
