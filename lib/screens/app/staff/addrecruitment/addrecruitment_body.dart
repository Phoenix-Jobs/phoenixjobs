import 'package:flutter/material.dart';

class AddrecruitmentBody extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  final state;
  // ignore: use_key_in_widget_constructors
  const AddrecruitmentBody({this.state});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: state.recruitmentFormKey,
      child: ListView(
        padding: const EdgeInsets.all(20),
        children: <Widget>[
          // jobtitle
          TextFormField(
            obscureText: false,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Job Title',
            ),
            validator: (value) {
              if (value!.isEmpty) {
                return '* Required';
              }
              return null;
            },
          ),
          const SizedBox(height: 20),
          // upload title image button
          MaterialButton(
            minWidth: MediaQuery.of(context).size.width * 0.8,
            height: 60,
            color: Colors.deepOrange,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0)),
            onPressed: () {},
            child: const Text(
              "UPLOAD IMAGE",
              style: TextStyle(color: Colors.white),
            ),
          ),
          // uploaded image tag
          Container(
            padding: const EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                RichText(
                  text: TextSpan(
                    children: <TextSpan>[
                      TextSpan(
                        text: 'example.jpg',
                        style: TextStyle(
                          color: Colors.grey[800],
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    "DELETE",
                    style: TextStyle(color: Colors.blueAccent),
                  ),
                ),
              ],
            ),
          ),
          // job Highlights
          TextFormField(
            keyboardType: TextInputType.multiline,
            maxLines: 10,
            obscureText: false,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Job Information',
            ),
            validator: (value) {
              if (value!.isEmpty) {
                return '* Required';
              }
              return null;
            },
          ),
          const SizedBox(height: 20),
          // Job Responsibilities
          TextFormField(
            keyboardType: TextInputType.multiline,
            maxLines: 10,
            obscureText: false,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Job Responsibilities',
            ),
            validator: (value) {
              if (value!.isEmpty) {
                return '* Required';
              }
              return null;
            },
          ),
          const SizedBox(height: 20),
          // career level
          TextFormField(
            obscureText: false,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Career Level',
            ),
            validator: (value) {
              if (value!.isEmpty) {
                return '* Required';
              }
              return null;
            },
          ),
          const SizedBox(height: 20),
          // Job Specialization
          TextFormField(
            obscureText: false,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Job Specialization',
            ),
            validator: (value) {
              if (value!.isEmpty) {
                return '* Required';
              }
              return null;
            },
          ),
          const SizedBox(height: 20),
          // Working hour
          TextFormField(
            obscureText: false,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Working Hour',
            ),
            validator: (value) {
              if (value!.isEmpty) {
                return '* Required';
              }
              return null;
            },
          ),
          const SizedBox(height: 20),
          // working time
          TextFormField(
            obscureText: false,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Working Time',
            ),
            validator: (value) {
              if (value!.isEmpty) {
                return '* Required';
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
              if (state.recruitmentFormKey.currentState.validate()) {
                // If the form is valid, display a Snackbar.
                // ignore: deprecated_member_use
                Scaffold.of(context).showSnackBar(
                    const SnackBar(content: Text('Data is in processing.')));
              }
            },
            child: const Text(
              "ADD RECRUITMENT",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
