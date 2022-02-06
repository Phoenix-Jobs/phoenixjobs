// ignore_for_file: import_of_legacy_library_into_null_safe

import 'package:flutter/material.dart';
import 'package:phoenixjobs/models/job_application.dart';
import 'package:phoenixjobs/screens/app/student/student_viewmodel.dart';
import 'package:phoenixjobs/screens/view.dart';

class ApplicationresultBody extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  final state, index;
  // ignore: use_key_in_widget_constructors
  const ApplicationresultBody({this.state, this.index});

  @override
  Widget build(BuildContext context) {
    return SelectorView<StudentViewModel, JobApplication>(
      selector: (_, vm) => vm.getJobApplication(index),
      builder: (_, vm, jobApplication, ___) {
        // print('my print, isViewResult: ${jobApplication.isViewResult}');
        return ListView(
          padding: const EdgeInsets.all(20),
          children: <Widget>[
            SizedBox(height: MediaQuery.of(context).size.height * 0.20),
            Column(
              children: <Widget>[
                RichText(
                  text: TextSpan(
                    children: <TextSpan>[
                      TextSpan(
                        text: 'Your result is...',
                        style: TextStyle(
                          color: Colors.grey[800],
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                // approved or declined
                Container(
                  alignment: Alignment.center,
                  height: 50,
                  width: 200,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(25.0),
                      topRight: Radius.circular(25.0),
                      bottomLeft: Radius.circular(25.0),
                      bottomRight: Radius.circular(25.0),
                    ),
                    color: jobApplication.approvalStatus == 'Approved'
                        ? Colors.greenAccent[700]
                        : Colors.redAccent[700],
                  ),
                  child: RichText(
                    text: TextSpan(
                      children: <TextSpan>[
                        TextSpan(
                          text: jobApplication.approvalStatus.toUpperCase(),
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 50),
                // return dashboard button
                View<StudentViewModel>(
                  shouldRebuild: false,
                  builder: (_, vmJobApplication, __) {
                    return MaterialButton(
                      minWidth: MediaQuery.of(context).size.width * 0.8,
                      height: 60,
                      color: Colors.deepOrange,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0)),
                      onPressed: () async {
                        if (jobApplication.isViewResult == false) {
                          // update isViewResult to true
                          jobApplication.isViewResult = true;
                          await vmJobApplication.updateJobApplication(
                              id: jobApplication.id, data: jobApplication);
                          // pop to dashboard
                          Navigator.of(context).pop();
                          Navigator.of(context).pop();
                          Navigator.of(context).pop();
                          Navigator.of(context).pop();
                        } else {
                          Navigator.of(context).pop();
                          Navigator.of(context).pop();
                          Navigator.of(context).pop();
                        }
                      },
                      child: const Text(
                        "RETURN TO DASHBOARD",
                        style: TextStyle(color: Colors.white),
                      ),
                    );
                  },
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
