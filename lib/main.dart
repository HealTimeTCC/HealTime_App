import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:healtime/src/screens/splash/splash_screen.dart';
import 'package:healtime/src/screens/telas_apresentacao/escolher_perfil.dart';

void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FlutterNativeSplash.remove();

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/SplashScreen',
      routes: {
        '/SplashScreen': (_) => const SplashScreen(),
        '/Apresentacao': (_) => Apresentacao(),
      },
    );
  }
}

