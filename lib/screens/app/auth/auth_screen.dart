import 'package:flutter/material.dart';
import 'package:phoenixjobs/screens/app/auth/auth_app_bar.dart';
import 'package:phoenixjobs/screens/app/auth/auth_body.dart';

// ignore: use_key_in_widget_constructors
class AuthScreen extends StatefulWidget {
  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  bool _passwordVisible = true;
  bool get passwordVisible => _passwordVisible;
  set passwordVisible(v) => setState(() => _passwordVisible = v);

  final loginFormKey = GlobalKey<FormState>();
  // String username = '';
  // String password = '';

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
