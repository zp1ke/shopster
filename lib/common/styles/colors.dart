import 'package:flutter/material.dart';

@immutable
class AppColors {
  final Color shopHeaderBackground;
  final Color shopHeaderForeground;
  final Color success;
  final Color onSuccess;
  final Color successContainer;
  final Color onSuccessContainer;
  final Color google;
  final Color facebook;

  const AppColors._({
    required this.shopHeaderBackground,
    required this.shopHeaderForeground,
    required this.success,
    required this.onSuccess,
    required this.successContainer,
    required this.onSuccessContainer,
    required this.google,
    required this.facebook,
  });

  static AppColors light = AppColors._(
    shopHeaderBackground: Colors.transparent,
    shopHeaderForeground: Colors.transparent,
    success: const Color(0xFF016B5D),
    onSuccess: const Color(0xFFFFFFFF),
    successContainer: const Color(0xFF9FF2E1),
    onSuccessContainer: const Color(0xFF00201B),
    google: const Color(0xFFDB4437),
    facebook: const Color(0xFF0165E1),
  );

  static AppColors dark = AppColors._(
    shopHeaderBackground: Colors.transparent,
    shopHeaderForeground: Colors.transparent,
    success: const Color(0xFF83D5C5),
    onSuccess: const Color(0xFF003730),
    successContainer: const Color(0xFF005046),
    onSuccessContainer: const Color(0xFF9FF2E1),
    google: const Color(0xFFDB4437),
    facebook: const Color(0xFF17A9FD),
  );

  AppColors copyWith({
    required Color shopHeaderBackground,
    required Color shopHeaderForeground,
    Color? success,
    Color? onSuccess,
    Color? successContainer,
    Color? onSuccessContainer,
    Color? google,
    Color? facebook,
  }) {
    return AppColors._(
      shopHeaderBackground: shopHeaderBackground,
      shopHeaderForeground: shopHeaderForeground,
      success: success ?? this.success,
      onSuccess: onSuccess ?? this.onSuccess,
      successContainer: successContainer ?? this.successContainer,
      onSuccessContainer: onSuccessContainer ?? this.onSuccessContainer,
      google: google ?? this.google,
      facebook: facebook ?? this.facebook,
    );
  }
}
