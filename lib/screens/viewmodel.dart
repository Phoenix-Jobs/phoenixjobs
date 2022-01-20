// Turn of null-safety by writing the following line
// @dart=2.9

//? The viewmodel class is fully given. You are not expected to modify this file.
//? However, if you feel like to add something or do any changes. Feel free to do so.

// Author: jumail@utm.my.
// Date: Dec 2021

import 'package:flutter/foundation.dart';

/// `Viewmodel` is the base class to implement the viemodel component of an MVVM.
/// Extend the class for your own viewmodel. Do not create an object directly from this base class.
/// Also, you need to register your viewmodels in the service locator (service_locator.dart).
///
class Viewmodel with ChangeNotifier {
  bool _initialized = false;
  bool get initialized => _initialized;
  void markInitialized() => _initialized = true;

  bool _busy = false;

  get busy => _busy;

  void turnBusy() {
    _busy = true;

    notifyListeners();
  }

  void turnIdle() {
    _busy = false;
    notifyListeners();
  }

  /// A convenient method, to implicitly write the turnBusy()... turnIdle()
  void update(AsyncCallback fn) async {
    turnBusy();
    if (fn != null) await fn();
    turnIdle();
  }

  /// To be overridden by the child class if it needs to
  /// do something once the viewmodel has been created
  void init() => markInitialized();
}
