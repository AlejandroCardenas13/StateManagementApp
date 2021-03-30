import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management_app/pages/providerswithchangenotifier/sample_provider_change_notifier.dart';

class MyActionsButtons extends StatelessWidget {
//La ventaja de usar providers es que podemos acceder a él desde otras clases al proveedor que esta encima
  @override
  Widget build(BuildContext context) {
    final provNotifier =
        Provider.of<SampleProviderNotifier>(context, listen: false);
    //El lister:false es util cuando unicamente queremos acceder al provider pero no queremos que escuche los cambios
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
            icon: Icon(Icons.restore), onPressed: provNotifier.resetCounter),
        IconButton(icon: Icon(Icons.check), onPressed: provNotifier.changeTheme)
      ],
    );
  }
}
