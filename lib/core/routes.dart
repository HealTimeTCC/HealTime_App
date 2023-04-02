import 'package:flutter/material.dart';

import '../src/screens/presentation_screens/screen_choose_profile.dart';
import '../src/screens/screens_navigation/home_page/home.dart';
import '../src/screens/screens_navigation/screens_medical/screen_doctor/screen_add_doctor.dart';
import '../src/screens/screens_navigation/screens_medical_prescription/screens/screen_include_prescription.dart';
import '../src/screens/splash/splash_screen.dart';

class Routes {
  static Map<String, Widget Function(BuildContext)> mapRoutes() {
    return {
      '/SplashScreen':      (_) => const SplashScreen(),
      '/Apresentacao':      (_) => const Apresentacao(),
      '/PrescricaoMedica':  (_) => const PrescricaoMedicamento(),
      '/PaginaInicial':     (_) => const HomePage(),
      '/Medico':            (_) => const IncluirMedico()
    };
  }
}
