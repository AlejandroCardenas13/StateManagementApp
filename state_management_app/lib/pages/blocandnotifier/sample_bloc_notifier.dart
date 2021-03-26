import 'package:flutter/material.dart';
import 'package:state_management_app/pages/blocandnotifier/sample_bloc_notifier_buttons.dart';

//De está manera estamos extrayendo la lógica del negocio a otra clase fuera de la vista
class SampleNotifier with ChangeNotifier {
  int counter = 0;
  bool isDark = false;

  void incrementCounter() {
    counter++;
    notifyListeners();
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

class SampleBloCNotifier extends StatelessWidget {
  @override
  Widget build(BuildContext context) => SamplePage(
        title: 'BloC with Notifier',
      );
}

class SamplePage extends StatelessWidget {
  SamplePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    SampleNotifier notifier = new SampleNotifier();
    //El ChangeNotifier es una implementación del Listenable es por eso que se puede implementar en el AnimatedBuilder que estara pendiente de esos métodos para re-dibujarse así mismo
    return AnimatedBuilder(
      animation: notifier,
      builder: (_, __) => Theme(
        data: notifier.isDark ? ThemeData.dark() : ThemeData.light(),
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
            actions: [MyActionsButtons(notifier: notifier)],
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'You have pushed the button this many times:',
                ),
                notifier.isDark
                    ? Text(
                        '${notifier.counter}',
                        style: TextStyle(color: Colors.white, fontSize: 40),
                      )
                    : Text(
                        '${notifier.counter}',
                        style: Theme.of(context).textTheme.headline4,
                      ),
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: notifier.incrementCounter,
            tooltip: 'Increment',
            child: Icon(Icons.add),
          ),
        ),
      ),
    );
  }
}
