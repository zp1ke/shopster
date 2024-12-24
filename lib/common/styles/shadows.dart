import 'package:flutter/material.dart';

extension AppShadow on ThemeData {
  BoxShadow get productShadow {
    return BoxShadow(
      color: colorScheme.shadow.withValues(alpha: 0.1),
      blurRadius: 50,
      spreadRadius: 7,
      offset: Offset(0, 2),
    );
  }
}
