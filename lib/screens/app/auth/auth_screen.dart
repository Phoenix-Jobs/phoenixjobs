// ignore_for_file: import_of_legacy_library_into_null_safe, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:phoenixjobs/screens/app/auth/auth_app_bar.dart';
import 'package:phoenixjobs/screens/app/auth/auth_body.dart';
import 'package:phoenixjobs/screens/app/auth/auth_viewmodel.dart';
import 'package:phoenixjobs/screens/app/auth/judge_user_type.dart';

class AuthScreen extends StatefulWidget {
  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  bool _passwordVisible = true;
  bool get passwordVisible => _passwordVisible;
  set passwordVisible(v) => setState(() => _passwordVisible = v);

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  String get email => emailController.text;
  String get password => passwordController.text;

  // onLogin button pressed
  void onLogin(AuthViewmodel viewmodel) async {
    await viewmodel.signIn(email: email, password: password);
    final _user = viewmodel.user;
    // ignore: unnecessary_null_comparison
    if (_user != null) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => JudgeUserType(),
        ),
      );
    }
  }

  void onCancel() => Navigator.pop(context, null);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AuthAppBar(state: this),
        body: AuthBody(state: this),
      ),
    );
  }
}
