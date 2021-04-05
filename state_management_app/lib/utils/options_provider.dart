import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

class _OptionsProvider {
  List<dynamic> _options = [];

  _OptionsProvider();

  Future<List<dynamic>> loadData() async {
    final response = await rootBundle.loadString('data/pages.json');
    Map optMap = jsonDecode(response);
    _options = optMap['routes'];
    return _options;
  }
}

final optionsProvider = new _OptionsProvider();
