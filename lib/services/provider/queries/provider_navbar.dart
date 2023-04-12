
import 'package:flutter/material.dart';

import '../../../src/screens/screens_navigation/home_page/home.dart';
import '../../../src/screens/screens_navigation/screens_medical_prescription/screens/screen_include_prescription.dart';
import '../../../src/screens/screens_navigation/screens_queries/screens/list_queries/screen_list_queries.dart';

class NavbarProvider with ChangeNotifier {
  List<NavbarDTO> items = [
    NavbarDTO(label: 'Home', widget: HomePage() , iconData: Icons.home),
    NavbarDTO(label: 'Medicação',  widget: PrescricaoMedicamento(), iconData: Icons.medication_rounded),
    NavbarDTO(label: 'Consulta',  widget: null, iconData: Icons.queue_play_next_rounded),
    NavbarDTO(label: 'Perfil',  widget: null, iconData: Icons.person),
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