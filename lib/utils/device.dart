import 'dart:io';

import 'package:flutter/foundation.dart';

class DeviceUtils {
  DeviceUtils._();

  static bool get isAndroid {
    return !kIsWeb && Platform.isAndroid;
  }
}
