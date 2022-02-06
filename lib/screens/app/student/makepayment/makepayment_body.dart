// ignore_for_file: import_of_legacy_library_into_null_safe

import 'package:flutter/material.dart';
import 'package:phoenixjobs/models/job_application.dart';
import 'package:phoenixjobs/screens/app/student/applicationresult/applicationresult_screen.dart';
import 'package:phoenixjobs/screens/app/student/student_viewmodel.dart';
import 'package:phoenixjobs/screens/view.dart';

class MakepaymentBody extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  final state, index;
  // ignore: use_key_in_widget_constructors
  const MakepaymentBody({this.state, this.index});

  @override
  Widget build(BuildContext context) {
    return SelectorView<StudentViewModel, JobApplication>(
      selector: (_, vm) => vm.getJobApplication(index),
      builder: (_, vm, jobApplication, ___) {
        return ListView(
          padding: const EdgeInsets.all(20),
          children: <Widget>[
            // middle box
            Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 10,
                    offset: const Offset(0, 3), // changes position of shadow
                  ),
                ],
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  topRight: Radius.circular(20.0),
                  bottomLeft: Radius.circular(20.0),
                  bottomRight: Radius.circular(20.0),
                ),
                color: Colors.white,
              ),
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  // pay with card
                  RichText(
                    text: TextSpan(
                      children: <TextSpan>[
                        TextSpan(
                          text: 'Pay with card',
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
                  const Divider(),
                  const SizedBox(height: 5),
                  // cardholder name
                  RichText(
                    text: TextSpan(
                      children: <TextSpan>[
                        TextSpan(
                          text: 'Cardholder name',
                          style: TextStyle(
                            color: Colors.grey[800],
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  // cardholder name field
                  Container(
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(25.0),
                        topRight: Radius.circular(25.0),
                        bottomLeft: Radius.circular(25.0),
                        bottomRight: Radius.circular(25.0),
                      ),
                      color: Colors.grey[200],
                    ),
                  ),
                  const SizedBox(height: 10),
                  // card number
                  RichText(
                    text: TextSpan(
                      children: <TextSpan>[
                        TextSpan(
                          text: 'Card number',
                          style: TextStyle(
                            color: Colors.grey[800],
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  // card number field
                  Container(
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(25.0),
                        topRight: Radius.circular(25.0),
                        bottomLeft: Radius.circular(25.0),
                        bottomRight: Radius.circular(25.0),
                      ),
                      color: Colors.grey[200],
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      // expiration date
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            RichText(
                              text: TextSpan(
                                children: <TextSpan>[
                                  TextSpan(
                                    text: 'Expiration date',
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
                      const SizedBox(width: 10),
                      // cvv
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            RichText(
                              text: TextSpan(
                                children: <TextSpan>[
                                  TextSpan(
                                    text: 'CVV',
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
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      // expiration date
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              height: 50,
                              decoration: BoxDecoration(
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(25.0),
                                  topRight: Radius.circular(25.0),
                                  bottomLeft: Radius.circular(25.0),
                                  bottomRight: Radius.circular(25.0),
                                ),
                                color: Colors.grey[200],
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 10),
                      // cvv
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              height: 50,
                              decoration: BoxDecoration(
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(25.0),
                                  topRight: Radius.circular(25.0),
                                  bottomLeft: Radius.circular(25.0),
                                  bottomRight: Radius.circular(25.0),
                                ),
                                color: Colors.grey[200],
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
            // make payment button
            View<StudentViewModel>(
              shouldRebuild: false,
              builder: (_, vmJobApplication, __) {
                return MaterialButton(
                  minWidth: MediaQuery.of(context).size.width * 0.8,
                  height: 60,
                  color: Colors.deepOrange,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0)),
                  onPressed: () async {
                    // update paymentStatus to 'Payment successful'
                    jobApplication.paymentStatus = 'Payment successful';
                    vmJobApplication.updateJobApplication(
                        id: jobApplication.id, data: jobApplication);
                    // navigate to payment screen
                    await Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) =>
                                ApplicationresultScreen(index: index)));
                  },
                  child: const Text(
                    "MAKE PAYMENT",
                    style: TextStyle(color: Colors.white),
                  ),
                );
              },
            ),
          ],
        );
      },
    );
  }
}
