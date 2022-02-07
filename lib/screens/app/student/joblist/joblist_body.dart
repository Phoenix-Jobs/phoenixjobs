// ignore_for_file: import_of_legacy_library_into_null_safe

import 'package:flutter/material.dart';
import 'package:phoenixjobs/models/job.dart';
import 'package:phoenixjobs/screens/app/student/student_viewmodel.dart';
import 'package:phoenixjobs/screens/app/student/jobdetails/jobdetails_screen.dart';
import 'package:phoenixjobs/screens/view.dart';

class JoblistBody extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  final state;
  // ignore: use_key_in_widget_constructors
  const JoblistBody({this.state});

  void _navigateJobdetailsScreen(
      BuildContext context, int index, StudentViewModel vm) async {
    print('my print, user: ${vm.currentUser.status}');
    if (vm.currentUser.status == 'Staff') {
      await Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) =>
                JobdetailsScreen(index: index, operation: 'staffJoblist'),
          ));
    } else {
      await Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => JobdetailsScreen(index: index),
          ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return View<StudentViewModel>(
      builder: (_, vm, __) {
        return ListView(
          padding: const EdgeInsets.all(20),
          children: <Widget>[
            // job items
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
                  itemCount: vm.jobLength,
                  itemBuilder: (context, index) =>
                      SelectorView<StudentViewModel, Job>(
                    selector: (_, vm) => vm.getJob(index),
                    builder: (_, vm, job, ___) {
                      return Column(
                        children: <Widget>[
                          InkWell(
                            onTap: () =>
                                _navigateJobdetailsScreen(context, index, vm),
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
                                        topRight: Radius.circular(20.0)),
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
                                            offset: const Offset(0,
                                                3), // changes position of shadow
                                          ),
                                        ],
                                        borderRadius: const BorderRadius.only(
                                          bottomLeft: Radius.circular(20.0),
                                          bottomRight: Radius.circular(20.0),
                                        ),
                                        color: Colors.white),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        // Job title
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
                                        const SizedBox(height: 40),
                                        // venue
                                        RichText(
                                          text: TextSpan(
                                            children: <TextSpan>[
                                              TextSpan(
                                                text: job.venue,
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
                                                    text: 'Posted on ',
                                                    style: TextStyle(
                                                      color: Colors.grey[400],
                                                      fontSize: 12,
                                                    ),
                                                  ),
                                                  TextSpan(
                                                    text: job.datePost,
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
                                    )),
                              ],
                            ),
                          ),
                          const SizedBox(height: 20),
                        ],
                      );
                    },
                  ),
                ),
              ),
            ),
            // InkWell(
            //   onTap: () => _navigateJobdetailsScreen(context: context),
            //   child: Column(
            //     children: <Widget>[
            //       // title image
            //       Container(
            //         width: MediaQuery.of(context).size.width,
            //         height: 150,
            //         decoration: BoxDecoration(
            //           boxShadow: [
            //             BoxShadow(
            //               color: Colors.grey.withOpacity(0.5),
            //               spreadRadius: 5,
            //               blurRadius: 10,
            //               offset:
            //                   const Offset(0, 3), // changes position of shadow
            //             ),
            //           ],
            //           borderRadius: const BorderRadius.only(
            //               topLeft: Radius.circular(20.0),
            //               topRight: Radius.circular(20.0)),
            //           image: const DecorationImage(
            //             fit: BoxFit.cover,
            //             image: AssetImage(
            //                 "assets/images/screens/student/joblist/joblist_sample_1.jpg"),
            //           ),
            //         ),
            //       ),
            //       Container(
            //           width: MediaQuery.of(context).size.width,
            //           padding: const EdgeInsets.all(15),
            //           decoration: BoxDecoration(
            //               boxShadow: [
            //                 BoxShadow(
            //                   color: Colors.grey.withOpacity(0.5),
            //                   spreadRadius: 5,
            //                   blurRadius: 10,
            //                   offset: const Offset(
            //                       0, 3), // changes position of shadow
            //                 ),
            //               ],
            //               borderRadius: const BorderRadius.only(
            //                 bottomLeft: Radius.circular(20.0),
            //                 bottomRight: Radius.circular(20.0),
            //               ),
            //               color: Colors.white),
            //           child: Column(
            //             mainAxisAlignment: MainAxisAlignment.start,
            //             crossAxisAlignment: CrossAxisAlignment.start,
            //             children: <Widget>[
            //               // Job title
            //               RichText(
            //                 text: const TextSpan(
            //                   children: <TextSpan>[
            //                     TextSpan(
            //                       text: 'Restaurant Mak XXX',
            //                       style: TextStyle(
            //                         color: Colors.deepOrange,
            //                         fontSize: 18,
            //                         fontWeight: FontWeight.bold,
            //                       ),
            //                     ),
            //                   ],
            //                 ),
            //               ),
            //               const SizedBox(height: 10),
            //               // Posted by staff_xxx
            //               RichText(
            //                 text: TextSpan(
            //                   children: <TextSpan>[
            //                     TextSpan(
            //                       text: 'Posted by ',
            //                       style: TextStyle(
            //                         color: Colors.grey[800],
            //                         fontSize: 12,
            //                       ),
            //                     ),
            //                     const TextSpan(
            //                       text: 'Staff_001',
            //                       style: TextStyle(
            //                         color: Colors.blue,
            //                         fontSize: 12,
            //                         fontWeight: FontWeight.bold,
            //                       ),
            //                     ),
            //                   ],
            //                 ),
            //               ),
            //               const SizedBox(height: 40),
            //               // venue
            //               RichText(
            //                 text: TextSpan(
            //                   children: <TextSpan>[
            //                     TextSpan(
            //                       text: 'Dewan Makan XXX',
            //                       style: TextStyle(
            //                         color: Colors.grey[800],
            //                         fontSize: 14,
            //                         fontWeight: FontWeight.bold,
            //                       ),
            //                     ),
            //                   ],
            //                 ),
            //               ),
            //               const SizedBox(height: 40),
            //               Row(
            //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //                 children: <Widget>[
            //                   RichText(
            //                     text: TextSpan(
            //                       children: <TextSpan>[
            //                         TextSpan(
            //                           text: 'Posted on ',
            //                           style: TextStyle(
            //                             color: Colors.grey[400],
            //                             fontSize: 12,
            //                           ),
            //                         ),
            //                         TextSpan(
            //                           text: '30 Oct 2021',
            //                           style: TextStyle(
            //                             color: Colors.grey[400],
            //                             fontSize: 12,
            //                           ),
            //                         ),
            //                       ],
            //                     ),
            //                   ),
            //                   RichText(
            //                     text: TextSpan(
            //                       children: <TextSpan>[
            //                         TextSpan(
            //                           text: 'See details   >',
            //                           style: TextStyle(
            //                             color: Colors.grey[400],
            //                             fontSize: 12,
            //                           ),
            //                         ),
            //                       ],
            //                     ),
            //                   ),
            //                 ],
            //               ),
            //             ],
            //           )),
            //     ],
            //   ),
            // ),
            // const SizedBox(height: 20),
            // // second item
            // InkWell(
            //   onTap: () {},
            //   child: Column(
            //     children: <Widget>[
            //       // title image
            //       Container(
            //         width: MediaQuery.of(context).size.width,
            //         height: 150,
            //         decoration: BoxDecoration(
            //           boxShadow: [
            //             BoxShadow(
            //               color: Colors.grey.withOpacity(0.5),
            //               spreadRadius: 5,
            //               blurRadius: 10,
            //               offset:
            //                   const Offset(0, 3), // changes position of shadow
            //             ),
            //           ],
            //           borderRadius: const BorderRadius.only(
            //               topLeft: Radius.circular(20.0),
            //               topRight: Radius.circular(20.0)),
            //           image: const DecorationImage(
            //             fit: BoxFit.cover,
            //             image: AssetImage(
            //                 "assets/images/screens/student/joblist/joblist_sample_1.jpg"),
            //           ),
            //         ),
            //       ),
            //       Container(
            //           width: MediaQuery.of(context).size.width,
            //           padding: const EdgeInsets.all(15),
            //           decoration: BoxDecoration(
            //               boxShadow: [
            //                 BoxShadow(
            //                   color: Colors.grey.withOpacity(0.5),
            //                   spreadRadius: 5,
            //                   blurRadius: 10,
            //                   offset: const Offset(
            //                       0, 3), // changes position of shadow
            //                 ),
            //               ],
            //               borderRadius: const BorderRadius.only(
            //                 bottomLeft: Radius.circular(20.0),
            //                 bottomRight: Radius.circular(20.0),
            //               ),
            //               color: Colors.white),
            //           child: Column(
            //             mainAxisAlignment: MainAxisAlignment.start,
            //             crossAxisAlignment: CrossAxisAlignment.start,
            //             children: <Widget>[
            //               // Job title
            //               RichText(
            //                 text: const TextSpan(
            //                   children: <TextSpan>[
            //                     TextSpan(
            //                       text: 'X Project Assistant',
            //                       style: TextStyle(
            //                         color: Colors.deepOrange,
            //                         fontSize: 18,
            //                         fontWeight: FontWeight.bold,
            //                       ),
            //                     ),
            //                   ],
            //                 ),
            //               ),
            //               const SizedBox(height: 10),
            //               // Posted by staff_xxx
            //               RichText(
            //                 text: TextSpan(
            //                   children: <TextSpan>[
            //                     TextSpan(
            //                       text: 'Posted by ',
            //                       style: TextStyle(
            //                         color: Colors.grey[800],
            //                         fontSize: 12,
            //                       ),
            //                     ),
            //                     const TextSpan(
            //                       text: 'Staff_002',
            //                       style: TextStyle(
            //                         color: Colors.blue,
            //                         fontSize: 12,
            //                         fontWeight: FontWeight.bold,
            //                       ),
            //                     ),
            //                   ],
            //                 ),
            //               ),
            //               const SizedBox(height: 40),
            //               // venue
            //               RichText(
            //                 text: TextSpan(
            //                   children: <TextSpan>[
            //                     TextSpan(
            //                       text: 'Building X, Office XX',
            //                       style: TextStyle(
            //                         color: Colors.grey[800],
            //                         fontSize: 14,
            //                         fontWeight: FontWeight.bold,
            //                       ),
            //                     ),
            //                   ],
            //                 ),
            //               ),
            //               const SizedBox(height: 40),
            //               Row(
            //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //                 children: <Widget>[
            //                   RichText(
            //                     text: TextSpan(
            //                       children: <TextSpan>[
            //                         TextSpan(
            //                           text: 'Posted on ',
            //                           style: TextStyle(
            //                             color: Colors.grey[400],
            //                             fontSize: 12,
            //                           ),
            //                         ),
            //                         TextSpan(
            //                           text: '24 Oct 2021',
            //                           style: TextStyle(
            //                             color: Colors.grey[400],
            //                             fontSize: 12,
            //                           ),
            //                         ),
            //                       ],
            //                     ),
            //                   ),
            //                   RichText(
            //                     text: TextSpan(
            //                       children: <TextSpan>[
            //                         TextSpan(
            //                           text: 'See details   >',
            //                           style: TextStyle(
            //                             color: Colors.grey[400],
            //                             fontSize: 12,
            //                           ),
            //                         ),
            //                       ],
            //                     ),
            //                   ),
            //                 ],
            //               ),
            //             ],
            //           )),
            //     ],
            //   ),
            // ),
            // const SizedBox(height: 20),
            // // third item
            // InkWell(
            //   onTap: () {},
            //   child: Column(
            //     children: <Widget>[
            //       // title image
            //       Container(
            //         width: MediaQuery.of(context).size.width,
            //         height: 150,
            //         decoration: BoxDecoration(
            //           boxShadow: [
            //             BoxShadow(
            //               color: Colors.grey.withOpacity(0.5),
            //               spreadRadius: 5,
            //               blurRadius: 10,
            //               offset:
            //                   const Offset(0, 3), // changes position of shadow
            //             ),
            //           ],
            //           borderRadius: const BorderRadius.only(
            //               topLeft: Radius.circular(20.0),
            //               topRight: Radius.circular(20.0)),
            //           image: const DecorationImage(
            //             fit: BoxFit.cover,
            //             image: AssetImage(
            //                 "assets/images/screens/student/joblist/joblist_sample_1.jpg"),
            //           ),
            //         ),
            //       ),
            //       Container(
            //           width: MediaQuery.of(context).size.width,
            //           padding: const EdgeInsets.all(15),
            //           decoration: BoxDecoration(
            //               boxShadow: [
            //                 BoxShadow(
            //                   color: Colors.grey.withOpacity(0.5),
            //                   spreadRadius: 5,
            //                   blurRadius: 10,
            //                   offset: const Offset(
            //                       0, 3), // changes position of shadow
            //                 ),
            //               ],
            //               borderRadius: const BorderRadius.only(
            //                 bottomLeft: Radius.circular(20.0),
            //                 bottomRight: Radius.circular(20.0),
            //               ),
            //               color: Colors.white),
            //           child: Column(
            //             mainAxisAlignment: MainAxisAlignment.start,
            //             crossAxisAlignment: CrossAxisAlignment.start,
            //             children: <Widget>[
            //               // Job title
            //               RichText(
            //                 text: const TextSpan(
            //                   children: <TextSpan>[
            //                     TextSpan(
            //                       text: 'XX Research and Development',
            //                       style: TextStyle(
            //                         color: Colors.deepOrange,
            //                         fontSize: 18,
            //                         fontWeight: FontWeight.bold,
            //                       ),
            //                     ),
            //                   ],
            //                 ),
            //               ),
            //               const SizedBox(height: 10),
            //               // Posted by staff_xxx
            //               RichText(
            //                 text: TextSpan(
            //                   children: <TextSpan>[
            //                     TextSpan(
            //                       text: 'Posted by ',
            //                       style: TextStyle(
            //                         color: Colors.grey[800],
            //                         fontSize: 12,
            //                       ),
            //                     ),
            //                     const TextSpan(
            //                       text: 'Staff_003',
            //                       style: TextStyle(
            //                         color: Colors.blue,
            //                         fontSize: 12,
            //                         fontWeight: FontWeight.bold,
            //                       ),
            //                     ),
            //                   ],
            //                 ),
            //               ),
            //               const SizedBox(height: 40),
            //               // venue
            //               RichText(
            //                 text: TextSpan(
            //                   children: <TextSpan>[
            //                     TextSpan(
            //                       text: 'Laboratory ABC',
            //                       style: TextStyle(
            //                         color: Colors.grey[800],
            //                         fontSize: 14,
            //                         fontWeight: FontWeight.bold,
            //                       ),
            //                     ),
            //                   ],
            //                 ),
            //               ),
            //               const SizedBox(height: 40),
            //               Row(
            //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //                 children: <Widget>[
            //                   RichText(
            //                     text: TextSpan(
            //                       children: <TextSpan>[
            //                         TextSpan(
            //                           text: 'Posted on ',
            //                           style: TextStyle(
            //                             color: Colors.grey[400],
            //                             fontSize: 12,
            //                           ),
            //                         ),
            //                         TextSpan(
            //                           text: '13 Oct 2021',
            //                           style: TextStyle(
            //                             color: Colors.grey[400],
            //                             fontSize: 12,
            //                           ),
            //                         ),
            //                       ],
            //                     ),
            //                   ),
            //                   RichText(
            //                     text: TextSpan(
            //                       children: <TextSpan>[
            //                         TextSpan(
            //                           text: 'See details   >',
            //                           style: TextStyle(
            //                             color: Colors.grey[400],
            //                             fontSize: 12,
            //                           ),
            //                         ),
            //                       ],
            //                     ),
            //                   ),
            //                 ],
            //               ),
            //             ],
            //           )),
            //     ],
            //   ),
            // ),
          ],
        );
      },
    );
  }
}
