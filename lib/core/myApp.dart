import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:healtime/core/routes.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],

        /* Linguagens suportadas pelo app, usado apenas no calendario */
        supportedLocales: const [
          Locale('en'), // Inglês
          Locale('pt_BR'), // Português Brasileiro
        ],
        theme: ThemeData(
          primaryColor: const Color(0xff1AE8E4),
          colorScheme: ColorScheme.fromSwatch().copyWith(
            secondary: const Color(0xff1AE8E4),
          ),
        ),
        debugShowCheckedModeBanner: false,
        initialRoute: '/PaginaInicial',
        routes: Routes.mapRoutes());
  }
}
