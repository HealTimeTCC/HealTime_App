import 'package:flutter/material.dart';
import 'package:healtime/src/screens/splash/splash_screen.dart';
import 'package:healtime/src/screens/telas_apresentacao/escolher_perfil.dart';
import 'package:healtime/src/screens/telas_navegacao/prescricao_medica/telas/tela_incluir_prescricao.dart';

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
      initialRoute: '/PrescricaoMedica',
      routes: {
        '/SplashScreen': (_) => const SplashScreen(),
        '/Apresentacao': (_) => Apresentacao(),
        '/PrescricaoMedica': (_) => PrescricaoMedicamento()
      },
    );
  }
}
