import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:healtime/shared/decorations/fonts_google.dart';
import 'package:healtime/shared/models/enuns/enum_type_operation.dart';
import 'package:healtime/shared/models/enuns/enum_type_screen_profile.dart';
import 'package:healtime/src/screens/screens_navigation/home_page/home.dart';
import 'package:healtime/src/screens/screens_navigation/screen_profile/screen_profile.dart';
import 'package:healtime/src/screens/screens_navigation/screens_medical/screen_doctor/screen_list_doctor.dart';
import 'package:healtime/src/screens/screens_navigation/screens_medical/screen_medicine/screen_include_medicine.dart';
import 'package:healtime/src/screens/screens_navigation/screens_medical/screen_patient/select_pacient/screen_select_patient.dart';
import 'package:healtime/src/screens/screens_navigation/screens_queries/logics/logic_type_user.dart';
import 'package:provider/provider.dart';

import '../../../../../services/provider/provider_home_page.dart';
import '../../../../../shared/models/enuns/enum_type_screen_medical.dart';
import '../logic/drawer.dart';

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
    List<Widget> _widgetOptions = [
      const HomePage(),
      const IncludeMedication(
        typeOperation: TypeScreenMedical.homePage,
      ),
      SelectPatient(
        mensageAppBar: "Detalhes Prescrição",
        personId: providerHomePage.getDataPerson?.pessoaId ?? 1,
        typeOperation: TypeOperation.selectDetailsPrescription,
      ),
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
                backgroundColor: const Color(0xff18CDCA),
                child: SafeArea(
                  child: ListView(
                    padding: EdgeInsets.symmetric(
                      horizontal: size.width * .02,
                    ),
                    shrinkWrap: true,
                    children: [
                      Container(
                        margin:
                            EdgeInsets.symmetric(vertical: size.height * .03),
                        child: CircleAvatar(
                          radius: size.width * .23,
                          child: FutureBuilder<Uint8List?>(
                            future: LogicDrawer.getImageProfile(context),
                            builder: (context, snapshot) {
                              switch (snapshot.connectionState) {
                                case ConnectionState.waiting:
                                  {
                                    return Container(
                                      width: size.width * .45,
                                      height: size.height * .23,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(size.width),
                                      ),
                                      child: Align(
                                        alignment: Alignment.center,
                                        child: Text(
                                          'Carregando...',
                                          style: FontGoogle.textTitleGoogle(
                                              size: size * .7,
                                              colorText:
                                                  const Color(0xff333333)),
                                        ),
                                      ),
                                    );
                                  }
                                default:
                                  {
                                    final Uint8List img = snapshot.data!;

                                    return Stack(
                                      children: [
                                        if (img.isNotEmpty) ...[
                                          Align(
                                            alignment: Alignment.center,
                                            child: Container(
                                              width: size.width * .46,
                                              height: size.height * .23,
                                              decoration: BoxDecoration(
                                                color: const Color(0xffFFCC8C),
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        size.width),
                                                image: DecorationImage(
                                                  fit: BoxFit.cover,
                                                  image: MemoryImage(img,
                                                      scale: 0.7),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ] else ...[
                                          Align(
                                            alignment: Alignment.center,
                                            child: Container(
                                              width: size.width * .45,
                                              height: size.height * .23,
                                              decoration: BoxDecoration(
                                                color: const Color(0xffFFCC8C),
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        size.width),
                                              ),
                                              child: Align(
                                                alignment: Alignment.center,
                                                child: SvgPicture.asset(
                                                  'assets/svg/user.svg',
                                                  height: size.height * .1,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                        Align(
                                          alignment: Alignment(
                                              size.width * .001,
                                              size.height * .0012),
                                          child: Bounceable(
                                            onTap: () async => await LogicDrawer
                                                .addImageProfile(
                                              context: context,
                                              typeOperation:
                                                  TypeProfile.typeDrawer,
                                            ),
                                            child: Icon(
                                              Icons.camera_alt_rounded,
                                              size: size.height * .05,
                                              color: Colors.white,
                                              shadows: const [
                                                Shadow(
                                                    blurRadius: 1,
                                                    offset: Offset(1, 2),
                                                    color: Colors.black12)
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    );
                                  }
                              }
                            },
                          ),
                        ),
                      ),
                      ListTile(
                        title: Text(
                          'Consultas',
                          style: FontGoogle.textNormaleGoogle(
                            size: size * .9,
                            colorText: Colors.white,
                          ),
                        ),
                        trailing: const Icon(
                          Icons.keyboard_arrow_right,
                          color: Colors.white,
                        ),
                        onTap: () {
                          Navigator.of(context).pop();
                          TypeUser.typeUserNavigator(context);
                        },
                      ),
                      ListTile(
                        title: Text(
                          'Medicamentos',
                          style: FontGoogle.textNormaleGoogle(
                            size: size * .9,
                            colorText: Colors.white,
                          ),
                        ),
                        trailing: const Icon(
                          Icons.keyboard_arrow_right,
                          color: Colors.white,
                        ),
                        onTap: () {
                          Navigator.of(context).pop();
                          Navigator.of(context).pushNamed('/ListMedicine');
                        },
                      ),
                      if (value.getDataPerson?.tipoPessoa != 1) ...[
                        ListTile(
                            title: Text(
                              'Pacientes',
                              style: FontGoogle.textNormaleGoogle(
                                size: size * .9,
                                colorText: Colors.white,
                              ),
                            ),
                            trailing: const Icon(
                              Icons.keyboard_arrow_right,
                              color: Colors.white,
                            ),
                            onTap: () {
                              Navigator.of(context).pop();
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => SelectPatient(
                                    typeOperation: TypeOperation.select,
                                    personId:
                                        value.getDataPerson?.pessoaId ?? 1,
                                  ),
                                ),
                              );
                            }),
                      ],
                      ListTile(
                          title: Text(
                            'Listar Medico',
                            style: FontGoogle.textNormaleGoogle(
                              size: size * .9,
                              colorText: Colors.white,
                            ),
                          ),
                          trailing: const Icon(
                            Icons.keyboard_arrow_right,
                            color: Colors.white,
                          ),
                          onTap: () {
                            Navigator.of(context).pop();
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => const ListarMedico(),
                              ),
                            );
                          }),
                    ],
                  ),
                ),
              ),
            )
          : null,
      //#endregion
      body: _widgetOptions[_selectedIndex],
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: .9, vertical: 8),
            child: GNav(
              rippleColor: Colors.grey[300]!,
              hoverColor: Colors.grey[100]!,
              gap: 8,
              activeColor: Colors.black,
              iconSize: 24,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              duration: const Duration(milliseconds: 400),
              tabBackgroundColor: Colors.grey[100]!,
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
