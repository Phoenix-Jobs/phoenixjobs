// ignore_for_file: import_of_legacy_library_into_null_safe

import 'package:flutter/material.dart';
import 'package:phoenixjobs/models/job_application.dart';
import 'package:phoenixjobs/screens/app/student/student_viewmodel.dart';
import 'package:phoenixjobs/screens/view.dart';

class PaymentTile extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  const PaymentTile(this.index);
  final int index;

  @override
  Widget build(BuildContext context) {
    return SelectorView<StudentViewModel, JobApplication>(
      selector: (_, vm) => vm.getPaymentStatus(index),
      builder: (_, vm, jobApplication, ___) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
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
            const SizedBox(height: 5),
            RichText(
              text: TextSpan(
                children: <TextSpan>[
                  TextSpan(
                    text: jobApplication.paymentStatus,
                    style: TextStyle(
                      color:
                          jobApplication.paymentStatus == 'Payment successful'
                              ? Colors.lightGreenAccent[400]
                              : Colors.amberAccent[400],
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
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
