import 'dart:async';

import 'package:flutter/foundation.dart';

class Debounce {
  final Duration duration;
  Timer? _timer;

  Debounce({required this.duration});

  run(VoidCallback action) {
    _timer?.cancel();
    _timer = Timer(duration, action);
  }
}
