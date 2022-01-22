import 'package:flutter/material.dart';
import 'package:phoenixjobs/screens/app/staff/addrecruitment/addrecruitment_screen.dart';

class RecruitmentFloat extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  final state;
  // ignore: use_key_in_widget_constructors
  const RecruitmentFloat({this.state});

  void _navigateAddrecruitmentScreen({context}) async {
    await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => AddrecruitmentScreen(),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      heroTag: null,
      onPressed: () => _navigateAddrecruitmentScreen(context: context),
      // label: const Text('Add'),
      child: const Icon(Icons.add),
    );
  }
}
