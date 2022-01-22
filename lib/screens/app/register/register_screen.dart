import 'package:flutter/material.dart';
import 'package:phoenixjobs/screens/app/register/register_app_bar.dart';
import 'package:phoenixjobs/screens/app/register/register_body.dart';

class RegisterScreen extends StatefulWidget {
  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool _passwordVisible = true;
  bool get passwordVisible => _passwordVisible;
  set passwordVisible(v) => setState(() => _passwordVisible = v);

  final registerFormKey = GlobalKey<FormState>();

  // String username = '';
  // String password = '';
  // String firstName = '';
  // String lastName = '';
  // String email = '';
  // String residueAddress = '';
  // String age = '';
  // String gender = '';
  // String status = '';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: RegisterAppBar(state: this),
        body: RegisterBody(state: this),
      ),
    );
  }
}
