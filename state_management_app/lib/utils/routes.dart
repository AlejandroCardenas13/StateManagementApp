import 'package:flutter/material.dart';
import 'package:state_management_app/home.dart';
import 'package:state_management_app/pages/blocandnotifier/sample_default.dart';
import 'package:state_management_app/pages/blocandstreams/sample_default.dart';
import 'package:state_management_app/pages/providerswithchangenotifier/sample_default.dart';
import 'package:state_management_app/pages/providerswithstreams/sample_default.dart';
import 'package:state_management_app/pages/statefulwithcallback/sample_default.dart';

Map<String, WidgetBuilder> getRoutes() => <String, WidgetBuilder>{
      'home': (context) => HomePage(),
      'stateful_callback': (context) => StatefulWithCallBack(),
      'bc_notifier': (context) => BloCWithNotifier(),
      'bc_streams': (context) => BloCWithStreams(),
      'prov_change_notifier': (context) => ProvidersWithChangeNotifier(),
      'prov_streams': (context) => ProvidersWithStreams(),
      'asyn_bloc_providers': (context) => HomePage(),
      'multiple_bloc_providers': (context) => HomePage(),
      'provider_flutter_bloc': (context) => HomePage(),
      'challenge': (context) => HomePage(),
    };
