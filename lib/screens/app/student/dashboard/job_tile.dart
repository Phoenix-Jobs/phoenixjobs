// ignore_for_file: import_of_legacy_library_into_null_safe

import 'package:flutter/material.dart';
import 'package:phoenixjobs/models/job.dart';
import 'package:phoenixjobs/screens/app/student/dashboard/dashboard_viewmodel.dart';
import 'package:phoenixjobs/screens/view.dart';

class JobTile extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  const JobTile(this.index);
  final int index;

  @override
  Widget build(BuildContext context) {
    return SelectorView<DashboardViewmodel, Job>(
      selector: (_, vm) => vm.getJob(index),
      builder: (_, vm, job, ___) {
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
                        text: job.title,
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
