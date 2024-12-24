import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shopster/common/styles/sizes.dart';

class AppTheme {
  AppTheme._();

  static const _flexScheme = FlexScheme.indigoM3;
  static final _fontFamily = GoogleFonts.notoSans().fontFamily;
  static final _visualDensity = FlexColorScheme.comfortablePlatformDensity;
  static final _subThemesData = FlexSubThemesData(
    interactionEffects: true,
    tintedDisabledControls: true,
    useM2StyleDividerInM3: true,
    buttonMinSize: Size(AppSize.buttonMinWidth, AppSize.buttonHeight),
    textButtonRadius: AppSize.buttonRadius,
    filledButtonRadius: AppSize.buttonRadius,
    elevatedButtonRadius: AppSize.buttonRadius,
    outlinedButtonRadius: AppSize.buttonRadius,
    inputDecoratorIsFilled: true,
    inputDecoratorBorderType: FlexInputBorderType.outline,
    inputDecoratorRadius: AppSize.buttonRadius,
    alignedDropdown: true,
    navigationRailUseIndicator: true,
    navigationRailLabelType: NavigationRailLabelType.all,
  );

  static ThemeData light = FlexThemeData.light(
    scheme: _flexScheme,
    useMaterial3: true,
    fontFamily: _fontFamily,
    visualDensity: _visualDensity,
    subThemesData: _subThemesData,
  );

  static ThemeData dark = FlexThemeData.dark(
    scheme: _flexScheme,
    useMaterial3: true,
    fontFamily: _fontFamily,
    visualDensity: _visualDensity,
    subThemesData: _subThemesData,
  );
}
