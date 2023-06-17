import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../../../../services/provider/provider_home_page.dart';
import '../../../../../shared/decorations/fonts_google.dart';
import '../../../../../shared/models/enuns/enum_type_operation.dart';
import '../../../../../shared/models/enuns/enum_type_screen_profile.dart';
import '../../screens_medical/screen_doctor/screen_list_doctor.dart';
import '../../screens_medical/screen_patient/select_pacient/screen_select_patient.dart';
import '../../screens_queries/logics/logic_type_user.dart';
import '../logic/drawer.dart';

class DrawerModel extends StatelessWidget {
  const DrawerModel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Drawer(
      elevation: 0,
      backgroundColor: const Color(0xff18CDCA),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(size.width * .08),
          bottomRight: Radius.circular(size.width * .08),
        ),
      ),
      child: Consumer<ProviderHomePage>(
        builder: (context, value, child) => SafeArea(
          child: ListView(
            padding: EdgeInsets.symmetric(
              horizontal: size.width * .02,
            ),
            shrinkWrap: true,
            children: [
              Container(
                margin: EdgeInsets.symmetric(vertical: size.height * .03),
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
                                borderRadius: BorderRadius.circular(size.width),
                              ),
                              child: Align(
                                alignment: Alignment.center,
                                child: Text(
                                  'Carregando...',
                                  style: FontGoogle.textTitleGoogle(
                                      size: size * .7,
                                      colorText: const Color(0xff333333)),
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
                                            BorderRadius.circular(size.width),
                                        image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: MemoryImage(img, scale: 0.7),
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
                                            BorderRadius.circular(size.width),
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
                                      size.width * .001, size.height * .0012),
                                  child: Bounceable(
                                    onTap: () async =>
                                        await LogicDrawer.addImageProfile(
                                      context: context,
                                      typeOperation: TypeProfile.typeDrawer,
                                    ),
                                    child: Icon(
                                      Icons.camera_alt_rounded,
                                      size: size.height * .05,
                                      color: Colors.white,
                                      shadows: const [
                                        Shadow(
                                          blurRadius: 1,
                                          offset: Offset(1, 2),
                                          color: Colors.black12,
                                        )
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
                            personId: value.getDataPerson?.pessoaId ?? 1,
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
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
