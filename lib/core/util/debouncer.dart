import 'dart:async';

import 'package:flutter/widgets.dart';

class Debouncer {
  final int milliseconds;
  VoidCallback? action;
  Timer? _timer;

  Debouncer({required this.milliseconds});

  void run(VoidCallback action) {
    this.action = action;
    if (_timer != null) {
      _timer!.cancel();
    }
    _timer = Timer(Duration(milliseconds: milliseconds), _debounce);
  }

  void _debounce() {
    if (action != null) {
      action!();
    }
  }
}