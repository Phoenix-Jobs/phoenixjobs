// @dart=2.9

import 'dart:async';
import 'package:flutter/foundation.dart';

import '../../models/user.dart';

abstract class AuthenticationService {
  Future<void> signIn(
      {@required String email,
      @required String password,
      Function(User) onSuccess,
      Function(Exception) onError});

  Future<void> signOut({Function onSuccess, Function(Exception) onError});

  // this getter is to be overidden,
  Stream get stream => null;

  // to be overridden by concrete class
  // This method is meant for normalizing of user data, as each
  //  service has their own structure of user data
  User transformUserData(dynamic userData) => null;

  StreamSubscription observeStream(
      {Function(User) onData, Function(Object) onError, Function onDone}) {
    if (stream == null) return null;
    // in case the service also supports stream (like firestore), prepare a listener
    return stream.listen((userData) {
      // In case of Firebase, the stream still send a response
      //  although the user is not signed in (due to the user has logout before)
      // Thus, we need to check that situation, if so, do not execute onData() handler

      if (userData != null) onData(transformUserData(userData));
    }, onError: onError, onDone: onDone);
  }
}
