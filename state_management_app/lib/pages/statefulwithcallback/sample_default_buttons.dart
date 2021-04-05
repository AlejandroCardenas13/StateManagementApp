import 'package:flutter/material.dart';

class MyActionsButtons extends StatelessWidget {
  final VoidCallback onTapRestore;
  final VoidCallback onTapChangeTheme;

  //Only static files can be declared as const.
  const MyActionsButtons({Key key, this.onTapRestore,this.onTapChangeTheme}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(icon: Icon(Icons.restore), onPressed: onTapRestore),
        IconButton(icon: Icon(Icons.check), onPressed: onTapChangeTheme)
      ],
    );
  }
}
