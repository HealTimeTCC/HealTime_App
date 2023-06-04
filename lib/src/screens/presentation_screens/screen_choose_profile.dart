import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healtime/shared/decorations/fonts_google.dart';
import 'package:healtime/src/screens/presentation_screens/widgets/button_choose_ profile.dart';

class Apresentacao extends StatelessWidget {
  const Apresentacao({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: SafeArea(
              child: Image.asset(
                'assets/img/background.jpeg',
                fit: BoxFit.cover,
                
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                margin: EdgeInsets.only(top: size.height * 0.05),
                child: Padding(
                  padding: const EdgeInsets.all(32.0),
                  child: Text(
                    textAlign: TextAlign.center,
                    'Selecione um tipo de perfil para começar',
                    style: GoogleFonts.getFont('Poppins',
                        decoration: TextDecoration.none,
                        color: const Color(0xff464646),
                        fontSize: size.width * .06,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
              SizedBox(height: size.height * .08),
              SizedBox(
                height: size.height * .6,
                child: ListView(
                  padding: EdgeInsets.symmetric(horizontal: size.width * .03),
                  shrinkWrap: true,
                  physics: const AlwaysScrollableScrollPhysics(
                    parent: BouncingScrollPhysics(),
                  ),
                  scrollDirection: Axis.horizontal,
                  children: [
                    const SelectProfile(
                      patchImage: 'assets/img/Remedy-cuate.png',
                      titleCard: 'Responsável',
                      colorBackgroundCard: Color(0xffBCEFEE),
                      subTitleCard:
                          'Este é o perfil do Responsável, criado para gerenciar e supervisionar os pacientes de maneira eficiente.',
                      typeProfile: 3,
                    ),
                    SizedBox(width: size.width * .08),
                    const SelectProfile(
                      patchImage: 'assets/img/Diabetes-cuate.png',
                      titleCard: 'Paciente',
                      colorBackgroundCard: Color(0xffFFE0B9),
                      subTitleCard:
                          'Este é o perfil de Paciente, desenvolvido para seus próprios cuidados.',
                      typeProfile: 2,
                    ),
                    SizedBox(width: size.width * .08),
                    const SelectProfile(
                      patchImage:
                          'assets/img/Health professional team-cuate.png',
                      titleCard: 'Cuidador',
                      colorBackgroundCard: Color(0xffE1F6D0),
                      subTitleCard:
                          'Este é o perfil de Cuidador, desenvolvido para cuidadores e prestadores de serviço médico.',
                      typeProfile: 1,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// EscolherPerfil.botaoEscolha(
//     backgroundButton: const Color(0xff1AE8E4),
//     textButton: 'Cuidador',
//     colorFontText: Colors.black,
//     typeNavigator: 1,
//     context: context),
// SizedBox(height: size.height * 0.03),
// EscolherPerfil.botaoEscolha(
//     backgroundButton: const Color(0xff172331),
//     textButton: 'Paciente',
//     colorFontText: Colors.white,
//     context: context,
//     typeNavigator: 2),
// SizedBox(height: size.height * 0.03),
// EscolherPerfil.botaoEscolha(
//     backgroundButton: Colors.white,
//     textButton: 'Responsável',
//     colorFontText: Colors.black,
//     context: context,
//     typeNavigator: 3)
