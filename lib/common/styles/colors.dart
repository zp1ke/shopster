import 'package:flutter/material.dart';

@immutable
class AppColors {
  final Color success;
  final Color onSuccess;
  final Color successContainer;
  final Color onSuccessContainer;
  final Color google;
  final Color facebook;
  final Color warning;
  final Color onWarning;

  const AppColors._({
    required this.success,
    required this.onSuccess,
    required this.successContainer,
    required this.onSuccessContainer,
    required this.google,
    required this.facebook,
    required this.warning,
    required this.onWarning,
  });

  static AppColors light = AppColors._(
    success: const Color(0xFF016B5D),
    onSuccess: const Color(0xFFFFFFFF),
    successContainer: const Color(0xFF9FF2E1),
    onSuccessContainer: const Color(0xFF00201B),
    google: const Color(0xFFDB4437),
    facebook: const Color(0xFF0165E1),
    warning: const Color(0xFFCEC16D),
    onWarning: const Color(0xFF101006),
  );

  static AppColors dark = AppColors._(
    success: const Color(0xFF83D5C5),
    onSuccess: const Color(0xFF003730),
    successContainer: const Color(0xFF005046),
    onSuccessContainer: const Color(0xFF9FF2E1),
    google: const Color(0xFFDB4437),
    facebook: const Color(0xFF17A9FD),
    warning: const Color(0xFF989162),
    onWarning: const Color(0xFF11110A),
  );

  AppColors copyWith({
    Color? success,
    Color? onSuccess,
    Color? successContainer,
    Color? onSuccessContainer,
    Color? google,
    Color? facebook,
    Color? warning,
    Color? onWarning,
  }) {
    return AppColors._(
      success: success ?? this.success,
      onSuccess: onSuccess ?? this.onSuccess,
      successContainer: successContainer ?? this.successContainer,
      onSuccessContainer: onSuccessContainer ?? this.onSuccessContainer,
      google: google ?? this.google,
      facebook: facebook ?? this.facebook,
      warning: warning ?? this.warning,
      onWarning: onWarning ?? this.onWarning,
    );
  }
}

extension AppColorScheme on ColorScheme {
  AppColors get app {
    if (brightness == Brightness.light) {
      return AppColors.light;
    }
    return AppColors.dark;
  }
}
