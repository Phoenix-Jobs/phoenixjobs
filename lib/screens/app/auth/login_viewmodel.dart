// Turn of null-safety by writing the following line
// @dart=2.9
import 'package:flutter/foundation.dart';

import '../../../models/user.dart';
import '../../../service_locator/service_locator.dart';
import '../../viewmodel.dart';
import '../../../services/user/user_repository.dart';

class LoginViewmodel extends Viewmodel {
  final UserRepository _userRepository = locator();

  LoginViewmodel() {
    _userRepository.addListener(() {
      notifyListeners();
    });
  }

  User get user => _userRepository.user;
  String _errorMessage;
  String get errorMessage => _errorMessage;
  set errorMessage(value) => update(() => _errorMessage = value);

  Future<void> signIn(
      {@required String username, @required String password}) async {
    await _userRepository.signIn(email: username, password: password);
    if (_userRepository.user != null) {
      _errorMessage = null;
    } else {
      _errorMessage = _userRepository.error;
    }
  }
}
