// Turn of null-safety by writing the following line
// @dart=2.9

import 'package:phoenixjobs/models/user.dart';
import 'package:phoenixjobs/services/user/user_service.dart';

class UserServiceMock extends UserService {
  final _mockUser = <User>[
    User(
      uid: '1',
      token: '',
      username: 'test1',
      password: 'thisisatest',
      firstName: 'John',
      lastName: 'Doe',
      email: 'test1@test.com',
      residueAddress: 'Lot 12, Rock Street, George Province, 12345 Johor.',
      age: '20',
      gender: 'Male',
      status: 'student',
    ),
    User(
      uid: '2',
      token: '',
      username: 'test2',
      password: 'thisisatest',
      firstName: 'Marie',
      lastName: 'May',
      email: 'test2@test.com',
      residueAddress: 'Lot 33, Rose Street, Lily City, 23456 Kuala Lumpur.',
      age: '19',
      gender: 'Female',
      status: 'student',
    ),
    User(
      uid: '3',
      token: '',
      username: 'test3',
      password: 'thisisatest',
      firstName: 'William',
      lastName: 'Ray',
      email: 'test3@test.com',
      residueAddress: 'Lot 321, Water Street, Rainbow Town, 54321 Selangor.',
      age: '25',
      gender: 'Male',
      status: 'staff',
    ),
  ];

  @override
  Future<List<User>> fetchUsers() async {
    return [..._mockUser];
  }

  @override
  Future<User> getUser(uid) async {
    await Future.delayed(const Duration(seconds: 1));
    // get _mockUser item by uid, else return null
    final item = _mockUser.firstWhere((element) => element.uid == uid,
        orElse: () => null);
    return User.copy(item);
  }

  @override
  Future<User> updateUser({uid, User data}) async {
    await Future.delayed(const Duration(seconds: 1));
    // queue _mockUser by uid
    final index = _mockUser.indexWhere((element) => element.uid == uid);

    // return if not found
    if (index == -1) {
      return null;
    } else {
      // update _mockUser
      _mockUser[index] = data.copyWith(uid: uid);
      return User.copy(_mockUser[index]);
    }
  }

  @override
  Future<void> removeUser(uid) async {
    await Future.delayed(const Duration(seconds: 1));
    // remove element from _mockUser
    _mockUser.removeWhere((element) => element.uid == uid);
  }

  @override
  Future<User> addUser(User data) async {
    await Future.delayed(const Duration(seconds: 1));
    // check uid first
    int uid = (_mockUser != null && _mockUser.isNotEmpty)
        ? int.parse(_mockUser.last.uid) + 1
        : 1;
    // add element to db
    User item = data.copyWith(uid: uid);
    return User.copy(item);
  }
}
