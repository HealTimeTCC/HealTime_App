import 'package:flutter/material.dart';
import 'package:healtime/services/provider/queries/provider_queries.dart';
import 'package:provider/provider.dart';
import 'core/myApp.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ProviderQueries(),
        )
      ],
      child: const MyApp(),
    ),
  );
}
