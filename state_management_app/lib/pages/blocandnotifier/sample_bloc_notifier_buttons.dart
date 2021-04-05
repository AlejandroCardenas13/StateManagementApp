import 'package:flutter/material.dart';
import 'sample_bloc_notifier.dart';

class MyActionsButtons extends StatelessWidget {
  final SampleNotifier notifier;

  //Only static files can be declared as const.
  const MyActionsButtons({Key key, this.notifier}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(icon: Icon(Icons.restore), onPressed: notifier.resetCounter),
        IconButton(icon: Icon(Icons.check), onPressed: notifier.changeTheme)
      ],
    );
  }
}
