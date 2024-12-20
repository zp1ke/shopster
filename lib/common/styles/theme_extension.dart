import 'package:flutter/material.dart';

@immutable
class AppThemeColors extends ThemeExtension<AppThemeColors> {
  final Color success;
  final Color onSuccess;
  final Color successContainer;
  final Color onSuccessContainer;
  final Color google;
  final Color facebook;

  const AppThemeColors._({
    required this.success,
    required this.onSuccess,
    required this.successContainer,
    required this.onSuccessContainer,
    required this.google,
    required this.facebook,
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
    google: const Color(0xFFDB4437),
    facebook: const Color(0xFF0165E1),
  );

  static AppThemeColors dark = AppThemeColors._(
    success: const Color(0xFF83D5C5),
    onSuccess: const Color(0xFF003730),
    successContainer: const Color(0xFF005046),
    onSuccessContainer: const Color(0xFF9FF2E1),
    google: const Color(0xFFDB4437),
    facebook: const Color(0xFF17A9FD),
  );

  @override
  ThemeExtension<AppThemeColors> copyWith({
    Color? success,
    Color? onSuccess,
    Color? successContainer,
    Color? onSuccessContainer,
    Color? google,
    Color? facebook,
  }) {
    return AppThemeColors._(
      success: success ?? this.success,
      onSuccess: onSuccess ?? this.onSuccess,
      successContainer: successContainer ?? this.successContainer,
      onSuccessContainer: onSuccessContainer ?? this.onSuccessContainer,
      google: google ?? this.google,
      facebook: facebook ?? this.facebook,
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
      google: Color.lerp(google, other.google, t) ?? other.google,
      facebook: Color.lerp(facebook, other.facebook, t) ?? other.facebook,
    );
  }
}
