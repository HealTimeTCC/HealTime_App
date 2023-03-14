import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:healtime/src/screens/screens_navigation/screen_patient/screen_list_patient.dart';
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
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
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
      initialRoute: '/ListarPaciente',
      routes: {
        '/SplashScreen': (_) => const SplashScreen(),
        '/Apresentacao': (_) => Apresentacao(),
        '/PrescricaoMedica': (_) => PrescricaoMedicamento(),
        '/ListarPaciente': (_) => ListaPaciente()
      },
    );
  }
}
