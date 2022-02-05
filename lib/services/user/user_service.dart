// Turn of null-safety by writing the following line
// @dart=2.9

import 'package:phoenixjobs/models/user.dart';
import 'package:phoenixjobs/services/service_locator.dart';
import 'package:phoenixjobs/services/user/user_repository.dart';

abstract class UserService {
  final UserRepository _userRepository = locator();
  User get user => _userRepository.user;

  Future<List<User>> fetchUsers();
  Future<User> getUser(uid);
  Future<User> updateUser({uid, User data});
  Future<void> removeUser(uid);
  Future<User> addUser(User data);
}
