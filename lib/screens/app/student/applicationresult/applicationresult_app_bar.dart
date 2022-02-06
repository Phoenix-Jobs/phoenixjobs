import 'package:flutter/material.dart';
import 'package:phoenixjobs/models/job_application.dart';
import 'package:phoenixjobs/screens/app/student/student_viewmodel.dart';
import 'package:phoenixjobs/screens/view.dart';

class ApplicationresultAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  // ignore: prefer_typing_uninitialized_variables
  final state, index;
  // ignore: use_key_in_widget_constructors
  const ApplicationresultAppBar({this.state, this.index});

  @override
  Size get preferredSize => const Size.fromHeight(50.0);

  @override
  Widget build(BuildContext context) {
    return SelectorView<StudentViewModel, JobApplication>(
      selector: (_, vm) => vm.getJobApplication(index),
      builder: (_, vm, jobApplication, ___) {
        return AppBar(
          leading: View<StudentViewModel>(
            shouldRebuild: false,
            builder: (_, vmJobApplication, __) {
              return IconButton(
                icon: const Icon(Icons.clear, color: Colors.white),
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
              );
            },
          ),
          title: const Text('Application result'),
          centerTitle: false,
        );
      },
    );
  }
}
