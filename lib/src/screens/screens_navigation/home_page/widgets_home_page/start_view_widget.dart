import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:healtime/shared/decorations/fonts_google.dart';
import 'package:healtime/shared/models/enuns/enum_type_operation.dart';
import 'package:healtime/src/screens/screens_navigation/home_page/home.dart';
import 'package:healtime/src/screens/screens_navigation/screen_profile/screen_profile.dart';
import 'package:healtime/src/screens/screens_navigation/screens_medical/screen_medicine/screen_include_medicine.dart';
import 'package:healtime/src/screens/screens_navigation/screens_medical/screen_patient/select_pacient/screen_select_patient.dart';
import 'package:provider/provider.dart';

import '../../../../../services/provider/provider_home_page.dart';
import '../../../../../shared/models/enuns/enum_type_screen_medical.dart';
import '../../screens_medical_prescription/screens/details_prescription.dart';
import 'drawer.dart';

class StartWidgetView extends StatefulWidget {
  const StartWidgetView({Key? key}) : super(key: key);

  @override
  State<StartWidgetView> createState() => _StartWidgetViewState();
}

class _StartWidgetViewState extends State<StartWidgetView> {
  int _selectedIndex = 0;

  @override
  void dispose() {
    super.dispose();
    _selectedIndex = 0;
  }

  @override
  Widget build(BuildContext context) {
    final ProviderHomePage providerHomePage =
        Provider.of(context, listen: false);

    final Size size = MediaQuery.of(context).size;

    Widget widgetScreen = (providerHomePage.getDataPerson?.tipoPessoa ?? 1) != 1
        ? SelectPatient(
            mensageAppBar: "Detalhes Prescrição",
            personId: providerHomePage.getDataPerson?.pessoaId ?? 1,
            typeOperation: TypeOperation.selectDetailsPrescription,
          )
        : const DetailsPrescription(
            typeOperation: TypeScreenMedical.homePage,
          );

    List<Widget> _widgetOptions = [
      const HomePage(),
      const IncludeMedication(
        typeOperation: TypeScreenMedical.homePage,
      ),
      widgetScreen,
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
      drawer: _selectedIndex == 0 ? const DrawerModel() : null,
      //#endregion
      body: _widgetOptions[_selectedIndex],
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: size.width * .01,
              vertical: size.height * .01,
            ),
            child: GNav(
              gap: 8,
              iconSize: 24,
              activeColor: Colors.black,
              hoverColor: Colors.grey[100]!,
              rippleColor: Colors.grey[300]!,
              tabBackgroundColor: Colors.grey[100]!,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              duration: const Duration(milliseconds: 500),
              textStyle: FontGoogle.textNormaleGoogle(
                size: size * .65,
                colorText: Colors.white,
              ),
              color: Colors.black,
              tabs: const [
                GButton(
                  backgroundColor: Color(0xFF14D8D5),
                  icon: Icons.home_rounded,
                  iconColor: Colors.grey,
                  iconActiveColor: Colors.white,
                  text: 'Home',
                  textColor: Colors.white,
                ),
                GButton(
                  backgroundColor: Color(0xFF14D8D5),
                  iconColor: Colors.grey,
                  icon: Icons.medication_liquid_rounded,
                  iconActiveColor: Colors.white,
                  text: 'Medicamento',
                  textColor: Colors.white,
                ),
                GButton(
                  backgroundColor: Color(0xFF14D8D5),
                  icon: Icons.medical_information_rounded,
                  iconActiveColor: Colors.white,
                  iconColor: Colors.grey,
                  text: 'Prescrição',
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
