// Turn of null-safety by writing the following line
// @dart=2.9
import 'package:flutter/foundation.dart';

abstract class Viewmodel extends ChangeNotifier {
  bool _initialized = false;
  bool get initialized => _initialized;
  void markInitialized() => _initialized = true;

  bool _busy = false;

  bool get busy => _busy;
  void _setBusy(bool value, {bool shouldNotify = true}) {
    _busy = value;
    if (shouldNotify) notifyListeners();
  }

  void turnBusy() => _setBusy(true, shouldNotify: false);
  void turnIdle() => _setBusy(false);

  Future<void> update(AsyncCallback fn) async {
    turnBusy();
    if (fn != null) await fn();
    turnIdle();
  }

  /// To be overridden by the child class if it needs to
  /// do something once the viewmodel has been created
  void init() => markInitialized();

  @override
  void dispose() {
    super.dispose();
  }
}
