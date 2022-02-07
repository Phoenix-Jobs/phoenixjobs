import 'package:flutter/material.dart';

class AddrecruitmentAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  // ignore: prefer_typing_uninitialized_variables
  final state, operation;
  // ignore: use_key_in_widget_constructors
  const AddrecruitmentAppBar({this.state, this.operation});

  @override
  Size get preferredSize => const Size.fromHeight(50.0);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: const Icon(Icons.arrow_back, color: Colors.white),
        onPressed: () => Navigator.of(context).pop(),
      ),
      title:
          Text(operation == 'add' ? 'Add recruitment' : 'Update recruitment'),
      centerTitle: false,
    );
  }
}
