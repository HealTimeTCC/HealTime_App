import 'package:flutter/material.dart';

import '../../../src/screens/screens_navigation/home_page/home.dart';
import '../../../src/screens/screens_navigation/screen_profile/screen_profile.dart';
import '../../../src/screens/screens_navigation/screens_medical_prescription/screens/screen_include_prescription.dart';

class NavbarProvider with ChangeNotifier {
  List<NavbarDTO> items = [
    NavbarDTO(label: 'Home', widget: const HomePage(), iconData: Icons.home),
    NavbarDTO(
        label: 'Medicação',
        widget: const PrescricaoMedicamento(),
        iconData: Icons.medication_rounded),
    // NavbarDTO(
    //     label: 'Consulta',
    //     widget: TypeUser.typeUserNavigator(context),
    //     iconData: Icons.queue_play_next_rounded),
    NavbarDTO(
        label: 'Perfil', widget: const ScreenProfile(), iconData: Icons.person),
  ];

  int _indexSelecionado = 0;

  int get indexSelecionado => _indexSelecionado;

  set indexSelecionado(int opcao) {
    _indexSelecionado = opcao;
    notifyListeners();
  }
}

class NavbarDTO {
  Widget? widget;
  String? label;
  IconData? iconData;

  NavbarDTO({this.widget, this.label, this.iconData});
}
