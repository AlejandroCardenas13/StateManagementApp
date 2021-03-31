import 'package:flutter/material.dart';
import 'package:state_management_app/home.dart';
import 'package:state_management_app/pages/blocandnotifier/sample_bloc_notifier.dart';
import 'package:state_management_app/pages/blocandstreams/sample_bloc_streams.dart';
import 'package:state_management_app/pages/providerswithchangenotifier/sample_provider_change_notifier.dart';
import 'package:state_management_app/pages/providerswithstreams/sample_provider_streams.dart';
import 'package:state_management_app/pages/statefulwithcallback/sample_default.dart';

Map<String, WidgetBuilder> getRoutes() => <String, WidgetBuilder>{
      'home': (context) => HomePage(),
      'stateful_callback': (context) => StatefulWithCallBack(),
      'bc_notifier': (context) => SampleBloCNotifier(),
      'bc_streams': (context) => SampleBloCStreams(),
      'prov_change_notifier': (context) => SampleProvidersWithChangeNotifier(),
      'prov_streams': (context) => SampleProviderWithStreams(),
      'asyn_bloc_providers': (context) => HomePage(),
      'multiple_bloc_providers': (context) => HomePage(),
      'provider_flutter_bloc': (context) => HomePage(),
      'challenge': (context) => HomePage(),
    };
