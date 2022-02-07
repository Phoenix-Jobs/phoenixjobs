// ignore_for_file: import_of_legacy_library_into_null_safe

import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:phoenixjobs/models/job.dart';
import 'package:phoenixjobs/models/job_application.dart';
import 'package:phoenixjobs/models/user.dart';
import 'package:phoenixjobs/screens/app/staff/addrecruitment/addrecruitment_screen.dart';
import 'package:phoenixjobs/screens/app/staff/staff_viewmodel.dart';
import 'package:phoenixjobs/screens/app/student/student_viewmodel.dart';
import 'package:phoenixjobs/screens/view.dart';

class JobdetailsBody extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  final state, index, operation;
  // ignore: use_key_in_widget_constructors
  const JobdetailsBody({this.state, this.index, this.operation});

  void _navigateAddrecruitmentScreen({context, index}) async {
    await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) =>
              AddrecruitmentScreen(index: index, operation: 'update'),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return SelectorView<StudentViewModel, Job>(
      selector: (_, vm) => vm.currentUser.status == 'Student'
          ? vm.getJob(index)
          : operation == 'staffJoblist'
              ? vm.getJob(index)
              : vm.getRecruitJob(index),
      builder: (_, vm, job, ___) {
        print('my print, here');
        return ListView(
          children: <Widget>[
            // title image container
            Container(
              width: MediaQuery.of(context).size.width,
              height: 300,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(
                      "assets/images/screens/student/joblist/joblist_sample_1.jpg"),
                ),
              ),
            ),
            // text container
            Container(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  // list of text content
                  RichText(
                    text: TextSpan(
                      children: <TextSpan>[
                        TextSpan(
                          text: job.title,
                          style: const TextStyle(
                            color: Colors.deepOrange,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  // Posted by staff_xxx
                  RichText(
                    text: TextSpan(
                      children: <TextSpan>[
                        TextSpan(
                          text: 'Posted by ',
                          style: TextStyle(
                            color: Colors.grey[800],
                            fontSize: 12,
                          ),
                        ),
                        TextSpan(
                          text: job.recruiter.username,
                          style: const TextStyle(
                            color: Colors.blue,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 5),
                  // venue
                  RichText(
                    text: TextSpan(
                      children: <TextSpan>[
                        TextSpan(
                          text: job.venue,
                          style: TextStyle(
                            color: Colors.grey[800],
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 5),
                  // Posted on "some date"
                  RichText(
                    text: TextSpan(
                      children: <TextSpan>[
                        TextSpan(
                          text: 'Posted on ',
                          style: TextStyle(
                            color: Colors.grey[800],
                            fontSize: 12,
                          ),
                        ),
                        TextSpan(
                          text: job.datePost,
                          style: TextStyle(
                            color: Colors.grey[800],
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                  // divider line
                  const Divider(),
                  // Job Highlight
                  RichText(
                    text: TextSpan(
                      children: <TextSpan>[
                        TextSpan(
                          text: 'Job Highlights',
                          style: TextStyle(
                            color: Colors.grey[800],
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 5),
                  // Job Highlight items
                  RichText(
                    text: TextSpan(
                      children: <TextSpan>[
                        TextSpan(
                          text: job.jobHighlights,
                          style: TextStyle(
                            color: Colors.grey[800],
                            fontSize: 12,
                            height: 1.65,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 15),
                  // Job Responsibilities
                  RichText(
                    text: TextSpan(
                      children: <TextSpan>[
                        TextSpan(
                          text: 'Job Responsibilities',
                          style: TextStyle(
                            color: Colors.grey[800],
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
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
                          text: job.jobResponsibilities,
                          style: TextStyle(
                            color: Colors.grey[800],
                            fontSize: 12,
                            height: 1.65,
                          ),
                        ),
                      ],
                    ),
                  ),
                  // divider line
                  const Divider(),
                  // Additional Informations
                  RichText(
                    text: TextSpan(
                      children: <TextSpan>[
                        TextSpan(
                          text: 'Additional Informations',
                          style: TextStyle(
                            color: Colors.grey[800],
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Additional Informations items
                  const SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      // left column
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            // career level
                            RichText(
                              text: TextSpan(
                                children: <TextSpan>[
                                  TextSpan(
                                    text: 'Career Level',
                                    style: TextStyle(
                                      color: Colors.grey[800],
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 5),
                            // career level item
                            RichText(
                              text: TextSpan(
                                children: <TextSpan>[
                                  TextSpan(
                                    text: job.careerLevel,
                                    style: TextStyle(
                                      color: Colors.grey[800],
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 15),
                            // working hour
                            RichText(
                              text: TextSpan(
                                children: <TextSpan>[
                                  TextSpan(
                                    text: 'Working Hour',
                                    style: TextStyle(
                                      color: Colors.grey[800],
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 5),
                            // working hour item
                            RichText(
                              text: TextSpan(
                                children: <TextSpan>[
                                  TextSpan(
                                    text: job.workingHour,
                                    style: TextStyle(
                                      color: Colors.grey[800],
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      /* end of left column */
                      // right column
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            // job specializations
                            RichText(
                              text: TextSpan(
                                children: <TextSpan>[
                                  TextSpan(
                                    text: 'Job Specializations',
                                    style: TextStyle(
                                      color: Colors.grey[800],
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 5),
                            // job specializations item
                            RichText(
                              text: TextSpan(
                                children: <TextSpan>[
                                  TextSpan(
                                    text: job.jobSpec,
                                    style: TextStyle(
                                      color: Colors.grey[800],
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 15),
                            // working time
                            RichText(
                              text: TextSpan(
                                children: <TextSpan>[
                                  TextSpan(
                                    text: 'Working Time',
                                    style: TextStyle(
                                      color: Colors.grey[800],
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 5),
                            // working hour item
                            RichText(
                              text: TextSpan(
                                children: <TextSpan>[
                                  TextSpan(
                                    text: job.workingTime,
                                    style: TextStyle(
                                      color: Colors.grey[800],
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      /* end of right column */
                    ],
                  ),
                  /* end of additional infomations */
                  const SizedBox(height: 30),
                  // update job button
                  if (vm.currentUser.uid == job.recruiter.uid)
                    View<StaffViewModel>(
                      shouldRebuild: false,
                      builder: (_, vmRecruitJob, __) {
                        return MaterialButton(
                          minWidth: MediaQuery.of(context).size.width,
                          height: 60,
                          color: Colors.deepOrange,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0)),
                          child: const Text(
                            "UPDATE",
                            style: TextStyle(color: Colors.white),
                          ),
                          onPressed: () {
                            _navigateAddrecruitmentScreen(
                                context: context, index: index);
                          },
                        );
                      },
                    ),
                  const SizedBox(height: 20),
                  // delete job button
                  if (vm.currentUser.uid == job.recruiter.uid)
                    View<StaffViewModel>(
                      shouldRebuild: false,
                      builder: (_, vmRecruitJob, __) {
                        return MaterialButton(
                          minWidth: MediaQuery.of(context).size.width,
                          height: 60,
                          color: Colors.deepOrange,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0)),
                          child: const Text(
                            "DELETE",
                            style: TextStyle(color: Colors.white),
                          ),
                          onPressed: () {
                            vm.deleteRecruitJob(job.id);
                            Navigator.of(context).pop();
                          },
                        );
                      },
                    ),
                  const SizedBox(height: 30),
                  // apply job button
                  if (vm.currentUser.status == 'Student')
                    View<StudentViewModel>(
                      shouldRebuild: false,
                      builder: (_, vmJobApplication, __) {
                        return MaterialButton(
                          minWidth: MediaQuery.of(context).size.width,
                          height: 60,
                          color: vm.isJobApplicationApplied(job.id)
                              ? Colors.grey[350]
                              : Colors.deepOrange,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0)),
                          child: Text(
                            vm.isJobApplicationApplied(job.id)
                                ? "JOB APPLIED"
                                : "APPLY JOB",
                            style: const TextStyle(color: Colors.white),
                          ),
                          onPressed: () {
                            vm.isJobApplicationApplied(job.id)
                                ? null
                                : showCupertinoDialog(
                                    context: context,
                                    builder: (BuildContext ctx) {
                                      return CupertinoAlertDialog(
                                        title: const Text('Apply Job'),
                                        content: const Text(
                                            'Confirm to submit your application? Your apllication will notify the recruiter and wait for approval.'),
                                        actions: [
                                          CupertinoDialogAction(
                                              onPressed: () {
                                                final dateToday =
                                                    DateTime.now();
                                                String strDateToday =
                                                    DateFormat('d MMM yyyy')
                                                        .format(dateToday);
                                                // add into job application
                                                JobApplication jobApplication =
                                                    JobApplication(
                                                  approvalStatus:
                                                      'Waiting for approval status',
                                                  dateApply: strDateToday,
                                                  isApproval: false,
                                                  isPayment: false,
                                                  isViewResult: false,
                                                  paymentStatus: '',
                                                  selectedJob: Job(
                                                    id: job.id,
                                                    imagePath: job.imagePath,
                                                    recruiter: vm
                                                        .getJob(index)
                                                        .recruiter,
                                                    title: job.title,
                                                    venue: job.venue,
                                                  ),
                                                  applicant: User(
                                                    age: vm.currentUser.age,
                                                    email: vm.currentUser.email,
                                                    firstName: vm
                                                        .currentUser.firstName,
                                                    gender:
                                                        vm.currentUser.gender,
                                                    lastName:
                                                        vm.currentUser.lastName,
                                                    residueAddress: vm
                                                        .currentUser
                                                        .residueAddress,
                                                    uid: vm.currentUser.uid,
                                                    username:
                                                        vm.currentUser.username,
                                                  ),
                                                );
                                                // add by vm
                                                vmJobApplication
                                                    .addJobApplication(
                                                        jobApplication);
                                                // Confirm, Close the dialog and pop job details
                                                Navigator.of(context).pop();
                                                Navigator.of(context).pop();
                                              },
                                              child: const Text(
                                                'Confirm',
                                                style: TextStyle(
                                                    color: Colors.red),
                                              )),
                                          CupertinoDialogAction(
                                            onPressed: () {
                                              // Cancel, Close the dialog
                                              Navigator.of(context).pop();
                                            },
                                            child: const Text(
                                              'Cancel',
                                              style:
                                                  TextStyle(color: Colors.blue),
                                            ),
                                          ),
                                        ],
                                      );
                                    },
                                  );
                          },
                        );
                      },
                    ),
                  const SizedBox(height: 20),
                ], /* end of text container */
              ),
            ),
          ],
        );
      },
    );
  }
}
