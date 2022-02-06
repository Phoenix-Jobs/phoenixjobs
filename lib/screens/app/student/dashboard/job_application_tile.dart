// ignore_for_file: import_of_legacy_library_into_null_safe

import 'package:flutter/material.dart';
import 'package:phoenixjobs/models/job_application.dart';
import 'package:phoenixjobs/screens/app/student/student_viewmodel.dart';
import 'package:phoenixjobs/screens/view.dart';

class JobApplicationTile extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  const JobApplicationTile(this.index);
  final int index;

  @override
  Widget build(BuildContext context) {
    return SelectorView<StudentViewModel, JobApplication>(
      selector: (_, vm) => vm.getJobApplication(index),
      builder: (_, vm, jobApplication, ___) {
        return Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                RichText(
                  text: TextSpan(
                    children: <TextSpan>[
                      TextSpan(
                        text: jobApplication.selectedJob.title,
                        style: TextStyle(
                          color: Colors.grey[800],
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
                RichText(
                  text: TextSpan(
                    children: <TextSpan>[
                      TextSpan(
                        text: '>',
                        style: TextStyle(
                          color: Colors.grey[400],
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 5),
            const Divider(),
            const SizedBox(height: 5),
          ],
        );
      },
    );
  }
}
