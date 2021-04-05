import 'dart:async';

import 'package:flutter/material.dart';
import 'sample_bloc_stream_buttons.dart';

//En este caso el patrón sigue siendo el mismo, el BloC para separar la lógica pero esta vez por medio de los StreamControllers vamos a controlar los valores a mostrar en los Widgets
class SampleStreams {
  final _controllerCounter = new StreamController<int>();
  final _controllerTheme = new StreamController<bool>();
  int _counter = 0;
  bool _isDark = false;

//  Function(int) get getCounterSink => _controllerCounter.sink.add; En que caso usaria el Sink?
  Stream<int> get getCounterStream => _controllerCounter.stream;

  //Function(bool) get getThemeSink => _controllerTheme.sink.add;
  Stream<bool> get getThemeStream => _controllerTheme.stream;

  void incrementCounter() {
    _counter++;
    _controllerCounter.add(_counter);
  }

  void resetCounter() {
    _counter = 0;
    _controllerCounter.add(_counter);
  }

  void changeTheme() {
    _isDark = !_isDark;
    _controllerTheme.add(_isDark);
  }
}

class SampleBloCStreams extends StatelessWidget {
  @override
  Widget build(BuildContext context) => SamplePage(title: 'BloC with Streams');
}

class SamplePage extends StatelessWidget {
  SamplePage({Key key, this.title}) : super(key: key);
  final String title;
  final SampleStreams streamBloC = new SampleStreams();

  //El StreamBuilder va a estar escuchando al stream del tipo que hallamos definido en la clase de la lógica y a partir de este vamos a poder jugar con los valores del snapshot
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<bool>(
        stream: streamBloC.getThemeStream,
        initialData: false,
        builder: (context, snapshot) {
          return Theme(
            data: snapshot.hasData && snapshot.data
                ? ThemeData.dark()
                : ThemeData.light(),
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
                actions: [
                  MyActionsButtons(
                    sampleStream: streamBloC,
                  )
                ],
              ),
              body: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'You have pushed the button this many times:',
                    ),
                    snapshot.data
                        ? StreamBuilder<int>(
                            stream: streamBloC.getCounterStream,
                            initialData: 0,
                            builder: (context, snapshot) {
                              return Text('${snapshot.data}',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 40));
                            })
                        : StreamBuilder<int>(
                            stream: streamBloC.getCounterStream,
                            initialData: 0,
                            builder: (context, snapshot) {
                              return Text('${snapshot.data}',
                                  style: Theme.of(context).textTheme.headline4);
                            })
                  ],
                ),
              ),
              floatingActionButton: FloatingActionButton(
                onPressed: streamBloC.incrementCounter,
                tooltip: 'Increment',
                child: Icon(Icons.add),
              ),
            ),
          );
        });
  }
}
