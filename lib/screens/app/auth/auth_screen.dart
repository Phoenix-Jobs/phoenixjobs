import 'package:flutter/material.dart';
import 'package:phoenixjobs/screens/app/auth/auth_app_bar.dart';
import 'package:phoenixjobs/screens/app/auth/auth_body.dart';
import 'package:phoenixjobs/screens/app/auth/login_viewmodel.dart';

// ignore: use_key_in_widget_constructors
class AuthScreen extends StatefulWidget {
  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  bool _passwordVisible = true;
  bool get passwordVisible => _passwordVisible;
  set passwordVisible(v) => setState(() => _passwordVisible = v);

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  final loginFormKey = GlobalKey<FormState>();

  String get username => usernameController.text;
  String get password => passwordController.text;

  void onLogin(LoginViewmodel viewmodel) async {
    await viewmodel.signIn(username: username, password: password);
    final _user = viewmodel.user;
    Navigator.pop(context, _user);
  }

  void onCancel() => Navigator.pop(context, null);

  void onClear(LoginViewmodel viewmodel) {
    usernameController.clear();
    passwordController.clear();
    viewmodel.errorMessage = null;
  }

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
