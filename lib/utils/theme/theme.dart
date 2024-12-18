import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shopster/utils/theme/extension.dart';

class AppTheme {
  AppTheme._();

  static const _flexScheme = FlexScheme.indigoM3;
  static final _fontFamily = GoogleFonts.notoSans().fontFamily;
  static final _visualDensity = FlexColorScheme.comfortablePlatformDensity;

  static ThemeData light = FlexThemeData.light(
    scheme: _flexScheme,
    useMaterial3: true,
    fontFamily: _fontFamily,
    visualDensity: _visualDensity,
    extensions: [
      AppThemeColors.light,
    ],
  );

  static ThemeData dark = FlexThemeData.dark(
    scheme: _flexScheme,
    useMaterial3: true,
    fontFamily: _fontFamily,
    visualDensity: _visualDensity,
    extensions: [
      AppThemeColors.dark,
    ],
  );
}
