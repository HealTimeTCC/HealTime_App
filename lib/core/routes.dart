import 'package:flutter/material.dart';

import '../shared/models/enuns/enum_type_screen_medical.dart';
import '../src/screens/presentation_screens/screen_choose_profile.dart';
import '../src/screens/screens_navigation/home_page/widgets_home_page/start_view_widget.dart';
import '../src/screens/screens_navigation/screen_alter_password/alter_password.dart';
import '../src/screens/screens_navigation/screens_medical/screen_doctor/screen_add_doctor.dart';
import '../src/screens/screens_navigation/screens_medical/screen_doctor/screen_list_doctor.dart';
import '../src/screens/screens_navigation/screens_medical/screen_medicine/screen_include_medicine.dart';
import '../src/screens/screens_navigation/screens_medical/screen_medicine/screen_list_medicine.dart';
import '../src/screens/screens_navigation/screens_medical_prescription/screens/screen_include_prescription.dart';
import '../src/screens/splash/splash_screen.dart';

class Routes {
  static Map<String, Widget Function(BuildContext)> mapRoutes() {
    return {
      '/SplashScreen': (_) => const SplashScreen(),
      '/Apresentacao': (_) => const Apresentacao(),
      '/PrescricaoMedica': (_) => const IncludePrescriptionMedical(),
      '/PaginaInicial': (_) => const StartWidgetView(),
      '/AddDoctor': (_) => const IncluirMedico(),
      '/ListDoctors': (_) => const ListarMedico(),
      '/AlterPassword': (_) => const AlterPassword(),
      '/ListMedicine': (_) => const ListaRemedios(),
      '/IncludeMedicine': (_) => const IncludeMedication(
            typeOperation: TypeScreenMedical.notHomePage,
          ),
    };
  }
}
