import 'package:flutter/material.dart';
import 'package:state_management_app/utils/options_provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    bool _isDark = false;
    final _screenSize = MediaQuery.of(context).size;
    return Theme(
      data: _isDark ? ThemeData.dark() : ThemeData.light(),
      child: Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text('State Management'),
          ),
          actions: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [IconButton(icon: Icon(Icons.check), onPressed: () {})],
            ),
          ],
        ),
        body: _list(_screenSize),
      ),
    );
  }

  void changeTheme() {}

  Widget _list(Size screenSize) {
    final double sizeWidth = screenSize.width * 0.03;
    final double sizeHeight = screenSize.height * 0.01;

    return Container(
      padding:
          EdgeInsets.symmetric(vertical: sizeHeight, horizontal: sizeWidth),
      child: FutureBuilder(
        future: optionsProvider.loadData(),
        initialData: [],
        builder: (BuildContext context, AsyncSnapshot<List<dynamic>> snapshot) {
          //Este constructor es apropiado para listar con un numero pequeño de hijos(Widgets), mientras que ListView.builder() es apropiado para listar con un numero largo o infinito de hijos(widgets) ya que estos se
          //cargan a demanda
          return ListView(
              reverse: false,
              //     physics: NeverScrollableScrollPhysics(),
              scrollDirection: Axis.vertical,
              //padding: EdgeInsets.symmetric(vertical: sizeHeight, horizontal: sizeWidth),
              children: _btnsList(snapshot.data, context, screenSize));
        },
      ),
    );
  }

  List<Widget> _btnsList(
      List<dynamic> data, BuildContext context, Size screenSize) {
    final List<Widget> options = [];

    data.forEach((element) {
      final tempWidget = ListTile(
        title: Text(element['text']),
        onTap: () {
          Navigator.pushNamed(context, element['route']);
        },
      );
      options..add(tempWidget)..add(Divider(color: Colors.grey[900]));
    });

    /*
    data.forEach((element) {
      final tempWidget = Center(
        child: Container(
          height: screenSize.height * 0.07,
          child: ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, element['route']);
              },
              child: Text(element['text'])),
        ),
      );
      options..add(tempWidget);
    });
*/
    return options;
  }
}
