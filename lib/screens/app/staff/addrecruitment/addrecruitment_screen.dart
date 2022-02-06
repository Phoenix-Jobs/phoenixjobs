import 'package:flutter/material.dart';
import 'package:phoenixjobs/screens/app/staff/addrecruitment/addrecruitment_app_bar.dart';
import 'package:phoenixjobs/screens/app/staff/addrecruitment/addrecruitment_body.dart';

// ignore: use_key_in_widget_constructors
class AddrecruitmentScreen extends StatefulWidget {
  final int _index;
  final String _operation;
  int get index => _index;
  String get operation => _operation;
  // ignore: use_key_in_widget_constructors
  const AddrecruitmentScreen({index, operation})
      : _index = index,
        _operation = operation;

  @override
  State<AddrecruitmentScreen> createState() => _AddrecruitmentScreenState();
}

class _AddrecruitmentScreenState extends State<AddrecruitmentScreen> {
  final recruitmentFormKey = GlobalKey<FormState>();

  final jobTitleController = TextEditingController();
  final venueController = TextEditingController();
  final jobHighlightsController = TextEditingController();
  final jobResponsibilitiesController = TextEditingController();
  final careerLevelController = TextEditingController();
  final jobSpecController = TextEditingController();
  final workingHourController = TextEditingController();
  final workingTimeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AddrecruitmentAppBar(state: this, operation: widget.operation),
        body: AddrecruitmentBody(
            state: this, index: widget.index, operation: widget.operation),
      ),
    );
  }
}
