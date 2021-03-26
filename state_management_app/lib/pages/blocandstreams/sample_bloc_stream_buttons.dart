import 'package:flutter/material.dart';
import 'sample_bloc_streams.dart';

class MyActionsButtons extends StatelessWidget {
  final SampleStreams sampleStream;
  //Only static files can be declared as const.
  const MyActionsButtons({Key key, this.sampleStream}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(icon: Icon(Icons.restore), onPressed: sampleStream.resetCounter),
        IconButton(icon: Icon(Icons.check), onPressed: sampleStream.changeTheme)
      ],
    );
  }
}
