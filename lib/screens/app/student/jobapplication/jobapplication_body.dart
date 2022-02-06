import 'package:flutter/material.dart';
import 'package:phoenixjobs/models/job_application.dart';
import 'package:phoenixjobs/screens/app/student/applicationdetails/applicationdetails_screen.dart';
import 'package:phoenixjobs/screens/app/student/student_viewmodel.dart';
import 'package:phoenixjobs/screens/view.dart';

class JobapplicationBody extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  final state;
  // ignore: use_key_in_widget_constructors
  const JobapplicationBody({this.state});

  void _navigateApplicationdetailsScreen({context, index}) async {
    await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => ApplicationdetailsScreen(index: index),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return View<StudentViewModel>(
      builder: (_, vm, __) {
        return ListView(
          padding: const EdgeInsets.all(20),
          children: <Widget>[
            // first item
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
                      return InkWell(
                        onTap: () => _navigateApplicationdetailsScreen(
                            context: context, index: index),
                        child: Column(
                          children: <Widget>[
                            // title image
                            Container(
                              width: MediaQuery.of(context).size.width,
                              height: 150,
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
                                ),
                                image: const DecorationImage(
                                  fit: BoxFit.cover,
                                  image: AssetImage(
                                      "assets/images/screens/student/joblist/joblist_sample_1.jpg"),
                                ),
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width,
                              padding: const EdgeInsets.all(15),
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
                                    bottomLeft: Radius.circular(20.0),
                                    bottomRight: Radius.circular(20.0),
                                  ),
                                  color: Colors.white),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  // Job title
                                  RichText(
                                    text: TextSpan(
                                      children: <TextSpan>[
                                        TextSpan(
                                          text:
                                              jobApplication.selectedJob.title,
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
                                          text: jobApplication
                                              .selectedJob.recruiter.username,
                                          style: const TextStyle(
                                            color: Colors.blue,
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(height: 40),
                                  // venue
                                  RichText(
                                    text: TextSpan(
                                      children: <TextSpan>[
                                        TextSpan(
                                          text:
                                              jobApplication.selectedJob.venue,
                                          style: TextStyle(
                                            color: Colors.grey[800],
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(height: 40),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      RichText(
                                        text: TextSpan(
                                          children: <TextSpan>[
                                            TextSpan(
                                              text: 'Applied on ',
                                              style: TextStyle(
                                                color: Colors.grey[400],
                                                fontSize: 12,
                                              ),
                                            ),
                                            TextSpan(
                                              text: jobApplication.dateApply,
                                              style: TextStyle(
                                                color: Colors.grey[400],
                                                fontSize: 12,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      RichText(
                                        text: TextSpan(
                                          children: <TextSpan>[
                                            TextSpan(
                                              text: 'See details   >',
                                              style: TextStyle(
                                                color: Colors.grey[400],
                                                fontSize: 12,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 20),
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
