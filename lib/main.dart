import 'package:flutter/material.dart';
import 'package:healtime/services/provider/login/provider_login.dart';
import 'package:healtime/services/provider/provider_home_page.dart';
import 'package:healtime/services/provider/queries/provider_details_queries.dart';
import 'package:healtime/services/provider/queries/provider_navbar.dart';
import 'package:healtime/services/provider/queries/provider_queries.dart';
import 'package:provider/provider.dart';
import 'core/myApp.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ProviderHomePage(),
        ),
        ChangeNotifierProvider(
          create: (_) => ProviderQueries(),
        ),
        ChangeNotifierProvider(
          create: (_) => NavbarProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => ProviderLogin(),
        ),
        ChangeNotifierProvider(
          create: (_) => ProviderDetailsQuery(),
        ),
        // ChangeNotifierProvider(
        //   create: (_) => ProviderPrescriptionMedic(),
        // )
      ],
      child: const MyApp(),
    ),
  );
}
