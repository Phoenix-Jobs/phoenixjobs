// ignore_for_file: import_of_legacy_library_into_null_safe

import 'package:flutter/material.dart';
import 'package:phoenixjobs/models/job_application.dart';
import 'package:phoenixjobs/screens/app/staff/approvalstatus/approvalstatus_screen.dart';
import 'package:phoenixjobs/screens/app/student/student_viewmodel.dart';
import 'package:phoenixjobs/screens/view.dart';

class ApprovalBody extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  final state;
  // ignore: use_key_in_widget_constructors
  const ApprovalBody({this.state});

  void _navigateApprovalstatusScreen({context, index}) async {
    await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => ApprovalstatusScreen(index: index),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return View<StudentViewModel>(
      builder: (_, vm, __) {
        return ListView(
          padding: const EdgeInsets.all(20),
          children: <Widget>[
            // approval items
            Container(
              // test the border
              // decoration:
              //     BoxDecoration(border: Border.all(color: Colors.blueAccent)),
              // padding is necessary, else items will dissappear
              padding: const EdgeInsets.all(1),
              child: Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: const ClampingScrollPhysics(),
                  itemCount: vm.approvalLength,
                  itemBuilder: (context, index) =>
                      SelectorView<StudentViewModel, JobApplication>(
                    selector: (_, vm) => vm.getApproval(index),
                    builder: (_, vm, jobApplication, ___) {
                      return InkWell(
                        onTap: () {
                          _navigateApprovalstatusScreen(
                              context: context, index: index);
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          padding: const EdgeInsets.all(10),
                          margin: const EdgeInsets.only(bottom: 20),
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
                                bottomLeft: Radius.circular(40.0),
                                bottomRight: Radius.circular(40.0),
                                topLeft: Radius.circular(40.0),
                                topRight: Radius.circular(40.0),
                              ),
                              color: Colors.white),
                          child: Row(
                            children: <Widget>[
                              // Profile picture
                              Container(
                                width: 50,
                                height: 50,
                                alignment: Alignment.topLeft,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                      image: NetworkImage(
                                          'https://images.pexels.com/photos/37347/office-sitting-room-executive-sitting.jpg?cs=srgb&dl=pexels-pixabay-37347.jpg&fm=jpg'),
                                      fit: BoxFit.fill),
                                ),
                              ),
                              const SizedBox(width: 10),
                              // middle row
                              SizedBox(
                                width: 245,
                                height: 45,
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  // upper row
                                  children: <Widget>[
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        // From user
                                        RichText(
                                          text: TextSpan(
                                            children: <TextSpan>[
                                              TextSpan(
                                                text: 'From ',
                                                style: TextStyle(
                                                  color: Colors.grey[850],
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              TextSpan(
                                                text: jobApplication
                                                    .applicant.username,
                                                style: const TextStyle(
                                                  color: Colors.blue,
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        // application date
                                        RichText(
                                          text: TextSpan(
                                            children: <TextSpan>[
                                              TextSpan(
                                                text: jobApplication.dateApply,
                                                style: const TextStyle(
                                                  color: Colors.blue,
                                                  fontSize: 12,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    RichText(
                                      text: TextSpan(
                                        children: <TextSpan>[
                                          TextSpan(
                                            text: jobApplication
                                                .selectedJob.title,
                                            style: TextStyle(
                                              color: Colors.grey[500],
                                              fontSize: 11,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    RichText(
                                      text: TextSpan(
                                        children: <TextSpan>[
                                          TextSpan(
                                            text: jobApplication.approvalStatus,
                                            style: TextStyle(
                                              color: jobApplication
                                                          .approvalStatus ==
                                                      'Approved'
                                                  ? Colors.greenAccent[700]
                                                  : jobApplication
                                                              .approvalStatus ==
                                                          'Declined'
                                                      ? Colors.redAccent[700]
                                                      : Colors.yellow[800],
                                              fontSize: 12,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    // approval status
                                  ],
                                ),
                              ),
                              const SizedBox(width: 12),
                              // next icon
                              const SizedBox(
                                width: 1,
                                child: Icon(Icons.arrow_forward,
                                    color: Colors.grey, size: 18.0),
                              ),
                            ],
                          ),
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
