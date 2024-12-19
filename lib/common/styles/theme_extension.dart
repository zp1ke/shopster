import 'package:flutter/material.dart';

@immutable
class AppThemeColors extends ThemeExtension<AppThemeColors> {
  final Color success;
  final Color onSuccess;
  final Color successContainer;
  final Color onSuccessContainer;

  const AppThemeColors._({
    required this.success,
    required this.onSuccess,
    required this.successContainer,
    required this.onSuccessContainer,
  });

  static AppThemeColors of(BuildContext context) {
    return Theme.of(context).extension<AppThemeColors>() ??
        AppThemeColors.light;
  }

  static AppThemeColors light = AppThemeColors._(
    success: const Color(0xFF016B5D),
    onSuccess: const Color(0xFFFFFFFF),
    successContainer: const Color(0xFF9FF2E1),
    onSuccessContainer: const Color(0xFF00201B),
  );

  static AppThemeColors dark = AppThemeColors._(
    success: const Color(0xFF83D5C5),
    onSuccess: const Color(0xFF003730),
    successContainer: const Color(0xFF005046),
    onSuccessContainer: const Color(0xFF9FF2E1),
  );

  @override
  ThemeExtension<AppThemeColors> copyWith({
    Color? success,
    Color? onSuccess,
    Color? successContainer,
    Color? onSuccessContainer,
  }) {
    return AppThemeColors._(
      success: success ?? this.success,
      onSuccess: onSuccess ?? this.onSuccess,
      successContainer: successContainer ?? this.successContainer,
      onSuccessContainer: onSuccessContainer ?? this.onSuccessContainer,
    );
  }

  @override
  ThemeExtension<AppThemeColors> lerp(
    covariant ThemeExtension<AppThemeColors>? other,
    double t,
  ) {
    if (other is! AppThemeColors) {
      return this;
    }
    return AppThemeColors._(
      success: Color.lerp(success, other.success, t) ?? other.success,
      onSuccess: Color.lerp(onSuccess, other.onSuccess, t) ?? other.onSuccess,
      successContainer:
          Color.lerp(successContainer, other.successContainer, t) ??
              other.successContainer,
      onSuccessContainer:
          Color.lerp(onSuccessContainer, other.onSuccessContainer, t) ??
              other.onSuccessContainer,
    );
  }
}
