//importing packages
import 'dart:async';

import 'package:flutter/cupertino.dart';

class Debouncer {
  // the time which debounce
  final int milliseconds;

  Debouncer({required this.milliseconds});

  Timer? _timer;

  void run(VoidCallback action) {
    if (_timer != null) {
      _timer!.cancel();
    }

    _timer = Timer(Duration(milliseconds: this.milliseconds), action);
  }
}
