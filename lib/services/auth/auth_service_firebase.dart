// @dart =2.9

import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:phoenixjobs/services/auth/auth_service.dart';
import 'package:phoenixjobs/services/firebase.dart';
import 'package:phoenixjobs/models/user.dart' as app_user;
// To resolve conflict with firebase 'User' class

class AuthenticationServiceFirebase extends AuthenticationService {
  final _firebaseAuth = FirebaseAuthentication();
  FirebaseAuth get _auth => _firebaseAuth.auth;

  // sign in email & password
  @override
  Future<void> signIn({
    @required String email,
    @required String password,
    Function(app_user.User) onSuccess,
    Function(Exception) onError,
  }) async {
    try {
      final UserCredential credential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      final User user = credential?.user;
      if (user == null) return;
      onSuccess?.call(transformUserData(user));
    } on FirebaseAuthException catch (e) {
      onError?.call(e);
    }
  }

  @override
  Future<void> signOut({
    Function onSuccess,
    Function(Exception) onError,
  }) async {
    try {
      await _auth.signOut();
      onSuccess?.call();
    } on FirebaseAuthException catch (e) {
      onError?.call(e);
    }
  }

  @override
  app_user.User transformUserData(dynamic userData) {
    if (userData == null) return null;

    final User user = userData; // Firebase Auth User class

    return app_user.User(
      // User data that are passed to Viewmodel is in the form our own User model class (not Firebase Auth user)
      email: user.email,
      uid: user.uid,
    );
  }
}
