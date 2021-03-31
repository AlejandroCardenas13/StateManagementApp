import 'package:flutter/material.dart';
import 'dart:async';

import 'package:provider/provider.dart';
import 'package:state_management_app/pages/providerswithstreams/sample_provider_stream_buttons.dart';

class SampleProviderStreams {
  final _controllerCounter = new StreamController<int>();
  final _controllerTheme = new StreamController<bool>();
  int _counter = 0;
  bool _isDark = false;
  Stream<int> get getCounterStream => _controllerCounter.stream;
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

  void dispose() {
    _controllerCounter.close();
    _controllerTheme.close();
  }
}

class SampleProviderWithStreams extends StatelessWidget {
  @override
  Widget build(BuildContext context) => SamplePage(
        title: 'Provider with Streams',
      );
}

class SamplePage extends StatelessWidget {
  SamplePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    final provStream =
        Provider.of<SampleProviderStreams>(context, listen: false);
    return Consumer<bool>(
      builder: (_, snapshotTheme, __) => Theme(
        data: snapshotTheme ? ThemeData.dark() : ThemeData.light(),
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
                snapshotTheme
                    ? Consumer<int>(
                        builder: (_, snapshotCounter, __) => Text(
                            '$snapshotCounter',
                            style:
                                TextStyle(color: Colors.white, fontSize: 40)))
                    : Consumer<int>(
                        builder: (_, snapshotCounter, __) => Text(
                          '$snapshotCounter',
                          style: Theme.of(context).textTheme.headline4,
                        ),
                      ),
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: provStream.incrementCounter,
            tooltip: 'Increment',
            child: Icon(Icons.add),
          ),
        ),
      ),
    );
  }
}
