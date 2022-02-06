import 'package:flutter/material.dart';
import 'package:phoenixjobs/screens/app/student/payment/payment_app_bar.dart';
import 'package:phoenixjobs/screens/app/student/payment/payment_body.dart';

// ignore: use_key_in_widget_constructors
class PaymentScreen extends StatefulWidget {
  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PaymentAppBar(state: this),
        body: PaymentBody(state: this),
      ),
    );
  }
}
