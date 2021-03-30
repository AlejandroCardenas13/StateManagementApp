import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:state_management_app/home.dart';
import 'package:state_management_app/pages/providerswithchangenotifier/sample_provider_change_notifier.dart';
import 'package:state_management_app/utils/routes.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //Esto se agrega en el Main para decir que lo que este dentro del child y hacia abajo de ese árbol le vamos a pasar el ProviderNotifier() que construimos
    //Aqui también podríamos usar el MultiProvider[]
    return ChangeNotifierProvider(
      create: (_) => SampleProviderNotifier(),
      child: MaterialApp(
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
          }),
    );
  }
}
