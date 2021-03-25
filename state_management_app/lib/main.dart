import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:state_management_app/home.dart';
import 'package:state_management_app/utils/routes.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate
        ],
        supportedLocales: [
          const Locale('en', ''), // English, no country code
          const Locale('es', 'ES'), // Hebrew, no country code
        ],
        title: 'State Management',
        initialRoute: 'home',
        routes: getRoutes(),
        onGenerateRoute: (settings) {
          return MaterialPageRoute(builder: (context) => HomePage());
        });
  }
}
