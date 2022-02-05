// @dart=2.9
import 'package:flutter/foundation.dart';

import 'package:phoenixjobs/services/service_locator.dart';
import '../../../models/user.dart';
import '../../viewmodel.dart';
import '../../../services/user/user_repository.dart';

class AuthViewmodel extends Viewmodel {
  final UserRepository _userRepository = locator();

  AuthViewmodel() {
    _userRepository.addListener(() {
      notifyListeners();
    });
  }

  User get user => _userRepository.user;
  String _errorMessage;
  String get errorMessage => _errorMessage;
  set errorMessage(value) => update(() => _errorMessage = value);

  Future<void> signIn({
    @required String email,
    @required String password,
  }) async {
    await _userRepository.signIn(email: email, password: password);
    if (_userRepository.user != null) {
      _errorMessage = null;
    } else {
      _errorMessage = _userRepository.error;
    }
  }
}
