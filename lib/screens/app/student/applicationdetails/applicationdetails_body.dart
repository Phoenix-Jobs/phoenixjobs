// ignore_for_file: import_of_legacy_library_into_null_safe

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:phoenixjobs/models/job_application.dart';
import 'package:phoenixjobs/screens/app/student/applicationresult/applicationresult_screen.dart';
import 'package:phoenixjobs/screens/app/student/student_viewmodel.dart';
import 'package:phoenixjobs/screens/app/student/makepayment/makepayment_screen.dart';
import 'package:phoenixjobs/screens/view.dart';

class ApplicationdetailsBody extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  final state, index;
  // ignore: use_key_in_widget_constructors
  const ApplicationdetailsBody({this.state, this.index});

  Future<void> _viewResultDialog(BuildContext context,
      StudentViewModel vmJobApplication, JobApplication jobApplication) async {
    showCupertinoDialog(
        context: context,
        builder: (BuildContext ctx) {
          return CupertinoAlertDialog(
            title: const Text('Viewing result'),
            content: const Text(
                'In order to view your application result, you have to do payment.'),
            actions: [
              CupertinoDialogAction(
                onPressed: () async {
                  // update isPayment and paymentStatus
                  jobApplication.isPayment = true;
                  jobApplication.paymentStatus = 'Pending payment';
                  vmJobApplication.updateJobApplication(
                      id: jobApplication.id, data: jobApplication);
                  // OK, Close the dialog and navigate to payment
                  Navigator.of(context).pop();
                  await Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => MakepaymentScreen(index: index)));
                },
                child: const Text(
                  'OK',
                  style: TextStyle(color: Colors.red),
                ),
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return SelectorView<StudentViewModel, JobApplication>(
        selector: (_, vm) => vm.getJobApplication(index),
        builder: (_, vm, jobApplication, ___) {
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
                            text: jobApplication.selectedJob.title,
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
                            text: jobApplication.selectedJob.recruiter.username,
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
                            text: jobApplication.selectedJob.venue,
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
                            text: 'Applied on ',
                            style: TextStyle(
                              color: Colors.grey[800],
                              fontSize: 12,
                            ),
                          ),
                          TextSpan(
                            text: jobApplication.dateApply,
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
                    // Application status
                    RichText(
                      text: TextSpan(
                        children: <TextSpan>[
                          TextSpan(
                            text: 'Application Status',
                            style: TextStyle(
                              color: Colors.grey[800],
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 15),
                    // application status items
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          RichText(
                            text: TextSpan(
                              children: <TextSpan>[
                                TextSpan(
                                  text: 'Job application',
                                  style: TextStyle(
                                    color: Colors.lightGreenAccent[400],
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 10),
                          RichText(
                            text: TextSpan(
                              children: <TextSpan>[
                                TextSpan(
                                  text: '|',
                                  style: TextStyle(
                                    color: Colors.grey[400],
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 10),
                          RichText(
                            text: TextSpan(
                              children: <TextSpan>[
                                TextSpan(
                                  text: 'Waiting for approval',
                                  style: TextStyle(
                                    color: jobApplication.isApproval
                                        ? Colors.lightGreenAccent[400]
                                        : Colors.amberAccent[200],
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 10),
                          RichText(
                            text: TextSpan(
                              children: <TextSpan>[
                                TextSpan(
                                  text: '|',
                                  style: TextStyle(
                                    color: Colors.grey[400],
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 10),
                          RichText(
                            text: TextSpan(
                              children: <TextSpan>[
                                TextSpan(
                                  text: 'Recieved approval',
                                  style: TextStyle(
                                    color: jobApplication.isApproval
                                        ? jobApplication.isPayment
                                            ? Colors.lightGreenAccent[400]
                                            : Colors.amberAccent[200]
                                        : Colors.grey[350],
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 10),
                          RichText(
                            text: TextSpan(
                              children: <TextSpan>[
                                TextSpan(
                                  text: '|',
                                  style: TextStyle(
                                    color: Colors.grey[400],
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 10),
                          RichText(
                            text: TextSpan(
                              children: <TextSpan>[
                                TextSpan(
                                  text: 'Viewing result',
                                  style: TextStyle(
                                    color: jobApplication.paymentStatus ==
                                                'Pending payment' ||
                                            jobApplication.paymentStatus ==
                                                'Payment successful'
                                        ? jobApplication.paymentStatus ==
                                                'Payment successful'
                                            ? Colors.lightGreenAccent[400]
                                            : Colors.amberAccent[200]
                                        : Colors.grey[350],
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 30),
                    // view result button
                    View<StudentViewModel>(
                      shouldRebuild: false,
                      builder: (_, vmJobApplication, __) {
                        return MaterialButton(
                          minWidth: MediaQuery.of(context).size.width,
                          height: 60,
                          color: jobApplication.isApproval
                              ? Colors.deepOrange
                              : Colors.grey[350],
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0)),
                          onPressed: () async {
                            if (jobApplication.isApproval) {
                              if (jobApplication.paymentStatus ==
                                  'Payment successful') {
                                await Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) => ApplicationresultScreen(
                                            index: index)));
                              } else {
                                _viewResultDialog(
                                    context, vmJobApplication, jobApplication);
                              }
                            }
                          },
                          child: Text(
                            jobApplication.isApproval
                                ? "VIEW RESULT"
                                : "WAITING FOR APPROVAL",
                            style: const TextStyle(color: Colors.white),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          );
        });
  }
}
