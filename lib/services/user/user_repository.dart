// ignore_for_file: import_of_legacy_library_into_null_safe
// @dart=2.9

import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:phoenixjobs/models/user.dart';
import 'package:phoenixjobs/services/auth/auth_service.dart';
import 'package:phoenixjobs/services/repository.dart';
import 'package:phoenixjobs/services/service_locator.dart';

class UserRepository extends Repository {
  User _user;
  String _error;
  StreamSubscription _streamObserver;
  bool get isObservingStream => _streamObserver != null;

  User get user => _user;
  String get error => _error;

  final AuthenticationService _authService = locator();

  UserRepository() {
    // if the auth service supports stream response (like Firebase Auth service)
    //  This is the place where the response or incoming stream data will arrive
    // Then, what it does here, it only passes / forwards the received data
    //  to the listeners of this repository (in this app example, they are LoginViewmodel and HomeViewmodel).

    _streamObserver = _authService.observeStream(
      onData: (user) async {
        await notifyListeners(onNotify: () async {
          _user = user?.copyWith();
          //The above line means,  _user =  user != null ? user.copyWith() : null

          _error = null;
        });
      },
      onError: (e) async {
        await notifyListeners(onNotify: () async {
          _user = null;
          _error = e.toString();
        });
      },
    );
  }

  Future<void> _signIn(String email, String password) => _authService.signIn(
        email: email,
        password: password,
        onSuccess: (user) {
          _user = user.copyWith();
          _error = null;
        },
        onError: (e) async {
          _user = null;
          _error = e.toString();
          await notifyListeners();
        },
      );

  Future<void> signIn(
      {@required String email, @required String password}) async {
    if (_user != null) return; // sign in only if not signed in

    // If the auth service also provides stream (like in Firebase)
    // observe the response only from the stream. Do not use the "response"
    // from the Future. Otherwise, there will duplicate results.
    // That's means, if stream is enabled, do not use "notifyListeners()".

    if (isObservingStream) {
      await _signIn(email, password);
    } else {
      await notifyListeners(onNotify: () => _signIn(email, password));
    }
  }

  Future<void> signOut() async {
    if (_user == null) return;

    await notifyListeners(
        onNotify: () =>
            _authService.signOut(onSuccess: () => _user = _error = null));
  }

  @override
  void dispose() {
    _streamObserver?.cancel();
    _streamObserver = null;
    super.dispose();
  }
}
