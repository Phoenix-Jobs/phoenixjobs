// ignore_for_file: import_of_legacy_library_into_null_safe

import 'package:flutter/material.dart';
import 'package:phoenixjobs/models/job_application.dart';
import 'package:phoenixjobs/screens/app/student/student_viewmodel.dart';
import 'package:phoenixjobs/screens/view.dart';

class ApplicationdetailsAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  // ignore: prefer_typing_uninitialized_variables
  final state, index;
  // ignore: use_key_in_widget_constructors
  const ApplicationdetailsAppBar({this.state, this.index});

  @override
  Size get preferredSize => const Size.fromHeight(50.0);

  @override
  Widget build(BuildContext context) {
    return SelectorView<StudentViewModel, JobApplication>(
        selector: (_, vm) => vm.getJobApplication(index),
        builder: (_, vm, jobApplication, ___) {
          return AppBar(
            leading: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () => Navigator.of(context).pop(),
            ),
            title: Text(jobApplication.selectedJob.title),
            centerTitle: false,
          );
        });
  }
}
