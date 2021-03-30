import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management_app/pages/providerswithchangenotifier/sample_provider_notifier_buttons.dart';

//import 'package:flutter/foundation.dart';
class SampleProviderNotifier with ChangeNotifier {
  int counter = 0;
  bool isDark = false;

  void incrementCounter() {
    counter++;
    notifyListeners(); //Esto es para que este notificando los cambios
  }

  void resetCounter() {
    counter = 0;
    notifyListeners();
  }

  void changeTheme() {
    isDark = !isDark;
    notifyListeners();
  }
}

class SampleProvidersWithChangeNotifier extends StatelessWidget {
  @override
  Widget build(BuildContext context) => SamplePage(
        title: 'Providers with Change Notifier',
      );
}

/*
  Hay dos formas de escuchar cuand se usa Providers, una es con Consumer() y otra es con Provider.of(), usando Provider.of() si no le
  ponemos listen:false entonces va a refrescar todo el Widget, en cambio el Consumer solo refresca las partes pequeñas que nosotros
  queremos.
   */
class SamplePage extends StatelessWidget {
  SamplePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    final provNotifier = Provider.of<SampleProviderNotifier>(context);
    //final provNotifier = Provider.of<SampleProviderNotifier>(context,listen: false);

    return Theme(
      data: provNotifier.isDark ? ThemeData.dark() : ThemeData.light(),
      child: Scaffold(
        appBar: AppBar(
          title: Center(child: Text(title)),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            color: Colors.white,
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          actions: [MyActionsButtons()],
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'You have pushed the button this many times:',
              ),
              provNotifier.isDark
                  ? Consumer<SampleProviderNotifier>(
                      builder: (_, snapshot, __) => Text('${snapshot.counter}',
                          style: TextStyle(color: Colors.white, fontSize: 40)))
                  : Consumer<SampleProviderNotifier>(
                      builder: (_, snapshot, __) => Text(
                        '${provNotifier.counter}',
                        style: Theme.of(context).textTheme.headline4,
                      ),
                    ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: provNotifier.incrementCounter,
          tooltip: 'Increment',
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
