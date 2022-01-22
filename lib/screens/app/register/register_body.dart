import 'package:flutter/material.dart';

class RegisterBody extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  final state;
  // ignore: use_key_in_widget_constructors
  const RegisterBody({this.state});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: state.registerFormKey,
      child: ListView(
        padding: const EdgeInsets.all(20),
        children: <Widget>[
          //SizedBox(height: MediaQuery.of(context).size.height * 0.3),
          // username
          TextFormField(
            obscureText: false,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Username',
            ),
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter your username';
              }
              return null;
            },
          ),
          const SizedBox(height: 20),
          // password
          TextFormField(
            //keyboardType: TextInputType.text,
            //controller: _userPasswordController,
            obscureText: state.passwordVisible,
            decoration: InputDecoration(
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
          // first name
          TextFormField(
            obscureText: false,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'First name',
            ),
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter your first name';
              }
              return null;
            },
          ),
          const SizedBox(height: 20),
          // last name
          TextFormField(
            obscureText: false,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Last name',
            ),
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter your last name';
              }
              return null;
            },
          ),
          const SizedBox(height: 20),
          // email
          TextFormField(
            obscureText: false,
            decoration: const InputDecoration(
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
          // residue address
          TextFormField(
            obscureText: false,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Residue address',
            ),
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter your residue address';
              }
              return null;
            },
          ),
          const SizedBox(height: 20),
          // age
          TextFormField(
            obscureText: false,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Age',
            ),
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter your age';
              }
              return null;
            },
          ),
          const SizedBox(height: 20),
          // gender
          TextFormField(
            obscureText: false,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Gender',
            ),
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter your gender';
              }
              return null;
            },
          ),
          const SizedBox(height: 20),
          // status
          TextFormField(
            obscureText: false,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Status',
            ),
            validator: (value) {
              if (value!.isEmpty) {
                return '"Student" or "Staff" only';
              }
              return null;
            },
          ),
          const SizedBox(height: 20),
          // register button
          MaterialButton(
            minWidth: MediaQuery.of(context).size.width * 0.8,
            height: 60,
            color: Colors.deepOrange,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0)),
            onPressed: () {
              if (state.registerFormKey.currentState.validate()) {
                // If the form is valid, display a Snackbar.
                // ignore: deprecated_member_use
                Scaffold.of(context).showSnackBar(
                    const SnackBar(content: Text('Data is in processing.')));
              }
            },
            child: const Text(
              "REGISTER",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
