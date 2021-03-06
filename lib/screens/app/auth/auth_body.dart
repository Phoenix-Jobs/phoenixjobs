// ignore_for_file: import_of_legacy_library_into_null_safe

import 'package:flutter/material.dart';
import 'package:phoenixjobs/screens/app/auth/auth_viewmodel.dart';
import 'package:phoenixjobs/screens/app/register/register_screen.dart';
import '../../view.dart';

class AuthBody extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  final state;
  // ignore: use_key_in_widget_constructors
  const AuthBody({this.state});

  void _navigateRegisterScreen({context}) async {
    final result = await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => RegisterScreen(),
        ));
    if (result != null) {
      // state.setState(() => something = result);
    }
  }

  @override
  Widget build(BuildContext context) {
    return View<AuthViewmodel>(
      builder: (context, viewmodel, _) => ListView(
        children: [
          ListView(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            padding: const EdgeInsets.all(20),
            children: <Widget>[
              SizedBox(height: MediaQuery.of(context).size.height * 0.20),
              // username
              TextFormField(
                controller: state.emailController,
                obscureText: false,
                decoration: const InputDecoration(
                  icon: Icon(Icons.person),
                  border: OutlineInputBorder(),
                  labelText: 'Email',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your email';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              // password
              TextFormField(
                controller: state.passwordController,
                obscureText: state.passwordVisible,
                decoration: InputDecoration(
                  icon: const Icon(Icons.lock),
                  border: const OutlineInputBorder(),
                  labelText: 'Password',
                  suffixIcon: IconButton(
                    icon: Icon(
                      // Based on passwordVisible state choose the icon
                      state.passwordVisible
                          ? Icons.visibility_off
                          : Icons.visibility,
                      color: Theme.of(context).primaryColorDark,
                    ),
                    onPressed: () {
                      state.passwordVisible = !state.passwordVisible;
                    },
                  ),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your password';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              // error message
              if (viewmodel.errorMessage != null)
                Column(
                  children: <Widget>[
                    Text(
                      viewmodel.errorMessage,
                      style: const TextStyle(color: Colors.red, fontSize: 14.0),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              // login button
              MaterialButton(
                minWidth: MediaQuery.of(context).size.width * 0.8,
                height: 60,
                color: Colors.deepOrange,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0)),
                onPressed: () => state.onLogin(viewmodel),
                child: const Text(
                  "LOGIN",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              const SizedBox(height: 20),
              // register button
              MaterialButton(
                minWidth: MediaQuery.of(context).size.width * 0.8,
                height: 60,
                color: Colors.deepOrange,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0)),
                onPressed: () => _navigateRegisterScreen(context: context),
                child: const Text(
                  "REGISTER",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
