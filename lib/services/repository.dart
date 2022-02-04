// @dart=2.9

import 'package:flutter/foundation.dart';

// A repository is almost like a service but it can also store states.
// This class is meant for avoiding a service class to hold any state.

abstract class Repository extends ChangeNotifier {
  bool _busy = false;
  get busy => _busy;

  @override
  Future<void> notifyListeners({AsyncCallback onNotify}) async {
    _busy = true;
    if (onNotify != null) await onNotify();
    _busy = false;
    super.notifyListeners();
  }
}
