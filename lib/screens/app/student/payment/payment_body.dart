// ignore_for_file: import_of_legacy_library_into_null_safe

import 'package:flutter/material.dart';
import 'package:phoenixjobs/models/job_application.dart';
import 'package:phoenixjobs/screens/app/student/student_viewmodel.dart';
import 'package:phoenixjobs/screens/view.dart';

class PaymentBody extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  final state;
  // ignore: use_key_in_widget_constructors
  const PaymentBody({this.state});

  @override
  Widget build(BuildContext context) {
    return View<StudentViewModel>(
      builder: (_, vm, __) {
        return ListView(
          padding: const EdgeInsets.all(20),
          children: <Widget>[
            // payment items
            Container(
              // test the border
              // decoration:
              //     BoxDecoration(border: Border.all(color: Colors.blueAccent)),
              // padding is necessary, else items will dissappear
              padding: const EdgeInsets.all(0),
              child: Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: const ClampingScrollPhysics(),
                  itemCount: vm.jobApplicationLength,
                  itemBuilder: (context, index) =>
                      SelectorView<StudentViewModel, JobApplication>(
                    selector: (_, vm) => vm.getJobApplication(index),
                    builder: (_, vm, jobApplication, ___) {
                      return Container(
                        decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 5,
                                blurRadius: 10,
                                offset: const Offset(
                                    0, 3), // changes position of shadow
                              ),
                            ],
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(20.0),
                              topRight: Radius.circular(20.0),
                              bottomLeft: Radius.circular(20.0),
                              bottomRight: Radius.circular(20.0),
                            ),
                            color: Colors.white),
                        padding: const EdgeInsets.all(20),
                        margin: const EdgeInsets.only(bottom: 20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            // first line
                            RichText(
                              text: TextSpan(
                                children: <TextSpan>[
                                  TextSpan(
                                    text: 'Viewing result for ',
                                    style: TextStyle(
                                      color: Colors.grey[800],
                                      fontSize: 14,
                                    ),
                                  ),
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
                            const SizedBox(height: 10),
                            // second line
                            RichText(
                              text: TextSpan(
                                children: <TextSpan>[
                                  TextSpan(
                                    text: jobApplication.paymentStatus,
                                    style: TextStyle(
                                      color: Colors.lightGreenAccent[400],
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
