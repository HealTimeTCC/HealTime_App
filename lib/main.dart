import 'package:flutter/material.dart';
import 'package:healtime/src/screens/splash/splash_screen.dart';
import 'package:healtime/src/screens/presentation_screens/screen_choose_profile.dart';
import 'package:healtime/src/screens/screens_navigation/screens_medical_prescription/screens/screen_include_prescription.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(
          secondary: const Color(0xff1AE8E4),
        ),
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/SplashScreen',
      routes: {
        '/SplashScreen': (_) => const SplashScreen(),
        '/Apresentacao': (_) => Apresentacao(),
        '/PrescricaoMedica': (_) => PrescricaoMedicamento()
      },
    );
  }
}
