import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:healtime/shared/models/enuns/enum_type_operation.dart';
import 'package:healtime/src/screens/screens_navigation/home_page/home.dart';
import 'package:healtime/src/screens/screens_navigation/screen_profile/screen_profile.dart';
import 'package:healtime/src/screens/screens_navigation/screens_medical/screen_doctor/screen_add_doctor.dart';
import 'package:healtime/src/screens/screens_navigation/screens_medical/screen_doctor/screen_list_doctor.dart';
import 'package:healtime/src/screens/screens_navigation/screens_medical/screen_medicine/screen_include_medicine.dart';
import 'package:healtime/src/screens/screens_navigation/screens_medical/screen_medicine/screen_list_medicine.dart';
import 'package:healtime/src/screens/screens_navigation/screens_medical_prescription/screens/screen_include_prescription.dart';
import 'package:healtime/src/screens/screens_navigation/screens_queries/logics/logic_type_user.dart';
import 'package:healtime/src/screens/screens_navigation/screens_medical/screen_patient/select_pacient/screen_select_patient.dart';
import 'package:provider/provider.dart';

import '../../../services/provider/provider_home_page.dart';
import '../../../shared/decorations/fonts_google.dart';

class StartWidgetView extends StatefulWidget {
  const StartWidgetView({Key? key}) : super(key: key);

  @override
  State<StartWidgetView> createState() => _StartWidgetViewState();
}

class _StartWidgetViewState extends State<StartWidgetView> {
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _selectedIndex = 0;
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    List<Widget> _widgetOptions = [
      const HomePage(),
      const IncludeMedication(),
      const PrescricaoMedicamento(),
      const ScreenProfile(),
    ];
    List<String> _listTitleAppBar = ["", "Medicamentos", "Profile"];

    return Scaffold(
      appBar: _selectedIndex == 0
          ? AppBar(
              elevation: 0,
              title: Text(_listTitleAppBar[_selectedIndex]),
              backgroundColor: _selectedIndex == 0
                  ? const Color(0xFF14D8D5)
                  : Colors.transparent,
            )
          : null,
      //#region DRAWER
      drawer: _selectedIndex == 0
          ? Consumer<ProviderHomePage>(
              builder: (context, value, child) => Drawer(
                elevation: 0,
                child: ListView(
                  children: [
                    ListTile(
                      title: const Text('Consultas'),
                      trailing: const Icon(Icons.keyboard_arrow_right),
                      onTap: () => TypeUser.typeUserNavigator(context),
                    ),
                    ListTile(
                      title: const Text('Medicamentos'),
                      trailing: const Icon(Icons.keyboard_arrow_right),
                      onTap: () =>
                          Navigator.of(context).pushNamed('/ListMedicine'),
                    ),
                    if (value.getDataPerson?.tipoPessoa != 1) ...[
                      ListTile(
                        title: const Text('Pacientes'),
                        trailing: const Icon(Icons.keyboard_arrow_right),
                        onTap: () => Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => SelectPatient(
                                typeOperation: TypeOperation.view,
                                personId: value.getDataPerson?.pessoaId ?? 1),
                          ),
                        ),
                      ),
                    ],
                    // ListTile(
                    //   title: const Text('Medico'),
                    //   trailing: const Icon(Icons.keyboard_arrow_right),
                    //   onTap: () => Navigator.of(context).push(
                    //     MaterialPageRoute(
                    //       builder: (context) => const IncluirMedico(),
                    //     ),
                    //   ),
                    // ),
                    ListTile(
                      title: const Text('Listar Medico'),
                      trailing: const Icon(Icons.keyboard_arrow_right),
                      onTap: () => Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const ListarMedico(),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          : null,
      //#endregion
      body: _widgetOptions[_selectedIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              blurRadius: 20,
              color: Colors.black.withOpacity(.1),
            )
          ],
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
            child: GNav(
              rippleColor: Colors.grey[300]!,
              hoverColor: Colors.grey[100]!,
              gap: 8,
              activeColor: Colors.black,
              iconSize: 24,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              duration: const Duration(milliseconds: 400),
              tabBackgroundColor: Colors.grey[100]!,
              color: Colors.black,
              tabs: const [
                GButton(
                  backgroundColor: Color(0xFF14D8D5),
                  icon: Icons.home,
                  iconColor: Colors.grey,
                  iconActiveColor: Colors.white,
                  text: 'Home',
                  textColor: Colors.white,
                ),
                GButton(
                  backgroundColor: Color(0xFF14D8D5),
                  iconColor: Colors.grey,
                  icon: Icons.list_alt,
                  iconActiveColor: Colors.white,
                  text: 'Medicamentos',
                  textColor: Colors.white,
                ),
                GButton(
                  backgroundColor: Color(0xFF14D8D5),
                  icon: Icons.list_alt,
                  iconActiveColor: Colors.white,
                  iconColor: Colors.grey,
                  text: 'Presc. Médica',
                  textColor: Colors.white,
                ),
                GButton(
                  backgroundColor: Color(0xFF14D8D5),
                  icon: Icons.person,
                  iconActiveColor: Colors.white,
                  text: 'Perfil',
                  iconColor: Colors.grey,
                  textColor: Colors.white,
                ),
              ],
              selectedIndex: _selectedIndex,
              onTabChange: (index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
            ),
          ),
        ),
      ),
    );
  }
}
