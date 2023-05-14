// home page
// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healtime/shared/decorations/fonts_google.dart';
import 'package:healtime/src/screens/screens_navigation/home_page/widgets_home_page/apresentation_initial_details.dart';
import 'package:healtime/src/screens/screens_navigation/home_page/widgets_home_page/buttom_gesture_detector.dart';
import 'package:healtime/src/screens/screens_navigation/screens_medical/screen_medicine/screen_list_medicine.dart';

import '../../../../services/data_locale/data_preferences_pessoa.dart';
import '../../../../shared/models/model_pessoa.dart';
import '../screens_medical/screen_doctor/screen_add_doctor.dart';
import '../screens_medical/screen_doctor/screen_list_doctor.dart';
import '../screens_queries/logics/logic_type_user.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Pessoa? pessoa;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xFF14D8D5),
      ),
      //#region DRAWER
      drawer: Drawer(
        elevation: 0,
        child: ListView(children: [
          ListTile(
            title: const Text('Consultas'),
            trailing: const Icon(Icons.keyboard_arrow_right),
            onTap: () => TypeUser.typeUserNavigator(context),
          ),
          ListTile(
            title: const Text('Medicamentos'),
            trailing: const Icon(Icons.keyboard_arrow_right),
            onTap: () => Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const ListaRemedios())),
          ),
          ListTile(
              title: const Text('Pacientes'),
              trailing: const Icon(Icons.keyboard_arrow_right),
              onTap: () => null),
          ListTile(
              title: const Text('Medico'),
              trailing: const Icon(Icons.keyboard_arrow_right),
              onTap: () => Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => IncluirMedico()))),
          ListTile(
              title: const Text('Listar Medico'),
              trailing: const Icon(Icons.keyboard_arrow_right),
              onTap: () => Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => ListarMedico()))),
        ]),
      ),
      //#endregion
      body: Stack(
        children: [
          //#region Parte AZUL embaixao da appbar
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              decoration: const BoxDecoration(
                color: Color(0xFF14D8D5),
              ),
              height: size.height * .18,
            ),
          ),
          //#endregion
          ListView(
            physics: const AlwaysScrollableScrollPhysics(
              parent: BouncingScrollPhysics(),
            ),
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Column(
                  children: [
                    //#region Widget superior
                     const IntialDetails(),
                    //#endregion
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: const Color(0xFF14D8D5)
                            .withAlpha((0.5 * 255).round()),
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(.2),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      width: size.width * 0.9,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GestureDetector(
                          onTap: () {
                            print('APERTEI');
                          },
                          child: const ButtonNextDose(),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Meus Remedios",
                      style: FontGoogle.textTitleGoogle(
                          size: size, colorText: Colors.black),
                    ),
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
