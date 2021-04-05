import 'package:flutter/material.dart';
import 'package:state_management_app/pages/statefulwithcallback/sample_default_buttons.dart';

class StatefulWithCallBack extends StatelessWidget {
  @override
  Widget build(BuildContext context) => SamplePage(
        title: 'StatefulWidget with Callback',
      );
}

class SamplePage extends StatefulWidget {
  SamplePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _SamplePageState createState() => _SamplePageState();
}

class _SamplePageState extends State<SamplePage> {
  int _counter = 0;
  bool _isDark = false;

  //Lo malo de hacer uso de los callbacks para manejar el estado de la aplicación es que tenemos toda nuestra lógica de negocio acoplada a mi vista

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _resetCounter() {
    //This setState is so that the Widget can be redrawn
    setState(() {
      _counter = 0;
    });
  }

  void _changeTheme() {
    //This setState is so that the Widget can be redrawn
    setState(() {
      _isDark = !_isDark;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: _isDark ? ThemeData.dark() : ThemeData.light(),
      child: Scaffold(
        appBar: AppBar(
          title: Center(child: Text(widget.title)),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            color: Colors.white,
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          actions: [
            MyActionsButtons(
              onTapRestore: _resetCounter,
              onTapChangeTheme: _changeTheme,
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
              _isDark
                  ? Text(
                      '$_counter',
                      style: TextStyle(color: Colors.white, fontSize: 40),
                    )
                  : Text(
                      '$_counter',
                      style: Theme.of(context).textTheme.headline4,
                    ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: _incrementCounter,
          tooltip: 'Increment',
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
