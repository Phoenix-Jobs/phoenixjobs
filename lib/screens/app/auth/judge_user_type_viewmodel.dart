// Turn of null-safety by writing the following line
// @dart=2.9

import 'package:phoenixjobs/models/user.dart';
import 'package:phoenixjobs/screens/viewmodel.dart';
import 'package:phoenixjobs/services/service_locator.dart';
import 'package:phoenixjobs/services/user/user_repository.dart';
import 'package:phoenixjobs/services/user/user_service.dart';

class JudgeUserTypeViewmodel extends Viewmodel {
  // user repository initializer
  final UserRepository _userRepository = locator<UserRepository>();
  final UserService _service = locator<UserService>();
  User get user => _userRepository.user;
  // current user initializer
  User get currentUser => _currentUser;
  User _currentUser;

  // viewmodel onload
  JudgeUserTypeViewmodel() {
    _userRepository.addListener(() async {
      if (user == null) {
        // do something, should get job list etc
      } else {
        init();
      }
      notifyListeners();
    });
  }

  // update init to get current user details
  @override
  init() => update(() async {
        _currentUser = await _service.getUser(_userRepository.user.uid);
        super.init();
      });
}
