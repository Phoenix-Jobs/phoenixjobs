// Turn of null-safety by writing the following line
// @dart=2.9

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:phoenixjobs/models/user.dart';
import 'package:phoenixjobs/services/firebase.dart';
import 'package:phoenixjobs/services/user/user_service.dart';
import 'package:uuid/uuid.dart';

class UserServiceFirebase extends UserService {
  final _uuid = Uuid();
  final _firestore = Firestore();
  String get _userUid => user.uid;

  // get all user collection
  CollectionReference get _collection =>
      _firestore.collection('users'); // use path style to reference

  // get user collection by user uid
  Query get _collectionByUserUid =>
      _firestore.collection('users').where('uid', isEqualTo: _userUid);

  // get user document by uid
  DocumentReference _getNumberDocument(userid) =>
      _firestore.document('users/$userid'); // use path style to reference

  @override
  Future<List<User>> fetchUsers() async {
    final snapshot = await _collectionByUserUid.get();
    // transform data. Field id might be null, so take the doc id instead
    return snapshot.docs.map((doc) {
      // return a list of user, not necessary in this development
      // transform data. Field id might be null, so take the doc id instead
      final users = User.fromJson(doc.data()).copyWith(uid: doc.id);
      return users;
    }).toList();
  }

  @override
  Future<User> getUser(uid) async {
    final userDoc = await _getNumberDocument(uid).get();
    return User.fromJson(userDoc.data());
  }

  @override
  Future<User> updateUser({uid, User data}) async {
    final updatedUser = data.copyWith(uid: uid);
    await _getNumberDocument(uid).update(updatedUser.toJson());
    return updatedUser;
  }

  @override
  Future<void> removeUser(uid) async {
    await _getNumberDocument(uid).delete();
  }

  @override
  Future<User> addUser(User data) async {
    final _uid = _uuid.v1(); // Generate time-based id
    final _data = data.copyWith(uid: _uid); // add generated id the data
    await _collection.doc(_uid).set(_data.toJson());
    return _data;
  }
}
