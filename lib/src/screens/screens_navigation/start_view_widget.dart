import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:healtime/src/screens/screens_navigation/home_page/home.dart';
import 'package:healtime/src/screens/screens_navigation/screen_profile/screen_profile.dart';
import 'package:healtime/src/screens/screens_navigation/screens_medical/screen_doctor/screen_add_doctor.dart';
import 'package:healtime/src/screens/screens_navigation/screens_medical/screen_doctor/screen_list_doctor.dart';
import 'package:healtime/src/screens/screens_navigation/screens_medical/screen_medicine/screen_include_medicine.dart';
import 'package:healtime/src/screens/screens_navigation/screens_medical/screen_medicine/screen_list_medicine.dart';
import 'package:healtime/src/screens/screens_navigation/screens_queries/logics/logic_type_user.dart';

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
      drawer: _selectedIndex == 0 ? Drawer(
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
              onTap: () => Navigator.of(context).pushNamed('/ListMedicine'),
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
          ],
        ),
      ) : null,
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
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              duration: Duration(milliseconds: 400),
              tabBackgroundColor: Colors.grey[100]!,
              color: Colors.black,
              tabs: const [
                GButton(
                  icon: Icons.home,
                  text: 'Home',
                ),
                GButton(
                  icon: Icons.list_alt,
                  text: 'Likes',
                ),
                GButton(
                  icon: Icons.person,
                  text: 'Search',
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