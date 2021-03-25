import 'package:flutter/material.dart';
import 'package:state_management_app/home.dart';
import 'package:state_management_app/pages/statefulwithcallback/sample_default.dart';

Map<String, WidgetBuilder> getRoutes() => <String, WidgetBuilder>{
      'home': (context) => HomePage(),
      'stateful_callback': (context) => StatefulWithCallBack(),
      'bc_notifier': (context) => HomePage(),
      'bc_streams': (context) => HomePage(),
      'prov_change_notifier': (context) => HomePage(),
      'prov_streams': (context) => HomePage(),
      'asyn_bloc_providers': (context) => HomePage(),
      'multiple_bloc_providers': (context) => HomePage(),
      'provider_flutter_bloc': (context) => HomePage(),
      'challenge': (context) => HomePage(),
    };
